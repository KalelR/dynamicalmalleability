include("general_plots.jl")
quantifier = "Rstats"
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
using DelimitedFiles
using StatsBase

# dictname = "ku_ws_501_unit_p_eps4"
dictname = "ku_ws_501_unit_eps_p008733"
# dictname = "ku_pl_501_unit_eps_alpha176923_omeganew3"
dictname = "ku_pl_501_unit_eps_alpha176923"
dictname = "ku_pl_501_shuf_p_eps646154"
# dictname =ku_ws_501_unit_p_eps451282_omeganew3"
idx_quantity=2
R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
ps = Vector(R_all[:,1])
R_all = Matrix(R_all[:, 2:end])
Δs = mapslices(gap, R_all[:, 2:end], dims=2)


#Calculate Kurtosis
idx =1
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, shuffleid, seedic, ω_new= d_params
v_ω_original = get_frequency(mchange, mfreq, d_params, DIR)

ks = zeros(Float64, 502)
for idx_unit = 0:N 
	v_ω = alt_frequency_oneunit(idx_unit,  ω_new, v_ω_original)
	ks[idx_unit+1] = kurtosis(v_ω) + 3.0
end

function normalize(x)
	y = x .- minimum(x) .+ 0.01
	y = y ./ (maximum(y) .+ 0.01)
end

R_all_excl = R_all[:, 2:end]
ks_excl = ks[2:end]

ks_norm = normalize(ks_excl)
cmap = matplotlib.cm.get_cmap("jet")


fig, ax = subplots()
for idx_unit = 1:N 
	ax.plot(ps, R_all_excl[:, idx_unit], color=cmap(ks_norm[idx_unit]), alpha=0.6)
end
m = matplotlib.cm.ScalarMappable(cmap=cmap)
fig.colorbar(m, ax=ax)
xscale("log")


min, idxmin = findmin(ks)
max, idxmax = findmax(ks)
fig, axs = subplots()
plot(ps, R_all[:, idxmin], "k-", label="minimum kurtosis")
plot(ps, R_all[:, idxmax], "b-", label="maximum kurtosis")


fig, ax= subplots()
norm = matplotlib.pyplot.Normalize(minimum(ks), maximum(ks))
lc = LineCollection(R_all[:,], cmap='viridis', norm=norm)

fig, ax = subplots()
ax.pcolormesh(ps, ks_excl, R_all_excl)
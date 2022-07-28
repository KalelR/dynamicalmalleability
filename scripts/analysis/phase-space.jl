include("general_plots.jl")
# axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
include("$(srcdir())/quantifiers.jl")
include("$(srcdir())/analysis/lyapunovs_src.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
using DelimitedFiles
data_dir = datadir()
DIR =  projectdir()
using ChaosTools, DynamicalSystems




# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]
# data_dir = datadir()
# DIR =  projectdir()
# dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
# a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
# a, names_phases = get_resultnames(dictname, "", "phases2")
# a, names_R = get_resultnames(dictname, "", "Rt")
# a, names_freqs = get_resultnames(dictname, "", "instafreqs")
# allparams, paramtypes = return_dict(dictname)
# idx=8 #periodic
# idx = 3 #0.02254, chaotic



dictname = "ku_ws_501_shuf_p_eps410256_tend100000"
# dictname = "ku_ws_501_shuf_eps_p013111_tend100000"
a, names_phases = get_resultnames(dictname, "", "phases")
a, names_R = get_resultnames(dictname, "", "Rt")
allparams, paramtypes = return_dict(dictname)


# idx=1
# for idx=1:8
for idx=1:11
#   d_params = dict_list(allparams)[idx]
#   @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
#   lyapsname = names_lyaps[idx]
#   phasename = names_phases[idx]
#   Rname = names_R[idx]
#   Ωname = names_freqs[idx]
# lyap_t, lyaps = get_convergence_lyapunovs(lyapsname)
# t = lyap_t
# data = CSV.File(phasename, header=false) |> DataFrame; m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi;
# data = CSV.File(Ωname, header=false) |> DataFrame; Ωs = Matrix(data);
# data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];


#from dynamical systems
  d_params = dict_list(allparams)[idx]
  @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
  phasename = names_phases[idx]
  Rname = names_R[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];

t = t[2000:end]
m_θ = m_θ[2000:end, :]

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
Ωs = instafreqs(t, m_θ, v_p, system_function) 



# include("$(DIR)/src/utils.jl")
# include("$(DIR)/src/sims/Kuramoto/parameters.jl")
# v_adjl = topology_params = get_topology(mtop, d_params, DIR)
# ------------------------------------------------------------------ cross section ----------------------------------------------------------------- #
fig, axs = subplots(3,1)
ax=axs[1]
ax.plot(t, Ωs[:,1])
ax.set_xlabel("t")
ax.set_ylabel(L"\dot{\theta}_1")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)

ax=axs[2]
# ax.plot(t[1:200], Ωs[1:200,1])
ax.plot(t, Ωs[:,1])
ax.set_xlabel("t")
ax.set_ylabel(L"\dot{\theta}_1")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)
# ax.set_xlim(0,200)

ax = axs[3]
i = 1
idxs_maxima = local_maxima(m_θ[:, i])
Δts = diff(t[idxs_maxima])
ax.scatter(Δts[1:end-1], Δts[2:end], c=1:length(Δts[1:end-1]))
ax.set_ylabel(L"\Delta tmax_{n+1}")
ax.set_xlabel(L"\Delta tmax_{n}")
fig.tight_layout()
fig.suptitle("p = $(p), epsi = $(epsi)")
savefig("$(plotsdir())/investigationsdynamics/frequencies_returnmap_p_$(p)-epsi_$(epsi)-$(dictname).png")


fig, axs = subplots(2,1, sharex="all")
ax=axs[1]
ax.plot(t, Ωs[:,1])
ax.set_xlabel("t")
ax.set_ylabel(L"\dot{\theta}_1")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)

ax=axs[2]
c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(m_θ), t; align=false)
# Rs = order_parameter(m_θ')
Rs = order_parameter(m_θ)
ax2 = plot_R!(fig, ax, Rs, t, 1, 1, 1)
fig.suptitle("p = $(p), epsi = $(epsi)")
# ax.set_xlim(15000, 18000)
savefig("$(plotsdir())/investigationsdynamics/frequencies_phases_p_$(p)-epsi_$(epsi)-$(dictname).png")

close("all")
end


fig = figure()
ax = fig.add_subplot(projection="3d")
ax.scatter(m_θ[:,1], m_θ[:,2], m_θ[:,3], c=1:size(m_θ)[1])

fig=figure()
ax = gca()
s = ax.scatter(m_θ[:,1], m_θ[:,2], c=1:size(m_θ)[1])
cbar=fig.colorbar(c)

ϕ = zeros((size(m_θ,1), size(m_θ,2)-1))
for i=1:size(m_θ,2)-1
	ϕ[:, i] = m_θ[:,i+1] .- m_θ[:,i]
end

figure()
i = 1
for j in v_adjl[i]
# PyPlot.plot(m_θ[:, i] .- m_θ[:, j])
PyPlot.plot(sin.(m_θ[:, i] .- m_θ[:, j]))
end

Icoup = sum( hcat([sin.(m_θ[:, i] .- m_θ[:, j]) for j ∈ v_adjl[i]]...), dims=2 )
figure()
PyPlot.plot(Icoup)

figure()
PyPlot.plot(Ωs[:,1])
PyPlot.plot(Ωs[:,2])


function local_maxima(x)
	x1 = @view x[1:end - 2]
	x2 = @view x[2:end - 1]
	x3 = @view x[3:end]
	collect(1:length(x2))[x1 .< x2 .> x3] .+ 1
    end
idxs_maxima = local_maxima(m_θ[:, i])
Δts = diff(t[idxs_maxima])
figure()
PyPlot.scatter(Δts[1:end-1], Δts[2:end], c=1:length(Δts[1:end-1]))

figure()
PyPlot.plot(Δts)

freqs =2π ./Δts
figure()
plot(t[idxs_maxima[1:end-1]], -freqs, ".-")


# ---------------------------------------------------------------------- DYCA ---------------------------------------------------------------------- #
a = transpose(m_θ)
eigvals, proj_mat, proj_data = dyca(m_θ, 0.1)

sortidxs = sortperm(real.(eigvals), rev=true)

a = real.(proj_data[:, sortidxs])

fig = figure()
ax = fig.add_subplot(projection="3d")
# ax.scatter(a[:,1], a[:,2], a[:,3])
ax.plot(a[:,1], a[:,2], a[:,3])
# end




# --------------------------------------------------------------- directly from solve -------------------------------------------------------------- #
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
using DelimitedFiles
data_dir = datadir()
DIR =  projectdir()
# dictname = "ku_ws_501_shuf_p_eps410256_tend100000"
dictname = "ku_ws_501_shuf_eps_p013111_tend100000"
a, names_phases = get_resultnames(dictname, "", "phases")
a, names_R = get_resultnames(dictname, "", "Rt")
allparams, paramtypes = return_dict(dictname)
idx=1
# for idx=1:8
  d_params = dict_list(allparams)[idx]
  @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
  phasename = names_phases[idx]
  Rname = names_R[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
Ωs = instafreqs(t, m_θ, v_p, system_function) 
# all(Ωs[end,:] .== v_ω) #TRUE, calculation is correct!

# i = 1
# idxs_maxima = local_maxima(m_θ[:, i])
# Δts = diff(t[idxs_maxima])

fig, axs = subplots(2,1, sharex="all")
ax=axs[1]
ax.plot(t, Ωs[:,1])
ax.set_xlabel("t")
ax.set_ylabel(L"\dot{\theta}_1")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)

ax=axs[2]
c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(m_θ), t; align=false)
Rs = order_parameter(m_θ')
ax2 = plot_R!(fig, ax, Rs, t, 1, 1, 1)
# ax.set_xlim(15000, 18000)









# ----------------------------------------------------- compare dynamical systems and diff eqs ----------------------------------------------------- #
# dictname = "ku_ws_501_shuf_eps_p013111_tend100000"
dictname = "ku_ws_501_shuf_p_eps410256_tend100000"
a, names_phases = get_resultnames(dictname, "", "phases")
a, names_R = get_resultnames(dictname, "", "Rt")
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)

idx = 11
# for idx=1:length(alldicts)
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
Rname = names_R[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
t = t[2000:end]
m_θ = m_θ[2000:end, :]

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
Ωs = instafreqs(t, m_θ, v_p, system_function) 
# Ωs2 = instafreqs(1:size(m_θ)[1], m_θ, v_p, system_function) 

diffeqtheta = deepcopy(m_θ)
diffeqfreq = deepcopy(Ωs)



idx = 1
dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
a, names_phases = get_resultnames(dictname, "", "phases2")
a, names_freqs = get_resultnames(dictname, "", "instafreqs")
allparams, paramtypes = return_dict(dictname)
d_params = dict_list(allparams)[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
Ωname = names_freqs[idx]
data = CSV.File(phasename, header=false) |> DataFrame; m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Ωname, header=false) |> DataFrame; Ωs = Matrix(data)
Ωs2 = instafreqs(1:size(m_θ)[1], m_θ, v_p, system_function) 



dstheta = deepcopy(m_θ)
dsfreq = deepcopy(Ωs)
dsfreq2 = deepcopy(Ωs2)

figure()
# plot(diffeqfreq[:,1])
plot(dsfreq[:,1])
# plot(dsfreq[:,2])
plot(dsfreq2[:,1])


figure()
plot(diffeqtheta[:,1])
plot(dstheta[:,1])




# ---------------------------------------------------------------- recurrence plots ---------------------------------------------------------------- #
dictname = "ku_ws_501_shuf_eps_p013111_tend100000"
# dictname = "ku_ws_501_shuf_p_eps410256_tend100000"
a, names_phases = get_resultnames(dictname, "", "phases")

dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
a, names_phases = get_resultnames(dictname, "", "phases2")


dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_steptrue"
a, names_phases = get_resultnames(dictname, "", "phases2")
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")

dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse"
a, names_phases = get_resultnames(dictname, "", "phases2")
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")



dictname = "ku_ws_lyap_501_shuf_p_eps410256-icsfrombasins-unit22_v2"
a, names_phases = get_resultnames(dictname, "", "phases2")
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")

# a, names_R = get_resultnames(dictname, "", "Rt")
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)



# allδs = [ #dictname = "ku_ws_501_shuf_p_eps410256_tend100000"
# 	[1, 5, 10, 20, 40],
# 	[0.02, 0.03, 0.05, 0.1, 0.4],
# 	[1, 5, 10, 20, 40],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5],
# 	[0.05, 0.1, 0.5, 0.6, 5] 
# ]

# allδs = [ #dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
# 	[1, 5, 10, 20, 40],
# 	[15, 20, 23, 26, 28],
# 	[0.05, 0.1, 0.15, 0.2, 0.3],
# 	[0.1, 0.2, 0.3, 0.5, 0.6],
# 	[0.05, 0.1, 0.2, 0.62, 0.65],
# 	[0.1, 0.2, 0.3, 0.5, 0.8],
# 	[0.1, 0.3, 0.4,0.5, 0.6],
# 	[0.1, 0.2, 0.3, 0.5, 0.6],
# ]

allδs = [ #dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_steptrue"
	[1, 5, 10, 20, 40],
	[15, 20, 23, 26, 28],
	[0.05, 0.1, 0.15, 0.2, 0.3],
	[0.1, 0.2, 0.3, 0.5, 0.6],
	[0.05, 0.1, 0.2, 0.62, 0.65],
	[0.1, 0.2, 0.3, 0.5, 0.8],
	[0.1, 0.3, 0.4,0.5, 0.6],
	[0.1, 0.2, 0.3, 0.5, 0.6],
]


# maxδ = sqrt(N*(2pi)^2)
# allδs = [ #dictname = "ku_ws_501_shuf_eps_p013111_tend100000"
# 	# [40, 50, 51, 52, 54],
# 	[50, 51.5, 52, 52.5, 53],
# 	[40, 50, 51, 52, 54],
# 	[40, 50, 51, 52, 54],
# 	[40, 50, 51, 52, 54],
# 	[1, 5, 10, 20, 30],
# 	[0.1, 0.3, 0.5, 0.7, 1.0],
# 	[0.1, 0.3, 0.5, 0.7, 1.0],
# 	[0.1, 0.3, 0.5, 0.7, 1.0],
# 	[0.1, 0.3, 0.5, 0.7, 1.0],
# ]

allδs = [ #dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse"
	# [40, 50, 51, 52, 54],
	[47, 48, 49, 50, 50.5],
	[47, 48, 49, 50, 51],
	[36, 38, 40, 41, 42],
	[2, 5, 8, 11, 14],
	[0.1, 0.3, 0.4, 0.5, 0.7],
	[0.05, 0.1, 0.2, 0.3, 0.4],
	[0.001, 0.004, 0.01, 0.05, 0.1],
	[0.1, 0.2, 0.3, 0.5, 0.7],
	[0.1, 0.3, 0.5, 0.6, 0.7],
	[0.1, 0.3, 0.5, 0.7, 1.0],
	[0.05, 0.1, 0.15, 0.2, 0.4],
]


# idx = 11
for idx=1:length(alldicts)
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
# Rname = names_R[idx]
# data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(phasename, header=false) |> DataFrame; m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi; #FOR LYAPUNOVS


lyapsname = names_lyaps[idx]
lyap_t, lyaps = get_convergence_lyapunovs(lyapsname; printbiggest=false)

# data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
# t = t[2000:end]
# m_θ = m_θ[2000:end, :]

# v_ω = get_frequency(mchange, mfreq, d_params, DIR)
# v_adjl = topology_params = get_topology(mtop, d_params, DIR)
# v_p = params(v_ω, epsi, v_adjl)
# system_function = kuramotonetwork!
# Ωs = instafreqs(t, m_θ, v_p, system_function) 
# m_θ = m_θ[5000:12000, :]
# lyap_t = lyap_t[5000:12000]


m_θ = m_θ[5000:8000, :]
# lyap_t = lyap_t[5000:8000]
# lyaps
x = Dataset(m_θ)

δs = allδs[idx]

fig, axs = subplots(1, 5, sharex="all", sharey="all", constrained_layout=true)
for (i, ε) in enumerate(δs)
R = RecurrenceMatrix(x, ε, parallel=true)
ax = axs[i]
xs, ys = coordinates(R)
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_xlim(1, size(R)[1]); ylim(1, size(R)[2]);
# ax.scatter(lyap_t[xs], lyap_t[ys], color = "k", s = 1)
# ax.set_xlim(lyap_t[xs[1]], lyap_t[xs[end]]); ax.set_ylim(lyap_t[ys[1]], lyap_t[ys[end]]);
ax.set_aspect("equal")
ax.set_title("δ = $(ε)")
end
# fig.subplots_adjust(pad=0.0)
fig.suptitle("p = $(p), epsi = $(epsi)", y=0.75)
# fig.tight_layout(pad=0.3)
savefig("$(plotsdir())/recurrenceplots/recurrenceplots_p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )

figure()
ax = gca()
plot(lyap_t, lyaps[:,1])
plot(lyap_t, lyaps[:,2])
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_title("p = $(p), epsi = $(epsi)", y=0.75)
savefig("$(plotsdir())/recurrenceplots/lyapunovs_p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )

# figure()
# ax = gca()
# # m_θ = m_θ[5000:12000, :]
# # lyap_t = lyap_t[5000:12000]
# c, m_θaa, t  = plot_spatiotemporal!(fig, ax, m_θ, lyap_t; align=false)
# ax.set_title("p = $(p), epsi = $(epsi)", y=0.75)
# ax.grid(b=true, axis="both", which="both", alpha=1.0, linestyle="--")
# savefig("$(plotsdir())/recurrenceplots/phases_p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )


close("all")
end



t = collect(range(0, 10pi, length=9999))
x = zeros((length(t), 10))

x[:, 1:5] .= 1 .* sin.(1.0 .* t)
x[:, 6:10] .= 1 .* sin.(1.0 .* t)
# x[:, 6:10] .= 1 .* sin.(2.0 .* t)


x[:, 1:5] .= mod.(10 .* t, 2pi)
x[:, 6:10] .= mod.(2 .* t, 2pi)
# x[:, 6:10] .= mod.(2 .* t, 2pi)
x[:, 6:10] .= mod.(3 .* t, 2pi)
x[:, 6:10] .= mod.(7 .* t, 2pi)


x[:, 1:2] .= mod.(10 .* t, 2pi)
x[:, 3:4] .= mod.(3 .* t, 2pi)
x[:, 5:6] .= mod.(7 .* t, 2pi)
x[:, 7:8] .= mod.(9 .* t, 2pi)
x[:, 9:10] .= mod.(pi .* t, 2pi)


R = RecurrenceMatrix(Dataset(x), 1, parallel=true)

figure()
ax = gca()
xs, ys = coordinates(R)
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_xlim(1, size(R)[1]); ylim(1, size(R)[2]);
ax.set_aspect("equal")
ax.set_title("δ = $(ε)")

figure()
plot(t, x)


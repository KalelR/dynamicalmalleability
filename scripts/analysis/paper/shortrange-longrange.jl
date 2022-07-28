include("../general_plots.jl")  
include("$(srcdir())/sims/Kuramoto/parameters.jl")
include("$(srcdir())/utils.jl")
include("$(srcdir())/quantifiers.jl")
using DelimitedFiles

#WS
dictname =  "ku_ws_501_shuf_p_eps451282"
# dictname =  "ku_ws_501_shuf_p_eps4"
dictname = "ku_ws_501_shuf_p_eps451282_moreshuffles"
quantifier = "Rstats"
data_dir = datadir()
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)

loc_range = 2 # =k, number of edges on each side (total is 2*loc_range)
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic, k, seednet = alldicts[1]
ps = allparams["p"]

SRdegrees = []; LRdegrees = [];
for (idx, p) in enumerate(ps)
    v_adjl = get_wattsstrogatz(N, p, k, seednet)

    SRdegree, LRdegree = calc_topological_contributions(v_adjl, loc_range)
    push!(SRdegrees, SRdegree); push!(LRdegrees, LRdegree)
end

SRtotal = sum.(SRdegrees)
LRtotal = sum.(LRdegrees)
ratioSL = @. (SRtotal - LRtotal) / (SRtotal + LRtotal)

R_all = collectresults(dictname, quantifier; data_dir=data_dir)
cp = R_all[:,1]
R_all = R_all[:,2:end]
# Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
Δs = [std(R_all[i,:]) for i=1:size(R_all)[1]]

# figure()
# plot(ps, SRtotal)
# plot(ps, LRtotal)
# xscale("log")

# figure()
# plot(ps, ratioSL)

# figure()
# plot(ps, Δs)
# xscale("log")

# figure()
# plot(ratioSL, Δs)




#PL
dictname = "ku_pl_501_shuf_p_eps646154"
R_all = collectresults(dictname, quantifier; data_dir=data_dir)
cp = R_all[:,1]
R_all = R_all[:,2:end]
# Δs_pl = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
Δs_pl = [std(R_all[i,:]) for i=1:size(R_all)[1]]
alphas = cp

# alphas = 0:0.01:3.0
SRdegrees = []; LRdegrees = [];
for (idx, alpha) in enumerate(alphas)
	SRdegree, LRdegree = calc_topological_contributions(N, alpha, loc_range)
	push!(SRdegrees, SRdegree); push!(LRdegrees, LRdegree)
end

SRtotal = sum.(SRdegrees)
LRtotal = sum.(LRdegrees)
ratioSL_pl = @. (SRtotal - LRtotal) / (SRtotal + LRtotal)

# figure()
# plot(alphas, SRtotal)
# plot(alphas, LRtotal)

# figure()
# plot(alphas, ratioSL)

# figure()
# plot(alphas, Δs_pl)

# figure()
# plot(ratioSL_pl, Δs_pl)


#Plot both
fig, ax = subplots(constrained_layout=true)
# plot(ratioSL, Δs, color="#987900")
# plot(ratioSL_pl, Δs_pl, color="#001F98")
plot(ratioSL, Δs, color="#4D027E", linewidth=2, label="Watts-Strogatz")
plot(ratioSL_pl, Δs_pl, color="#337E02", linewidth=2, label="Distance-dependent")
xlabel(L"\kappa = \frac{K_\mathrm{short\;range} - K_\mathrm{long\;range} }{K_\mathrm{short\;range} + K_\mathrm{long\;range} }", fontsize=13)
# ylabel(L"\Delta")
ylabel(L"\mathrm{std}(\langle R \rangle)", fontsize=13)
xlim(-1, 1)
# ylim(0,1)
ylim(0,0.2) #for std
ax.tick_params(axis="both", direction="in", which="both")
width = 1; height = 0.8
resize!(fig; width=width, height=height)
ax.spines["top"].set_visible(false);
ax.spines["right"].set_visible(false);
xticks(-1:0.5:1)
yticks(0:0.05:0.2)
legend()
savefig("$(plotsdir())/paper/shortlongrange/delta_ratio_short_long_range.pdf")
savefig("$(plotsdir())/paper/shortlongrange/figure_5.pdf")


# Getting p from varying eps results
ps = ["0", "0001", "001", "001311", "002955",  "005817", "006661", "008733", "01", "01145", "013111", "017191", "025809", "050802", "1"]
ps_real = [0, 0.001, 0.01, 0.01311, 0.02955, 0.05817, 0.06661, 0.08733, 0.1, 0.1145, 0.13111, 0.17191, 0.25809, 0.50802, 1]
# ps = replace.(string.(ps_real), "."=>"")
N = 501
idx_quantity = 2
quantifier = "Rstats"

epsis = [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0]

epsi = 4.51282; idx_eps = findfirst(x->x==epsi, epsis)

numrealizations = 1001
allRs = zeros(Float64, (length(ps), numrealizations+1))
for (idx, p) in enumerate(ps)
	dictname = "ku_ws_501_shuf_eps_p$(p)" 
	R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
	Rs = Vector(R_all[idx_eps, 2:end])
	allRs[idx, 2:end] = Rs 
end
allRs[:,1] = ps_real
Δs = [gap(allRs[i,:]) for i=1:size(allRs)[1]]

fig, axs = plot_R(allRs[:,1], allRs[:,2:end])
SRdegrees = []; LRdegrees = [];
for (idx, p) in enumerate(ps_real)
    v_adjl = get_wattsstrogatz(N, p, k, seednet)

    SRdegree, LRdegree = calc_topological_contributions(v_adjl, loc_range)
    push!(SRdegrees, SRdegree); push!(LRdegrees, LRdegree)
end
SRtotal = sum.(SRdegrees)
LRtotal = sum.(LRdegrees)
ratioSL = @. (SRtotal - LRtotal) / (SRtotal + LRtotal)

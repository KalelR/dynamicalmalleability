# To plot <R> versus eps and p for all the cases
include("general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()

idx_quantity = 2
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]


# N = 25
# N = 50
# N = 100
# N = 200
# N = 400
# N = 1000
# N = 5000
N = 501
# N = 10000
dictname = "ku_ws_$(N)_shuf_eps_pseveral"
# dictname = "ku_ws_$(N)_shuf_eps_pseveral_2" #for N = 1000
allparams, paramtypes = return_dict(dictname)
ps = allparams["p"]
shuffleids = allparams["shuffleid"]; numrealizations = length(shuffleids)
# alldicts = dict_list(allparams)
# @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]
# data = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
# epsis = data[:,1]
# data = data[:, 2:end]

global epsis
meanRs_all = []; gapRs_all = []; stdRs_all = []
for (idx, p) in enumerate(ps)
	names = ["/home/kalelr/malleability/data/N_$(N)-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_epsi_all-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid in shuffleids]
	# names = ["/home/kalelr/malleability/data/N_$(N)-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_epsi_all-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3001.0-ttrans_1250.0.dat" for shuffleid in shuffleids] #for N =1000
	df = collectresults(names, idx_quantity, 1:length(shuffleids))
	if idx == 1 epsis = df[:,1] end
	Rs = Matrix(df[:, 2:end])
	push!(meanRs_all, mean(Rs, dims=2)[:,1])
	push!(gapRs_all, mapslices(gap, Rs; dims=2)[:,1])
	push!(stdRs_all, mapslices(std, Rs; dims=2)[:,1])
end
meanRs_all = hcat(meanRs_all...); gapRs_all = hcat(gapRs_all...); stdRs_all = hcat(stdRs_all...)
# Two plots together
fig, axs = subplots(1, 2, constrained_layout=true, sharex="all", sharey="all")
ax = axs[1]
c = ax.pcolormesh(epsis, ps, meanRs_all', vmin=0, vmax=1)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
ax.tick_params(axis="both", direction="in", which="both")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{mean}(\langle R \rangle)", ax=ax)
cbar.ax.tick_params(axis="both", direction="in", which="both")

ax = axs[2]
# c = ax.pcolormesh(epsis, ps, stdRs_all', vmin=0, vmax=0.3) #10000
c = ax.pcolormesh(epsis, ps, stdRs_all', vmin=0, vmax=0.2) #5000
# c = ax.pcolormesh(epsis, ps, stdRs_all', vmin=0, vmax=0.4) #for N = 50
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
ax.tick_params(axis="both", direction="in", which="both")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{std}(\langle R \rangle)", ax=ax)
cbar.ax.tick_params(axis="both", direction="in", which="both")

# axs[1].set_xlim(0,8)
max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
max_gapR, idxmaxgapR = findmax(gapRs_all); pmaxg, epsmaxg = ps[idxmaxgapR[2]], epsis[idxmaxgapR[1]]
fig.suptitle("N = $(N), num realizations = $(numrealizations)\n maximum std = $(round(max_stdR, digits=2)) at epsi = $(epsmax) and p = $(pmax) \n maximum gap = $(round(max_gapR, digits=2)) at epsi = $(epsmaxg) and p = $(pmaxg) ")

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width,height)

savefig("$(plotsdir())/scaling/scaling_meanR_stdR-N_$(N).png")

# Three plots together
# fig, axs = subplots(1, 3, constrained_layout=true, sharex="all", sharey="col")
# ax = axs[1]
# c = ax.pcolormesh(epsis, ps, meanRs_all')
# ax.set_yscale("log")
# ax.set_yticks(v_xticks)
# ax.set_yticklabels(v_xticklabels)
# ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
# ax.set_xlabel(L"\epsilon")
# ax.tick_params(axis="both", direction="in", which="both")
# cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{mean}(\langle R \rangle)", ax=ax)

# ax = axs[2]
# c = ax.pcolormesh(epsis, ps, stdRs_all')
# ax.set_yscale("log")
# ax.set_yticks(v_xticks)
# ax.set_yticklabels(v_xticklabels)
# ax.set_ylim(0, 1)
# # ax.set_ylabel(L"p")
# ax.set_xlabel(L"\epsilon")
# ax.tick_params(axis="both", direction="in", which="both")
# cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{std}(\langle R \rangle)", ax=ax)


# ax = axs[3]
# c = ax.pcolormesh(epsis, ps, gapRs_all')
# ax.set_yscale("log")
# ax.set_yticks(v_xticks)
# ax.set_yticklabels(v_xticklabels)
# ax.set_ylim(0, 1)
# # ax.set_ylabel(L"p")
# ax.set_xlabel(L"\epsilon")
# ax.tick_params(axis="both", direction="in", which="both")
# cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{max}(\langle R \rangle) - \mathrm{min}(\langle R \rangle)", ax=ax)

# axs[1].set_xlim(0,8)
# max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
# max_gapR, idxmaxgapR = findmax(gapRs_all); pmaxg, epsmaxg = ps[idxmaxgapR[2]], epsis[idxmaxgapR[1]]
#
# fig.suptitle("N = $(N), num realizations = $(numrealizations); maximum std = $(round(max_stdR, digits=2)) at epsi = $(epsmax) and p = $(pmax); maximum gap = $(round(max_gapR, digits=2)) at epsi = $(epsmaxg) and p = $(pmaxg); ")
# savefig("$(plotsdir())/scaling/scaling_meanR_stdR_gapR-N_$(N).png")



# ps = ["0", "0001", "001", "001311", "002955",  "005817", "006661", "008733", "01", "01145", "013111", "017191" "025809", "050802", "1"]
# ps_real = [0, 0.001, 0.01, 0.01311, 0.02955, 0.05817, 0.06661, 0.08733, 0.1, 0.1145, 0.13111, 0.17191, 0.25809, 0.50802, 1]
# ps_real = [0.0, 0.001, 0.01, 0.02955, 0.05817, 0.08733, 0.1, 0.25809, 1.0] #N = 25
# ps = replace.(string.(ps_real), "."=>"")

# idx_quantity = 2

# v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
# v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]

# meanRs_all = [Float64[] for idx in ps]; gapRs_all = [Float64[] for idx in ps]; stdRs_all = [Float64[] for idx in ps]
# for (idx, p) in enumerate(ps)
# 	dictname = "ku_ws_501_shuf_eps_p$(p)"
# 	R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
# 	cp = R_all[:,1]
# 	Rs = Matrix(R_all[:, 2:end])
# 	push!(meanRs_all, mean(Rs, dims=2)[:,1])
# 	push!(gapRs_all, mapslices(gap, Rs; dims=2)[:,1])
# 	push!(stdRs_all, mapslices(std, Rs; dims=2)[:,1])
# end
# meanRs_all = hcat(meanRs_all...)

# fig, ax = subplots(constrained_layout=true)
# c = ax.pcolormesh(ps_real, cp, meanRs_all)
# ax.set_xscale("log")
# ax.set_xticks(v_xticks)
# ax.set_xticklabels(v_xticklabels)
# ax.set_xlim(0, 1)
# ax.set_xlabel(L"p")
# ax.set_ylabel(L"\epsilon")
# cbar = fig.colorbar(c, location="bottom", label = L"\langle R \rangle")

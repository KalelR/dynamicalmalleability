# To plot <R> versus eps and p for all the cases
include("../general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()


# ps = ["0", "0001", "0003", "001", "001145", "001311", "001968", "002955",  "005817", "006661", "007627", "008733", "01", "01145", "013111", "015013", "017191", "019684", "025809", "050802", "066608",  "1"]
# ps_real = [0, 0.001, 0.003, 0.01, 0.01145, 0.01311, 0.01968,  0.02955, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013,  0.17191, 0.19684, 0.25809, 0.50802, 0.66608, 1]

ps = ["0", "0001", "001", "001311", "002955",  "005817", "006661", "008733", "01", "01145", "013111", "017191", "025809", "050802", "1"]
ps_real = [0, 0.001, 0.01, 0.01311, 0.02955, 0.05817, 0.06661, 0.08733, 0.1, 0.1145, 0.13111, 0.17191, 0.25809, 0.50802, 1]
# ps = replace.(string.(ps_real), "."=>"")
N = 501
idx_quantity = 2
quantifier = "Rstats"
p_offset = 0.0003
v_xticks = [p_offset, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
shading = "gouraud"
# shading = "auto"
width=2
height=1

meanRs_all = []; gapRs_all = []; stdRs_all = []; cps = []
global numrealizations
for (idx, p) in enumerate(ps)
	dictname = "ku_ws_501_shuf_eps_p$(p)" 
	R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
	Rs = Matrix(R_all[:, 2:end])
	numrealizations = size(Rs, 2)
	push!(cps, R_all[:,1])
	push!(meanRs_all, mean(Rs, dims=2)[:,1])
	push!(gapRs_all, mapslices(gap, Rs; dims=2)[:,1])
	push!(stdRs_all, mapslices(std, Rs; dims=2)[:,1])
end
meanRs_all = hcat(meanRs_all...); gapRs_all = hcat(gapRs_all...); stdRs_all = hcat(stdRs_all...)
epsis = cps[1] 

cmap = "viridis"
# cmap = "plasma"
# cmap = "inferno"
# cmap = "magma"
# cmap = "cividis"
# cmap = "jet"

epsilon_colors = ["#1E9792","#7127C7","#5F971E", "#971E22"]
ps_colors = [p_offset+0.03*p_offset, 0.1145, 0.19684, 0.95]
#With STD
fig, axs = subplots(1, 2, constrained_layout=true, sharey=true)
ax = axs[1]
c = ax.pcolormesh(epsis, ps_real, meanRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{mean}(\langle R \rangle)", ax=ax)
ax.tick_params(axis="both", direction="in", which="both")
cbar.ax.tick_params(axis="both", direction="in", which="both")
cbar.solids.set_rasterized(true)
cbar.solids.set_edgecolor("face")

ax = axs[2]
c = ax.pcolormesh(epsis, ps_real, stdRs_all', cmap=cmap, shading=shading, vmin=0, vmax=0.2)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{std}(\langle R \rangle)", ax=ax)
ax.tick_params(axis="both", direction="in", which="both")
cbar.ax.tick_params(axis="both", direction="in", which="both")
cbar.set_ticks([0, 0.05, 0.1, 0.15, 0.2])
cbar.solids.set_rasterized(true)
cbar.solids.set_edgecolor("face")
max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
max_gapR, idxmaxgapR = findmax(gapRs_all); pmaxg, epsmaxg = ps[idxmaxgapR[2]], epsis[idxmaxgapR[1]]
fig.suptitle("N = $(N), num realizations = $(numrealizations)\n maximum std = $(round(max_stdR, digits=2)) at epsi = $(epsmax) and p = $(pmax) \n maximum gap = $(round(max_gapR, digits=2)) at epsi = $(epsmaxg) and p = $(pmaxg) ")

resize!(fig, width=width, height=height)
# savefig("$(plotsdir())/scaling/scaling_meanR_stdR-N_$(N)-shading_$(shading).pdf")
savefig("$(plotsdir())/scaling/scaling_meanR_stdR-N_$(N)-shading_$(shading)-details.pdf")

#With GAP
fig, axs = subplots(1, 2, constrained_layout=true, sharey=true)
ax = axs[1]
c = ax.pcolormesh(epsis, ps_real, meanRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1.0, linewidth=0)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{mean}(\langle R \rangle)", ax=ax)
for i=1:4 ax.axhline(ps_colors[i], linestyle="-", color=epsilon_colors[i], linewidth=4, alpha=0.7) end
ax.axvline(4.51, linestyle="-", color="black", linewidth=4, alpha=0.7) 
ax.tick_params(axis="both", direction="in", which="both")
cbar.solids.set_rasterized(true)
cbar.solids.set_edgecolor("face")
cbar.ax.tick_params(axis="both", direction="in", which="both")
minorticks_off()
ax.set_ylim(p_offset, 1.0)

ax = axs[2]
c = ax.pcolormesh(epsis, ps_real, gapRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1.0)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
# cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{max}(\langle R \rangle) - \mathrm{min}(\langle R \rangle)", ax=ax)
cbar = fig.colorbar(c, location="bottom", label = L"\Delta", ax=ax)
ax.tick_params(axis="both", direction="in", which="both")
cbar.ax.tick_params(axis="both", direction="in", which="both")
minorticks_off()
# cbar.set_ticks([0, 0.05, 0.1, 0.15, 0.2])
cbar.solids.set_rasterized(true)
cbar.solids.set_edgecolor("face")
for i=1:4 ax.axhline(ps_colors[i], linestyle="-", color=epsilon_colors[i], linewidth=4, alpha=0.7) end
ax.axvline(4.51, linestyle="-", color="black", linewidth=4, alpha=0.7) 

# max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps_real[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
# maxgap = gapRs_all[idxmaxstdR]
# fig.suptitle("N = $(N), maximum std = $(round(max_stdR, digits=2)) w gap = $(round(maxgap, digits=2)) at epsi = $(epsmax) and p = $(pmax); num realizations = $(numrealizations)")
resize!(fig, width=width, height=height)
# savefig("$(plotsdir())/scaling/scaling_meanR_gapR-N_$(N)-shading_$(shading).pdf")
savefig("$(plotsdir())/paper/generalscenariomalleability/figure_1b.pdf")

include("general_plots.jl")
using PyCall, DelimitedFiles
# axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")

colorR = "#d45b02"
align = false

ps = [0.0,  0.08733,  0.19684, 1.0]
unitids = [0, 118, 391]
epsi = 4.51282
shuffleid = 0

numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_3999.9999999999995-ttrans_3000.0-ω_new_3.0.dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_3999.9999999999995-ttrans_3000.0-ω_new_3.0.dat"
        ax=axs[i,j]
        c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
        ax2 = plot_R!(fig, ax, Rname, t, j, i, numC, colorR="#027118")
        ax.tick_params(axis="both", direction="in", which="both")
        ax2.tick_params(axis="both", direction="in", which="both")
    end
end

axs[end, 2].set_xlabel(L"t")
axs[2,1].set_ylabel("Unit No.")
for i=1:numL axs[i,1].set_yticks([1, 250, 501]) end

axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
    axs[end, j].set_xticks([3000, 3500, 4000])
end

for i=2:numL
    idxunit = unitids[i]
    for j=1:numC 
        axs[i,j].axhline(idxunit, linestyle="dashed", color="#FF0D00", alpha=0.8, linewidth=2.5)
    end 
end

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(5.0/6)*width;
fig.set_size_inches(width,height)
filename = "$(plotsdir())/paper/spatiotemporal/spatiotemporalpatterns-oneunit-omeganew3.png"
mkpath(dirname(filename))
savefig(filename, dpi=400)


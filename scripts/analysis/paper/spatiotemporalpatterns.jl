include("../general_plots.jl")
using PyCall, DelimitedFiles
axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]

# --- Plot the phases 
# colorR = "#098608"
colorR = "#d45b02"
align = true
# align = false

epsi = 4.10256
ps = [0, 0.13111, 1.0] #shuffle
shuffleids = [0, 67, 380]


function plot_spatiotemporal!(fig, ax, phasename; align=false, xticks=[], xlim=())
        data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        t_end, N = size(m_θ)
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        if(align) idxperm = sortperm(m_θ_t[:,1]); m_θ_t = m_θ_t[idxperm, :]; end #-----align phases!
        c = ax.pcolormesh(x, y, m_θ_t, cmap="twilight", vmin=-pi, vmax=pi)
        return c, m_θ_t, v_t
end

function plot_R!(fig, ax, Rname, t, j=0, i=1, numC=0; colorR="red")
    data = readdlm(Rname); v_R = data
    ax2 = ax.twinx()
    ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
    ax2.set_ylim(0,1)
    ax2.tick_params(axis="y", colors=colorR)
    ax2.yaxis.label.set_color(colorR)

    if(j != numC) ax2.set_yticks([]) end
    if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
    return ax2 
end

function beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false)
    numL, numC = size(axs)
    for j=1:numC
        axs[end, j].set_xlabel(L"t")
        # axs[1,ij].set_xticks([1500, 2000])
        s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
        # if xticks != [] axs[end,j].set_xticks(xticks) end 
    end

    for i =1:numL
        axs[i, 1].set_ylabel("Unit No.")
        if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
        axs[i,1].set_yticks([1, 250, 501])
        if(shuffle) axs[i, end].text(1.35, 0.5, "Shuffle $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        else
        axs[i, end].text(1.35, 0.5, "Switched Unit\n $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        end
    end


    # if xlim != () axs[1,1].set_xlim(xlim) end

    ax = axs[end,2]
    axins = axes_grid1.inset_axes(ax,
               width="250%",  # width = 5% of parent_bbox width
               height="10%",  # height : 50%
               loc="upper center",
            #    bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
               bbox_to_anchor=(0.0, 0, 1, 1), #x0, y0, width height
               bbox_transform=ax.transAxes,
               borderpad=14,
               )
    cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
    cbar.set_label(L"\theta", fontsize=label_size)
    cbar.solids.set_edgecolor("face")
    cbar.set_ticks(-pi:pi:pi)
    cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
end
    
numL, numC = length(shuffleids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (i, shuffleid) in enumerate(shuffleids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
        ax=axs[i,j]
        global c
        c, _, t  = plot_spatiotemporal!(fig, ax, phasename; align=align)
        ax2 = plot_R!(fig, ax, Rname, t, j, i, numC)
    end
end
# xlim = (3000, 4000); xticks=[]
beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align)
axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
    axs[end, j].set_xticks([3000, 3500, 4000])
end

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
# fig.tight_layout(rect=[0.0, 0.1, 1., 1.01])
fig.subplots_adjust(bottom=0.2)
# fig.subplots_adjust(wspace=0.15)
filename = "$(plotsdir())/paper/spatiotemporalpatterns-shuffling.png" 
if align==true filename = "$(plotsdir())/paper/spatiotemporalpatterns-shuffling-aligned.png" end
mkpath(dirname(filename))
savefig(filename, dpi=300)




# -------------------------------------------------------------------- One unit -------------------------------------------------------------------- #
ps = [0, 0.19684, 1.0] #unit
unitids = [0, 158, 298]

epsi = 4.51282
unitids = [0, 118, 391]
# ps = [0.0, 0.08733, 0.19684, 1.0]
ps = [0.0, 0.19684, 1.0]
shuffleid = 0
align = false
# align = true
function beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false)
    numL, numC = size(axs)
    for j=1:numC
        axs[end, j].set_xlabel(L"t")
        # axs[1,ij].set_xticks([1500, 2000])
        # s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
        # if xticks != [] axs[end,j].set_xticks(xticks) end 
    end

    for i =1:numL
        axs[i, 1].set_ylabel("Unit No.")
        if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
        axs[i,1].set_yticks([1, 250, 501])
        # if(shuffle) axs[i, end].text(1.35, 0.5, "Shuffle $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        # else
        # axs[i, end].text(1.35, 0.5, "Unit $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        # axs[i, end].text(1.35, 0.5, "Switched unit $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        # end
    end


    # if xlim != () axs[1,1].set_xlim(xlim) end
    # ax = axs[end,2]
    # axins = axes_grid1.inset_axes(ax,
    #            width="250%",  # width = 5% of parent_bbox width
    #            height="10%",  # height : 50%
    #            loc="upper center",
    #         #    bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
    #            bbox_to_anchor=(0.0, 0, 1, 1), #x0, y0, width height
    #            bbox_transform=ax.transAxes,
    #            borderpad=25,
    #            )
    # cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
    # cbar.set_label(L"\theta", fontsize=label_size)
    # cbar.solids.set_edgecolor("face")
    # cbar.set_ticks(-pi:pi:pi)
    # cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
    # cbar.ax.tick_params(axis="both", direction="in", which="both")
end
function plot_R!(fig, ax, Rname, t, j=0, i=1, numC=0; colorR="red")
    data = readdlm(Rname); v_R = data[:,1]
    ax2 = ax.twinx()
    ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
    ax2.set_ylim(0,1)
    ax2.tick_params(axis="y", colors=colorR)
    ax2.yaxis.label.set_color(colorR)
    ax2.set_yticks([0, 0.5, 1.0])
    if(j != numC) ax2.set_yticks([]) end
    if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
    return ax2 
end


numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        # phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
        # Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"

        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/Rt-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
        ax=axs[i,j]
        c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
        ax2 = plot_R!(fig, ax, Rname, t, j, i, numC, colorR="#027118")
        ax.tick_params(axis="both", direction="in", which="both")
        ax2.tick_params(axis="both", direction="in", which="both")

    end
end
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=unitids, shuffle=false, axes_grid1=axes_grid1, align=align)
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
# fig.subplots_adjust(bottom=0.08, wspace=0.05, top=0.95, left=0.08, right=0.93, hspace=0.15)
filename = "$(plotsdir())/paper/spatiotemporal/spatiotemporalpatterns-oneunit-omeganew3.png"
# filename = "$(plotsdir())/paper/spatiotemporalpatterns-oneunit-omeganew3.pdf"
# if align==true filename = "$(plotsdir())/paper/spatiotemporalpatterns-oneunit-aligned.png" end
mkpath(dirname(filename))
savefig(filename, dpi=400)




# -------------------------------------------------------------------- SNAPSHOTS ------------------------------------------------------------------- #
ps = [0, 0.19684, 1.0] #unit
unitids = [0, 158, 298]

epsi = 4.51282
unitids = [0, 118, 391]
# ps = [0.0, 0.08733, 0.19684, 1.0]
ps = [0.0, 0.19684, 1.0]
shuffleid = 0

numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        # phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
        # Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"

        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/Rt-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
        ax=axs[i,j]
        data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        t_end, N = size(m_θ)
        ax.scatter(1:N, m_θ[end,:],    s=10, c="k")
        ax.scatter(1:N, m_θ[end-10,:], s=10, c="k", alpha=0.15)
        ax.scatter(1:N, m_θ[end-20,:], s=10, c="k", alpha=0.10)
        ax.scatter(1:N, m_θ[end-30,:], s=10, c="k", alpha=0.08)
        ax.scatter(1:N, m_θ[end-40,:], s=10, c="k", alpha=0.05)
        ax.scatter(1:N, m_θ[end-50,:], s=10, c="k", alpha=0.01)
        ax.tick_params(axis="both", direction="in", which="both")

    end
end
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=unitids, shuffle=false, axes_grid1=axes_grid1, align=align)
axs[end, 2].set_xlabel("Unit No.")
axs[2,1].set_ylabel(L"\theta")
for i=1:numL axs[i,1].set_yticks([-pi, -pi/2, 0, pi/2, pi]); axs[i,1].set_yticklabels([L"-\pi", L"-\pi/2", L"0", L"\pi/2", L"\pi"]) end
axs[1,1].set_ylim(-pi, pi)
axs[1,1].set_xlim(0, 501)
for i=1:numC axs[end,i].set_xticks([1, 100, 200, 300, 400, 501]) end


column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(5.5/6)*width;
fig.set_size_inches(width,height)
# fig.subplots_adjust(bottom=0.08, wspace=0.05, top=0.95, left=0.08, right=0.93, hspace=0.15)
filename = "$(plotsdir())/paper/spatiotemporal/snapshots-spatiotemporalpatterns-oneunit-omeganew3.png"
# filename = "$(plotsdir())/paper/spatiotemporalpatterns-oneunit-omeganew3.pdf"
# if align==true filename = "$(plotsdir())/paper/spatiotemporalpatterns-oneunit-aligned.png" end
mkpath(dirname(filename))
savefig(filename, dpi=400)
filename = "$(plotsdir())/paper/spatiotemporal/snapshots-spatiotemporalpatterns-oneunit-omeganew3.pdf"
savefig(filename)




# # --- Determine the shuffleids and probabiltiies to use 
# #Shuffling
# quantifier = "Rstats"
# dictname = "ku_ws_501_shuf_p_eps4"
# # dictname = "ku_ws_501_unit_p_eps4"
# R_all = collectresults(dictname, quantifier; data_dir=data_dir)
# control_parameter = R_all[:,1]
# R_all = R_all[:,2:end]
# fig, axs = plot_R(control_parameter, R_all; x_zero_offset =5e-5, xscale="log")

# Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
# max, idxmaxΔ = findmax(Δs)
# cpmax = control_parameter[idxmaxΔ]

# maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# minR, idxminR = findmin(R_all[idxmaxΔ, :])


# julia> max, idxmaxΔ = findmax(Δs)
# (0.94506, 28)

# cpmax = control_parameter[idxmaxΔ]
# 0.13111

# maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# (0.97088, Symbol("68"))
# Shuffleid = 68 - 1

# julia> minR, idxminR = findmin(R_all[idxmaxΔ, :])
# (0.00672, Symbol("381"))

# Shuffleid = 381 - 1


# #One unit

dictname = "ku_ws_501_unit_p_eps451282_omeganew3"
R_all = collectresults(dictname, "Rstats"; data_dir=data_dir)
control_parameter = R_all[:,1]
R_all = R_all[:,2:end]
Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
max, idxmaxΔ = findmax(Δs)
cpmax = control_parameter[idxmaxΔ]
maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
minR, idxminR = findmin(R_all[idxmaxΔ, :])
idxmaxR -= 1

# julia> cpmax = control_parameter[idxmaxΔ]
# 0.19688999999999998

# julia> maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# (0.96418, Symbol("159"))

# julia> minR, idxminR = findmin(R_all[idxmaxΔ, :])
# (0.01912, Symbol("299"))


 # ------------------------------------------------------------- Plot phases as scatter ------------------------------------------------------------- #

function beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false)
    numL, numC = size(axs)
    for j=1:numC
        axs[end, j].set_xlabel(L"t")
        # axs[1,ij].set_xticks([1500, 2000])
        s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
        # if xticks != [] axs[end,j].set_xticks(xticks) end 
    end

    for i =1:numL
        axs[i, 1].set_ylabel("Unit No.")
        if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
        # axs[i,1].set_yticks([1, 250, 501])
        if(shuffle) axs[i, end].text(1.35, 0.5, "Shuffle $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        else
        axs[i, end].text(1.35, 0.5, "Switched Unit\n $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        end
    end
end


epsi = 4.10256
ps = [0, 0.13111, 1.0] #shuffle
shuffleids = [0, 67, 380]

function scatter_phases!(fig, ax, phasename; align=false, xticks=[], xlim=())
    data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
    t_end, N = size(m_θ)
    ts = 1:length(v_t[1:1:500])
    cmap = matplotlib.cm.get_cmap("viridis")
    for i = 1:N
        # c = ax.scatter(ts, m_θ[ts, i], c = [cmap(i/N) for jj=1:length(ts)], s = 0.5, alpha=0.3, cmap="viridis")
        c = ax.scatter(ts, m_θ[ts, i], color = cmap(i/N), s = 0.5, alpha=0.3, cmap="viridis")
    end
    return m_θ, v_t
end

    
numL, numC = length(shuffleids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
for (i, shuffleid) in enumerate(shuffleids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
        # Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
        ax=axs[i,j]
        global c
        _, t  = scatter_phases!(fig, ax, phasename)
    end
end
# xlim = (3000, 4000); xticks=[]
beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1)
# axs[1,1].set_xlim(3000, 4000)
# for j=1:numC 
    # axs[end, j].set_xticks([3000, 3500, 4000])
# end


column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
# fig.tight_layout(rect=[0.0, 0.1, 1., 1.01])
fig.subplots_adjust(bottom=0.2)
# fig.subplots_adjust(wspace=0.15)
filename = "$(plotsdir())/spatiotemporal/scatterphases-shuffling.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)



# ---------------------------------------------------------------- Plot frequencies for shuffles ---------------------------------------------------------------- #
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
epsi = 4.10256
ps = [0, 0.13111, 1.0] #shuffle
shuffleids = [0, 67, 380]
N = 501
k = 2 
seednet = 1
mu = 0.0
std = 1.0
seedfreq = 0 

system_function = kuramotonetwork!

    
numL, numC = length(shuffleids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
for (i, shuffleid) in enumerate(shuffleids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω = get_frequency_gauss(N, mu, std, seedfreq, shuffleid, DIR)
        v_p = params(v_ω, epsi, v_adjl)
        data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        ax=axs[i,j]
        ax.scatter(1:N, mean(Ωs, dims=1))
    end
end
# xlim = (3000, 4000); xticks=[]
beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1)
# axs[1,1].set_xlim(3000, 4000)
# for j=1:numC 
    # axs[end, j].set_xticks([3000, 3500, 4000])
# end

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
fig.subplots_adjust(bottom=0.2)
filename = "$(plotsdir())/spatiotemporal/frequencies-per-unitnumbers-shuffling.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

# --------------------------------------------------- Instantaneous frequencies for changing unit -------------------------------------------------- #
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
std = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
epsi = 4.51282
ps = [0.0, 0.19684, 1.0]

numL, numC = length(shuffleids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, std, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsi, v_adjl)
        data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        ax=axs[i,j]
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x, y, Ωs', cmap="twilight", vmin=-0.07, vmax=-0.055)
    end
end

ax = axs[end,2]
axins = axes_grid1.inset_axes(ax,
           width="250%",  # width = 5% of parent_bbox width
           height="10%",  # height : 50%
           loc="upper center",
        #    bbox_to_anchor=(0.0, -1.52, 1, 1), #x0, y0, width height
           bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
           bbox_transform=ax.transAxes,
           borderpad=0,
           )
cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
cbar.set_label(L"\theta", fontsize=label_size)
cbar.solids.set_edgecolor("face")
# cbar.set_ticks(-pi:pi:pi)
# cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align)


column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
fig.subplots_adjust(bottom=0.4)
filename = "$(plotsdir())/paper/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

# --------------------------------------------------- Average instantaneous frequencies for changing unit -------------------------------------------------- #
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
std = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
epsi = 4.51282
ps = [0.0, 0.19684, 1.0]

numL, numC = length(shuffleids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, std, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsi, v_adjl)
        # data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        data = readdlm(phasename); v_t = data[1500:end,1]; m_θ = data[1500:end, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        ax=axs[i,j]
        c = ax.scatter(1:N, mean(Ωs, dims=1), color="black", s=10)
    end
end

axs[end, 2].set_xlabel("Unit No.")
axs[2,1].set_ylabel(L"\langle \dot{\theta} \rangle")
axs[1,1].set_xlim(0, 501)
for i=1:numC axs[end,i].set_xticks([1, 100, 200, 300, 400, 501]) end


column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
# fig.subplots_adjust(bottom=0.2)
filename = "$(plotsdir())/paper/spatiotemporal/meanfrequencies-per-unitnumbers-oneunit.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)
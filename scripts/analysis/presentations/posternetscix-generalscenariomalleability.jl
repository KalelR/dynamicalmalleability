# To plot <R> versus eps and p for all the cases
include("../general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()

dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]



epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
epsilon_colors = ["#B41C9A", "#B4821C", "#1CB436"]
epsilon_colors_weaker = ["#b33d9e", "#b58b36", "#57b567"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1.0; height = 0.5;
width = 2.0; height = 1.0
ylabel1 = L"\langle R \rangle"
ylabel2 = L"{\langle R \rangle}_{max} - {\langle R \rangle}_{min}"
v_ylabel=[ylabel1, ylabel2]

p_xlabel=[L"p"]
e_xlabel=[L"\epsilon"]
alpha_xlabel=[L"\alpha"]
p_offset = 5e-5
linewidths = [1.8,1.3]#[0.8, 1.2]
tick_size=15#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =22 #10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels



#----- WS
#topology


    
function plot_R(cp, R_all; axs="", fig="", x_zero_offset=0, xscale="linear", strongcolor="black", weakcolor="black", strongalpha=1.0, weakalpha=0.1, linewidths=[1.0,1.0], kwargs...)
        if(axs == "" || fig == "") fig, axs = subplots(1, sharex=true, constrained_layout=true, squeeze=false) end
        cp .+= x_zero_offset;
        numrealizations = size(R_all)[2] - 1
        # for idx_realization = 1:numrealizations 
        for idx_realization = numrealizations:-1:1 #so that idxrealization is plotted on top
                alpha, color = (idx_realization == 1) ? (strongalpha, strongcolor, linewidths[1]) : (weakalpha, weakcolor, linewidths[2])
                axs[1].plot(cp, R_all[:,idx_realization], "-", alpha=alpha, color=color, linewidth=linewidths[1])
        end
        # Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
        # Δs = [std(R_all[i,:]) for i=1:size(R_all)[1]]
        # axs[2].plot(cp, Δs, "-", color=strongcolor, linewidth=linewidths[2])
        axs[1].set_xscale(xscale)
        return fig, axs 
end
function plot_R_all(dictnames, quantifier, fileout, idx_quantity=2; data_dir=data_dir, x_zero_offset=0, xscale="linear", strongcolors=["black"], weakcolors=["black"], strongalpha=1.0, weakalpha=0.1, kwargs...)
	fig = ""; axs = ""
	for (i, dictname) in enumerate(dictnames)
	    R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
	    cp = R_all[:,1]
	    R_all = R_all[:,2:end]
	    fig, axs = plot_R(cp, R_all; axs=axs, fig=fig, x_zero_offset=x_zero_offset, xscale=xscale, strongcolor=strongcolors[i], weakcolor=weakcolors[i], kwargs...)
	end
	resize!(fig; kwargs...)
	fig.tight_layout()
	fig.subplots_adjust(hspace=0.5, bottom=0.26, left=0.18, top=0.95, right=0.95)
	beautify_plot!(fig, axs; kwargs...)
	if(fileout != "") savefigure(fig, axs, fileout; kwargs...) end
	return fig, axs
    end
    
function beautify_plot!(fig, axs; v_xlabel=[""], v_ylabel=[""], v_title=[""], v_sidetext=[""], m_yticks=[], v_xticks=[], v_xticklabels=[], v_xlim=(), haslegend=false, kwargs...)
    numL = 1; numC = 1
    for ax in axs
        ax.spines["top"].set_visible(false);
        ax.spines["right"].set_visible(false);
    end

    if (haslegend)
        ax = axs[1]
        lines = ax.get_lines()
        lg = ax.legend([lines[end], lines[end-1]], ["Original sequence", "Switching one unit"] )
        for lh in lg.legendHandles
                lh.set_alpha(1)
        end
    end


    axs[1,1].set_ylim(bottom=0)

    for i=1:numC
            axs[end,i].set_xlabel(v_xlabel[i], fontsize=label_size)
    end
    for i=1:numL
            # axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", color2][i])
            axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", "black"][i])
    end
    if m_yticks != []
        axs[1,1].set_yticks(m_yticks[1])
    end
    if(v_xticks != []) axs[end,1].set_xticks(v_xticks)end
    if(v_xticklabels != []) axs[end,1].set_xticklabels(v_xticklabels) end
    if(v_xlim != ()) axs[end,1].set_xlim(v_xlim) end
end 
epsilon_colors = ["#1E9792","#7127C7","#5F971E", "#971E22"]
epsilon_colors_weaker = ["#5CDFDA", "#995CDF", "#A2DF5C", "#DF5C61"]


# #1. topology, 1 unit
m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
# fileout = ""
# # fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-varyingoneunit.png"
# # fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-varyingoneunit-eps2.png"
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
#2. topology, shuffling

x_zero_offset = p_offset
v_xlabel = [L"\mathrm{rewiring\;probability}, p"]
fileout = "$(plotsdir())/presentations/netscix2022/transitiontosynchronization-topology-shuffling.png"
dictnames = ["ku_ws_501_shuf_p_eps4"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, haslegend=false, linewidths=linewidths)

fig.tight_layout(pad=0.3)
savefig(fileout, dpi=500, transparent=true)

#4. coupling, shuffling
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
v_xticklabels = [L"0.0", L"4.0", L"8.0"]; v_xticks = [0, 4.0, 8.0]; v_xlim = (0, 8)
# fileout = "$(plotsdir())/presentations/netscix2022/transitiontosynchronization-coupling-shuffling.png"
fileout = "$(plotsdir())/presentations/leshoches/transitiontosynchronization-coupling-shuffling.png"
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
dictnames = ["ku_ws_501_shuf_eps_p0",  "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p019684","ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta

m_yticks = [[0., 0.5, 1.0]]
v_ylabel=[L"\mathrm{sync}, r"]
v_xlabel = [L"\mathrm{coupling\;strength}, \epsilon"]
fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
fig.tight_layout(pad=0.3)
savefig(fileout, dpi=500, transparent=true)

fig = figure()
plot(1:10, 1:10, label=L"0.0", color=epsilon_colors[1])
plot(1:10, 1:10, label=L"0.08733", color=epsilon_colors[2])
plot(1:10, 1:10, label=L"0.19684", color=epsilon_colors[3])
plot(1:10, 1:10, label=L"1.0", color=epsilon_colors[4])
# ylabel(L"\langle R \rangle")
legend(title="  rewiring\nprobability", ncol=1)
savefig("$(plotsdir())/presentations/leshoches/aux-legend-ws.pdf", transparent=true)

fig = figure()
plot(1:10, 1:10, label="original frequencies", color=p_color[1], alpha=1.0)
plot(1:10, 1:10, label="shuffled frequencies", color=p_color_weaker[1], alpha=1.0)
legend(ncol=1)
savefig("$(plotsdir())/presentations/leshoches/aux-legend-ws-otherrealizations.pdf", transparent=true)


# ------------------------------------------------------------------ SURFACE PĹOT ------------------------------------------------------------------ #
ps = ["0", "0001", "0003", "001", "001145", "001311", "001968", "002955",  "005817", "006661", "007627", "008733", "01", "01145", "013111", "015013", "017191", "019684", "025809", "050802", "066608",  "1"]
ps_real = [0, 0.001, 0.003, 0.01, 0.01145, 0.01311, 0.01968,  0.02955, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013,  0.17191, 0.19684, 0.25809, 0.50802, 0.66608, 1]
# ps = replace.(string.(ps_real), "."=>"")
N = 501
idx_quantity = 2
quantifier = "Rstats"
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
cmap = "viridis"
shading = "gouraud"
# shading = "auto"

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

#With STD
# fig, axs = subplots(1, 2, constrained_layout=true)
# ax = axs[1]
# c = ax.pcolormesh(epsis, ps_real, meanRs_all', cmap=cmap, shading=shading)
# ax.set_yscale("log")
# ax.set_yticks(v_xticks)
# ax.set_yticklabels(v_xticklabels)
# ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
# ax.set_xlabel(L"\epsilon")
# cbar = fig.colorbar(c, location="bottom", label = L"mean(R)", ax=ax)

# ax = axs[2]
# c = ax.pcolormesh(epsis, ps_real, stdRs_all', cmap=cmap, shading=shading)
# ax.set_yscale("log")
# ax.set_yticks(v_xticks)
# ax.set_yticklabels(v_xticklabels)
# ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
# ax.set_xlabel(L"\epsilon")
# cbar = fig.colorbar(c, location="bottom", label = L"std(R)", ax=ax)

# max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps_real[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
# maxgap = gapRs_all[idxmaxstdR]
# # fig.suptitle("N = $(N), maximum std = $(round(max_stdR, digits=2)) w gap = $(round(maxgap, digits=2)) at epsi = $(epsmax) and p = $(pmax); num realizations = $(numrealizations)")
# fig.set_size_inches(width, height)

# fileout = "$(plotsdir())/presentations/netscix2022/surface-transitiontosynchronization.png"
# savefig(fileout, dpi=300, transparent=true)

#With GAP
tick_size=18#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =26 #10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels




fig, axs = subplots(1, 2, constrained_layout=true, sharey="all", sharex="all")
ax = axs[1]
# v_param = [5.2e-5, 0.08733, 0.92]; v_colors = ["#B41C9A", "#B4821C", "#1CB436"]
v_colors = ["#1E9792","#7127C7","#5F971E", "#971E22"]
v_param = [p_offset+0.03*p_offset, 0.1145, 0.19684, 0.95]

for i=1:4 ax.axhline(v_param[i], linestyle="-", color=v_colors[i], linewidth=13, alpha=0.8) end
ax.axvline(4.10256, linestyle="-", color="black", linewidth=13, alpha=0.8) 
c = ax.pcolormesh(epsis, ps_real, meanRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1.0)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(5e-5, 1)
ax.set_ylabel(L"\mathrm{rewiring\;probability}, p", fontsize = label_size)
ax.set_xlabel(L"\mathrm{coupling\;strength}, \epsilon", fontsize = label_size)
v_xlabel = [L"\mathrm{coupling\;strength}, \epsilon"]
cbar = fig.colorbar(c, location="bottom", label = "mean sync over samples (shuffles)", ax=ax, ticks=0:0.2:1.0)



ax = axs[2]
# v_param = [5.2e-5, 0.08733, 0.92]; v_colors = ["#B41C9A", "#B4821C", "#1CB436"]
for i=1:4 ax.axhline(v_param[i], linestyle="-", color=v_colors[i], linewidth=13, alpha=0.8) end
ax.axvline(4.10256, linestyle="-", color="black", linewidth=13, alpha=0.8) 
c = ax.pcolormesh(epsis, ps_real, gapRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1.0)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
ax.set_xlabel(L"\mathrm{coupling\;strength}, \epsilon", fontsize = label_size)
cbar = fig.colorbar(c, location="bottom", label = "max(sync) - min(sync) over samples (shuffles)", ax=ax, ticks=0:0.2:1.0)
width = 20.0; height = 12.0
fig.set_size_inches(width, height)

fileout = "$(plotsdir())/presentations/leshoches/surface-transitiontosynchronization.png"
savefig(fileout, dpi=300, transparent=true)





# ----------------------------------------------------------------- MULTISTABILITY ----------------------------------------------------------------- #
# dictname = "ku_ws_501_multi_eps_p013111"
# R_all = collectresults(dictname, quantifier; data_dir=data_dir)
# c_params = R_all[:,1]
# R_all = R_all[:,2:end]
# fig, axs = plot_R(c_params, R_all; x_zero_offset =5e-5, xscale="linear")




width = 1.0; height=1
# ylabel1 = L"\langle R \rangle"
# ylabel2 = L"{\langle R \rangle}_{max} - {\langle R \rangle}_{min}"
# p_xlabel=[L"p"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
p_offset = 5e-5
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 1.0]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
v_ylabel=[ylabel1, ylabel2]
linewidths = [1.3,1.3]#[0.8, 1.2]
# tick_size=9#7
# rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
# rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
# label_size =12#10
# rc("axes", labelsize=label_size)    # fontsize of the x and y labels

function beautify_plot!(fig, axs; v_xlabel=[""], v_ylabel=[""], v_title=[""], v_sidetext=[""], m_yticks=[], v_xticks=[], v_xticklabels=[], v_xlim=(), haslegend=false, kwargs...)
    numL = 2; numC = 1
    for ax in axs
        ax.spines["top"].set_visible(false);
        ax.spines["right"].set_visible(false);
    end

    if (haslegend)
        ax = axs[1]
        lines = ax.get_lines()
        lg = ax.legend([lines[end], lines[end-1]], ["Original IC", "Shuffling ICs"] )
        for lh in lg.legendHandles
                lh.set_alpha(1)
        end
    end


    axs[1,1].set_ylim(bottom=0)
    axs[2,1].set_ylim(bottom=0)

    for i=1:numC
            axs[end,i].set_xlabel(v_xlabel[i], fontsize=label_size)
    end
    for i=1:numL
            # axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", color2][i])
            axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", "black"][i])
    end
    axs[1,1].set_yticks(m_yticks[1])
    axs[2,1].set_yticks(m_yticks[2])
    if(v_xticks != []) axs[end,1].set_xticks(v_xticks)end
    if(v_xticklabels != []) axs[end,1].set_xticklabels(v_xticklabels) end
    if(v_xlim != ()) axs[end,1].set_xlim(v_xlim) end
end 



width = 2.0; height = 1.0
dictname=["ku_ws_501_multi_p_eps4"]
quantifier = "Rstats"
v_xlabel = [L"\mathrm{rewiring\;probability}, p"]
v_ylabel=[L"\mathrm{sync}, r"]

fig, axs= plot_R_all(dictname, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=false)
fig.tight_layout(pad=0.3)

fileout = "$(plotsdir())/presentations/netscix2022/multistability-transitiontosynchronization.png"
savefig(fileout, dpi=500, transparent=true)



# --------------------------------------------------------------------- PHASES --------------------------------------------------------------------- #
using PyCall, DelimitedFiles
axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]

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
    if(j == numC && i == 2) ax2.set_ylabel(L"\mathrm{sync}, r(t)", fontsize=label_size) end
    return ax2 
end

#One unit
ps = [0, 0.19684, 1.0] #unit
unitids = [0, 158, 298]
shuffleid = 0
align = false
# align = true
function beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false)
    numL, numC = size(axs)
    # for j=1:numC
        axs[end, 2].set_xlabel(L"t")
        # axs[1,ij].set_xticks([1500, 2000])
        # s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
        # if xticks != [] axs[end,j].set_xticks(xticks) end 
    # end

    axs[2, 1].set_ylabel("Unit No.")
    for i =1:numL
        if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
        axs[i,1].set_yticks([1, 250, 501])
        if(shuffle) axs[i, end].text(1.35, 0.5, "Shuffle $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        else
        # axs[i, end].text(1.35, 0.5, "Unit $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        # axs[i, end].text(1.35, 0.5, "Switched unit $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
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
               borderpad=18,
               )
    cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
    cbar.set_label(L"\theta", fontsize=label_size)
    cbar.solids.set_edgecolor("face")
    cbar.set_ticks(-pi:pi:pi)
    cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
end

tick_size=10#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
# label_size =12#10
label_size =22 #10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels
numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
        ax=axs[i,j]
        global c
        c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
        ax2 = plot_R!(fig, ax, Rname, t, j, i, numC)
    end
end
beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=unitids, shuffle=false, axes_grid1=axes_grid1, align=align)
axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
    axs[end, j].set_xticks([3000, 3500])
end

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(5.0/6)*width;
fig.set_size_inches(width, height)
# fig.tight_layout(pad=0.3)
# fig.subplots_adjust(bottom=0.2, top=0.95)
fig.subplots_adjust(bottom=0.25, top=0.98, right=0.89, wspace=0.1, left=0.11)
fileout = "$(plotsdir())/presentations/netscix2022/phases-transitiontosynchronization.png"
savefig(fileout, dpi=500, transparent=true)

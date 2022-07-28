# To plot <R> versus eps and p for all the cases
include("../general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()

dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]



epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1.0; height=1;
ylabel1 = L"\langle R \rangle"
ylabel2 = L"{\langle R \rangle}_{max} - {\langle R \rangle}_{min}"
v_ylabel=[ylabel1, ylabel2]

p_xlabel=[L"p"]
e_xlabel=[L"\epsilon"]
alpha_xlabel=[L"\alpha"]
p_offset = 5e-5
linewidths = [1.3,1.3]#[0.8, 1.2]
tick_size=9#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =12#10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels



#----- WS
#topology
m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel

#0. topology, original realization only

function plot_R_single(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=0, xscale="linear", strongcolors=["black"], weakcolors=["black"], strongalpha=1.0, weakalpha=0.1, kwargs...)
fig, axs = subplots(1, sharex=true, constrained_layout=false, squeeze=false) 
    for (i, dictname) in enumerate(dictnames)
        R_all = collectresults(dictname, quantifier; data_dir=data_dir)
        cp = R_all[:,1]
        R_all = R_all[:,2:3]
        # fig, axs = plot_R(cp, R_all; axs=axs, fig=fig, x_zero_offset=x_zero_offset, xscale=xscale, strongcolor=strongcolors[i], weakcolor=weakcolors[i], kwargs...)
	axs[1].plot(cp, R_all[:,1], "-", alpha=strongalpha, color=strongcolors[1], linewidth=linewidths[1])
    end
    resize!(fig; kwargs...)
    fig.tight_layout()
    fig.subplots_adjust(hspace=0.5, bottom=0.26, left=0.18, top=0.95, right=0.95)
#     beautify_plot!(fig, axs; kwargs...)
	ax = axs[1]
        ax.spines["top"].set_visible(false);
        ax.spines["right"].set_visible(false);
    axs[1].set_ylim(bottom=0)
axs[1].set_xlabel(v_xlabel[1], fontsize=label_size)
axs[1].set_ylabel(v_ylabel[1], fontsize=label_size, color=["black", "black"][1])
    # ax.set_xscale("log")
    fig.tight_layout()
    if(fileout != "") savefigure(fig, axs, fileout; kwargs...) end
    return fig, axs
end


fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-originalrealization.png"
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
# dictnames = ["ku_ws_501_unit_p_eps2"]
dictnames = ["ku_ws_501_unit_p_eps4"]
# dictnames = ["ku_ws_501_unit_p_eps8"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fig, axs= plot_R_single(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=false)
axs[1].set_xticks(v_xticks)
axs[1].set_xticklabels(v_xticklabels) 
axs[1].set_xlim(v_xlim) 
savefig(fileout, dpi=300)






#1. topology, 1 unit
fileout = ""
# fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-varyingoneunit.png"
# fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-varyingoneunit-eps2.png"
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
# dictnames = ["ku_ws_501_unit_p_eps2"]
dictnames = ["ku_ws_501_unit_p_eps4"]
# dictnames = ["ku_ws_501_unit_p_eps8"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fig, axs= plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=true)

#2. topology, shuffling
x_zero_offset = p_offset
fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-shuffling.png"
dictnames = ["ku_ws_501_shuf_p_eps4"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, haslegend=true)


#coupling

fileout = "$(plotsdir())/presentations/transitiontosynchronization-coupling-originalrealization.png"
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"; x_zero_offset = 0
dictnames = ["ku_ws_501_unit_eps_p1"] 
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fig, axs= plot_R_single(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=false)
axs[1].set_xticks(v_xticks)
axs[1].set_xticklabels(v_xticklabels) 
axs[1].set_xlim(v_xlim) 
savefig(fileout, dpi=300)






#3. coupling, 1 unit
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
v_xticklabels = [L"0.0", L"4.0", L"8.0"]; v_xticks = [0, 4.0, 8.0]; v_xlim = (0, 8)
# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p013111", "ku_ws_501_unit_eps_p1"]
dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
fileout = "$(plotsdir())/presentations/transitiontosynchronization-coupling-varyingoneunit.png"
m_yticks = [[0., 0.5, 1.0], [0.0, 0.35, 0.70]]
plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)



#4. coupling, shuffling
fileout = "$(plotsdir())/presentations/transitiontosynchronization-coupling-shuffling_008733.png"
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]
dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
m_yticks = [[0., 0.5, 1.0], [0.0, 0.45, 0.90]]
plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)


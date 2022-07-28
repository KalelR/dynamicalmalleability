include("../general_plots.jl")
# epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
# epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
epsilon_colors = ["#1E9792","#7127C7","#5F971E", "#971E22"]
epsilon_colors_weaker = ["#5CDFDA", "#995CDF", "#A2DF5C", "#DF5C61"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
# width = 1/2; height=1/2;
# width = 1/2; height=0.8;
width = 1; height=1;
width = 1/2; height=0.8;
ylabel1 = ""
ylabel2 = ""

ylabel1 = L"\langle R \rangle"
ylabel2 = L"\Delta"
v_ylabel=[ylabel1, ylabel2]

p_xlabel=[L"p"]
e_xlabel=[L"\epsilon"]
alpha_xlabel=[L"\alpha"]
p_offset = 5e-5
linewidths = [0.8, 1.2]
tick_size=7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels
quantifier="Rstats"
# ----------------------------------------------------------------- WATTS STROGATZ ----------------------------------------------------------------- #

# ---------------------------------------------------------------- varying epsilon ---------------------------------------------------------------- #
# dictnames = ["ku_ws_501_multi_eps_p0", "ku_ws_501_multi_eps_p013111", "ku_ws_501_multi_eps_p1"]
dictnames = ["ku_ws_501_multi_eps_p0","ku_ws_501_multi_eps_p008733", "ku_ws_501_multi_eps_p013111", "ku_ws_501_multi_eps_p1"]

v_xlabel = e_xlabel
# v_xlabel = []
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
v_xticklabels = [L"0.0", L"4.0", L"8.0"]; v_xticks = [0, 4.0, 8.0]; v_xlim = (0, 8)
# fileout=""
fileout = "$(plotsdir())/paper/multistability/multistability_$(dictnames).pdf"
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fig, axs=plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
resize!(fig, width=width, height=height); 
# fig.subplots_adjust(hspace=0.1, bottom=0.12, left=0.14, top=0.98, right=0.97) #for w and h = 1
fig.align_ylabels(axs[:])
# fig.subplots_adjust(hspace=0.22, bottom=0.13, left=0.28, top=0.95, right=0.95) 
fig.subplots_adjust(hspace=0.22, bottom=0.16, left=0.28, top=0.95, right=0.95)
# fig.subplots_adjust(hspace=0.1, bottom=0.12, left=0.14, top=0.98, right=0.97) #for w and h = 1
# resize!(fig, width=width, height=height); fig.subplots_adjust(hspace=0.1, bottom=0.12, left=0.10, top=0.98, right=0.98) #for w and h = 1
savefig(fileout)
# -------------------------------------------------------------------- varying p ------------------------------------------------------------------- #
dictnames = ["ku_ws_501_multi_p_eps451282"]
# dictnames = ["ku_ws_501_multi_p_eps451282_k1"]
# dictnames = ["ku_ws_501_multi_p_eps8_k1"]
# dictnames = ["ku_ws_501_multi_p_eps12_k1"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.9]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
fileout=""
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
fig, axs= plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths)
resize!(fig, width=width, height=height);
fig.align_ylabels(axs[:])
#  fig.subplots_adjust(hspace=0.1, bottom=0.12, left=0.14, top=0.98, right=0.97) #for w and h = 1
fig.subplots_adjust(hspace=0.22, bottom=0.18, left=0.26, top=0.95, right=0.95) 
fileout = "$(plotsdir())/paper/multistability/multistability_$(dictnames).pdf"
savefig(fileout)






# -------------------------------------------------------------------- POWERLAW -------------------------------------------------------------------- #
# -------------------------------------------------------------------- varying alpha ------------------------------------------------------------------- #
quantifier = "Rstats"
# dictnames = ["ku_pl_501_multi_alpha_eps646154"]
dictnames = ["ku_pl_501_multi_alpha_eps646154_resample"] #sampling ics
# fileout = "$(plotsdir())/paper/multistability/multistability-pl-$(dictnames[1]).png"
fileout=""
v_xlabel=[L"\alpha"]
v_xticks = [0, 1.0, 2.0, 3.0]
v_xticklabels = ["0.0", "1.0", "2.0", "3.0"]
v_xlim = (0, 3+0.05)
v_xlabel= alpha_xlabel
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"; x_zero_offset = p_offset
m_yticks = [[0., 0.5, 1.0], [0.0, 0.04, 0.08]]
fig, axs= plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
resize!(fig, width=width, height=height); fig.subplots_adjust(hspace=0.1, bottom=0.12, left=0.14, top=0.98, right=0.97) #for w and h = 1

fileout = "$(plotsdir())/paper/multistability/multistability_$(dictnames).pdf"
savefig(fileout)


resize!(fig, width=width, height=height)
# fig.subplots_adjust(hspace=0.5, bottom=0.45, left=0.18, top=0.95, right=0.95) #for w and h = 1/2
fig.subplots_adjust(hspace=0.1, bottom=0.12, left=0.10, top=0.98, right=0.98) #for w and h = 1
savefig("$(plotsdir())/paper/multistability-pl.png", dpi=300)



#aux
# # #X. Legends
# fig = figure()
# plot(1:10, 1:10, label=L"0.0", color=epsilon_colors[1])
# plot(1:10, 1:10, label=L"0.08733", color=epsilon_colors[2])
# plot(1:10, 1:10, label=L"0.19684", color=epsilon_colors[3])
# plot(1:10, 1:10, label=L"1.0", color=epsilon_colors[4])
# ylabel(L"\langle R \rangle")
# legend(title=L"p", ncol=2)
# savefig("$(plotsdir())/paper/fig1/aux-legend-ws.pdf")
#
# #

fig = figure()
plot(1:10, 1:10, label="original realization", color=p_color[1], alpha=1.0)
plot(1:10, 1:10, label="other realizations", color=p_color_weaker[1], alpha=1.0)
legend(ncol=1)
savefig("$(plotsdir())/paper/multistability/aux-legend-otherrealizations.pdf")
#
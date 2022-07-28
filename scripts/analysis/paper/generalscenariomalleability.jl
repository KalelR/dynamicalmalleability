# To plot <R> versus eps and p for all the cases
include("../general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()

dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]



# epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
# epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]

epsilon_colors = ["#1E9792","#7127C7","#5F971E", "#971E22"]
epsilon_colors_weaker = ["#5CDFDA", "#995CDF", "#A2DF5C", "#DF5C61"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
# width = 1/2; height=1/2;
# width = 1/2; height=0.9;
width = 1/2; height=0.6;
ylabel1 = ""
ylabel2 = ""
v_ylabel=[ylabel1, ylabel2]

p_xlabel=[L"p"]
e_xlabel=[L"\epsilon"]
alpha_xlabel=[L"\alpha"]
# p_offset = 5e-5
p_offset = 0.0003
linewidths = [0.8, 1.2]
tick_size=7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels

# fmt = "png"
fmt = "pdf"
#
# #----- WS
# #topology
m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
v_xticks = [p_offset, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (p_offset, 1+0.1)
v_xlabel= p_xlabel
#1. topology, 1 unit
fileout=""
fileout = "$(plotsdir())/paper/fig1/fig1-1.$(fmt)"
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
# # # dictnames = ["ku_ws_501_unit_p_eps2"]
# # dictnames = ["ku_ws_501_unit_p_eps4"]
# # dictnames = ["ku_ws_501_unit_p_eps4_omeganew4"]
# dictnames = ["ku_ws_501_unit_p_eps451282_omeganew3"]
# # # dictnames = ["ku_ws_501_unit_p_eps8"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
# fig, axs= plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths)
# minorticks_off()
#
# # #2. topology, shuffling
# x_zero_offset = p_offset
# fileout = "$(plotsdir())/paper/fig1/fig1-2.$(fmt)"
# # dictnames = ["ku_ws_501_shuf_p_eps4"]
# dictnames = ["ku_ws_501_shuf_p_eps451282"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.98]]
# fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
# minorticks_off()
#
#
# # #coupling
# #3. coupling, 1 unit
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
# v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 2.5, 5.0]; v_xlim = (0, 5)
v_xticklabels = [L"0.0", L"4.0", L"8.0"]; v_xticks = [0, 4.0, 8.0]; v_xlim = (0, 8)
# # dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p013111", "ku_ws_501_unit_eps_p1"]
# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
# dictnames = ["ku_ws_501_unit_eps_p0_omeganew4", "ku_ws_501_unit_eps_p008733_omeganew4", "ku_ws_501_unit_eps_p1_omeganew4"]
dictnames = ["ku_ws_501_unit_eps_p0_omeganew3", "ku_ws_501_unit_eps_p008733_omeganew3", "ku_ws_501_unit_eps_p019684_omeganew3","ku_ws_501_unit_eps_p1_omeganew3"]
fileout = "$(plotsdir())/paper/fig1/fig1-3.$(fmt)"
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.99]]
fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)

#
# # epsilon_colors_weaker =  ["#3333ff", "#ffa64d","green", "#ff6666"]
# # x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
#
#
#
# #4. coupling, shuffling
# fileout = "$(plotsdir())/paper/fig1/fig1-4.$(fmt)"
# fileout = ""
# # dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"]
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p01145", "ku_ws_501_shuf_eps_p1"]
# dictnames = ["ku_ws_501_shuf_eps_p0",  "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p019684","ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
# dictnames = ["ku_ws_501_shuf_eps_p0",  "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p017191","ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
# dictnames = ["ku_ws_501_shuf_eps_p0",  "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p015013","ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 1.0]]
# fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.03,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
# resize!(fig, width=width, height=height)


#----- PL
# v_xlabel=[L"\alpha"]
# v_xticks = [0, 1.0, 2.0, 3.0]
# v_xticklabels = []
# v_xlim = (0, 3)
# v_xlabel= alpha_xlabel
# strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"; x_zero_offset = p_offset

#5. topology, 1 unit
# fileout = "$(plotsdir())/paper/fig1/fig1-5.$(fmt)"
# dictnames = ["ku_pl_501_unit_alpha_eps646154"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.25, 0.5]]
# fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
# axs[1].invert_xaxis()
# savefig(fileout)



# #6. topology, shuffling
# fileout = "$(plotsdir())/paper/fig1/fig1-6.$(fmt)"
# dictnames = ["ku_pl_501_shuf_p_eps646154"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.35, 0.7]]
# fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
# axs[1].invert_xaxis()
# savefig(fileout)


# #7. coupling, 1 unit
# fileout = "$(plotsdir())/paper/fig1/fig1-7.$(fmt)"
# v_xlabel = e_xlabel
# v_xlim = (5e-5, 12)
# v_xticks = [0, 2, 4,6,8,10,12]
# x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
# dictnames = ["ku_pl_501_unit_eps_alpha0", "ku_pl_501_unit_eps_alpha176923", "ku_pl_501_unit_eps_alpha3"]
# dictnames = ["ku_pl_501_unit_eps_alpha0_omeganew3", "ku_pl_501_unit_eps_alpha176923_omeganew3", "ku_pl_501_unit_eps_alpha3_omeganew3"]
# dictnames = ["ku_pl_501_unit_eps_alpha0_omeganew3", "ku_pl_501_unit_eps_alpha153846_omeganew3", "ku_pl_501_unit_eps_alpha176923_omeganew3", "ku_pl_501_unit_eps_alpha3_omeganew3"]
# dictnames = dictnames[4:-1:1]

# m_yticks = [[0., 0.5, 1.0], [0.0, 0.25, 0.5]]
# fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)

#8. coupling, shuffling
# fileout = "$(plotsdir())/paper/fig1/fig1-8.$(fmt)"
# dictnames = ["ku_pl_501_shuf_eps_alpha0",  "ku_pl_501_shuf_eps_alpha176923", "ku_pl_501_shuf_eps_alpha3"]
# dictnames = ["ku_pl_501_shuf_eps_alpha0", "ku_pl_501_shuf_eps_alpha153846", "ku_pl_501_shuf_eps_alpha176923", "ku_pl_501_shuf_eps_alpha3"]
# dictnames = dictnames[4:-1:1]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.35, 0.7]]
# plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)


#
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
# fig = figure()
# plot(1:10, 1:10, label=L"0.0", color=epsilon_colors[1])
# plot(1:10, 1:10, label=L"1.538463", color=epsilon_colors[2])
# plot(1:10, 1:10, label=L"1.76923", color=epsilon_colors[3])
# plot(1:10, 1:10, label=L"3.0", color=epsilon_colors[4])
# ylabel(L"\Delta")
# legend(title=L"\alpha", ncol=2)
# savefig("$(plotsdir())/paper/fig1/aux-legend-dd.pdf")

#
# fig = figure()
# plot(1:10, 1:10, label="original realization", color=p_color[1], alpha=1.0)
# plot(1:10, 1:10, label="other realizations", color=p_color_weaker[1], alpha=1.0)
# legend(ncol=2)
# savefig("$(plotsdir())/paper/fig1/aux-legend-otherrealizations.pdf")
#


# resize!(fig, width=width, height=height)


# # Getting p from varying eps results
# ps = ["0", "0001", "001", "001311", "002955",  "005817", "006661", "008733", "01", "01145", "013111", "017191", "025809", "050802", "1"]
# ps_real = [0, 0.001, 0.01, 0.01311, 0.02955, 0.05817, 0.06661, 0.08733, 0.1, 0.1145, 0.13111, 0.17191, 0.25809, 0.50802, 1]
# # ps = replace.(string.(ps_real), "."=>"")
# N = 501
# idx_quantity = 2
# quantifier = "Rstats"
#
# epsis = [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0]
#
# epsi = 4.51282; idx_eps = findfirst(x->x==epsi, epsis)
#
# numrealizations = 1001
# allRs = zeros(Float64, (length(ps), numrealizations+1))
# for (idx, p) in enumerate(ps)
# 	dictname = "ku_ws_501_shuf_eps_p$(p)"
# 	R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
# 	Rs = Vector(R_all[idx_eps, 2:end])
# 	allRs[idx, 2:end] = Rs
# end
# allRs[:,1] = ps_real
#
#
# fig, axs = plot_R(allRs[:,1], allRs[:,2:end];  x_zero_offset=x_zero_offset, xscale="log", strongcolor=strongcolors[1], weakcolor=weakcolors[1])

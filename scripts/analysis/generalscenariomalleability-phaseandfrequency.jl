# To plot <R> versus eps and p for all the cases
include("general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()

dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]



# epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
# epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
epsilon_colors = ["#1E9792","#7127C7","#5F971E", "#971E22"]
epsilon_colors_weaker = ["#5CDFDA", "#995CDF", "#A2DF5C", "#DF5C61"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1/2; height=1/2;
# width = 1; height=1;

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


# ------------------------------------------------------------ Frequency synchronization ----------------------------------------------------------- #

quantifier = "syncfreqstats"
# idx_quantity = 2; ylabel1 = L"\langle \mathrm{std}(\{\omega_i(t)\}) \rangle"
# idx_quantity = 3; ylabel1 = L"\langle \mathrm{iqi}(\{\omega_i(t)\}) \rangle"
# idx_quantity = 3; ylabel1 = L"\langle \mathrm{IQI}(\{\dot{\theta}_i} \rangle)"
idx_quantity = 3; ylabel1 = "IQI"
# idx_quantity = 4 #gap = (max - min
ylabel2 = L"\Delta"
v_ylabel=[ylabel1, ylabel2]

#----- WS
#topology
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
m_yticks = []
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
#1. topology, 1 unit
fileout=""
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
# dictnames = ["ku_ws_501_unit_p_eps2"]
# dictnames = ["ku_ws_501_unit_p_eps4"]
# dictnames = ["ku_ws_501_unit_p_eps4_omeganew4"]
# dictnames = ["ku_ws_501_unit_p_eps8"]
dictnames = ["ku_ws_501_unit_p_eps451282_omeganew3"]

# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs= plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)

#2. topology, shuffling
x_zero_offset = p_offset
# dictnames = ["ku_ws_501_shuf_p_eps4"]
dictnames = ["ku_ws_501_shuf_p_eps451282"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#coupling
#3. coupling, 1 unit
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
# v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 1.0, 2.0, 3.0, 4.0, 5.0]; v_xlim = (0, 5)
# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p013111", "ku_ws_501_unit_eps_p1"]
# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
dictnames = ["ku_ws_501_unit_eps_p0_omeganew3", "ku_ws_501_unit_eps_p008733_omeganew3", "ku_ws_501_unit_eps_p019684_omeganew3","ku_ws_501_unit_eps_p1_omeganew3"]

# m_yticks = [[0., 0.5, 1.0], [0.0, 0.35, 0.70]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#4. coupling, shuffling
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
dictnames = ["ku_ws_501_shuf_eps_p0",  "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p019684","ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta

# m_yticks = [[0., 0.5, 1.0], [0.0, 0.45, 0.90]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#----- PL
v_xlabel=[L"\alpha"]
v_xticks = [0, 1.0, 2.0, 3.0]
v_xticklabels = []
v_xlim = (5e-5, 3+0.05)
v_xlabel= alpha_xlabel
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"; x_zero_offset = p_offset

#5. topology, 1 unit
dictnames = ["ku_pl_501_unit_alpha_eps646154"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.2, 0.45]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)

#6. topology, shuffling
dictnames = ["ku_pl_501_shuf_p_eps646154"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.65]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#7. coupling, 1 unit
v_xlabel = e_xlabel
v_xlim = (5e-5, 12)
v_xticks = [0, 2, 4,6,8,10,12]
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
# dictnames = ["ku_pl_501_unit_eps_alpha3", "ku_pl_501_unit_eps_alpha176923", "ku_pl_501_unit_eps_alpha0"]
dictnames = ["ku_pl_501_unit_eps_alpha0_omeganew3", "ku_pl_501_unit_eps_alpha176923_omeganew3", "ku_pl_501_unit_eps_alpha3_omeganew3"]

# m_yticks = [[0., 0.5, 1.0], [0.0, 0.2, 0.4]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#8. coupling, shuffling
# dictnames = ["ku_pl_501_shuf_eps_alpha3", "ku_pl_501_shuf_eps_alpha176923", "ku_pl_501_shuf_eps_alpha0"]
dictnames = ["ku_pl_501_shuf_eps_alpha0", "ku_pl_501_shuf_eps_alpha153846", "ku_pl_501_shuf_eps_alpha176923", "ku_pl_501_shuf_eps_alpha3"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.65]]
fileout = "$(plotsdir())/frequencysynchronization/syncfreq_$(quantifier)_$(idx_quantity)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#=
# -------------------------------------------------------------- PHASE SYNCHRONIZATION ------------------------------------------------------------- #
quantifier = "Rstats"
idx_quantity = 2
ylabel1 = L"\langle R \rangle"; v_ylabel=[ylabel1, ylabel2]

#----- WS
#topology
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
m_yticks = []
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
#1. topology, 1 unit
fileout=""
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
# dictnames = ["ku_ws_501_unit_p_eps2"]
dictnames = ["ku_ws_501_unit_p_eps4"]
# dictnames = ["ku_ws_501_unit_p_eps4_omeganew4"]
# dictnames = ["ku_ws_501_unit_p_eps8"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs= plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)

#2. topology, shuffling
x_zero_offset = p_offset
dictnames = ["ku_ws_501_shuf_p_eps4"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#coupling
#3. coupling, 1 unit
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 2.5, 5.0]; v_xlim = (0, 5)
# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p013111", "ku_ws_501_unit_eps_p1"]
dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.35, 0.70]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)



#4. coupling, shuffling
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]
dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.45, 0.90]]
fileout = ""
# fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#----- PL
v_xlabel=[L"\alpha"]
v_xticks = [0, 1.0, 2.0, 3.0]
v_xticklabels = []
v_xlim = (5e-5, 3+0.05)
v_xlabel= alpha_xlabel
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"; x_zero_offset = p_offset

#5. topology, 1 unit
dictnames = ["ku_pl_501_unit_alpha_eps646154"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.2, 0.45]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)

#6. topology, shuffling
dictnames = ["ku_pl_501_shuf_p_eps646154"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.65]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#7. coupling, 1 unit
v_xlabel = e_xlabel
v_xlim = (5e-5, 12)
v_xticks = [0, 2, 4,6,8,10,12]
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
dictnames = ["ku_pl_501_unit_eps_alpha3", "ku_pl_501_unit_eps_alpha176923", "ku_pl_501_unit_eps_alpha0"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.2, 0.4]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)


#8. coupling, shuffling
dictnames = ["ku_pl_501_shuf_eps_alpha3", "ku_pl_501_shuf_eps_alpha176923", "ku_pl_501_shuf_eps_alpha0"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.65]]
fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)



# ------------------------------------------------------------------ SURFACE PĹOT ------------------------------------------------------------------ #
ps = ["0", "0001", "0003","001", "001145", "001311", "001968", "002955",  "005817", "006661","007627",  "008733", "01", "01145", "013111", "015013", "017191", "019684", "025809", "050802", "066608",  "1"]
ps_real = [0, 0.001, 0.003,  0.01, 0.01145, 0.01311, 0.01968, 0.02955, 0.05817, 0.06661, 0.07627,  0.08733, 0.1, 0.1145, 0.13111, 0.15013,  0.17191, 0.19684, 0.25809, 0.50802, 0.66608, 1]
# ps = replace.(string.(ps_real), "."=>"")
N = 501
idx_quantity = 2
quantifier = "Rstats"
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
cmap = "viridis"
shading = "gouraud"
shading = "auto"

width = 2
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

#With STD
fig, axs = subplots(1, 2, constrained_layout=true, sharex="all", sharey="all")
ax = axs[1]
c = ax.pcolormesh(epsis, ps_real, meanRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
ax.tick_params(axis="both", direction="in", which="both")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{mean}(R)", ax=ax)

ax = axs[2]
c = ax.pcolormesh(epsis, ps_real, stdRs_all', cmap=cmap, shading=shading, vmin=0)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{std}(R)", ax=ax)

max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps_real[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
maxgap = gapRs_all[idxmaxstdR]
resize!(fig; width, height)
ax.tick_params(axis="both", direction="in", which="both")

# fig.suptitle("N = $(N), maximum std = $(round(max_stdR, digits=2)) w gap = $(round(maxgap, digits=2)) at epsi = $(epsmax) and p = $(pmax); num realizations = $(numrealizations)")
savefig("$(plotsdir())/scaling/scaling_meanR_stdR-N_$(N)-shading_$(shading).png")

#With GAP
fig, axs = subplots(1, 2, constrained_layout=true, sharex="all", sharey="all")
ax = axs[1]
c = ax.pcolormesh(epsis, ps_real, meanRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
cbar = fig.colorbar(c, location="bottom", label = L"mean(R)", ax=ax)
ax.tick_params(axis="both", direction="in", which="both")

ax = axs[2]
c = ax.pcolormesh(epsis, ps_real, gapRs_all', cmap=cmap, shading=shading, vmin=0, vmax=1)
ax.set_yscale("log")
ax.set_yticks(v_xticks)
ax.set_yticklabels(v_xticklabels)
ax.set_ylim(0, 1)
# ax.set_ylabel(L"p")
ax.set_xlabel(L"\epsilon")
cbar = fig.colorbar(c, location="bottom", label = L"\mathrm{max}(R) - \mathrm{min}(R)", ax=ax)
resize!(fig; width, height)
ax.tick_params(axis="both", direction="in", which="both")

# max_stdR, idxmaxstdR = findmax(stdRs_all); pmax, epsmax = ps_real[idxmaxstdR[2]], epsis[idxmaxstdR[1]]
# maxgap = gapRs_all[idxmaxstdR]
# fig.suptitle("N = $(N), maximum std = $(round(max_stdR, digits=2)) w gap = $(round(maxgap, digits=2)) at epsi = $(epsmax) and p = $(pmax); num realizations = $(numrealizations)")
savefig("$(plotsdir())/scaling/scaling_meanR_gapR-N_$(N)-shading_$(shading).png")



# -------------------------------------------------- PLOTTING ONLY TWO REALIZATIONS PER PARAMETER -------------------------------------------------- #

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


    function plot_R(cp, R_all; axs="", fig="", x_zero_offset=0, xscale="linear", strongcolor="black", weakcolor="black", strongalpha=1.0, weakalpha=0.1, linewidths=[1.0,1.0], kwargs...)
        if(axs == "" || fig == "") fig, axs = subplots(1, sharex=true, constrained_layout=false, squeeze=false) end
        cp .+= x_zero_offset;
        numrealizations = size(R_all)[2] - 1
	R_all = Matrix(R_all)
	idx_max = findmax(R_all[end, 1:end])[2]
	idx_min = findmin(R_all[end, 1:end])[2]
	for idx_realization = numrealizations:-1:1 #so that idxrealization is plotted on top
                alpha, color = (idx_realization ∈ [idx_max, idx_min]) ? (strongalpha, strongcolor) : (weakalpha, weakcolor)
                axs[1].plot(cp, R_all[:,idx_realization], "-", alpha=alpha, color=color, linewidth=linewidths[1])
        end
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


dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.45, 0.90]]
fileout = ""
# fileout = "$(plotsdir())/phasesynchronization/phasefreq_$(quantifier)_$(dictnames).png"
fig, axs = plot_R_all(dictnames, quantifier, "", idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)

for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55) end
fig.tight_layout(pad=0.3); savefig(fileout)










=#
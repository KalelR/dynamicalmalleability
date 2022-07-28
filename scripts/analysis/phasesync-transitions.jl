using PyPlot, CSV, DataFrames

figure()
for shuffleid in 0:50
	file = "../../data/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_p_all-epsi_2.0-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat"
	df = CSV.File(file) |> DataFrame
	plot(df[:,1], df[:,2], "-", alpha=0.6)
end
xscale("log")


include("general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()



epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1/2; height=1/2;
ylabel1 = ""
ylabel2 = ""
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



#----- WS
#topology
m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
x_zero_offset = 0
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 2.5, 5.0]; v_xlim = (0, 5)
x_scale = "linear"
# fileout = "$(plotsdir())/paper/fig1/fig1-4.png"
fileout = ""
dictnames=["ku_ws_501_shuf_eps_extended_p0", "ku_ws_501_shuf_eps_extended_p008733"]
# dictnames=["ku_ws_501_shuf_eps_extended_p008733"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.45, 0.90]]
fig,axs=plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
axs[1].set_title("p = 0 and p = 0.008733")
xlim(10,100)
savefig("$(plotsdir())/phasesynchronization/verystrongcoupling-behavior_p0_p008733-$(dictnames).png")
xlim(10,1000)
savefig("$(plotsdir())/phasesynchronization/verystrongcoupling-behavior_p0_p008733-zoomout-$(dictnames).png")







# -------------------------------------------------------------------- FREQUENCY ------------------------------------------------------------------- #
quantifier = "syncfreqstats"
dictnames=["ku_ws_501_shuf_p_eps4"]
dictnames = ["ku_ws_501_unit_p_eps4"]
dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
dictnames = ["ku_pl_501_unit_alpha_eps646154"]
dictnames = [""]
fileout=""
# m_yticks = [[],[],[]]
m_yticks = []

# idx_quantity = 2 #std
idx_quantity = 3 #iqi
# idx_quantity = 4 #gap = (max - min)
fig, axs = plot_R_all(dictnames, quantifier, fileout, idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
# fig, axs = plot_syncfreq_all(dictnames, quantifier, fileout, idx_quantity; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)










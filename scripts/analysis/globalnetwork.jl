include("general_plots.jl")

data_dir = datadir()



epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1; height=1;
ylabel1 = L"\langle R \rangle"
# ylabel1 = L"\langle \mathrm{std}(\{\omega_i(t)\}) \rangle"
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

eps_c = 2*sqrt(2)/sqrt(pi)



#-----  Shuffles
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"
N = 501
# N = 50
# dictnames = ["ku_global_$(N)_shuf_eps"]; mode = "shuffled"
dictnames = ["ku_global_$(N)_freqrand_eps"]; mode = "random"
m_yticks = []
quantifier = "Rstats"; v_ylabel=[ylabel1, ylabel2]
fileout=""
fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55); axs[idx].axvline(eps_c, linestyle="--", color="red") end
axs[1].set_title("Global network, $(mode) frequencies, N = $(N)")
fileout = "$(plotsdir())/globalnetwork/Rmalleability-$(dictnames[1]).png"
savefig(fileout)


quantifier = "syncfreqstats"
idx_quantity = 2 #std
ylabel1 = L"\langle \mathrm{std}(\{\omega_i(t)\}) \rangle"; v_ylabel=[ylabel1, ylabel2]
fileout=""
fig, axs = plot_R_all(dictnames, quantifier, fileout, idx_quantity; data_dir=data_dir, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55); axs[idx].axvline(eps_c, linestyle="--", color="red") end
axs[1].set_title("Global network, $(mode) frequencies, N = $(N)")
fileout = "$(plotsdir())/globalnetwork/frequencymalleability-$(dictnames[1]).png"
savefig(fileout)


#-----  ICs
v_xlabel = e_xlabel
x_zero_offset = 0.0; strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"
dictnames = ["ku_global_$(N)_icshuf_eps"]
# dictnames = ["ku_global_$(N)_icrand_eps"]
ylabel1 = L"\langle R \rangle"; v_ylabel=[ylabel1, ylabel2]
quantifier = "Rstats"
m_yticks = []
fileout=""
fig, axs = plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55); axs[idx].axvline(eps_c, linestyle="--", color="red") end
fileout = "$(plotsdir())/globalnetwork/Rmultistability-$(dictnames[1]).png"
axs[1].set_title("Global network, $(mode) ics, N = $(N)")
savefig(fileout)

quantifier = "syncfreqstats"
ylabel1 = L"\langle \mathrm{std}(\{\omega_i(t)\}) \rangle"; v_ylabel=[ylabel1, ylabel2]
idx_quantity = 2 #std
fileout=""
fig, axs = plot_R_all(dictnames, quantifier, fileout, idx_quantity; data_dir=data_dir, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,   v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)
for idx = 1:2 axs[idx].grid(linestyle="--", alpha=0.55); axs[idx].axvline(eps_c, linestyle="--", color="red") end
fileout = "$(plotsdir())/globalnetwork/frequencymultistability-$(dictnames[1]).png"
axs[1].set_title("Global network, $(mode) ics, N = $(N)")
savefig(fileout)


# -------------------------------------------------- distribution of R, finding max multistability ------------------------------------------------- #
idx_quantity = 2
quantifier = "Rstats"
dictname = "ku_global_501_icrand_eps_maxmulti"; epsi = "1.7592592592592593"
# dictname = "ku_global_501_icrand_eps_maxmulti2"; epsi = "1.4814814814814814"
# dictname = "ku_global_501_icrand_eps_maxmulti3"; epsi = "1.6"
data = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
ic_seeds = data[:,1]
Rs = data[:,2]
figure()
hist(Rs, bins=50)
idxs = sortperm(Rs)
Rs = Rs[idxs]; ic_seeds = ic_seeds[idxs]
title("ϵ = $(epsi), num random ics = $(length(Rs)), gap = $(gap(Rs))\nTwo smaller Rs: $(Rs[1]), $(Rs[2]), ics: $(ic_seeds[1]), $(ic_seeds[2]) \n Two bigger Rs: $(Rs[end]), $(Rs[end-1]), ics: $(ic_seeds[end]), $(ic_seeds[end-1]) ")
fileout = "$(plotsdir())/globalnetwork/multistability-check-Rdistribution-epsi_$(epsi)-$(dictname).png"
savefig(fileout)

# -------------------------------------------------------- phases - veryfing multistability -------------------------------------------------------- #
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(srcdir())/quantifiers.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")

# dictname = "ku_global_501_icrand_eps_1.6_phases"
dictname = "ku_global_501_icrand_eps_1.759_phases"
a, names_phases = get_resultnames(dictname, "", "phases")

allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)
idx = 1
idx = 2
idx = 3
idx = 4
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, shuffleid, seedic = d_params
phasename = names_phases[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi
v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_p = params_global(v_ω, epsi)
system_function = kuramotonetwork_global!
Ωs = instafreqs(t, m_θ, v_p, system_function) 
Rs = order_parameter(m_θ)

#plot phases and freqs
fig, axs = subplots(2,1, sharex="all")
ax=axs[1]
for i =1:N
ax.plot(t, Ωs[:,i])
end
ax.set_xlabel("t")
ax.set_ylabel(L"\dot{\theta}_i")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)

ax=axs[2]
c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(m_θ), t; align=false)
ax2 = plot_R!(fig, ax, Rs, t, 1, 1, 1)
fig.suptitle("epsi = $(epsi), ic seed = $(seedic)")
ax.set_xlabel("t")

savefigure(fig, axs, "$(plotsdir())/globalnetwork/verifyingmultistability-phases-frequencies_-epsi_$(epsi)-seedic_$(seedic)-$(dictname).png", dpi=300)
ax.set_xlim(t[end]-2500, t[end])
savefigure(fig, axs, "$(plotsdir())/globalnetwork/verifyingmultistability-phases-frequencies-zoomin-epsi_$(epsi)-seedic_$(seedic)-$(dictname).png", dpi=300)

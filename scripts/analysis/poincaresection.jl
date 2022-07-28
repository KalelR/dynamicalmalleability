# using DrWatson
# @quickactivate "malleability"
include("general_plots.jl")
# using PyCall, DelimitedFiles, CSV, DataFrames
# axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
using ChaosTools, DynamicalSystems
include("$(DIR)/src/drwatson-organization.jl")
include("$(DIR)/data/inputs/alldictionaries.jl")
# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]
data_dir = datadir()
DIR =  projectdir()
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
# --------------------------------------------------------------- Plot For varying p --------------------------------------------------------------- #
# colorR = "#098608"
# colorR = "#d45b02"
# align = false
# # align = false
# dictname = "ku_lyap_ws_501_shuf_p_ic_3_selectphases"
# epsi = 4.10256
# shuffleid = 0
# seedic = 1
# ps = [0.001, 0.006, 1e-2, 0.02254, 0.08733, 1e-1, 0.15013, 1e0]
    
numL, numC = length(ps), 1
# fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

# for (j, p) in enumerate(ps)
	# j = 1;
	# p = ps[j]
  #reading data
#     phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_$(seedic)-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_25499.999999999996-ttrans_0.0.dat"
#  data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end];
#   m_θ = mod.( m_θ, 2pi)
# N = 501
  dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
#   a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
  a, names_phases = get_resultnames(dictname, "", "phases2")
#   a, names_R = get_resultnames(dictname, "", "Rt")
#   a, names_freqs = get_resultnames(dictname, "", "instafreqs")
  allparams, paramtypes = return_dict(dictname)
#   idx=8 #periodic
#   idx = 3 #0.02254, chaotic
for idx=1:8
  d_params = dict_list(allparams)[idx]
  @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
#   lyapsname = names_lyaps[idx]
  phasename = names_phases[idx]
#   Rname = names_R[idx]
#   Ωname = names_freqs[idx]
# lyap_t, lyaps = get_convergence_lyapunovs(lyapsname)
data = CSV.File(phasename, header=false) |> DataFrame; m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi;
# data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
# data = CSV.File(Ωname, header=false) |> DataFrame; Ωs = Matrix(data)
  #plotting
data = Dataset(m_θ)
a = poincaresos(data, (1, pi/2))

fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [2, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	ax.scatter(a[:,1], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_1")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p)")
# fig.subplots_adjust(left=0.05, right=0.97, bottom=0.1, wspace=0.4)
fig.tight_layout()
savefig("$(plotsdir())/surfaceofsection/surfaceofsection_theta1_versus_thetavarious_theta1_pi2_p_$(p)_$(dictname).png")


# fig, axs= subplots(2, 5, sharey="all", sharex="all")
fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [2, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	# ax.plot(a[:,2], a[:,idxunit], "o", alpha=0.8, color="C$(i)", markersize=1) 
	ax.scatter(a[:,2], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_2")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p)")
# fig.subplots_adjust(left=0.05, right=0.97, bottom=0.1, wspace=0.4)
fig.tight_layout()
savefig("$(plotsdir())/surfaceofsection/surfaceofsection_theta2_versus_thetavarious_theta1_pi2_p_$(p)_$(dictname).png")

close("all")
end






# plane = zeros(Float64, N+1)
# plane[3:end-1] .= 1
# a = poincaresos(data, plane)
# figure()
# plot(a[:,2], a[:,3], "o")

# plane = zeros(Float64, N+1)
# plane[1] =  0.5
# plane[2] = 0.5
# plane[end] = pi
# a = poincaresos(data, plane)

	
end

#     Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_$(seedic)-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_25499.999999999996-ttrans_0.0.dat"
#     ax=axs[j]
#     global c
#     c, _, t  = plot_spatiotemporal!(fig, ax, phasename; align=align)
#     ax2 = plot_R!(fig, ax, Rname, t, 1, j, numC)
# end
#       
 


# -------------------------------------------------------- data from differential equations -------------------------------------------------------- #include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")

# dictname = "ku_ws_501_shuf_p_eps410256_tend100000"
dictname = "ku_ws_501_shuf_eps_p013111_tend100000"
a, names_phases = get_resultnames(dictname, "", "phases")
a, names_R = get_resultnames(dictname, "", "Rt")
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)

# idx = 3
for idx=1:length(alldicts)
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
Rname = names_R[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];

t = t[2000:end]
m_θ = m_θ[2000:end, :]

data = Dataset(m_θ)
a = poincaresos(data, (1, pi/2)) ###try with 0?
# a = poincaresos(data, (1, pi)) ###tried with 0.5, pi -> same results; with 0 you get no intersections

fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [2, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	ax.scatter(a[:,1], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_1")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p), epsi = $(epsi)")
# fig.subplots_adjust(left=0.05, right=0.97, bottom=0.1, wspace=0.4)
fig.tight_layout()
savefig("$(plotsdir())/surfaceofsection/surfaceofsection_theta1_versus_thetavarious_theta1_pi2_p_$(p)-epsi_$(epsi)-$(dictname).png")


# fig, axs= subplots(2, 5, sharey="all", sharex="all")
fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [2, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	# ax.plot(a[:,2], a[:,idxunit], "o", alpha=0.8, color="C$(i)", markersize=1) 
	ax.scatter(a[:,2], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_2")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p), epsi = $(epsi)")
# fig.subplots_adjust(left=0.05, right=0.97, bottom=0.1, wspace=0.4)
fig.tight_layout()
savefig("$(plotsdir())/surfaceofsection/surfaceofsection_theta2_versus_thetavarious_theta1_pi2_p_$(p)-epsi_$(epsi)-$(dictname).png")

close("all")
end












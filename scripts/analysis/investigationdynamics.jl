include("general_plots.jl")
# axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
include("$(srcdir())/quantifiers.jl")
include("$(srcdir())/analysis/lyapunovs_src.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
using DelimitedFiles
data_dir = datadir()
DIR =  projectdir()
using ChaosTools, DynamicalSystems


# dictname = "ku_ws_501_shuf_p_T600000s_states_lsoda"
# dictname = "ku_ws_501_shuf_p_eps410256-icsfrombasins-T600000_lsoda"
dictname = "ku_ws_501_shuf_eps_p013111_tend600000_lsoda"

# dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_steptrue"
a, names_phases = get_resultnames(dictname, "", "phases")
# a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
# ku_ws_501_shuf_p_T600000s_states phases

# dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_steptrue"
# dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse"
# a, names_phases = get_resultnames(dictname, "", "phases2")
# a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")

# dictname = "ku_ws_lyap_501_shuf_p_eps410256-icsfrombasins-unit22_v3"
# dictname = "ku_ws_lyap_501_shuf_p_eps410256-icsfrombasins-unit22_v2_steptrue"
# a, names_phases = get_resultnames(dictname, "", "phases2")
# a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
# dictname2 = "ku_ws_501_shuf_p_eps410256-icsfrombasins-T600000"
# a, names_phasesdiffeq = get_resultnames(dictname2, "", "phases")



allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)

allδs = [ #dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse"
	# [40, 50, 51, 52, 54],
	[48, 49, 49.5, 50, 50.5],
	[47, 48, 49, 50, 51],
	[36, 38, 40, 41, 42],
	[2, 5, 8, 11, 14],
	[0.1, 0.3, 0.4, 0.5, 0.7],
	[0.05, 0.1, 0.2, 0.3, 0.4],
	[0.001, 0.004, 0.01, 0.05, 0.1],
	[0.1, 0.2, 0.3, 0.5, 0.7],
	[0.1, 0.3, 0.5, 0.6, 0.7],
	[0.1, 0.3, 0.5, 0.7, 1.0],
	[0.05, 0.1, 0.15, 0.2, 0.4],
]

allδs = [ #dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse"
	# [40, 50, 51, 52, 54],
	[48, 49, 49.5, 50, 50.5],
	[47, 48, 49, 50, 51],
	[0.05, 0.1, 0.2, 0.35, 0.5],
	[2, 5, 8, 11, 14],
	[6, 8, 9, 10, 12],
	[0.05, 0.1, 0.2, 0.3, 0.4],
	[0.05, 0.1, 0.2, 0.3, 0.4],
	[0.05, 0.1, 0.2, 0.3, 0.5],
	[0.05, 0.1, 0.2, 0.3, 0.5],
]


idx =1

d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
# data = CSV.File(phasename, header=false) |> DataFrame; m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi; #FOR LYAPUNOVS

@unpack u01, u02 = d_params

lyapsname = names_lyaps[idx]
lyap_t, lyaps = get_convergence_lyapunovs(lyapsname; printbiggest=false)
t = deepcopy(lyap_t)

m_θ = m_θ[100:end, :]
t = t[100:end]

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
Ωs = instafreqs(t, m_θ, v_p, system_function) 
Rs = order_parameter(m_θ)

# ------------------------------------------------------------- 1. Phases and frequencies ------------------------------------------------------------- #
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
fig.suptitle("p = $(p), epsi = $(epsi)")
fig.suptitle("p = $(p), epsi = $(epsi), u01 = $(u01), u02 = $(u02)")
ax.set_xlabel("t")

savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/phases-frequencies_p_$(p)-epsi_$(epsi)-$(dictname).png")
ax.set_xlim(t[end]-3000, t[end])
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/phases-frequencies-zoomin-_p_$(p)-epsi_$(epsi)-$(dictname).png")


# ----------------------------------------------------------- Return map ---------------------------------------------------------- #
fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [2, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	idxs_maxima = local_maxima(m_θ[:, idxunit])
	Δts = diff(t[idxs_maxima])
	ax.scatter(Δts[1:end-1], Δts[2:end], c=1:length(Δts[1:end-1]))
	ax.set_title("unit $(idxunit)")
	ax.set_ylabel(L"\Delta tmax_{n+1}")
	ax.set_xlabel(L"\Delta tmax_{n}")
end
fig.tight_layout()
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/returnmaps-_p_$(p)-epsi_$(epsi)-$(dictname).png")

# ---------------------------------------------------------------- Poincare section ---------------------------------------------------------------- #
data = Dataset(m_θ)
a = poincaresos(data, (1, pi/2))
fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [1, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	ax.scatter(a[:,2], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_2")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p), epsi = $(epsi)")
fig.tight_layout()
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/surfaceofsection-theta2_versus_thetavarious-theta1_pi2-p_$(p)-epsi_$(epsi)-$(dictname).png")


fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [2, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	ax.scatter(a[:,1], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_2")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p), epsi = $(epsi)")
fig.tight_layout()
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/surfaceofsection-theta1_versus_thetavarious-theta1_pi2-p_$(p)-epsi_$(epsi)-$(dictname).png")


# ---------------------------------------------------------------- Lyapunov spectrum --------------------------------------------------------------- #
instalyaps, lyap_t2 = get_instantaneous_lyapunovs(lyapsname)


subplot_kw = Dict("height_ratios" =>  [1,1,3])
numL, numC = 3, 1
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="none", gridspec_kw=subplot_kw)
ax = axs[1]
for i = 1:size(lyaps)[2]
	ax.plot(lyap_t2, lyaps[:, i], alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_ylabel(L"\lambda")

ax = axs[2]
for i = 1:size(lyaps)[2]
	ax.plot(lyap_t2, instalyaps[:, i], alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_ylabel(L"\lambda_{insta}(t) = \ln( diag(\mathbf{R}) ) ")
ax.set_yscale("symlog", linthresh=1e-5, linscale=0.1)


ax=axs[3]
c, _, _  = plot_spatiotemporal!(fig, ax, m_θ, t; align=false)
ax2 = plot_R!(fig, ax, Rs, t, 1, 1, numC)
ax.set_ylabel("θ")
# ax.set_xlim(lyap_t[1], lyap_t[end])

fig.suptitle("p = $(p), epsi = $(epsi)")

for j=1:numC 
    axs[end, j].set_xlabel(L"t")
end

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=2*column;
# fig.set_size_inches(width, height)
# fig.subplots_adjust(left=0.06, right=0.97, top=0.96, bottom=0.05, wspace=0.10, hspace=0.0)

# savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/lyapunovsconvergence-instantaneous-phases-p_$(p)-epsi_$(epsi)-$(dictname).png", width=width, height=height)
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/lyapunovsconvergence-instantaneous-phases-p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=200)

ax.set_xlim(t[end]-2000, t[end])
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/lyapunovsconvergence-instantaneous-phases-zoomin-p_$(p)-epsi_$(epsi)-$(dictname).png", width=width, height=height)


# ---------------------------------------------------------------- Biggest Lyapunovs --------------------------------------------------------------- #
subplot_kw = Dict("height_ratios" =>  [1,1,3])
numL, numC = 3, 1
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="none", gridspec_kw=subplot_kw)
ax = axs[1]
for i = 1:4
	ax.plot(lyap_t2, lyaps[:, i], alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_ylabel(L"\lambda")

ax = axs[2]
for i = 1:4
	ax.plot(lyap_t2, instalyaps[:, i], alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_ylabel(L"\lambda_{insta}(t) = \ln( diag(\mathbf{R}) ) ")
ax.set_yscale("symlog", linthresh=1e-5, linscale=0.1)


ax=axs[3]
c, _, _  = plot_spatiotemporal!(fig, ax, m_θ, t; align=false)
ax2 = plot_R!(fig, ax, Rs, t, 1, 1, numC)
ax.set_ylabel("θ")
# ax.set_xlim(lyap_t[1], lyap_t[end])

# fig.suptitle("p = $(p), epsi = $(epsi)")
fig.suptitle("p = $(p), epsi = $(epsi), u01 = $(u01), u02 = $(u02)")

for j=1:numC 
    axs[end, j].set_xlabel(L"t")
end

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=2*column;
# fig.set_size_inches(width, height)
# fig.subplots_adjust(left=0.06, right=0.97, top=0.96, bottom=0.05, wspace=0.10, hspace=0.0)

# savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/biggestlyapunovsconvergence-instantaneous-phases-p_$(p)-epsi_$(epsi)-$(dictname).png", width=width, height=height)
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/biggestlyapunovsconvergence-instantaneous-phases-p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=200)

ax.set_xlim(t[end]-2000, t[end])
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/biggestlyapunovsconvergence-instantaneous-phases-zoomin-p_$(p)-epsi_$(epsi)-$(dictname).png", width=width, height=height)



# ---------------------------------------------------------------- Recurrence plots ---------------------------------------------------------------- #
x = Dataset(m_θ[5000:10000, :])
δs = allδs[idx]

fig, axs = subplots(1, 5, sharex="all", sharey="all", constrained_layout=true)
for (i, δ) in enumerate(δs)
R = RecurrenceMatrix(x, δ, parallel=true)
ax = axs[i]
xs, ys = coordinates(R)
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_xlim(1, size(R)[1]); ylim(1, size(R)[2]);
# ax.scatter(lyap_t[xs], lyap_t[ys], color = "k", s = 1)
# ax.set_xlim(lyap_t[xs[1]], lyap_t[xs[end]]); ax.set_ylim(lyap_t[ys[1]], lyap_t[ys[end]]);
ax.set_aspect("equal")
ax.set_title("δ = $(δ)")
end
fig.suptitle("p = $(p), epsi = $(epsi)", y=0.75)
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/recurrenceplots-p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )

x = Dataset(m_θ[5000:10000, 1:3])
δs = allδs[idx]
δs = 
[0.05, 0.1, 0.15, 0.2, 0.3]
fig, axs = subplots(1, 5, sharex="all", sharey="all", constrained_layout=true)
for (i, δ) in enumerate(δs)
R = RecurrenceMatrix(x, δ, parallel=true)
ax = axs[i]
xs, ys = coordinates(R)
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_xlim(1, size(R)[1]); ylim(1, size(R)[2]);
# ax.scatter(lyap_t[xs], lyap_t[ys], color = "k", s = 1)
# ax.set_xlim(lyap_t[xs[1]], lyap_t[xs[end]]); ax.set_ylim(lyap_t[ys[1]], lyap_t[ys[end]]);
ax.set_aspect("equal")
ax.set_title("δ = $(δ)")
end
fig.suptitle("p = $(p), epsi = $(epsi),3 units", y=0.75)
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/recurrenceplots-3units-p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )

x = Dataset(m_θ[5000:15000, :])
δs = allδs[idx]

fig, axs = subplots(1, 5, sharex="all", sharey="all", constrained_layout=true)
for (i, δ) in enumerate(δs)
R = RecurrenceMatrix(x, δ, parallel=true)
ax = axs[i]
xs, ys = coordinates(R)
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_xlim(1, size(R)[1]); ylim(1, size(R)[2]);
# ax.scatter(lyap_t[xs], lyap_t[ys], color = "k", s = 1)
# ax.set_xlim(lyap_t[xs[1]], lyap_t[xs[end]]); ax.set_ylim(lyap_t[ys[1]], lyap_t[ys[end]]);
ax.set_aspect("equal")
ax.set_title("δ = $(δ)")
end
fig.suptitle("p = $(p), epsi = $(epsi)", y=0.75)
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/recurrenceplots-longer-p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )



# ------------------------------------------------------------- Long simulation phases ------------------------------------------------------------- #
using DifferentialEquations
using LSODA
allδs = [ #dictname = dictname = "ku_ws_501_shuf_p_eps410256-icsfrombasins-T600000_lsoda"
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35],
	[0.05, 0.075, 0.1, 0.2, 0.35]
]
allδs = [ #dictname = "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse"
	# [40, 50, 51, 52, 54],
	[48, 49, 49.5, 50, 50.5],
	[47, 48, 49, 50, 51],
	[47, 48, 49, 50, 51],
	[34,36,37,38, 39],
	[0.1, 0.3, 0.4, 0.5, 0.7],
	[0.05, 0.1, 0.2, 0.3, 0.4],
	[0.001, 0.004, 0.01, 0.05, 0.1],
	[0.1, 0.2, 0.3, 0.5, 0.7],
	[0.05, 0.1, 0.15, 0.2, 0.4],
]
allδs = [ #"ku_ws_501_shuf_p_T600000s_states_lsoda"
	[15, 20, 25,30, 35],
	[2, 5, 8, 12, 15],
	[0.05, 0.1, 0.2, 0.35, 0.5],
	[0.05, 0.1, 0.2, 0.35, 0.5],
	[0.05, 0.1, 0.2, 0.35, 0.5],
	[0.05, 0.1, 0.2, 0.35, 0.5],
	[0.05, 0.1, 0.2, 0.35, 0.5],
	[0.05, 0.1, 0.2, 0.35, 0.5],
]



dictname = "ku_ws_501_shuf_p_T600000s_states_lsoda"
# dictname = "ku_ws_501_shuf_p_eps410256-icsfrombasins-T600000_lsoda"
# dictname = "ku_ws_501_shuf_eps_p013111_tend600000_lsoda"
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)
# a, names_phases = get_resultnames(dictname, "", "phases")

idx=1
# idx=2
for idx=1:length(alldicts)

d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
# @unpack u01, u02 = d_params
# phasename = names_phases[idx]
# data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi; #FOR LYAPUNOVS
# m_θ = m_θ[100:end, :]
# t = t[100:end]

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
v_u0 = get_initialconditions(mchange, d_params, DIR)

prob = ODEProblem(kuramotonetwork!, v_u0, (0.0, 600000), v_p)
sol = @time solve(prob, lsoda(), reltol=1e-8, abstol=1e-8, saveat=0:10:600000, maxiters=1e10)
# sol = @time solve(prob, lsoda(), reltol=1e-8, abstol=1e-8, saveat=0:1:600000, maxiters=1e10)
# sol = @time solve(prob, lsoda(), reltol=1e-8, abstol=1e-8, saveat=500000:1.0:550000, maxiters=1e10)
# sol = @time solve(prob, lsoda(), reltol=1e-8, abstol=1e-8, saveat=500000:0.1:550000, maxiters=1e10)
# sol = @time solve(prob, lsoda(), reltol=1e-8, abstol=1e-8, saveat=500000:0.05:550000, maxiters=1e10)
# sol = @time solve(prob, lsoda(), reltol=1e-8, abstol=1e-8, maxiters=1e10)
m_θ = mod.(transpose(sol[:,:]), 2pi)
t = sol.t 
m_θ = m_θ[500:end, :]
t = t[500:end]

Ωs = instafreqs(t, m_θ, v_p, system_function) 
Rs = order_parameter(m_θ)

#one unit's frequency
idxunit=1
fig,axs = subplots(2,2, sharey="row")
ax = axs[1,1]
ax.plot(t[100:350], m_θ[100:350,idxunit], ".-")
ax = axs[1,2]
ax.plot(t[end-250:end], m_θ[end-250:end,idxunit], ".-")
ax = axs[2,1]
ax.plot(t[100:350], Ωs[100:350,idxunit], ".-", alpha=0.8)
ax=axs[2,2]
ax.plot(t[end-250:end], Ωs[end-250:end,idxunit], ".-", alpha=0.8)
# fig.suptitle("p = $(p), epsi = $(epsi), u01 = $(u01), u02 = $(u02)")
fig.suptitle("p = $(p), epsi = $(epsi)")
ax.set_xlabel("t")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)
axs[2,1].set_ylabel(L"\dot{\theta}_i")
axs[1,1].set_ylabel(L"\theta_i")
# savefig("$(plotsdir())/investigationsdynamics/$(dictname)/phases-frequencies-singleunit-zoomin_p_$(p)-u02_$(u02)-epsi_$(epsi)-$(dictname).png")
fileout = "$(plotsdir())/investigationsdynamics/$(dictname)/phases-frequencies-singleunit-zoomin_p_$(p)-epsi_$(epsi)-$(dictname).png"
mkpath(dirname(fileout))
savefig(fileout)

#all

fig,axs = subplots(1,1, sharex="all")
ax = axs
for idxunit=1:N
# ax.plot(t[:], Ωs[:,idxunit], "-", alpha=0.8)
ax.plot(t[1:100:end], Ωs[1:100:end,idxunit], "-", alpha=0.8)
end

# fig.suptitle("p = $(p), epsi = $(epsi), u01 = $(u01), u02 = $(u02)")
fig.suptitle("p = $(p), epsi = $(epsi)")
ax.set_xlabel("t")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)

ax.set_ylabel(L"\dot{\theta}_i")
# savefig("$(plotsdir())/investigationsdynamics/$(dictname)/frequencies_p_$(p)-epsi_u02_$(u02)-$(epsi)-$(dictname).png")
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/frequencies_p_$(p)-epsi-$(epsi)-$(dictname).png")
ax.set_xlim(t[end]-1000, t[end])
# savefig("$(plotsdir())/investigationsdynamics/$(dictname)/frequencies-zoomin_p_$(p)-u02_$(u02)-epsi_$(epsi)-$(dictname).png")
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/frequencies-zoomin_p_$(p)-epsi_$(epsi)-$(dictname).png")

#-------------- PHASES
fig, axs = subplots(1,1, sharex="all")
ax=axs
c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(m_θ[end-500:end, :]), t[end-500:end]; align=false)
ax2 = plot_R!(fig, ax, Rs[end-500:end], t[end-500:end], 1, 1, 1)
fig.suptitle("p = $(p), epsi = $(epsi)")
# fig.suptitle("p = $(p), epsi = $(epsi), u01 = $(u01), u02 = $(u02)")
ax.set_xlabel("t")
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/phases-_p_$(p)-epsi_$(epsi)-$(dictname).png")
# savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/phases-_p_$(p)-epsi_$(epsi)-u02_$(u02)-$(dictname).png")


#------------ Recurnce plots
x = Dataset(m_θ[end-15000:end, :])
δs = allδs[idx]

fig, axs = subplots(1, 5, sharex="all", sharey="all", constrained_layout=true)
for (i, δ) in enumerate(δs)
R = RecurrenceMatrix(x, δ, parallel=true)
ax = axs[i]
xs, ys = coordinates(R)
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_xlim(1, size(R)[1]); ylim(1, size(R)[2]);
# ax.scatter(lyap_t[xs], lyap_t[ys], color = "k", s = 1)
# ax.set_xlim(lyap_t[xs[1]], lyap_t[xs[end]]); ax.set_ylim(lyap_t[ys[1]], lyap_t[ys[end]]);
ax.set_aspect("equal")
ax.set_title("δ = $(δ)")
end
fig.suptitle("p = $(p), epsi = $(epsi)", y=0.75)
# savefig("$(plotsdir())/investigationsdynamics/$(dictname)/recurrenceplots-p_$(p)-epsi_$(epsi)-u02_$(u02)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )
savefig("$(plotsdir())/investigationsdynamics/$(dictname)/recurrenceplots-p_$(p)-epsi_$(epsi)-$(dictname).png", dpi=300,bbox_inches="tight", pad_inches=0.0 )


#Poincare section
# data = Dataset(m_θ)
# data = Dataset(m_θ[5000:end,:])
# data = Dataset(m_θ[end-5000:end,:])
data = Dataset(m_θ)
a = poincaresos(data, (1, pi/2))
fig, axs= subplots(2, 5, sharey="none", sharex="none")
idxunits = [1, 3, 10, 50, 100, 200, 250, 300, 400, 501]
for (i, idxunit) in enumerate(idxunits)
	j,k =  floor(Int, (idxunit-1) / 5) + 1, (idxunit-1) % 5 + 1
	idxunit = idxunits[i]
	ax = axs[i]
	ax.scatter(a[:,2], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	# ax.scatter(a[:,1], a[:,idxunit], alpha=0.8, c=1:length(a[:,2]), s=1) 
	ax.set_ylabel("θ_$(idxunit)")
	ax.set_xlabel("θ_2")
end
fig.suptitle("Surface of section on θ_1 = π/2, p = $(p), epsi = $(epsi)")
fig.tight_layout()
# savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/surfaceofsection-theta2_versus_thetavarious-theta1_pi2-p_$(p)-epsi_$(epsi)-u02_$(u02)-$(dictname).png")
savefigure(fig, axs, "$(plotsdir())/investigationsdynamics/$(dictname)/surfaceofsection-theta2_versus_thetavarious-theta1_pi2-p_$(p)-epsi_$(epsi)-$(dictname).png")

# fig, axs = subplots(2,1, sharex="all")
# for i in [1, 2,10,100]
# 	ax = axs[1]
# 	ax.plot(t[end-5000:end], m_θ[end-5000:end,i], alpha=0.8)
# 	ax = axs[2]
# 	ax.plot(t[end-5000:end], Ωs[end-5000:end,i], alpha=0.8)
# 	ax.ticklabel_format(useOffset=false, style="plain", axis="both")
# ax.get_yaxis().get_major_formatter().set_useOffset(false)
# ax.get_yaxis().get_major_formatter().set_scientific(false)
# end
# axs[1].axhline(pi/2, color="black")
# axs[1].grid(b=true, which=minor, color="black")

close("all")
end


# fig,axs = subplots(length(names_phasesdiffeq),1, sharex="all", sharey="all")
# for idx = 1:length(alldicts)
# d_params = alldicts[idx]
# @unpack u01, u02, N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
# phasename = names_phasesdiffeq[idx]
# data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi; #FOR LYAPUNOVS
# Rs = order_parameter(m_θ)
# ax = axs[idx]
# ax.plot(t, Rs)
# ax.set_ylim(0,1)
# # ax.set_title("u01 = $(u01), u02 = $(u02)")
# # ax.set_xlabel("t")
# ax.set_ylabel(L"\langle R \rangle")
# end
# # fig.suptitle("p = $(p), epsi = $(epsi)")
# fig.tight_layout()
# savefig("$(plotsdir())/investigationsdynamics/$(dictname)/kuramotoorderparameter_p_$(p)-epsi-$(epsi)-$(dictname).png")








# orderparametercommunity
close("all")


idx=136
fig,axs = subplots(3,1, sharex="all")
ax = axs[1]
ax.plot(t, m_θ[:,idx])


ax = axs[2]
ax.plot(t[500:end], Ωs[500:end,idx])


ax = axs[3]
idxs_maxima = local_maxima(m_θ[:, idx])
Δts = diff(t[idxs_maxima])
ax.plot(t[idxs_maxima[1:end-1]], Δts, "o")

idx=136
fig,axs = subplots(2,1, sharex="none")
ax = axs[1]
ax.plot(t[1:300], m_θ[1:300,idx])


ax = axs[2]
ax.plot(t[end-300:end], m_θ[end-300:end,idx])

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
a = instafreqs(t, m_θ, v_p, system_function) 

x = Dataset(m_θ[:, idx])
R = RecurrenceMatrix(x, 0.05, parallel=true)
xs, ys = coordinates(R)
figure()
ax = gca()
ax.scatter(xs, ys, color = "k", s = 1)
ax.set_aspect("equal")

idx=171
fig,axs = subplots(2,1, sharex="all")
ax = axs[1]
ax.plot(t[:], m_θ[:,idx], ".-")
ax.set_xlim(1000, 1500)
ax.set_xlim(70000, 80000)

ax = axs[2]
ax.plot(t[:], Ωs[:,idx], ".-")
# ax2.set_xlim(0, 200)
ax2.set_xlim(1000, 10000)

idxs_maxima = local_maxima(m_θ[:, idx])
Δts = diff(t[idxs_maxima])
tmaxs = t[idxs_maxima]
ax.set_xlim(tmaxs[750], tmaxs[751])
diff(m_θ[:,171])


ax = axs[2]

findmax(Ωs[end,:])
findmin(Ωs[end,:])




a = instafreqs(t[50000:end], m_θ[50000:end, :], v_p, system_function) 



dictname = "ku_ws_501_shuf_eps_p013111_tend600000_lsoda"

# dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_steptrue"
a, names_phases = get_resultnames(dictname, "", "phases")


# idx =1
idx = 4 #epsi = 1.43
idx =  5
idx = 6
# idx = 13 #2.46
# idx = 20 #3.89
for idx in [5,6,7,8]
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;

# @unpack u01, u02 = d_params

# lyapsname = names_lyaps[idx]
# lyap_t, lyaps = get_convergence_lyapunovs(lyapsname; printbiggest=false)
# t = deepcopy(lyap_t)

m_θ = m_θ[1:end, :]
t = t[1:end]

# v_ω = get_frequency(mchange, mfreq, d_params, DIR)
# v_adjl = topology_params = get_topology(mtop, d_params, DIR)
# v_p = params(v_ω, epsi, v_adjl)
# system_function = kuramotonetwork!
# Ωs = instafreqs(t, m_θ, v_p, system_function) 
Rs = order_parameter(m_θ)
figure()
plot(t, Rs)
title("ϵ = $(epsi), p = $(p), shuffle id = $(shuffleid)")
ylim(0,1)
savefig("$(plotsdir())/statistics-R/timeseries-$(epsi)_p_$(p)_shuffleid_$(shuffleid).png", dpi=300)
end
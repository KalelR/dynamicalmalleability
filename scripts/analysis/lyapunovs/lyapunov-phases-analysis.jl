
include("../general_plots.jl")
include("$(srcdir())/analysis/lyapunovs_src.jl")
include("$(srcdir())/quantifiers.jl")
include("$(srcdir())/sims/Kuramoto/parameters.jl")
include("$(srcdir())/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/utils.jl")

using PyCall, DelimitedFiles
axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]
data_dir = datadir()
# --------------------------------------------------------------- Plot For varying p --------------------------------------------------------------- #
# # colorR = "#098608"
# colorR = "#d45b02"
# align = false
# # align = false
# dictname = "ku_lyap_ws_501_shuf_p_ic_3_selectphases"
# epsi = 4.10256
# shuffleid = 0
# seedic = 1
# ps = [0.001, 0.006, 1e-2, 0.02254, 0.08733, 1e-1, 0.15013, 1e0]
    
# numL, numC = length(ps), 1
# fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

# for (j, p) in enumerate(ps)
#     phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_$(seedic)-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_25499.999999999996-ttrans_0.0.dat"
#     Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_$(seedic)-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_25499.999999999996-ttrans_0.0.dat"
#     ax=axs[j]
#     global c
#     c, _, t  = plot_spatiotemporal!(fig, ax, phasename; align=align)
#     ax2 = plot_R!(fig, ax, Rname, t, 1, j, numC)
# end

# # xlim = (3000, 4000); xticks=[]
# # beautify_spatiotemporal!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align, hascbar=false)
# # axs[1,1].set_xlim(3000, 4000)
# for j=1:numC 
# #     axs[end, j].set_xticks([3000, 3500])
#     axs[end, j].set_xlabel(L"t")
# end
# for i =1:numL
#     s  = "\\mathrm{p} = $(ps[i])"; axs[i].set_title(latexstring(s), x=1.05, y = 0.2, fontsize=label_size-5, rotation=-90, pad=8)
# #     axs[i, 1].set_ylabel("Unit No.")
#     axs[i,1].set_yticks([1, 250, 501])
# end
# # fig.suptitle("Seed ic = $(seedic)")

# column = 3.54 ##1 column = 2.3 inches
# width= 3.5 *column;
# height=2*column;
# fig.set_size_inches(width, height)
# fig.tight_layout()
# # fig.subplots_adjust(wspace=0.15)
# fig.subplots_adjust(wspace=0.10, hspace=0.1)
# filename = "$(plotsdir())/lyapunovs/spatiotemporalpatterns-in-lyapunovs-shuffling-$(dictname).png" 
# mkpath(dirname(filename))
# savefig(filename, dpi=300)





# -------------------------------------------------------------- Phases with lyapunovs ------------------------------------------------------------- #

function plot_spatiotemporal!(fig, ax, phasename, lyap_t; align=false, xticks=[], xlim=())
        data = CSV.File(phasename, header=false) |> DataFrame
        m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) .- pi;
	idxs_t_lyap = 1:10:size(m_θ)[1]
	m_θ = m_θ[idxs_t_lyap,:]
	v_t = lyap_t
        t_end, N = size(m_θ)
        # v_t = range(lyap_t[1], lyap_t[end], length=t_end)
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        if(align) idxperm = sortperm(m_θ[1,:]); m_θ = m_θ[:, idxperm]; end #-----align phases!
        c = ax.pcolormesh(x, y, m_θ', cmap="twilight", vmin=-pi, vmax=pi)
        return c, m_θ, v_t
end

# function plot_R!(v_R, fig, ax, Rs, t, j=0, i=1, numC=0; colorR="red")
#     ax2 = ax.twinx()
#     ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
#     ax2.set_ylim(0,1)
#     ax2.tick_params(axis="y", colors=colorR)
#     ax2.yaxis.label.set_color(colorR)

#     if(j != numC) ax2.set_yticks([]) end
#     if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
#     return ax2 
# end

function get_convergence_lyapunovs(filename; printbiggest=true)
	# lyaps = readdlm(filename)
	lyaps = myreadfile(filename)
	t = lyaps[:,1]
	λ = lyaps[:,2:end]
	if printbiggest == true
	sort_idxs = sortperm(λ[end,:], rev=true)
	λ = λ[:, sort_idxs]
	idx_zero = argmin(abs.(λ[end,:]))
	idx_max = 1 #argmax(finalλs)
	idxs = idx_max:idx_zero+1
		return t, λ[:, idxs]
	else
		return t, λ[:, :]
	end
end


function local_maxima(x)
	x1 = @view x[1:end - 2]
	x2 = @view x[2:end - 1]
	x3 = @view x[3:end]
	collect(1:length(x2))[x1 .< x2 .> x3] .+ 1
    end
    

# colorR = "#098608"
colorR = "#d45b02"
align = false
# align = false
# dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_steptrue"
# dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse_dt01"
# dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse_dt10"
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
a, names_phases = get_resultnames(dictname, "", "phases2")
a, names_R = get_resultnames(dictname, "", "Rt")
a, names_freqs = get_resultnames(dictname, "", "instafreqs")
DIR =  projectdir()
allparams, paramtypes = return_dict(dictname)

idx = 3
# idx = 2
# idx = 6
d_params = dict_list(allparams)[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
lyapsname = names_lyaps[idx]
phasename = names_phases[idx]
Rname = names_R[idx]
Ωname = names_freqs[idx]

# phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/phases2-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
# Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/Rt-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
# lyapsname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/conv_lyapu_spectrum-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
lyap_t, lyaps = get_convergence_lyapunovs(lyapsname)
data = CSV.File(phasename, header=false) |> DataFrame; m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
data = CSV.File(Ωname, header=false) |> DataFrame; Ωs = Matrix(data);

# Ωs = instafreqs(d_params, 1:size(m_θ)[1], m_θ)

# -------------------------------------------------------------------- PLOT ALL -------------------------------------------------------------------- #

subplot_kw = Dict("height_ratios" =>  [1,2,8])
numL, numC = 3, 1
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="none", gridspec_kw=subplot_kw)
ax = axs[1]
for i = 1:size(lyaps)[2]
	ax.plot(lyap_t, lyaps[:, i], alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_ylabel(L"\lambda")
ax.set_title("p = $(p)")

ax=axs[3]
c, m_θ, t  = plot_spatiotemporal!(fig, ax, m_θ, lyap_t; align=align)
Rs = order_parameter(m_θ')
ax2 = plot_R!(fig, ax, Rs, lyap_t, 1, 1, numC)
# ax.set_xlim(lyap_t[1], 2000)
# ax.set_xlim(lyap_t[end]-1000, lyap_t[end])
# ax.set_xlim(1200, 1900) #idx = 2,3
# ax.set_xlim(1200, 1800) #idx = 2,3, dt = 0.1
# ax.set_xlim(1000, 2200) #idx = 2,3, dt = 10
ax.set_xlim(2000, 3500) #idx = 2,3
# ax.set_xlim(5500, 7000) #idx = 2,3
ax.set_ylabel("θ")
ax.set_xlim(lyap_t[1], lyap_t[end])


ax=axs[2]
for i = 1:size(Ωs)[2]
	ax.plot(lyap_t, Ωs[:, i], alpha=0.65)
end
ax.set_ylabel(L"\dot{\theta}(t)")

for j=1:numC 
    axs[end, j].set_xlabel(L"t")
end

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=2*column;
fig.set_size_inches(width, height)
fig.subplots_adjust(left=0.06, right=0.97, top=0.96, bottom=0.05, wspace=0.10, hspace=0.0)
filename = "$(plotsdir())/lyapunovs/real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
# filename = "$(plotsdir())/lyapunovs/real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi)-zoomout.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

idx_units_comm, Rcomms = order_parameter_community(m_θ, 50)
figure()
ax = gca()
for i = 1:size(Rcomms)[2]
	ax.plot(lyap_t, Rcomms[:, i], alpha=0.65)
end
ylabel("R from communities")
xlabel("t")
filename = "$(plotsdir())/lyapunovs/Rcomm-acommpanying-real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

figure()
ax = gca()
for i = 1:size(Ωs)[2]
	ax.plot(lyap_t, Ωs[:, i], alpha=0.65)
end
ax.set_ylabel(L"\dot{\theta}(t)")
xlabel("t")
filename = "$(plotsdir())/lyapunovs/instafreqs-acommpanying-real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


Ω_spat_av = mean(Ωs, dims=2)
Ω_spat_std = std(Ωs, dims=2)

figure()
ax = gca()
for i = 1:size(Ωs)[2]
	# ax.plot(lyap_t, Ω_spat_av, alpha=0.65)
	ax.plot(lyap_t, Ω_spat_std, alpha=0.65)
end
ax.set_ylabel(L"mean(\dot{\theta_{i=1}^N})")
xlabel("t")
filename = "$(plotsdir())/lyapunovs/spatialaveragefrequency-acommpanying-real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

# ---------------------------------------------------------------- Checking by hand ---------------------------------------------------------------- #
# data = CSV.File(phasename, header=false) |> DataFrame
# m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) #.- pi;
# idxs_t_lyap = 1:10:size(m_θ)[1]
# m_θ = m_θ[idxs_t_lyap,:]
# lyapsname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/conv_lyapu_spectrum-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
# lyap_t, lyaps = get_convergence_lyapunovs(lyapsname)
# t = lyap_t
# Ωs = instafreqs(d_params, 1:size(m_θ)[1], m_θ)


t = lyap_t
idxminfreq = argmin(Ωs[end,:])
fig, axs = subplots(2, 1,constrained_layout=true, sharex="all", sharey="none")
ax = axs[1]
# sub = mod.(v_ω[idxminfreq] .* t, 2pi)
ax.plot(t, m_θ[:, idxminfreq], ".-")
# ax.plot(t, m_θ[:, idxminfreq] .- sub, ".-")
ax=axs[2]
ax.plot(t, Ωs[:, idxminfreq], alpha=0.65)
idxs_maxima = local_maxima(m_θ[:, idxminfreq])
# plot(t[idxs_maxima], m_θ[idxs_maxima, idxminfreq], "o")
Δts = diff(t[idxs_maxima])
freqs =2π ./Δts
ax.plot(t[idxs_maxima[1:end-1]], -freqs, ".-")


figure()
scatter(m_θ[:,1], m_θ[:,2])
scatter(m_θ[:,1], m_θ[:,200])


v_ω = get_frequency(mchange, mfreq, d_params, DIR)
couplingintensities = hcat([Ωs[:, i] .- v_ω[i] for i=1:N]...)



# ------------------------------------------------------------- Instantaneous lyapunovs ------------------------------------------------------------ #
instalyaps, lyap_t = get_instantaneous_lyapunovs(lyapsname)
# subplot_kw = Dict("height_ratios" =>  [1,2,8])
numL, numC = 2, 1
# fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="none", gridspec_kw=subplot_kw)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="none")
ax = axs[1]
i = 1
# for i = 1:size(instalyaps)[2]
	ax.plot(lyap_t, instalyaps[:, i], alpha=0.65)
	# ax.plot(lyap_t, abs.(instalyaps[:, i]), alpha=0.65)
# end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_ylabel(L"\lambda_{insta}(t) = \ln( diag(\mathbf{R}) ) ")
ax.set_yscale("symlog", linthresh=1e-5, linscale=0.1)
ax.set_title("p = $(p)")

ax = axs[2]
ax.plot(lyap_t, lyaps[:, i], alpha=0.65)
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")

ax.set_yscale("symlog", linthresh=1e-5, linscale=0.1)
ax.set_ylabel(L"\lambda = mean(\lambda_{insta}[1:t])")
# ax.set_title("p = $(p)")
ax.set_xlim(0, 5000)
filename = "$(plotsdir())/lyapunovs/instalyaps-lyaps-maximum-acommpanying-real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


instalyaps, lyap_t = get_instantaneous_lyapunovs(lyapsname)
numL, numC = 2, 1
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="none")
ax = axs[1]
i = 1
for i = 1:size(instalyaps)[2]
	ax.plot(lyap_t, instalyaps[:, i], alpha=0.65)
	# ax.plot(lyap_t, abs.(instalyaps[:, i]), alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.set_yscale("symlog", linthresh=1e-4)
ax.set_ylabel(L"\lambda_{insta}(t) = \ln( diag(\mathbf{R}) ) ")
ax.set_title("p = $(p)")

ax.set_yscale("symlog", linthresh=1e-4, linscale=0.1)

ax = axs[2]
for i = 1:size(instalyaps)[2]
	ax.plot(lyap_t, lyaps[:, i], alpha=0.65)
end
ax.axhline(y=0, color="red", linestyle="--", linewidth=1)
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")

ax.set_yscale("symlog", linthresh=1e-5, linscale=0.1)
ax.set_ylabel(L"\lambda = mean(\lambda_{insta}[1:t])")
# ax.set_xlim(0, 23000)
# ax.set_xlim(1200, 1900)

# filename = "$(plotsdir())/lyapunovs/instalyaps-lyaps-all-acommpanying-real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi)-zoomout.png" 
filename = "$(plotsdir())/lyapunovs/instalyaps-lyaps-all-acommpanying-real-spatiotemporalpatterns-frequencies-lyapunovs-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

#calc convergence lyap from insta lyaps (can remove some of the initial values)
instalyaps, lyap_t = get_instantaneous_lyapunovs(lyapsname)
λs = (cumsum(instalyaps[10000:end, :], dims=1)[:,1]) ./ lyap_t[10000:end]
plot(lyap_t[10000:end], λs)


λs, ps, Rs = [], [], []
for (idx, lyapsname) in enumerate(names_lyaps)
	instalyaps, lyap_t = get_instantaneous_lyapunovs(lyapsname)
	λ = mean(instalyaps[10000:end, :], dims=1)[1,:]
	@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
	Rname = names_R[idx]
	data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];

	push!(λs, λ)
	push!(ps, p)
	push!(Rs, mean(Rs))
end
λs = hcat(λs...)

plot(λs)
xscale("log")

ax.set_yscale("symlog", linthresh=1e-5, linscale=0.1)


# ---------------------------------------------------------- CONVERGENCE MAXIMUM LYAPUNOV ---------------------------------------------------------- #
dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
DIR =  projectdir()
allparams, paramtypes = return_dict(dictname)

idx = 1
#plot convergence
# for idx=1:length(dict_list(allparams))
d_params = dict_list(allparams)[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
lyapsname = names_lyaps[idx]
lyap_t, lyaps = get_convergence_lyapunovs(lyapsname)

function get_convergence_maxlyapunov(filename, filename2)
	# maxlyaps = CSV.File(filename, header=false) |> DataFrame

	# maxlyaps = readdlm(filename)
	maxlyaps = myreadfile(filename)
	t = myreadfile(filename2)
	maxlyaps ./= t
	return maxlyaps, t
end

function get_instantaneous_maxlyapunov(filename, filename2)
	maxlyaps = myreadfile(filename)
	t = myreadfile(filename2)
	return maxlyaps, t
end
# dictname = "ku_lyap_ws_501_shuf_p_T_100000"
dictname = "ku_lyap_ws_501_shuf_p_T_100000_fromfile"
a, names_maxlyap = get_resultnames(dictname, "", "maximumlyapunovconvergence")
a, names_maxlyaptime = get_resultnames(dictname, "", "maximumlyapunovconvergencetime")

name_maxlyap = names_maxlyap[idx]
name_maxlyaptime = names_maxlyaptime[idx]
λs, ts = get_convergence_maxlyapunov(name_maxlyap, name_maxlyaptime)
figure()
plot(ts, λs, "k-")
# ylabel("Maximum Lyapunov")
ylabel("t")
title("p = $(p)")
# xlim(lyap_t[1], lyap_t[end])
plot(lyap_t, lyaps[:,1])
for i = 1:size(lyaps)[2]
	plot(lyap_t, lyaps[:, i], alpha=0.65)
end
filename = "$(plotsdir())/lyapunovs/maximumlyapunov-comparison-twoalgorithms-shuffling-$(dictname)-p_$(p)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)
end


# Plot instantaneous maximum lyapunov and the instantaneous spectrum
idx = 3

dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse"
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
DIR =  projectdir()
allparams, paramtypes = return_dict(dictname)
lyapsname = names_lyaps[idx]
instalyaps, lyap_t = get_instantaneous_lyapunovs(lyapsname)


dictname = "ku_lyap_ws_501_shuf_p_T_100000"
a, names_maxlyap = get_resultnames(dictname, "", "maximumlyapunovinstantaneous")
a, names_maxlyaptime = get_resultnames(dictname, "", "maximumlyapunovinstantaneoustime")
name_maxlyap = names_maxlyap[idx]
name_maxlyaptime = names_maxlyaptime[idx]
ds, ts =  get_instantaneous_maxlyapunov(name_maxlyap, name_maxlyaptime)


figure()
plot(lyap_t, instalyaps[:,1])
d0 = 1e-9
plot(ts, log.(ds./d0),alpha=0.8)

#plot convergence calculated from the instantaneous series -- does not really work
function get_convergence_maxlyapunov_frominsta(filename, filename2)
	maxlyaps = myreadfile(filename)
	t = myreadfile(filename2)
	conv_maxlyaps = cumsum(ds, dims=1)[:,1] ./ t
	return conv_maxlyaps, t
end
dictname = "ku_lyap_ws_501_shuf_p_T_100000"
a, names_maxlyap = get_resultnames(dictname, "", "maximumlyapunovinstantaneous")
a, names_maxlyaptime = get_resultnames(dictname, "", "maximumlyapunovinstantaneoustime")
name_maxlyap = names_maxlyap[idx]
name_maxlyaptime = names_maxlyaptime[idx]
λs, t  = get_convergence_maxlyapunov_frominsta(name_maxlyap, name_maxlyaptime)

idx = 3
d_params = dict_list(allparams)[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
lyapsname = names_lyaps[idx]
lyap_t, lyaps = get_convergence_lyapunovs(lyapsname)

t2 = t[50000:end]
λs2 = cumsum(ds[50000:end], dims=1)[:,1] ./ t2
plot(t2, λs2)
figure()
plot(t, λs)
# ylabel("t")
title("p = $(p)")
xlim(lyap_t[1], lyap_t[end])
plot(lyap_t, lyaps[:,1])
for i = 1:size(lyaps)[2]
	plot(lyap_t, lyaps[:, i], alpha=0.65)
end




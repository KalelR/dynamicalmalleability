include("../general_plots.jl")
include("$(srcdir())/analysis/lyapunovs_src.jl")
using DelimitedFiles
data_dir = datadir()



# dictname = "ku_lyap_ws_501_shuf_p_ic_4"
# # dictname = "ku_lyap_ws_501_shuf_p_ic_3_eps2" #Would need to rerun, I sdcrewer up the R file
# dictname = "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps17"
# dictname = "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps2"
# dictname = "ku_lyap_ws_501_shuf_p_ic_3_eps17"
# dictname = "ku_lyap_ws_501_shuf_p_ic_3_eps14"
# dictname = "ku_lyap_ws_501_shuf_p_ic_3_eps10"
# dictnames = ["ku_lyap_ws_501_shuf_p_ic_3"]
# dictnames = ["ku_lyap_ws_501_shuf_p_ic_3"]#, "ku_lyap_ws_501_shuf_p_ic_4"]#, "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps17", "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps2", "ku_lyap_ws_501_shuf_p_ic_3_eps17", "ku_lyap_ws_501_shuf_p_ic_3_eps14", "ku_lyap_ws_501_shuf_p_ic_3_eps10"]
# dictnames = ["ku_lyap_ws_501_cauchy_shuf_p_ic0_eps17", "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps2", "ku_lyap_ws_501_shuf_p_ic_3_eps17", "ku_lyap_ws_501_shuf_p_ic_3_eps14", "ku_lyap_ws_501_shuf_p_ic_3_eps10"]
# dictnames = ["ku_lyap_ws_501_shuf_eps_ic_3_p003384", "ku_lyap_ws_501_shuf_eps_ic_3_p008733"]
# dictnames = ["ku_lyap_ws_501_shuf_e"]; Rnames = ["$(datadir())/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_epsi_all-mu_0.0-p_0.13111-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_1250.0.dat"] #in case I overwrote the automatic R file
# Rnames = [""] 
# dictnames = ["ku_lyap_ws_501_shuf_eps_ic_3_p1"]
# dictnames = ["ku_lyap_ws_501_shuf_p"]; Rnames = ["$(datadir())/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_p_all-epsi_4.10256-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_1250.0.dat"]
# dictnames = ["ku_lyap_ws_501_shuf_p_altq0"]; 
# dictnames = ["ku_lyap_ws_501_shuf_p_80000QRs"];
# dictnames = ["ku_lyap_ws_501_shuf_p_25000QRs_states"]
# dictnames = ["ku_lyap_ws_501_shuf_p_altq0_30000QRs"]

dictnames = ["ku_lyap_ws_501_shuf_e_80000QRs"]
Rnames = [""]
# dictnames = ["ku_lyap_ws_501_shuf_p_e2"];
# Rnames = [""]
# dictname = "ku_lyap_ws_501_shuf_p_ic_3"
# dictname = "ku_lyap_ws_501_shuf_eps_ic_3_p003384"
# dictname = "ku_lyap_ws_501_shuf_eps_ic_3_p008733"
# dictname = "ku_lyap_ws_501_shuf_eps_ic_3_p1"
for (idx, dictname) in enumerate(dictnames)
	println(dictname)
cp_k, cp_vals, all_lyaps, R, N, p, mfreq, seedic, num_QRs, epsi = get_lyap_info(dictname; Rname=Rnames[idx])
(cp_k == "epsi") && (cp_k = "\\epsilon")

subplot_kw = Dict("height_ratios" =>  [1,8])

# for i=1:size(all_lyaps)[2]
# 	if(all(all_lyaps[:,i] .== 0)) all_lyaps[:,i] .= NaN end
# 	end

# ------------------------------------------------------------------ All infinite-time lyapunovs ----------------------------------------------------------------- #

fig, axs = subplots(2,1, constrained_layout=true, gridspec_kw=subplot_kw, sharex=true)

ax = axs[1]
ax.plot(R[:,1], R[:,2], "k.-")
ax.set_ylabel(L"\langle R \rangle")
ax2 = ax.twinx()
ax2.plot(R[:,1], R[:,3], "r.-")
ax2.set_ylabel(L"std(R(t))", color="red")

ax = axs[2]
for i=1:N
	ax.plot(cp_vals, all_lyaps[i,:], "k-", alpha=0.1, linewidth=1)
end
ax.set_ylabel(L"\lambda_i")
if cp_k == "p" ax.set_xscale("log") end
if cp_k == "\\epsilon" ax.set_xlim(0,8) end
ax.set_xlabel(latexstring(cp_k))
ax.axhline(y=0, color="orange", linestyle="--", linewidth=1)
savefig("$(plotsdir())/lyapunovs/infinitetimelyapunovs-$(dictname).png", dpi=500)


# --------------------------------------------------------------- Zoom close to zero --------------------------------------------------------------- #
fig, axs = subplots(2,1, constrained_layout=true, gridspec_kw=subplot_kw, sharex=true)

ax = axs[1]
ax.plot(R[:,1], R[:,2], "k.-")
ax.set_ylabel(L"\langle R \rangle")
ax2 = ax.twinx()
ax2.plot(R[:,1], R[:,3], "r.-")
ax2.set_ylabel(L"std(R(t))", color="red")


ax = axs[2]
for i=1:N
	ax.plot(cp_vals, all_lyaps[i,:], "k-", alpha=0.3, linewidth=1)
	ax.plot(cp_vals, all_lyaps[i,:], "k.", alpha=0.6)
end
ax.set_ylim(-1,1)
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_ylabel(L"\lambda_i")
if cp_k == "p" ax.set_xscale("log") end
if cp_k == "\\epsilon" ax.set_xlim(0,8) end
ax.set_xlabel(latexstring(cp_k))
ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.axhline(y=0, color="orange", linestyle="--", linewidth=1)
savefig("$(plotsdir())/lyapunovs/infinitetimelyapunovs-zoom-$(dictname).png", dpi=500)



 # ---------------------------------------------------------- Convergence (ie. Finite-time) --------------------------------------------------------- #
if(cp_k == "p" && dictname == "ku_lyap_ws_501_shuf_p_ic_3") cps_selected = [0.001, 0.006, 1e-2, 0.02254, 0.03875
, 0.08733, 1e-1, 0.15013, 1e0]
elseif(cp_k == "p" && dictname == "ku_lyap_ws_501_shuf_p_80000QRs") cps_selected = [0.001, 0.006, 1e-2, 0.02254, 0.02581, 0.03384, 0.08733, 0.13111, 0.15013, 1e0]
# cps_selected = [0.0, 0.001, 0.002, 0.003,  0.01968, 0.04437, 0.0508, 0.07627, 0.1, 0.22539,  0.66608 ] #shuf_p_80000QRs more ps
elseif(cp_k == "p" && dictname == "ku_lyap_ws_501_shuf_p") cps_selected = [0.001, 0.006, 1e-2, 0.02254, 0.04437, 0.08733, 1e-1, 1e0]
elseif(cp_k == "p" && dictname == "ku_lyap_ws_501_shuf_p_25000QRs_states") cps_selected = [0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0]
elseif(cp_k == "p") cps_selected = [0.001, 0.006, 1e-2, 0.02254, 0.08733, 1e-1, 1e0]
elseif dictname == "ku_lyap_ws_501_shuf_e" cps_selected=  [0.20513, 0.41026, 1.02564, 2.05128, 2.87179, 3.07692, 7.38462, 8.0]#for epsilon
elseif dictname == "ku_lyap_ws_501_shuf_e_80000QRs" cps_selected=  [0.20513, 0.41026, 1.02564, 2.05128, 2.87179, 3.07692, 7.38462, 8.0]#for epsilon
else cps_selected=  [1.0, 2.0, 3.0, 4.10256, 6.0, 8.0]#for epsilon
end
numL = length(cps_selected)
fig, axs = subplots(numL, 1, sharex="all", sharey="all", constrained_layout=true, squeeze=false)
a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
cont = 1
for (i, filename) in enumerate(names_lyaps)
	if !(cp_vals[i] ∈ cps_selected) println("skipping $(cp_vals[i])"); continue end
	println("reading $(cp_vals[i])")
	t, lyaps = get_convergence_lyapunovs(filename)
	ax=axs[cont]
	for ii = 1:size(lyaps)[2]
		ax.plot(t, lyaps[:, ii], alpha=0.65)
	end
	ax.set_yscale("symlog", linthresh=1e-5)
	ax.set_ylabel(L"\lambda")
	ax.text(1.0, 0.5, latexstring("$(cp_k) = $(cp_vals[i])"), transform=ax.transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-4.5)
	cont += 1;
end


axs[end].set_xlabel(L"t")
for i =1:numL 
	axs[i].grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
end
for i=1:numL
	axs[i].axhline(y=0, color="red", linestyle="--", linewidth=1)
end
column = 3.54 ##1 column = 2.3 inches
width= 2.5 *column;
height=2.5*column;
height=3.0*column;
fig.set_size_inches(width, height)
fig.tight_layout()
# savefig("$(plotsdir())/lyapunovs/finitetimelyapunovs-$(dictname).png", dpi=500)
savefig("$(plotsdir())/lyapunovs/finitetimelyapunovs-$(dictname)-moreps.png", dpi=500)


# close("all")
# GC.gc()
end 


# ------------------------ OLD CODE





#=
"""
Analysis for old cod
"""
function old_get_infinite_time_lyapunovs(filename)
	lyaps = readdlm(filename)
	t = lyaps[:,1]
	λ = lyaps[1:4000,2:end]
	λ_mean = sort(mean(λ, dims=1)[1,:], rev=true) #infinite-time lyaps, sorted in decrescent order
end

function old_get_finite_time_lyapunovs(filename)
	lyaps = readdlm(filename)
	t = lyaps[:,1]
	λ = lyaps[:,2:end]

	numlyaps = length(findall(x->x>1e-4, λ[1,:])) #numberof lyapunvos above 1e-4
	m_meanlyaps = zeros(Float64, (length(t), size(λ)[2]));
	for i=1:size(m_meanlyaps)[2]
		m_meanlyaps[1, i] = λ[1, i]
	    for idxt =2:size(m_meanlyaps)[1]
		m_meanlyaps[idxt, i] = λ[idxt, i] + m_meanlyaps[idxt-1,i]
	    end
	    m_meanlyaps[:,i] ./= 1:size(m_meanlyaps)[1]
	end
    
	idxs_zero = sortperm(abs.(m_meanlyaps[end,:]))[1:2]
	idx_max = findmax(m_meanlyaps[end,:])[2]
	idxs = union(idxs_zero, idx_max); sort!(idxs)
	return t, m_meanlyaps[:, idxs]
end

num_QRs = 5500
ps = [0.0, 0.001, 0.01, 0.01311, 0.01501, 0.08733, 0.1, 0.1145, 1.0]

# ps = ps[1:4]
N = 501
all_lyaps = zeros(Float64, (N, length(ps)))

for (i, p) in enumerate(ps)
	filename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_oldcode-seedic_1-seednet_1/conv_lyapu_spectrum-control_p_$(p)-dt_qr_1.0-epsi_$(epsi)-mu_0.0-num_QRs_$(num_QRs)-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
	all_lyaps[:,i] = old_get_infinite_time_lyapunovs(filename)
end

filename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_oldcode-seedic_1-seednet_1/Rstatslyaps-control_p_all-dt_qr_1.0-epsi_$(epsi)-mu_0.0-num_QRs_$(num_QRs)-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
# R = CSV.File(filename, header=false) |> DataFrame
# R = R[:, 2] #average


subplot_kw = Dict("height_ratios" =>  [1,8])


#---- 1. All lyapunovs

fig, axs = subplots(2,1, constrained_layout=true, gridspec_kw=subplot_kw, sharex=true)

ax = axs[1]
# ax.plot(ps, R[:,2], "k.-")
ax.plot(R[:,1], R[:,2], "k.-")
ax.set_ylabel(L"\langle R \rangle")


ax = axs[2]
for i=1:N
	ax.plot(ps, all_lyaps[i,:], "k-", alpha=0.1, linewidth=1)
	# ax.plot(ps, all_lyaps[i,:], "k.", alpha=0.6)
end
ax.set_xscale("log")
ax.set_ylabel(L"\lambda_i")
ax.set_xlabel(L"p")
ax.axhline(y=0, color="orange", linestyle="--", linewidth=1)
savefig("$(plotsdir())/lyapunovs/infinitetimelyapunovs-oldcode-gauss-ic2-numQRs_5500.png", dpi=500)


#----- 2. Closest to zero
fig, axs = subplots(2,1, constrained_layout=true, gridspec_kw=subplot_kw, sharex=true)

ax = axs[1]
# ax.plot(ps, R[:,2], "k.-")
ax.plot(R[:,1], R[:,2], "k.-")
ax.set_ylabel(L"\langle R \rangle")


ax = axs[2]
for i=1:N
	ax.plot(ps, all_lyaps[i,:], "k-", alpha=0.1, linewidth=1)
	ax.plot(ps, all_lyaps[i,:], "k.", alpha=0.6)
end
ax.set_ylim(-1,1)
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_xscale("log")
ax.set_ylabel(L"\lambda_i")
ax.set_xlabel(L"p")
# ax.grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
ax.axhline(y=0, color="orange", linestyle="--", linewidth=1)
savefig("$(plotsdir())/lyapunovs/infinitetimelyapunovs-oldcode-zoom-gauss-ic2-numQRs_5500.png", dpi=500)

# ----- Convergence (ie. Finite-time)





ps_selected = [0.0, 0.01, 0.08733, 0.1, 1.0]
fig, axs = subplots(length(ps_selected), 1, sharex="all", sharey="all", constrained_layout=true, squeeze=false)
for (i, p) in enumerate(ps_selected)
	filename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_oldcode-seedic_1-seednet_1/conv_lyapu_spectrum-control_p_$(p)-dt_qr_1.0-epsi_$(epsi)-mu_0.0-num_QRs_$(num_QRs)-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
	t, lyaps = old_get_finite_time_lyapunovs(filename)
	ax=axs[i]
	for i = 1:size(lyaps)[2]
		ax.plot(t, lyaps[:,i], alpha=0.65)
	end
	ax.set_yscale("symlog", linthresh=1e-5)
	ax.set_ylabel(L"\lambda_{1,2}")
	ax.text(1.0, 0.5, "p = $(p)", transform=ax.transAxes, rotation=-90, verticalalignment="center")

end
axs[end].set_xlabel(L"t")
for i =1:numL 
	axs[i].grid(b=true, axis="both", which="both", alpha=0.55, linestyle="--")
end
savefig("$(plotsdir())/lyapunovs/finitetimelyapunovs-oldcode-gauss-ic2.png", dpi=500)
=#


# ku_ws_501_shuf_p_eps4
# dictname = "ku_ws_501_unit_eps_p1"
# Rstd = collectresults(dictname, "Rstats"; idx_quantity=3, data_dir=datadir())
# plot_R(Rstd)
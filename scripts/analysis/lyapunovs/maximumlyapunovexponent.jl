include("../general_plots.jl")
using DelimitedFiles
data_dir = datadir()

dictname = "ku_lyap_ws_501_shuf_p_ic_3_T_50000"
lyapmaxfile = "$(datadir())/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs-seedic_1-seednet_1/maximumlyapunov-control_p_all-T_50000-dt_qr_1.0-epsi_4.10256-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
maxlyaps = CSV.File(lyapmaxfile, header=false) |> DataFrame

Rstatsmaxlyapfile = "$(datadir())/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs-seedic_1-seednet_1/Rstatsmaxlyap-control_p_all-T_50000-dt_qr_1.0-epsi_4.10256-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
R = CSV.File(Rstatsmaxlyapfile, header=false) |> DataFrame

fig, axs = subplots(2,1, sharex=true, constrained_layout=true)

ax = axs[1]
ax.plot(R[:,1], R[:,2], "k.-")
ax.set_ylabel(L"\langle R \rangle")
ax2 = ax.twinx()
ax2.plot(R[:,1], R[:,3], "r.-")
ax2.set_ylabel(L"std(R(t))", color="red")

ax = axs[2]
ax.plot(maxlyaps[:,1], maxlyaps[:,2], "k.-")
ax.set_yscale("symlog", linthresh=1e-5)
ax.set_ylabel("λ max")
ax.set_xlabel(L"p")
ax.set_xscale("log")
ax.axhline(y=0, color="orange", linestyle="--", linewidth=1)

savefig("$(plotsdir())/lyapunovs/maximumlyapunov-$(dictname).png", dpi=500)

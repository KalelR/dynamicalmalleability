
include("../general_plots.jl")
dictname = "ku_ws_501_shuf_p"
quantifier = "Rstats"

# function plot_mod(fig, axs; logx=false)
    # logx && 
# names_results, cp_key, cp_values = collect_name_results(quantifier, dictname)
# numrealizations = 1:length(names_results)
# figure()
# for idx_realization = 1:numrealizations 
#     df = CSV.File(names_results[idx_realization], header=false) |> DataFrame
#     # df = CSV.File(names_results[idx_realization], header=["mean", "std", "3", "4", "5", "6", "7", "8"]) |> DataFrame
#     alpha, color = (idx_realization == 1) ? (1.0, "black") : (0.05, "#006600")

#     plot(df[:,1], df[:,2], "-", alpha=alpha, color=color)
# end
# xscale("log")

#WS 

numrealizations = 600
names_results = ["$(data_dir)/N_501-k_2-mfreq_cauchy-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_p_all-epsi_2.0-gamma_0.5-seedfreq_0-shuffleid_$(shuffleid)-tend_3000.0-ttrans_1250.0-x0_0.0.dat" for shuffleid = 0:numrealizations]

numrealizations = 600
names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_p_all-epsi_2.0-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid = 0:numrealizations]


#Vary eps
names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_epsi_all-mu_0.0-p_0.13111-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid = 0:numrealizations]

names_results = ["$(data_dir)/N_501-k_2-mfreq_cauchy-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_epsi_all-gamma_0.5-p_0.13111-seedfreq_0-shuffleid_$(shuffleid)-tend_3000.0-ttrans_1250.0-x0_0.0.dat" for shuffleid = 0:numrealizations]

p = 0.13111
p = 0.0
p = 1.0
numrealizations = 500
names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_epsi_all-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid=0:numrealizations];

R_all = collect_results(names_results, 2)
plot_R(R_all)


epsi = 4.10256
numrealizations = 500
names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rstats-control_p_all-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid=0:numrealizations];

#one unit 
# epsi = 4.10256; #error in 1-5
# epsi = 2.0 #error 
epsi = 8.0 #error 


ωnew = 10.0; shuffleid =0 
numrealizations = 500
names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rstats-control_p_all-epsi_$(epsi)-idx_unit_$(idxunit)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-ω_new_$(ωnew).dat" for idxunit=0:numrealizations];
R_all = collect_results(names_results, 2)
plot_R(R_all)
xscale("log")

p = 0.13111
p = 0.08733
# p = 0.0
# p = 1.0
names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rstats-control_epsi_all-idx_unit_$(idxunit)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-ω_new_$(ωnew).dat" for idxunit=0:numrealizations];



R_all = collect_results(names_results, 2)
plot_R(R_all)
# xscale("log")


#---- Basins
p = 0.13111; epsi = 4.10256; unit1 = 1; unit2=2; shuffleid = 0;
p = 1.0
numrealizations = 50
v_u02 = collect(range(0, 2pi, length=50))
# names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1/Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_$(u02)-unit1_1-unit2_$(unit2).dat" for u02 in v_u02];

using Glob 
names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1")
R_all = collect_results(names_results, 2)
v_u02 = R_all[:,1]
R_all = R_all[:, 2:end]



#Plotting for all params a 3x2 with all unit2s 
function plot_all_basins()
    epsi = 4.10256; unit1 = 1;
unit2s = [2, 150, 249, 250, 350, 500]
for shuffleid in [0,1]
for p in [0, 0.13111,0.06661, 1.0]
    fig, axs=subplots(nrows=3, ncols=2, constrained_layout=true)
    unit2s = reshape(unit2s, (3,2))
    for idx in CartesianIndices(unit2s)
        unit2 = unit2s[idx]
        names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1")
        R_all = collect_results(names_results, 2)
        v_u02 = R_all[:,1]
        R_all = R_all[:, 2:end]
        println("$(p), $(shuffleid)")
        cbar = plot_basins(v_u02, Matrix(R_all); unit1=unit1, unit2=unit2, ax = axs[idx], fig=fig)
    end
        fig.suptitle("p = $(p), shuffleid = $(shuffleid)")
        savefigure(fig, axs, "$(projectdir())/plots/temporary-basins-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid).png"; width=2, height=1.2)
        close("all")
        GC.gc()
end 
end
end

plot_all_basins()

# -------- PL 
numrealizations = 2
epsi = 5.53486; names_results = ["$(data_dir)/N_501-mfreq_gauss-mmodel_kuramoto-mtop_PL/mchange_shuffling-seedic_0/Rstats-control_alpha_all-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid=0:numrealizations]
alpha = 1.9; names_results = ["$(data_dir)/N_501-mfreq_gauss-mmodel_kuramoto-mtop_PL/mchange_shuffling-seedic_0/Rt-control_epsi_all-alpha_$(alpha)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid=0:numrealizations]
R_all = collect_results(names_results, 2)
fig, axs = plot_R(R_all)
# plot_mod(fig, axs; logx=true)

numrealizations = 2
epsi = 5.53486; names_results = ["$(data_dir)/N_501-mfreq_gauss-mmodel_kuramoto-mtop_PL/mchange_shuffling-seedic_0/Rt-control_alpha_all-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid=0:numrealizations]
alpha = 1.9; names_results = ["$(data_dir)/N_501-mfreq_gauss-mmodel_kuramoto-mtop_PL/mchange_shuffling-seedic_0/Rt-control_epsi_all-alpha_$(alpha)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0.dat" for shuffleid=0:numrealizations]
epsi = 5.53486; names_results = ["$(data_dir)/N_501-mfreq_gauss-mmodel_kuramoto-mtop_PL/mchange_shuffling-seedic_0/Rt-control_epsi_all-alpha_$(alpha)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_1250.0-ttrans_0.0.dat" for shuffleid=0:numrealizations]
for (idx, filename) in enumerate(names_results)
    df = CSV.File(filename, header=false) |> DataFrame
    figure()
    for i=1:size(df)[1]
    t = collect(1:1:(size(df)[2]-1)) #.+ 1750
    plot(t, Array(df[i,2:end]), label="$(df[i,1])")
    end 
    legend()
end 


alpha = 3.0
alpha = 0.0
alpha = 1.76923
using Glob 
names_results = glob("Rstats-control_epsi_all-alpha_$(alpha)-mu_0.0-seedfreq_0-shuffleid_*-std_1.0-tend_1250.0-ttrans_499.99999999999994.dat", "$(data_dir)/N_501-mfreq_gauss-mmodel_kuramoto-mtop_PL/mchange_shuffling-seedic_0/")
R_all = collect_results(names_results, 2)
# cp = R_all[:,1]
# R_all = R_all[:, 2:end]
plot_R(R_all)

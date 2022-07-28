include("general_plots.jl")

# p = 0.13111; epsi = 4.10256; unit1 = 1; unit2=2; shuffleid = 0;
# p = 1.0
# numrealizations = 50
# v_u02 = collect(range(0, 2pi, length=50))
# # names_results = ["$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1/Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_$(u02)-unit1_1-unit2_$(unit2).dat" for u02 in v_u02];

using Glob 
# names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1")
# R_all = collect_results(names_results, 2)
# v_u02 = R_all[:,1]
# R_all = R_all[:, 2:end]


shuffleid = 0
unit1 = 

#Plotting for all params a 3x2 with all unit2s 
function plot_all_basins()
    epsi = 4.10256; unit1 = 1;
unit2s = [2, 150, 249, 250, 350, 500]
# unit2s = [2, 250, 350, 500]
# for shuffleid in [0,1]
for shuffleid in [0]
# for p in [0, 0.13111,0.06661, 1.0]
for p in [0.06661]
    fig, axs=subplots(nrows=3, ncols=2, constrained_layout=true)
    # fig, axs=subplots(nrows=2, ncols=2, constrained_layout=true)
    unit2s = reshape(unit2s, (3,2))
    # unit2s = reshape(unit2s, (2,2))
    for idx in CartesianIndices(unit2s)
        unit2 = unit2s[idx]
        names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1")
        # names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen-seedic_0-seednet_1")
        # names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_details-seedic_0-seednet_1")
        R_all = collectresults(names_results, 2)
        v_u02 = R_all[:,1]
        R_all = R_all[:, 2:end]
        cbar = plot_basins(v_u02, Matrix(R_all); unit1=unit1, unit2=unit2, ax = axs[idx], fig=fig)
    end
        println("$(p), $(shuffleid)")
        fig.suptitle("p = $(p), shuffleid = $(shuffleid)")
        savefigure(fig, axs, "$(projectdir())/plots/temporary-basins-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid).png"; width=2, height=1.2)
        # close("all")
        # GC.gc()
end 
end
end

plot_all_basins()


# One basin
# viridis = matplotlib.cm.get_cmap("viridis", 2)
p = 0.06661
shuffleid = 0
epsi = 4.10256
unit1 = 1

unit2 = 2
# v_u02 = collect(range(0, 2pi, length=500))
# v_u02 = collect(range(1.8, 5.8, length=1000)) #more details
v_u02 = collect(range(1.8, 5.8, length=500))
# dictname = "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit2"
dictname = "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit2_lsoda"
# unit2 = 350
# v_u02 = collect(range(0.85, 6.06, length=400))
# unit2 = 500
# v_u02 = collect(range(0, 2pi, length=400))
# names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_details-seedic_0-seednet_1/")
# names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_moredetails-seedic_0-seednet_1/")
names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_moredetails-seedic_0-seednet_1-solver_lsoda")
R_all = collectresults(names_results, 2)
v_u01 = R_all[:,1]
R_all = R_all[:, 2:end]

# fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = "", fig="")
# fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = "", fig="", cmap="jet")
fig, ax, cbar, uniquevals, attractor_id = plot_basins_attractorids(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = "", fig="", cmap="Accent")


# fig.suptitle("p = $(p), epsi = $(epsi), shuffleid = $(shuffleid), unit2 = $(unit2)")
fig.suptitle("p = $(p), epsi = $(epsi), shuffleid = $(shuffleid), unit2 = $(unit2), solver = lsoda()")
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-attractorids-moredetails-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-$(dictname).png"; width=2, height=1.2)


#Randomly chosen ICs
viridis = matplotlib.cm.get_cmap("viridis", 2)
unit1 = 1


epsi = 4.10256
p = 0.06661
shuffleid = 0

unit2 = 2
v_u02 = [0.02872, 0.0296, 0.03092, 0.04859, 0.04934, 0.05429, 0.09466, 0.10532, 0.11937, 0.12614, 0.13053, 0.13579, 0.14188, 0.16861, 0.17242, 0.17498, 0.18209, 0.18586, 0.18913, 0.22409, 0.22767, 0.235, 0.23764, 0.24152, 0.24362, 0.32853, 0.33302, 0.3343, 0.36052, 0.36159, 0.36481, 0.36515, 0.36629, 0.37454, 0.38315, 0.39029, 0.42499, 0.42989, 0.43427, 0.45187, 0.46059, 0.46158, 0.46448, 0.48909, 0.51365, 0.51931, 0.53138, 0.53877, 0.552, 0.58211, 0.5982, 0.63006, 0.65525, 0.68483, 0.73072, 0.73765, 0.76105, 0.76146, 0.7721, 0.77598, 0.7792, 0.80616, 0.81011, 0.82808, 0.84183, 0.88557, 0.89458, 0.90466, 0.92676, 0.93039, 0.93203, 0.95677, 0.96206, 0.96427, 0.97127, 0.98463, 1.00449, 1.01215, 1.03042, 1.04819, 1.05028, 1.0594, 1.08644, 1.13376, 1.13646, 1.16595, 1.16871, 1.19628, 1.24925, 1.27206, 1.27365, 1.27505, 1.29343, 1.30484, 1.32229, 1.33684, 1.34249, 1.3568, 1.3804, 1.39103, 1.39675, 1.41198, 1.41667, 1.42855, 1.43115, 1.44223, 1.44624, 1.45237, 1.45646, 1.46062, 1.46102, 1.47133, 1.49025, 1.49874, 1.49908, 1.50246, 1.50364, 1.50579, 1.51584, 1.51986, 1.53276, 1.57193, 1.59881, 1.59998, 1.61504, 1.6194, 1.66664, 1.68039, 1.68993, 1.69596, 1.70972, 1.72253, 1.73313, 1.73566, 1.78188, 1.80742, 1.81405, 1.82679, 1.82731, 1.84766, 1.84798, 1.85629, 1.85952, 1.86598, 1.87607, 1.8883, 1.88934, 1.89231, 1.90958, 1.95327, 1.96685, 2.00945, 2.03601, 2.04168, 2.04452, 2.05185, 2.06213, 2.07374, 2.07567, 2.07605, 2.07635, 2.08049, 2.08297, 2.0935, 2.09479, 2.09901, 2.10177, 2.10402, 2.12938, 2.13116, 2.13395, 2.15696, 2.15905, 2.16746, 2.17268, 2.17449, 2.17845, 2.19722, 2.21548, 2.21594, 2.22318, 2.226, 2.22627, 2.22685, 2.24717, 2.24888, 2.28044, 2.28781, 2.30939, 2.30965, 2.34679, 2.36355, 2.36836, 2.36842, 2.38885, 2.42575, 2.43128, 2.47893, 2.49604, 2.51181, 2.51366, 2.51688, 2.53673, 2.54592, 2.55685, 2.56379, 2.58691, 2.60234, 2.6046, 2.61197, 2.62432, 2.63015, 2.63112, 2.63124, 2.67371, 2.67812, 2.68103, 2.68162, 2.71871, 2.73147, 2.7385, 2.74383, 2.75917, 2.77311, 2.82191, 2.82872, 2.83519, 2.8401, 2.85373, 2.85712, 2.86498, 2.87647, 2.88256, 2.8877, 2.89558, 2.90704, 2.90851, 2.91958, 2.92304, 2.93039, 2.93463, 2.98504, 3.02801, 3.03676, 3.03692, 3.03899, 3.0457, 3.04757, 3.06666, 3.07394, 3.07517, 3.08642, 3.09311, 3.10381, 3.12595, 3.13504, 3.15675, 3.17801, 3.18783, 3.19063, 3.22459, 3.23838, 3.24819, 3.25277, 3.27389, 3.28721, 3.29646, 3.3178, 3.35404, 3.36147, 3.36283, 3.3701, 3.373, 3.4044, 3.41132, 3.44848, 3.46456, 3.47399, 3.48067, 3.48082, 3.48899, 3.5097, 3.52402, 3.53388, 3.53591, 3.58294, 3.60912, 3.66256, 3.71052, 3.71673, 3.72445, 3.73479, 3.74589, 3.75374, 3.75376, 3.75666, 3.77791, 3.78038, 3.78114, 3.78449, 3.78818, 3.79877, 3.81229, 3.8211, 3.83493, 3.8413, 3.85447, 3.86839, 3.86977, 3.89349, 3.89772, 3.91674, 3.91842, 3.94099, 3.96299, 3.97127, 3.9738, 3.98613, 3.98856, 3.9991, 4.00783, 4.02333, 4.03567, 4.03907, 4.04091, 4.04118, 4.05121, 4.05754, 4.06337, 4.06917, 4.08334, 4.08372, 4.09413, 4.10627, 4.11509, 4.12244, 4.1229, 4.1295, 4.1388, 4.13964, 4.15172, 4.1567, 4.16042, 4.19666, 4.19783, 4.20426, 4.20849, 4.23592, 4.2381, 4.30549, 4.32858, 4.33947, 4.38629, 4.40368, 4.41057, 4.4538, 4.45518, 4.46093, 4.50376, 4.51287, 4.51474, 4.51671, 4.52714, 4.54825, 4.57268, 4.5838, 4.59455, 4.59528, 4.60313, 4.60522, 4.61976, 4.63271, 4.6368, 4.64272, 4.64283, 4.65059, 4.65455, 4.66773, 4.6897, 4.69428, 4.69461, 4.71177, 4.71404, 4.72963, 4.74233, 4.74983, 4.77493, 4.81269, 4.82343, 4.84545, 4.84818, 4.9196, 4.94938, 4.96368, 4.9736, 4.97612, 4.9923, 5.00214, 5.00636, 5.01264, 5.0273, 5.03987, 5.05685, 5.06115, 5.07048, 5.07755, 5.10598, 5.1175, 5.13011, 5.13793, 5.14462, 5.17186, 5.17572, 5.20635, 5.23645, 5.23798, 5.25621, 5.27647, 5.28707, 5.29054, 5.31013, 5.32407, 5.33539, 5.34997, 5.35899, 5.36868, 5.38709, 5.39146, 5.40603, 5.4109, 5.41237, 5.41284, 5.41386, 5.44615, 5.45276, 5.45327, 5.46779, 5.47176, 5.48731, 5.50417, 5.52632, 5.53059, 5.56115, 5.58504, 5.59237, 5.59397, 5.65506, 5.6789, 5.68619, 5.70548, 5.71638, 5.72855, 5.77081, 5.77518, 5.78378, 5.79565, 5.80557, 5.82153, 5.83566, 5.84126, 5.86423, 5.88609, 5.88746, 5.88837, 5.89199, 5.91527, 5.91971, 5.9333, 5.95665, 5.98205, 5.99032, 5.99647, 5.99771, 6.01534, 6.06026, 6.06394, 6.06562, 6.09805, 6.09805, 6.10445, 6.10498, 6.10638, 6.10796, 6.12401, 6.13585, 6.13824, 6.14017, 6.15073, 6.16275, 6.17362, 6.17733, 6.17979, 6.18276, 6.22264, 6.22573, 6.22824, 6.23864, 6.25722, 6.26634, 6.26794]
v_u02 = v_u02[1:end-1]
dictname = "ku_ws_501_basins_eps410256_pselected_random_unit2"

# unit2 = 350
# v_u02 = [1.8698, 0.96748, 2.25798, 5.77271, 4.12969, 4.26016, 4.50132, 3.57302, 3.9302, 1.89577, 2.98063, 3.12268, 1.44246, 6.01612, 5.58144, 2.52006, 2.45681, 4.15387, 5.46799, 1.87765, 3.31586, 5.04411, 3.61066, 1.43771, 4.26983, 3.48158, 1.27474, 3.27884, 4.88783, 2.3576, 5.4305, 1.44307, 5.94883, 1.82021, 5.95227, 4.4302, 5.24049, 1.88687, 2.31093, 1.33335, 2.83164, 5.9612, 4.60782, 1.80297, 1.46853, 0.91783, 4.38261, 3.30556, 1.02874, 4.16448, 3.54655, 1.49398, 3.32137, 3.50565, 5.00963, 4.76017, 3.74995, 3.0389, 3.81552, 4.60794, 4.46637, 2.89394, 2.14227, 2.39576, 3.27797, 3.54761, 4.2135, 1.45528, 3.23028, 1.35888, 4.58433, 5.1828, 1.68301, 2.20524, 5.80258, 3.44019, 4.85572, 2.43128, 1.09342, 4.51483, 5.08749, 3.54001, 2.61285, 0.95996, 4.31829, 2.94489, 3.31675, 1.00534, 2.27067, 2.84521, 1.8705, 2.05156, 4.48334, 3.76382, 4.953, 1.15253, 5.3081, 5.50482, 5.85707, 1.48938, 2.90908, 5.90169, 2.1735, 4.76909, 1.76286, 4.71403, 1.15647, 4.90966, 4.2374, 3.22634, 1.45168, 2.91612, 5.95079, 5.39896, 2.84121, 2.61691, 2.37842, 5.24875, 1.66254, 1.65793, 2.93967, 5.11461, 1.413, 3.05919, 1.02836, 5.88119, 1.14348, 5.1014, 4.89836, 3.39543, 5.43548, 4.62478, 5.85479, 6.0126, 2.73914, 4.52549, 5.69211, 2.61097, 4.273, 2.78321, 2.01463, 4.00545, 4.04805, 2.44889, 4.02143, 5.36081, 2.96398, 2.71218, 1.91723, 2.82764, 2.76383, 5.72076, 3.9829, 1.9066, 2.89267, 4.44235, 3.35687, 4.97774, 1.17647, 4.26214, 0.89069, 5.66306, 1.62904, 4.34557, 2.15371, 4.91488, 2.42765, 3.55017, 1.9055, 3.32317, 3.56042, 1.3857, 4.46048, 1.57915, 2.68767, 2.88974, 3.99756, 3.76899, 4.18285, 5.80922, 4.71332, 3.00993, 3.01576, 1.74015, 2.90027, 1.77182, 0.9149, 1.92569, 1.05467, 5.55415, 1.08937, 1.68757, 4.44069, 2.29984, 4.18926, 1.80879, 1.0611, 2.64773, 1.49725, 2.02669, 2.1939, 2.42935, 2.95781, 4.95769, 1.14807, 5.49162, 2.04581, 0.90303, 2.63016, 1.0507, 5.3246, 1.72561, 2.64898, 6.00717, 5.00917, 1.68117, 4.13784, 2.16543, 1.13024, 3.1134, 2.5843, 5.77287, 3.37565, 5.19674, 3.39891, 3.17049, 4.80174, 4.47907, 1.63925, 4.45087, 2.14344, 5.73705, 3.35662, 0.93406, 1.24821, 3.39613, 1.40813, 2.1542, 1.08065, 1.6311, 1.50595, 4.22669, 4.54724, 4.524, 4.06643, 4.77577, 5.89466, 1.75083, 4.98754, 1.97855, 5.87256, 4.34073, 2.32493, 1.52074, 4.57589, 3.82423, 3.08831, 3.49711, 1.14084, 5.40512, 1.41754, 1.26969, 5.48832, 2.89929, 1.52406, 1.76158, 1.97073, 2.12117, 2.92684, 1.49239, 3.9588, 2.19122, 3.86391, 5.97798, 4.04827, 4.65443, 5.58783, 4.47019, 3.67217, 5.6233, 1.51725, 1.25707, 5.81375, 3.5728, 3.7213, 1.75262, 3.77168, 2.82789, 1.39158, 1.27209, 1.90876, 2.94928, 5.01503, 3.02842, 2.71996, 2.55377, 1.16597, 2.11565, 1.49988, 2.24801, 2.91742, 1.7301, 0.86022, 2.43659, 3.39745, 4.03275, 4.20772, 5.47304, 3.86726, 1.5282, 1.60662, 2.67222, 3.51047, 1.75959, 1.95082, 1.6048, 3.18684, 4.07883, 5.94452, 2.35207, 1.13119, 4.99948, 5.00217, 5.06629, 5.28855, 2.57095, 5.08355, 5.70512, 1.47307, 2.67959, 5.22478, 3.71871, 4.91479, 4.83833, 5.41431, 3.974, 4.64576, 2.41089, 6.00102, 5.69401, 5.20252, 4.27443, 1.50202, 4.70416, 4.59916, 2.80017, 5.41196, 3.12301, 1.47195, 6.03208, 5.86088, 2.77123, 4.12953, 1.85273, 4.16301, 5.87228, 5.22366, 3.80114, 1.6365, 5.33813, 5.23591, 5.04118, 1.83493, 6.02941, 0.93092, 3.53463, 1.86702, 3.63823, 2.24093, 3.72907, 2.75507, 2.42522, 5.94845, 1.2591, 4.71919, 1.44564, 5.84233, 5.12359, 1.79654, 4.91525, 4.32579, 2.74139, 5.50917, 4.35695, 2.99301, 4.86331, 3.97638, 1.53193, 5.95316, 3.51859, 4.23795, 2.38348, 5.50785, 5.8348, 4.75469, 2.20286, 2.38471, 3.98318, 2.7734, 2.58214]

unit2 = 500
v_u02 = [0.01819, 0.02665, 0.02876, 0.02949, 0.03197, 0.04378, 0.06035, 0.06434, 0.07537, 0.07791, 0.09615, 0.09729, 0.11009, 0.15047, 0.15133, 0.15214, 0.15489, 0.15938, 0.16046, 0.16397, 0.20976, 0.2565, 0.25904, 0.35044, 0.35636, 0.36417, 0.37335, 0.38868, 0.38903, 0.39764, 0.40549, 0.4061, 0.43111, 0.43503, 0.44762, 0.45451, 0.46968, 0.48644, 0.49279, 0.52785, 0.54122, 0.54509, 0.58158, 0.5845, 0.61305, 0.61529, 0.62896, 0.65199, 0.68525, 0.72933, 0.74694, 0.76061, 0.77324, 0.78172, 0.78721, 0.79611, 0.82851, 0.82855, 0.83045, 0.84398, 0.85179, 0.86267, 0.88081, 0.90084, 0.92332, 0.93338, 0.95268, 0.95622, 0.96493, 0.96644, 0.96678, 0.97027, 1.00286, 1.00667, 1.01586, 1.02121, 1.02896, 1.05551, 1.07167, 1.07972, 1.11794, 1.15316, 1.15601, 1.16408, 1.17527, 1.19959, 1.20149, 1.20212, 1.24535, 1.2583, 1.27932, 1.28477, 1.29976, 1.30402, 1.31254, 1.32712, 1.373, 1.37601, 1.38237, 1.41305, 1.43765, 1.44244, 1.47835, 1.49511, 1.49732, 1.51709, 1.54282, 1.56212, 1.57388, 1.61242, 1.6156, 1.65272, 1.66688, 1.66877, 1.67312, 1.67517, 1.68656, 1.68706, 1.69003, 1.69621, 1.69909, 1.71259, 1.71997, 1.72035, 1.73416, 1.73537, 1.75477, 1.80989, 1.858, 1.88543, 1.88758, 1.8924, 1.89395, 1.9089, 1.91544, 1.92822, 2.01321, 2.01982, 2.0861, 2.08848, 2.08906, 2.09859, 2.10691, 2.14204, 2.1791, 2.18657, 2.19058, 2.21751, 2.2414, 2.25395, 2.26206, 2.27074, 2.28709, 2.28739, 2.31144, 2.31907, 2.33908, 2.40469, 2.40792, 2.42182, 2.43226, 2.43886, 2.4581, 2.4621, 2.47617, 2.49232, 2.52153, 2.52281, 2.56369, 2.57348, 2.5892, 2.60107, 2.62325, 2.63447, 2.66988, 2.67257, 2.68349, 2.69003, 2.69634, 2.71152, 2.73162, 2.75309, 2.75482, 2.76381, 2.79106, 2.82468, 2.8273, 2.82776, 2.86174, 2.88448, 2.88792, 2.9061, 2.91409, 2.91561, 2.91784, 2.91956, 2.93902, 2.94918, 2.97787, 2.99607, 3.01459, 3.02768, 3.04179, 3.05239, 3.08231, 3.11552, 3.11619, 3.12096, 3.1389, 3.14347, 3.15183, 3.17073, 3.17818, 3.18585, 3.18915, 3.20962, 3.21366, 3.2214, 3.22888, 3.24739, 3.27239, 3.28507, 3.29612, 3.32728, 3.35449, 3.38941, 3.41213, 3.42219, 3.43435, 3.44015, 3.44737, 3.46743, 3.48125, 3.48322, 3.48982, 3.50316, 3.51097, 3.51877, 3.54372, 3.56824, 3.58443, 3.58865, 3.59875, 3.60879, 3.63438, 3.63541, 3.63807, 3.65657, 3.71439, 3.82143, 3.8291, 3.84465, 3.84465, 3.88228, 3.88262, 3.8834, 3.88393, 3.88656, 3.89325, 3.90225, 3.93708, 3.95825, 3.95898, 3.95934, 3.97123, 3.98682, 3.9974, 4.02541, 4.02601, 4.03142, 4.06872, 4.07247, 4.0889, 4.11728, 4.12949, 4.13826, 4.1436, 4.17336, 4.17652, 4.18571, 4.19216, 4.22606, 4.23171, 4.24326, 4.25741, 4.27929, 4.289, 4.28941, 4.29005, 4.29233, 4.302, 4.30234, 4.30307, 4.31013, 4.31369, 4.31829, 4.33091, 4.34158, 4.35063, 4.35755, 4.35954, 4.37344, 4.39272, 4.40566, 4.44455, 4.45191, 4.45243, 4.46614, 4.47614, 4.47829, 4.47987, 4.48403, 4.49505, 4.5164, 4.54033, 4.57772, 4.58379, 4.64163, 4.69649, 4.73263, 4.73469, 4.74901, 4.82382, 4.84426, 4.84838, 4.89366, 4.89659, 4.90981, 4.916, 4.92182, 4.93465, 4.93515, 4.95704, 4.98272, 4.99733, 5.00905, 5.01252, 5.03243, 5.0467, 5.05272, 5.05943, 5.06676, 5.06969, 5.07845, 5.11403, 5.13976, 5.16165, 5.17796, 5.18119, 5.18632, 5.28158, 5.30567, 5.31317, 5.34216, 5.34949, 5.35662, 5.39385, 5.40612, 5.44789, 5.46319, 5.46828, 5.4911, 5.53327, 5.55643, 5.61903, 5.62206, 5.64148, 5.65578, 5.67518, 5.68685, 5.69619, 5.70313, 5.70501, 5.71521, 5.75767, 5.76787, 5.78729, 5.78826, 5.79075, 5.82556, 5.8425, 5.89448, 5.98508, 6.01792, 6.0553, 6.08067, 6.08564, 6.09462, 6.12592, 6.13578, 6.15841, 6.1897, 6.20903, 6.22051, 6.22455, 6.2278, 6.22856, 6.25049, 6.25184, 6.27303]
v_u02 = v_u02[1:end-1]
dictname = "ku_ws_501_basins_eps410256_pselected_random_unit2"


names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen_severalfiles-seedic_0-seednet_1")
R_all = collectresults(names_results, 2)
v_u01 = R_all[:,1]
R_all = R_all[:, 2:end]
fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = "", fig="")
fig.suptitle("p = $(p), epsi = $(epsi), shuffleid = $(shuffleid), unit2 = $(unit2)")
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-randomlysampled-$(dictname).png"; width=2, height=1.2)

names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen_severalfiles-seedic_0-seednet_1")
R_all = collectresults(names_results, 3)
v_u01 = R_all[:,1]
R_all = R_all[:, 2:end]
fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = "", fig="")
cbar.set_label(L"std(R)", fontsize=label_size)
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-stdR-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-randomlysampled-$(dictname).png"; width=2, height=1.2)


names_results = glob("meanfreqs-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen_severalfiles-seedic_0-seednet_1")
Ω_all = collectresults(names_results, 2)
v_u01 = Ω_all[:,1]
Ω_all = Ω_all[:, 2:end]
fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(Ω_all); unit1=unit1, unit2=unit2, ax = "", fig="")
cbar.set_label(L"\langle \overline{\dot{\theta}} \rangle", fontsize=label_size)
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-meanfreq-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-randomlysampled-$(dictname).png"; width=2, height=1.2)


names_results = glob("syncfreqstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen_severalfiles-seedic_0-seednet_1")
Ω_all = collectresults(names_results, 2)
v_u01 = Ω_all[:,1]
Ω_all = Ω_all[:, 2:end]
fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(Ω_all); unit1=unit1, unit2=unit2, ax = "", fig="")
cbar.set_label(L"\langle std{\dot{\theta}} \rangle", fontsize=label_size)
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-stdfreqs-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-randomlysampled-$(dictname).png"; width=2, height=1.2)



names_results = glob("syncfreqstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen_severalfiles-seedic_0-seednet_1")
Ω_all = collectresults(names_results, 3)
v_u01 = Ω_all[:,1]
Ω_all = Ω_all[:, 2:end]
fig, ax, cbar = plot_basins(v_u02, v_u01, Matrix(Ω_all); unit1=unit1, unit2=unit2, ax = "", fig="")
cbar.set_label(L"\langle IQI{\dot{\theta}} \rangle", fontsize=label_size)
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-iqifreqs-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-randomlysampled-$(dictname).png"; width=2, height=1.2)



# --------------------------------------------------------------- phases from basins --------------------------------------------------------------- #
include("$(DIR)/src/drwatson-organization.jl")
include("$(DIR)/data/inputs/alldictionaries.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/quantifiers.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
using DelimitedFiles
dictname = "ku_ws_501_shuf_p_eps410256-icsfrombasins-unit22"
a, names_phases = get_resultnames(dictname, "", "phases")
a, names_R = get_resultnames(dictname, "", "Rt")
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)

idx = 8
# for idx=1:length(alldicts)
d_params = alldicts[idx]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
phasename = names_phases[idx]
Rname = names_R[idx]
data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
t = t[2000:end]
m_θ = m_θ[2000:end, :]

v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_adjl = topology_params = get_topology(mtop, d_params, DIR)
v_p = params(v_ω, epsi, v_adjl)
system_function = kuramotonetwork!
Ωs = instafreqs(t, m_θ, v_p, system_function) 


fig, axs = subplots(2,1, sharex="all")
ax=axs[1]
ax.plot(t, Ωs[:,1])
ax.set_xlabel("t")
ax.set_ylabel(L"\dot{\theta}_1")
ax.ticklabel_format(useOffset=false, style="plain", axis="both")
ax.get_yaxis().get_major_formatter().set_useOffset(false)
ax.get_yaxis().get_major_formatter().set_scientific(false)

ax=axs[2]
c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(m_θ), t; align=false)
# Rs = order_parameter(m_θ')
Rs = order_parameter(m_θ)
ax2 = plot_R!(fig, ax, Rs, t, 1, 1, 1)
fig.suptitle("p = $(p), epsi = $(epsi)")
# ax.set_xlim(15000, 18000)
# savefig("$(plotsdir())/investigationsdynamics/f.png")


fig, axs = subplots(3,3, sharex="all", sharey="all")
for idx=1:length(alldicts)
    d_params = alldicts[idx]
    @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic, u02 = d_params
    phasename = names_phases[idx]
    Rname = names_R[idx]
    data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
    data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
    t = t[19000:end]
    m_θ = m_θ[19000:end, :]

    j,k =  floor(Int, (idx-1) / 3) + 1, (idx-1) % 3 + 1
    ax = axs[j,k]
    c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(m_θ), t; align=false)
    Rs = order_parameter(m_θ)
    ax2 = plot_R!(fig, ax, Rs, t, 1, 1, 1)
    ax.set_title("u02 = $(u02)")
    println("$(u02), $(mean(Rs)), $(std(Rs))")
end
savefigure(fig, ax, "$(projectdir())/plots/basins/basins-phases-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid)-unit2_$(unit2)-randomlysampled-$(dictname).png"; width=2, height=1.2)

fig, axs = subplots(3,3, sharex="all", sharey="all")
for idx=1:length(alldicts)
    d_params = alldicts[idx]
    @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic, u02 = d_params
    phasename = names_phases[idx]
    Rname = names_R[idx]
    data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
    data = CSV.File(Rname, header=false) |> DataFrame; Rs = Matrix(data)[:,1];
    t = t[2000:end]
    m_θ = m_θ[2000:end, :]

    v_ω = get_frequency(mchange, mfreq, d_params, DIR)
    v_adjl = topology_params = get_topology(mtop, d_params, DIR)
    v_p = params(v_ω, epsi, v_adjl)
    system_function = kuramotonetwork!
    Ωs = instafreqs(t, m_θ, v_p, system_function) 
   

    j,k =  floor(Int, (idx-1) / 3) + 1, (idx-1) % 3 + 1
    ax = axs[j,k]
    c, m_θa, ta  = plot_spatiotemporal!(fig, ax, Matrix(Ωs), t; align=false)
    # Rs = order_parameter(m_θ)
    # ax2 = plot_R!(fig, ax, Rs, t, 1, 1, 1)
    ax.set_title("u02 = $(u02)")
    println("$(u02), $(mean(Rs)), $(std(Rs)), $(mean(Ωs)), $(std(Ωs))")
end


# ------------------------------------------------------ Get nodes with most and least degrees ----------------------------------------------------- #
using DelimitedFiles
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")

epsi = 4.51282
p = 0.13111
N = 501; k = 2; seednet = 1

v_adjl = get_wattsstrogatz(N, p, k, seednet)
degrees = length.(v_adjl)
mindegree = minimum(degrees)
idx_mindegrees = findall(x->x==mindegree, degrees)
maxdegree = maximum(degrees)
idx_maxdegrees = findall(x->x==maxdegree, degrees)

function collectresults(names_results, idx_quantity, realizationids=nothing)
    df = DataFrame()
        # println("$(names_results)")
    if isnothing(realizationids) realizationids = 1:length(names_results) end
    for (idx, idx_realization) in enumerate(realizationids)
        filename = names_results[idx_realization]
        if(isfile(filename) == false) println("No file $(filename)"); continue end
        df_single = CSV.File(filename, header=false) |> DataFrame
        # if size(df_single,1) <= 120  continue end
        if(idx == 1)
            df[!, "cp"] = df_single[:,1]
        end
        # println("$(idx_realization), $(df_single), $(filename)")
        df[!, string(idx)] = df_single[:,idx_quantity]
    end 
    return df
end


function plot_all_basins()
    epsi = 4.51282
    p = 0.13111
    shuffleid = 0
    fig, axs=subplots(nrows=2, ncols=2, constrained_layout=true)
    unit1s = [132, 354]
    unit2s = [43, 324]
    # v_u01s = [[collect(range(1, 5.74, length=625)), collect(range(0, 3, length=500))], [collect(range(0, 2pi, length=750)), collect(range(0, 2pi, length=750)) ]]
    v_u02s = [[collect(range(0, 4.5, length=625)), collect(range(0.5, 2pi, length=750))], [collect(range(1.5, 4.8, length=500)), collect(range(2.6, 5.5, length=500))]]
    for (idx1, unit1) in enumerate(unit1s)
        for (idx2, unit2) in enumerate(unit2s)
            names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3001.0-ttrans_1250.0-u02_*-unit1_$(unit1)-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-seedic_0-seednet_1")
        # names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_randomlychosen-seedic_0-seednet_1")
        # names_results = glob("Rstats-control_u01_all-epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3000.0-ttrans_1250.0-u02_*-unit1_1-unit2_$(unit2).dat", "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_ictwounits-mchange2_details-seedic_0-seednet_1")
        R_all = collectresults(names_results, 2)
        v_u01 = R_all[:,1]
        R_all = R_all[:, 2:end]
        # cbar = plot_basins(v_u02, Matrix(R_all); unit1=unit1, unit2=unit2, ax = axs[idx1, idx2], fig=fig)
        # v_u01 = v_u02
        v_u02 = v_u02s[idx1][idx2]
        # fig, ax, cbar, uniquevals, attractor_id = plot_basins_attractorids(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = "", fig="", cmap="Accent")
        fig2, ax, cbar, uniquevals, attractor_id = plot_basins_attractorids(v_u02, v_u01, Matrix(R_all); unit1=unit1, unit2=unit2, ax = axs[idx1, idx2], fig=fig, cmap="viridis_r")

    end end
    return fig, axs
        # println("$(p), $(shuffleid)")
        # fig.suptitle("p = $(p), epsi = $(epsi)")
        # savefigure(fig, axs, "$(projectdir())/plots/basins/lowdetail-basins-epsi_$(epsi)-p_$(p)-shuffleid_$(shuffleid).png"; width=2, height=1.2)
        # close("all")
        # GC.gc()
end

fig, axs = plot_all_basins()
resize!(fig, width=2, height=1.35)

savefigure(fig, ax, "$(plotsdir())/basins/basins-unit1_132_354-unit2_43_324.png")
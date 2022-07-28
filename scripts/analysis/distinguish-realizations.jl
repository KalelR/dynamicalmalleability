include("general_plots.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(srcdir())/quantifiers.jl")

using PyCall
rcParams = PyDict(matplotlib["rcParams"])
rcParams["mathtext.fontset"] = "custom"
rcParams["mathtext.rm"] = "Bitstream Vera Sans"
rcParams["mathtext.it"] = "Bitstream Vera Sans:italic"
rcParams["mathtext.bf"] = "Bitstream Vera Sans:bold"
rcParams["text.usetex"] = false
using DelimitedFiles
# using StatsBase

# function histogram(vector, bins, stat="probability")
#     a=fit(Histogram, vector, bins)
#     if stat=="probability" 
#             weights = a.weights ./ sum(a.weights)
#     else
#             weights = a.weights
#     end
#     return a.edges, weights
# end

"""
Get features form single realizations
"""
function get_features(N, p, k, seednet, DIR, μ, σ, seedfreq, shuffleid, unitid, ω_new, epsi)
    v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
    v_ω_original = get_frequency_gauss(N, μ, σ, seedfreq, shuffleid, DIR)
    v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
    v_p = params(v_ω, epsi, v_adjl)

    phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_3.0.dat"
    data = readdlm(phasename); v_t = data[1500:end,1]; m_θ = data[1500:end, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; #---- WATCH THIS **************************************************************8
    Ωs = instafreqs(v_t, m_θ, v_p, system_function)


    #compute features from phases
    Rt = order_parameter(m_θ)
    meanfreqs =  mean(Ωs, dims=1)[1,:]
    iqis, stds, deltas = sync_freq_insta(Ωs, v_t)
    # Rcomm = order_parameter_community()
    Rlocal = order_parameter_local(m_θ', v_adjl)

    features = [mean(Rt), std(Rt), mean(iqis), std(iqis), meanfreqs, Rlocal[1,:]]
    return features 
end

"""
Given features of all ralizations; attractors numbered from 1 to total amount; returns vector saying to which attractor realization i belongs and the attractors
"""
function find_attractors(features_all, thresholds)
    attractors = [features_all[1]]
    ids = ones(Int64, length(features_all))
    for i=2:length(features_all) 
        wassame = false
        for j=1:(i-1) #see if i is same as j
            are_same = compare_realizations(features_all[i], features_all[j], thresholds)
            if are_same 
                wassame = true
                ids[i] = ids[j]
                break 
            end
        end
        if wassame == false
            ids[i] = maximum(ids)+1
            push!(attractors, features_all[i])
        end
    end
    return ids, attractors
end

function compare_realizations(features_1, features_2, features_th)
    dists = features_1 .- features_2
    are_same = zeros(Bool, length(dists))
    for i = 1:length(dists)
        if typeof(dists[i]) <: Number   
            are_same[i] = abs(dists[i]) < abs(features_th[i])
        else
            are_same[i] = all(abs.(dists[i]) .< abs.(features_th[i]))
        end
    end
    all(are_same)
end

# ---------------------------------------------------- data from malleability (not a good test) ---------------------------------------------------- #
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
μ = 0.0
σ = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
epsi = 4.51282
ps = [0.0, 0.19684, 1.0]
shuffleid = 0

p = ps[1]
unitid = unitids[1]
thresholds = [0.01, 0.01, 0.01, 0.01 ,[0.01 for i=1:N], [0.01 for i=1:N]]
thresholds = [0.005, 0.005, 0.005, 0.005 ,[0.005 for i=1:N], [0.005 for i=1:N]]


features_all = [get_features(N, p, k, seednet, DIR, μ, σ, seedfreq, shuffleid, unitid, ω_new, epsi) for unitid in unitids] #if unitid is varying
realization_attractors, attractors = find_attractors(features_all, thresholds)


# ---------------------------------------------------------------- data from basins ---------------------------------------------------------------- #
function get_features(d_params, name_phase)
    @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic, u02 = d_params
    v_ω = get_frequency(mchange, mfreq, d_params, DIR)
    v_adjl = topology_params = get_topology(mtop, d_params, DIR)
    v_p = params(v_ω, epsi, v_adjl)
    system_function = kuramotonetwork!

    phasename = name_phase
    data = CSV.File(phasename, header=false) |> DataFrame; v_t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;
    v_t = v_t[2000:5000]
    m_θ = m_θ[2000:5000, :]
    Ωs = instafreqs(v_t, m_θ, v_p, system_function)


    #compute features from phases
    Rt = order_parameter(m_θ)
    meanfreqs =  mean(Ωs, dims=1)[1,:]
    iqis, stds, deltas = sync_freq_insta(Ωs, v_t)
    # Rcomm = order_parameter_community()
    Rlocal = order_parameter_local(m_θ', v_adjl)

    features = [mean(Rt), std(Rt), mean(iqis), std(iqis), meanfreqs, Rlocal[1,:]]
    return features 
end



include("$(DIR)/src/drwatson-organization.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
dictname = "ku_ws_501_shuf_p_eps410256-icsfrombasins-unit22"
a, names_phases = get_resultnames(dictname, "", "phases")
allparams, paramtypes = return_dict(dictname); alldicts = dict_list(allparams)

features_all = [get_features(alldicts[idx], names_phases[idx]) for idx=1:length(alldicts)]
realization_attractors, attractors = find_attractors(features_all, thresholds)
#WORKS!



# ------------------------------------------------------------ features from simulations ----------------------------------------------------------- #
## WS, k =2
# dictname = "ku_ws_501_multi_p_eps451282_features"
dictname = "ku_ws_501_multi_p_eps451282_k1_features"
# features_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
a, names_files = get_resultnames(dictname, "", "features")
allparams, paramtypes = return_dict(dictname); alldicts = dict_list(allparams)
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, shuffleid, seedic, k = alldicts[1]
ps = allparams["p"]
icshuffleids = allparams["icshuffleid"]
thresholds_all = [[th, th, th, th, th, th, th, [th for i=1:N], [th for i=1:N], [th for i=1:10]] for th ∈ [1e-5, 1e-4, 4e-4, 1e-3, 5e-3, 1e-2]]

numattractors_all = zeros(Int64, length(thresholds_all), length(ps))
R_all = zeros(Float64, (length(ps), length(icshuffleids)))
for (i, p) in enumerate(ps)
    features_all = []
    for (j, icshuffleid) ∈ enumerate(icshuffleids)
        file = "/home/kalelr/malleability/data/N_501-k_$(k)-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shufflingics-mstudy_features-seedic_0-seednet_1/features-control_p_$(p)-epsi_$(epsi)-icshuffleid_$(icshuffleid)-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_6000.0-ttrans_4500.0.dat"
        features_raw = readdlm(file)
        features = [features_raw[1], features_raw[2], features_raw[3], features_raw[4], features_raw[5], features_raw[6], features_raw[7], features_raw[8:8+501-1], features_raw[8+501:8+501+501-1], features_raw[8+501+501:end]]
        push!(features_all, features)
        R_all[i,j] = features[1]
    end

    for (k, thresholds) in enumerate(thresholds_all)
        realization_attractors, attractors = find_attractors(features_all, thresholds)
        numattractors = maximum(realization_attractors)
        numattractors_all[k, i] =  numattractors
    end
end

ps_p = deepcopy(ps); ps_p[1] = ps_p[1] + 3e-4
fig, axs = subplots(2, 1, constrained_layout=true, sharex="all")
ax = axs[1]
for (k, thresholds) in enumerate(thresholds_all)
    ax.plot(ps_p, numattractors_all[k, :], label="$(thresholds[1])")
end
ax.set_xscale("log")
# ax.set_ylabel(L"\mathrm{Number\;of\;attractors")
ax.set_ylabel("Number of attractors")
ax.set_ylim(1,520)
ax.set_yticks([0, 100, 200, 300, 400, 500])
ax.axhline(y=502, color="black", linestyle="--", alpha=0.5)
ax.legend(title="thresholds")

ax = axs[2]
for (i, shuffleid) in enumerate(icshuffleids)
    ax.plot(ps_p, R_all[:, i], "k-", alpha=0.01)
end
ax.set_ylabel(L"\langle R \rangle")
ax.set_ylim(0,1)
ax.set_xlim(3e-4, 1)
ax.set_xlabel(L"p")
Δs = mapslices(gap, R_all, dims=2)[:,1]
σs = mapslices(std, R_all, dims=2)[:,1]
ax2 = ax.twinx()
ax2.plot(ps_p, Δs, "r-")
ax2.set_ylabel(L"\Delta", color="red")
ax2.spines["right"].set_edgecolor("red")
ax2.tick_params(axis="y", colors="red") 
ax2.set_ylim(0,1)

ax3 = ax.twinx()
ax3.plot(ps_p, σs, "-", color="green")
# ax3.spines["right"].set_position(("axes", 1.03))
ax3.spines["right"].set_position(("axes", 1.2))
ax3.set_ylabel(L"\sigma", color="green")
ax3.spines["right"].set_edgecolor("green")
ax3.tick_params(axis="y", colors="green") 
resize!(fig, width=2, height=1.2)
fig.tight_layout(pad=0.2)
filename = "$(plotsdir())/paper/multistability/countingattractors-versusp-$(dictname)-variousthresholds.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)



# -------------------------------------------- for global network (printed differently to file ... --') -------------------------------------------- #
## WS, k =2
dictname = "ku_global_501_icshuf_eps_features"
a, names_files = get_resultnames(dictname, "", "features")
allparams, paramtypes = return_dict(dictname); alldicts = dict_list(allparams)
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, shuffleid, seedic, k = alldicts[1]
ps = allparams["p"]
icshuffleids = allparams["icshuffleid"]
thresholds_all = [[th, th, th, th, th, th, th, [th for i=1:N], [th for i=1:N], [th for i=1:10]] for th ∈ [1e-5, 1e-4, 4e-4, 1e-3, 5e-3, 1e-2]]

numattractors_all = zeros(Int64, length(thresholds_all), length(ps))
R_all = zeros(Float64, (length(ps), length(icshuffleids)))
    features_all = []
    for (j, icshuffleid) ∈ enumerate(icshuffleids)
        file = "/home/kalelr/malleability/data/N_501-k_$(k)-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shufflingics-mstudy_features-seedic_0-seednet_1/features-control_p_$(p)-epsi_$(epsi)-icshuffleid_$(icshuffleid)-mu_0.0-seedfreq_0-shuffleid_0-std_1.0-tend_6000.0-ttrans_4500.0.dat"
        features_raw = readdlm(file)
        features = [features_raw[1], features_raw[2], features_raw[3], features_raw[4], features_raw[5], features_raw[6], features_raw[7], features_raw[8:8+501-1], features_raw[8+501:8+501+501-1], features_raw[8+501+501:end]]
        push!(features_all, features)
        R_all[i,j] = features[1]
    end

    for (k, thresholds) in enumerate(thresholds_all)
        realization_attractors, attractors = find_attractors(features_all, thresholds)
        numattractors = maximum(realization_attractors)
        numattractors_all[k, i] =  numattractors
    end
end

ps_p = deepcopy(ps); ps_p[1] = ps_p[1] + 3e-4
fig, axs = subplots(2, 1, constrained_layout=true, sharex="all")
ax = axs[1]
for (k, thresholds) in enumerate(thresholds_all)
    ax.plot(ps_p, numattractors_all[k, :], label="$(thresholds[1])")
end
ax.set_xscale("log")
# ax.set_ylabel(L"\mathrm{Number\;of\;attractors")
ax.set_ylabel("Number of attractors")
ax.set_ylim(1,520)
ax.set_yticks([0, 100, 200, 300, 400, 500])
ax.axhline(y=502, color="black", linestyle="--", alpha=0.5)
ax.legend(title="thresholds")

ax = axs[2]
for (i, shuffleid) in enumerate(icshuffleids)
    ax.plot(ps_p, R_all[:, i], "k-", alpha=0.01)
end
ax.set_ylabel(L"\langle R \rangle")
ax.set_ylim(0,1)
ax.set_xlim(3e-4, 1)
ax.set_xlabel(L"p")
Δs = mapslices(gap, R_all, dims=2)[:,1]
σs = mapslices(std, R_all, dims=2)[:,1]
ax2 = ax.twinx()
ax2.plot(ps_p, Δs, "r-")
ax2.set_ylabel(L"\Delta", color="red")
ax2.spines["right"].set_edgecolor("red")
ax2.tick_params(axis="y", colors="red") 
ax2.set_ylim(0,1)

ax3 = ax.twinx()
ax3.plot(ps_p, σs, "-", color="green")
# ax3.spines["right"].set_position(("axes", 1.03))
ax3.spines["right"].set_position(("axes", 1.2))
ax3.set_ylabel(L"\sigma", color="green")
ax3.spines["right"].set_edgecolor("green")
ax3.tick_params(axis="y", colors="green") 
resize!(fig, width=2, height=1.2)
fig.tight_layout(pad=0.2)
filename = "$(plotsdir())/paper/multistability/countingattractors-versusp-$(dictname)-variousthresholds.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

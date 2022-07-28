#Check 1. loop, 2. timeaverage output

using OrdinaryDiffEq
using Random
Random.seed!(0)
using DelimitedFiles
using Statistics
# using Parameters
DIR = pwd()[1:findfirst("Malleability", pwd())[1]-1] * "Malleability"
include(DIR * "/src/utils.jl")
include(DIR * "/Analysis/Quantifiers/synchronization.jl")
include("$(DIR)/src/Kuramoto/kuramoto-library.jl")
include("$(DIR)/src/Kuramoto/current-parameters.jl")
include("library.jl")

#----Network parameters
# N = 1001; k = 4
N = 101; k = 2
seednet = 1 #default
seed_CI = 0
ciName = "$(DIR)/data/Network-inputs/data/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_0-seed_$(seed_CI).dat"
v_u0 = readdlm(ciName)[:,1]

shuffleid = 0
μ = distmean= 0.0
σ = diststd = 1.0
v_ω_new = [10.0]
v_idx_N = [0]
# epsi = 0
# epsi = 0.5
# epsi = 1.0
# epsi = 1.5
# epsi = 2.0
# epsi = 3.0
# epsi = 4.0
# epsi = 5.0
# epsi = 8.0
# epsi = 10.0
v_epsi = [ 0, 0.5, 1.0, 1.5, 2.0, 3.0, 4.0, 5.0]
v_epsi = [2.0]
v_shuffleid = 0:10
v_shuffleid = [0]
for shuffleid in v_shuffleid
distName = "$(DIR)/data/Network-inputs/data/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(distmean)-gamma_$(diststd)-seed_$(seedfreq)-shuffled-id_$(shuffleid).dat"
v_ω_original = readdlm(distName)[:,1]
for epsi in v_epsi


# v_p_rewiring = [0, 1e-3, 2e-3, 5e-3, 1e-2, 1.5e-2, 2e-2, 3e-2, 4e-2, 5e-2, 6e-2, 7e-2, 8e-2, 9e-2, 1e-1, 2e-1, 2.5e-1, 3e-1, 1]
v_p_rewiring = [0, 1e-3, 2e-3, 5e-3, 1e-2, 1.25e-2, 1.5e-2, 2e-2, 2.5e-2, 3e-2, 3.5e-2, 4e-2, 4.5e-2, 5e-2, 5.5e-2, 6e-2, 6.5e-2, 7e-2, 7.5e-2, 8e-2, 8.5e-2, 9e-2, 9.5e-2, 1e-1, 1.3e-1, 1.5e-1, 1.8e-1, 2e-1, 2.5e-1, 3e-1, 4e-1, 6e-1, 1]

# v_p_rewiring = [0, 1e-3, 1e-2, 1.7e-2, 3e-2, 5e-2, 7e-2, 1e-1, 1e0]
# p_rewiring = 0.017; v_epsi = [0, 1, 1.5, 2, 2.5, 5, 7]
# p_rewiring = 1.0; v_epsi = [0, 0.2, 0.22, 0.24, 0.26, 0.3, 0.4, 1.0]




# t_end = 200;
# t_trans = 50;
t_end = 100000.
t_trans = 1000.

tspan = (0., t_end)
t_saveat = t_trans:dt_ana:t_end


# cd(ENV["WORK"])
# DIR = "/gss/work/pasu1786/Malleability"
dirout =  "$(DIR)/data/Results/kuramoto-ws-gaussian-switchfreqs/N_$(N)"

for idx =1:length(v_ω_new)
    ω_new = v_ω_new[idx]
    for idx_N in v_idx_N

        v_ω = deepcopy(v_ω_original)
        if(idx_N != 0)
            v_ω[idx_N] = ω_new
        end

        # m_Rstats = zeros(Float64, (length(v_epsi), 7))
        # networkName = "$(DIR)/data/Network-inputs/Topology/Networks/undirected_ws_N_$(N)_p_$(p_rewiring)_k_$(k)_seed_$(seednet).dat"; #original, from lightgraphs
        # v_adj = readdlm(networkName, Int64)[:,1]
        # v_adjl = adjvec_to_adjlist(v_adj, N)
        # @Threads.threads for idx_p =1:length(v_epsi)
            # epsi = v_epsi[idx_p]

        m_Rstats = zeros(Float64, (length(v_p_rewiring), 7))
        @Threads.threads for idx_p =1:length(v_p_rewiring)
            p_rewiring = v_p_rewiring[idx_p]
            networkName = "$(DIR)/data/Network-inputs/data/N_$(N)/topologies/undirected_ws_N_" * string(N) * "_p_" * string(p_rewiring) * "_k_" * string(k) * "_seed_" * string(seednet)  * ".dat"
            v_adj = readdlm(networkName, Int64)[:,1]
            v_adjl = adjvec_to_adjlist(v_adj, N)



            println("Starting to run Kuramoto integration, with p_rewiring = $(p_rewiring) and ϵ = $(epsi), with shuffleid $(shuffleid). I have $(Threads.nthreads()) threads.")
            v_p = params(v_ω, epsi, v_adjl)
            prob = ODEProblem(kuramotonetwork!, v_u0, tspan, v_p)
            sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8, saveat=t_saveat, maxiters=1e7)

            v_t = sol.t; m_θ = transpose(sol[:,:]) #m_θ = times x units

            v_R, v_ϕ = complex_order_parameter(m_θ)



            m_Rstats[idx_p, :] =  stats_q(v_R)
            # fileOut = "$(dirout)/phases/phases-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            # mkpath(dirname(fileOut))
            # saveSolution(fileOut, sol)
            #
            # fileOut = "$(dirout)/Rxt/Rxt-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            # mkpath(dirname(fileOut))
            # saveRxt(v_t, v_R, fileOut)
            #
            # fileOut = "$(dirout)/phi/phi-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            # mkpath(dirname(fileOut))
            # saveRxt(v_t, v_ϕ, fileOut)
            #
            # fileOut = "$(dirout)/instafreqs/frequencies-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            # mkpath(dirname(fileOut))
            # saveVectorMatrix(fileOut, m_thetadot, v_t)
            # m_thetadot = instafreqs(v_t, m_θ, v_p)
        end
        # fileOut = "$(dirout)/timeaverages/R-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_all-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
        fileOut = "$(dirout)/timeaverages/R-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-wattsstrogatz-N_$(N)-p_all-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
        mkpath(dirname(fileOut))
        saveRtstats(v_p_rewiring, m_Rstats, fileOut)


    end
end
end
end

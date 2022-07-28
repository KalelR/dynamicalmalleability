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
# include("$(DIR)/src/Kuramoto/current-parameters.jl")
include("current-parameters.jl")


using LinearAlgebra
function instafreqs(v_t, m_θ, v_p)
    N = size(m_θ)[2]
    du = zeros(Float64, N)
    m_ωinst = zeros(Float64, (length(v_t), N))
    for idx = 1:length(v_t)
        t = v_t[idx]
        u = m_θ[idx,:]
        kuramotonetwork!(du,u,v_p,t)
        m_ωinst[idx,:] = du
    end
    return m_ωinst
end






#----Network parameters
N = 1001; k = 4
seednet = 1 #default
seed_CI = 0
ciName = "$(DIR)/data/Network-inputs/Initial-conditions/initial-conditions-N_$(N)_max_2pi-min_-2pi-seed_$(seed_CI).dat"
v_u0 = readdlm(ciName)[:,1]

shuffleid = 0
μ = 0.0
σ = 1.0
distName = "$(DIR)/data/Network-inputs/Frequency-distributions/Shuffles/distribution-frequencies-N_$(N)_gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid).dat"
v_ω_original = readdlm(distName)[:,1]
# v_ω_new = [10.0]

v_epsi=[0, 0.1, 0.5, 0.8, 2.0, 3.0, 5.0, 10.0]

t_end = 2500.
t_trans = 1000.

tspan = (0., t_end)
t_saveat = t_trans:dt_ana:t_end

cd(ENV["WORK"])
DIR = "/gss/work/pasu1786/Malleability"


    v_ω = deepcopy(v_ω_original)

    @Threads.threads for idx in 1:length(v_epsi)
        epsi = v_epsi[idx]
        v_p = params(v_ω, epsi, [])
        println("Solving for global at epsi = $(epsi)")
        prob = ODEProblem(kuramotonetwork_global!, v_u0, tspan, v_p)
        sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8, saveat=t_saveat)

            v_t = sol.t; m_θ = transpose(sol[:,:]) #m_θ = times x units

            v_R, v_ϕ = complex_order_parameter(m_θ)
            m_thetadot = instafreqs(v_t, m_θ, v_p)


            dirout =  "$(DIR)/data/Results/kuramoto-alltoall-gaussian-switchfreqs/"

            fileOut = "$(dirout)/phases/phases-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-alltoall-N_$(N)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            mkpath(dirname(fileOut))
            saveSolution(fileOut, sol)

            fileOut = "$(dirout)/Rxt/Rxt-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-alltoall-N_$(N)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            mkpath(dirname(fileOut))
            saveRxt(v_t, v_R, fileOut)

            fileOut = "$(dirout)/phi/phi-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-alltoall-N_$(N)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            mkpath(dirname(fileOut))
            saveRxt(v_t, v_ϕ, fileOut)

            fileOut = "$(dirout)/instafreqs/frequencies-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-alltoall-N_$(N)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[idx])-initialcondition_seed_$(seed_CI).dat"
            mkpath(dirname(fileOut))
            saveVectorMatrix(fileOut, m_thetadot, v_t)

    end

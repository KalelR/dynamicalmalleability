
#Plot Rstats, Rcommstats, DynCont
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
using DynamicalSystems
include("../lyapunov/integration_library.jl")
include("../lyapunov/lyapunov_library.jl")
include("library.jl")

function saveLyapunovs(fileOut, m_λ, v_t; print_step=1)
    open(fileOut, "w") do io
        for idx=2:print_step:length(v_t) #ignores first time, due to way I saved the lyapunovs
            @printf(io, "%f ", v_t[idx])
            for j = 1:length(m_λ[idx])
                @printf(io, "%.8f ", m_λ[idx][j])
            end
            @printf(io, "\n")
        end
    end
end


function saveLyapunovs(fileOut, m_λ::Array{Float64,2}, v_t::Array{Float64,1}; print_step=1)
    open(fileOut, "w") do io
        for idx=2:print_step:length(v_t) #ignores first time, due to way I saved the lyapunovs
            @printf(io, "%f ", v_t[idx])
            for j = 1:length(m_λ[:,idx])
                @printf(io, "%.8f ", m_λ[j,idx])
            end
            @printf(io, "\n")
        end
        flush(io)
    end
end

# N = 101; k = 2
N = 501; k = 2
seednet = 1 #default
seed_CI = 0
# ciName = "$(DIR)/data/Network-inputs/data/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_0-seed_$(seed_CI).dat"
ciName = "$(DIR)/data/Network-inputs/data/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_-2pi-seed_$(seed_CI).dat"
v_u0 = readdlm(ciName)[:,1]

shuffleid = 0
μ = distmean= 0.0
σ = diststd = 1.0
distName = "$(DIR)/data/Network-inputs/data/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(distmean)-gamma_$(diststd)-seed_$(seedfreq)-shuffled-id_$(shuffleid).dat"
v_ω_original = readdlm(distName)[:,1]
v_ω_new = [10.0]; ω_new = v_ω_new[1]
v_idx_N = [0]; idx_N = v_idx_N[1]
v_ω = deepcopy(v_ω_original)
epsi = 2.0
v_p_rewiring = [0, 1e-3, 2e-3, 5e-3, 1e-2, 1.25e-2, 1.5e-2, 2e-2, 2.5e-2, 3e-2, 3.5e-2, 4e-2, 4.5e-2, 5e-2, 5.5e-2, 6e-2, 6.5e-2, 7e-2, 7.5e-2, 8e-2, 8.5e-2, 9e-2, 9.5e-2, 1e-1, 1.05e-1, 1.1e-1, 1.2e-1, 1.3e-1, 1.5e-1, 1.6e-1, 1.8e-1, 2e-1, 2.5e-1, 3e-1, 3.5e-1, 4e-1, 5e-1, 6e-1, 1]

dirout =  "$(DIR)/data/Results/kuramoto-ws-gaussian-switchfreqs/N_$(N)"


#t_trans just evolves the system; t_trans2 then evolves the system and the Q vectors (its a sort of second transient burn-off)
# numQRs = 5; t_trans = 10; t_trans2 = 0; #test
# numQRs = 100000; t_trans = 5000; t_trans2 = 5000; #heavier stil run
# numQRs = 50000; t_trans = 2500; t_trans2 = 500; #heavier stil run
# Dt = 1.; #time between successive applications of QR

# numQRs = 10000; t_trans = 2500; t_trans2 = 500; #heavier stil run
# Dt = 5.; #time between successive applications of QR

#N = 501
numQRs = 15000; t_trans = 2500; t_trans2 = 100; #heavier stil run
Dt = 1.; #time between successive applications of QR

tspan = (0., t_end)
t_saveat = t_trans:dt_ana:t_end
numAverages = 1;
numQRs = Int64(numQRs); t_trans = Int64(t_trans); t_trans2 = Int64(t_trans2);
print_step =  1;
tols = (1e-4, 1e-4)

numEqs = 1
# Q0 = aorthonormal(N, N, 1);
Q0 = zeros(Float64, (N*numEqs,N*numEqs)); for i =1:N Q0[i,i] = 1. end;

    m_Rstats = zeros(Float64, (length(v_p_rewiring), 7))
    @Threads.threads for idx_p =1:length(v_p_rewiring)
        p_rewiring = v_p_rewiring[idx_p]
        networkName = "$(DIR)/data/Network-inputs/data/N_$(N)/topologies/undirected_ws_N_" * string(N) * "_p_" * string(p_rewiring) * "_k_" * string(k) * "_seed_" * string(seednet)  * ".dat"
        # if(!(isfile(networkName))) continue end
        # networkName = "$(DIR)/data/Network-inputs/Topology/networkx/Networks/nx_undirected_ws_N_$(N)_p_$(p_rewiring)_k_$(k)_seed_$(seednet).dat"; #with networkx
        v_adj = readdlm(networkName, Int64)[:,1]
        v_adjl = adjvec_to_adjlist(v_adj, N)
        v_p = params(v_ω, epsi, v_adjl)


        v_t = zeros(Float64, Int64(numQRs/numAverages)+1);
        m_λ = zeros(Float64, (N*numEqs, Int64(numQRs/numAverages)+1)) #each column corresponds to the lyapunov spectrum for that time (ie m_λ[:,1] returns the N*numQrs lyapunovs for time v_t[1])
        m_u = zeros(Float64, (Int64(numQRs/numAverages)+1, N*numEqs)) #each row corresponds to the system's variables for that time (ie m_u[1,:] returns the N*numQrs lyapunovs for time v_t[1])
        ds = ContinuousDynamicalSystem(kuramotonetwork!, v_u0, v_p)

        #integrate some time to get a steady state
        if(t_trans > 0)
            tr, t = trajectory_lastState_only(ds, t_trans+1, Ttr=t_trans, dt=1.) #changing this dt does not affect the lyapunovs
            v_CI2 = deepcopy(tr)
        else
            v_CI2 = deepcopy(v_CI)
        end


        # tinteg = tangent_integrator(ds, N*numEqs, u0 = v_CI2, tols=tols) #original
        tinteg = tangent_integrator(ds, Q0, u0 = v_CI2, tols=tols) #original
        # tinteg.u[:.1]# == phases for current time
        # tinteg.u[:.2:end]# == Q vectors for current time

        # numAverages = 1
        # lyapunovs_timeSeries!(tinteg, numQRs, Dt, m_λ, v_t, t_trans2, numAverages) #FIRST  column OF m_λ CONTAINS ZEROS, DUE TO CONTRUCTION, IGNORE THEM!
        lyapunovs_timeSeries_savesystemvariables!(tinteg, numQRs, Dt, m_λ, m_u, v_t, t_trans2, numAverages) #FIRST  column OF m_λ CONTAINS ZEROS, DUE TO CONTRUCTION, IGNORE THEM!

        m_u = m_u[2:end, :]


        fileOut = "$(dirout)/lyapunovs/lyapunovspectrum_timeseries-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-eps_$(epsi)-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-shuffled-id_$(shuffleid)-duration_$(numQRs)-numav_$(numAverages)-trans2_$(t_trans2)-dt_$(Dt)-ic_$(seed_CI).dat"
        mkpath(dirname(fileOut))
        saveLyapunovs(fileOut, m_λ, v_t, print_step=print_step)
        # flush(stdout)
        fill!(v_t, 0); fill!(m_λ, 0);


        # u_idx = 1:N;
        # v_R = abs.(mapslices(order_parameter, (m_u[1,:]), dims = 1))[1:end]
        v_R = order_parameter(m_u)
        # println
        m_Rstats[idx_p, :] =  stats_q(v_R)

    end


    fileOut = "$(dirout)/lyapunovs/R-onlyapunov-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-eps_$(epsi)-wattsstrogatz-N_$(N)-p_all-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(v_ω_new[1])-initialcondition_seed_$(seed_CI).dat"
    mkpath(dirname(fileOut))
    saveRtstats(v_p_rewiring, m_Rstats, fileOut)

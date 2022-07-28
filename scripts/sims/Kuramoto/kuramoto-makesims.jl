
get_parameter(dict, parkey, par_default) = haskey(dict, parkey) ? dict[parkey] : par_default
"""
Real simulation function: receives parameters for a single simulation, integrates it, does the required analysis, and returns the results in `res` and the trajectory solution in `sol`
"""
function makesim_kuramoto(d_params, d_quantifiers, DIR=projectdir())
    @unpack N, mtop, mfreq, mchange, epsi, tend, ttrans, dtana = d_params
    v_ω = get_frequency(mchange, mfreq, d_params, DIR)
    topology_params = get_topology(mtop, d_params, DIR)
    v_u0 = get_initialconditions(mchange, d_params, DIR)
    #--set up integrator and integrate
    tspan = (0.0, tend)
    t_saveat = ttrans:dtana:tend
    if(mtop == "WS")
        v_adjl = topology_params
        v_p = params(v_ω, epsi, v_adjl)
        prob = ODEProblem(kuramotonetwork!, v_u0, tspan, v_p)
        system_function = kuramotonetwork!
        solver = Tsit5()
    elseif(mtop == "PL")
        N_p, eta, alpha = topology_params
        v_p = params_powerlaw(v_ω, epsi, N_p, eta, alpha)
        prob = ODEProblem(kuramotonetwork_powerlaw!, v_u0, tspan, v_p)
        system_function = kuramotonetwork_powerlaw!
        solver = VCABM()
    else
        @error("Wrong topological model!")
    end
    
    solvername = get_parameter(d_params, "solver", solver)
    if solvername == "lsoda" solver = lsoda() end 
    sol = solve(prob, solver, reltol=1e-8, abstol=1e-8, saveat=t_saveat, maxiters=1e11) #m_\tehta = sol[:,:], a NxT matrix
    
    #--analyse
    res = analyse_solution(sol, d_quantifiers; mtop, v_p, system_function)
    return res
end

function analyse_solution(sol, d_quantifiers; mtop, v_p, system_function)
    quantifiers = keys(d_quantifiers)

    res = Dict()
    if("Rstats" ∈ quantifiers || "Rt" ∈ quantifiers)
        Rstats, v_Rt = orderparameter_stats_fromsol(sol)
        if("Rstats" ∈ quantifiers) res["Rstats"] = Rstats end 
        if("Rt" ∈ quantifiers) res["Rt"] = v_Rt end
    end

    if("phases" ∈ quantifiers)
        res["phases"] = sol[:,:]
        res["phases"] = sol
    end

    if("dynamicalcontributions" ∈ quantifiers )
        v_localranges = d_quantifiers["dynamicalcontributions"]["v_localranges"]
        if(mtop == "WS")
            contributions = dynamical_contributions(sol, v_p, v_localranges)
        elseif(mtop == "PL")
            contributions = dynamical_contributions_powerlaw(sol, v_p, v_localranges)
        end
        res["dynamicalcontributions"] = contributions
    end

    if("Rlocalstats" ∈ quantifiers)
        v_num_communities = d_quantifiers["Rlocalstats"]["v_num_communities"]
        Rlocalstats = order_parameter_community(sol, v_num_communities)
        res["Rlocalstats"] = Rlocalstats
    end

    if("syncfreqstats" ∈ quantifiers)
        frequency_synchronization_stats = frequency_synchronization(sol, v_p, system_function)
        res["syncfreqstats"] = frequency_synchronization_stats
    end

    if("meanfreqs" ∈ quantifiers)
        mean_ωs = average_frequency(sol, v_p, system_function)
        res["meanfreqs"] = mean_ωs
    end

    if("features" ∈ quantifiers)
        m_θ = transpose(sol[:,:]); v_t = sol.t #m_\tehta    will be TxN
        Rt = order_parameter(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        meanfreqs =  mean(Ωs, dims=1)[1,:]
        iqis, stds, deltas = sync_freq_insta(Ωs, v_t)
        adjl = v_p.v_adjl; Rlocal = order_parameter_local(m_θ', adjl)
        idx, Rcomms = order_parameter_community(m_θ', 10)
        features = hcat(mean(Rt), std(Rt), mean(iqis), std(iqis), mean(stds), std(stds), mean(deltas), meanfreqs..., Rlocal[1,:]..., Rcomms[1,:]...)[1,:]
        res["features"] = features
    end

    if("features_pl" ∈ quantifiers)
        m_θ = transpose(sol[:,:]); v_t = sol.t #m_\tehta    will be TxN
        Rt = order_parameter(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        meanfreqs =  mean(Ωs, dims=1)[1,:]
        iqis, stds, deltas = sync_freq_insta(Ωs, v_t)
        idx, Rcomms = order_parameter_community(m_θ', 10)
        features = hcat(mean(Rt), std(Rt), mean(iqis), std(iqis), mean(stds), std(stds), mean(deltas), meanfreqs..., Rcomms[1,:]...)[1,:]
        res["features"] = features
    end


    return res
end

function analyse_solution!(res, sol, d_quantifiers; mtop, v_p, system_function)
    quantifiers = keys(d_quantifiers)

    if("Rstats" ∈ quantifiers || "Rt" ∈ quantifiers)
        Rstats, v_Rt = orderparameter_stats_fromsol(sol)
        if("Rstats" ∈ quantifiers) res["Rstats"] = Rstats end 
        if("Rt" ∈ quantifiers) res["Rt"] = v_Rt end
    end

    if("Rt_lyaps" ∈ quantifiers)
        Rstats, v_Rt = orderparameter_stats_fromsol(sol')
         res["Rt"] = v_Rt 
    end

    if("phases" ∈ quantifiers) #for normal sols, from DiffEqs
        res["phases"] = sol[:,:]
        res["phases"] = sol
    end

    if("phases2" ∈ quantifiers) #for lyapunovs
        res["phases2"] = sol
    end

    if("dynamicalcontributions" ∈ quantifiers )
        v_localranges = d_quantifiers["dynamicalcontributions"]["v_localranges"]
        if(mtop == "WS")
            contributions = dynamical_contributions(sol, v_p, v_localranges)
        elseif(mtop == "PL")
            contributions = dynamical_contributions_powerlaw(sol, v_p, v_localranges)
        end
        res["dynamicalcontributions"] = contributions
    end

    if("Rlocalstats" ∈ quantifiers)
        v_num_communities = d_quantifiers["Rlocalstats"]["v_num_communities"]
        Rlocalstats = order_parameter_community(sol, v_num_communities)
        res["Rlocalstats"] = Rlocalstats
    end

    if("syncfreqstats" ∈ quantifiers)
        frequency_synchronization_stats = frequency_synchronization(sol, v_p, system_function)
        res["syncfreqstats"] = frequency_synchronization_stats
    end

    if("meanfreqs" ∈ quantifiers)
        mean_ωs = average_frequency(sol, v_p, system_function)
        res["meanfreqs"] = mean_ωs
    end

end
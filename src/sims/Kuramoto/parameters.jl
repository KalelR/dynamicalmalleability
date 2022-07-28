"""
Util function that returns the relevant parameters for each type of coupling. For WS, retursn teh adjacency list. For PL, returns N_p and η.
"""
function get_topology(mtop, d::Dict, DIR=projectdir())
    if(mtop == "WS")
        @unpack N, p, k, seednet = d
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        return v_adjl
    elseif(mtop == "PL")
        @unpack N, alpha = d 
        N_p = Int64((N-1)/2)
        eta = norm_powerlaw(alpha, N_p)
        return [N_p, eta, alpha]
    end
end


function get_wattsstrogatz(N, p_rewiring, k, seednet, DIR=projectdir())
    networkName = "$(DIR)/data/inputs/N_$(N)/topologies/undirected_ws_N_$(N)_p_$(p_rewiring)_k_$(k)_seed_$(seednet).dat"; #original, from lightgraphs
    v_adj = readdlm(networkName, Int64)[:,1]
    v_adjl = adjvec_to_adjlist(v_adj, N)
end
    
function get_initialconditions(change_mode, d::Dict, dir=projectdir())
    if typeof(change_mode) <: Tuple change_mode = change_mode[2] end
    @unpack N, seedic = d
    v_u0_original = get_initialconditions_uniform(N, seedic, dir)

    if change_mode == "ictwounits"
        @unpack unit1, unit2, u01, u02 = d
        v_u0 = deepcopy(v_u0_original)
        # println("$(u01), $(u02), $(unit1), $(unit2)")
        v_u0[unit1] = u01;
        v_u0[unit2] = u02;
    elseif change_mode == "shufflingics"
        @unpack icshuffleid = d
        v_u0 = get_initialconditions_uniform_shuffled(N, seedic, icshuffleid, dir)
    else 
        v_u0 = deepcopy(v_u0_original)
    end
    return v_u0
end

function get_initialconditions_uniform(N, seed_ic, DIR=projectdir())
    ciName = "$(DIR)/data/inputs/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_-2pi-seed_$(seed_ic).dat"
    v_u0 = readdlm(ciName)[:,1]
end

function get_initialconditions_uniform_shuffled(N, seed_ic, icshuffleid, DIR=projectdir())
    ciName = "$(DIR)/data/inputs/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_-2pi-seed_$(seed_ic)-icshuffleid_$(icshuffleid).dat"
    v_u0 = readdlm(ciName)[:,1]
end

function get_frequency(change_mode, freq_mode, d::Dict, DIR=projectdir())
    if typeof(change_mode) <: Tuple change_mode = change_mode[1] end
    if freq_mode == "gauss"
        @unpack N, mu, std, seedfreq, shuffleid = d
        v_ω_original = get_frequency_gauss(N, mu, std, seedfreq, shuffleid, DIR)
    elseif freq_mode == "cauchy"
        @unpack N, x0, gamma, seedfreq, shuffleid = d
        v_ω_original = get_frequency_cauchy(N, x0, gamma, seedfreq, shuffleid, DIR)
    end

    if change_mode == "shuffling"
        v_ω = deepcopy(v_ω_original) #already reads shuffled versions
    elseif change_mode == "oneunit"
        @unpack ω_new, idx_unit = d
        v_ω = alt_frequency_oneunit(idx_unit,  ω_new, v_ω_original)
    elseif change_mode == "oneunit_add" 
        @unpack ω_add, idx_unit = d
        v_ω = add_frequency_oneunit(idx_unit, ω_add, v_ω_original)
    else 
        v_ω = deepcopy(v_ω_original)
    end

    return v_ω
end

function get_frequency_cauchy(N, x0, γ, seedfreq, shuffleid, DIR=projectdir())
    distName = "$(DIR)/data/inputs/N_$(N)/frequencies/distribution-frequencies-N_$(N)-cauchy-x0_$(x0)-gamma_$(γ)-seed_$(seedfreq)-shuffled-id_$(shuffleid).dat"
    v_ω = readdlm(distName)[:,1]
end

function get_frequency_gauss(N, μ, σ, seedfreq, shuffleid, DIR=projectdir())
    distName = "$(DIR)/data/inputs/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(μ)-std_$(σ)-seed_$(seedfreq)-shuffled-id_$(shuffleid).dat"
    v_ω = readdlm(distName)[:,1]
end

function alt_frequency_oneunit(idx_unit, ω_new,  v_ω_original)
    v_ω = deepcopy(v_ω_original)
    if(idx_unit != 0)
        v_ω[idx_unit] = ω_new
    end
    return v_ω
end

function add_frequency_oneunit(idx_unit, ω_add,  v_ω_original)
    v_ω = deepcopy(v_ω_original)
    if(idx_unit != 0)
        v_ω[idx_unit] += ω_add
    end
    return v_ω
end

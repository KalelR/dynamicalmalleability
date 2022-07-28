using LinearAlgebra

"""
* Sol: solution array from diff eqs
* p = parameter struct (params) contining parameters to pass to kuramoto_network! function
* loc_range = local range

Returns
* the average local and nonlocal contributions
* the std of local and nonlocal contributions
"""
function dynamical_contributions(sol, p, loc_range::Int64)
    v_w0, eps, v_adjl = p.v_w0, p.eps, p.v_adjl
    N = length(v_w0)
    v_Icoup_l = zeros(Float64, N) #local
    v_Icoup_nl = zeros(Float64, N) #nonlocal
    v_t = sol.t
    for i = 1:N
        v_inedges = v_adjl[i] #get neighborhood of i
        for(idx, t) in enumerate(v_t)
            u = sol.u[idx]
            sum_local = 0.0; sum_nonlocal =0.0
            for j in v_inedges
                #determine if local or nonlocal
                dist = abs(i - j)
                if (dist > N/2) dist = N - dist; end
                if (dist <= loc_range)
                    sum_local += sin(u[j] - u[i])
                else
                    sum_nonlocal += sin(u[j] - u[i])
                end
            end
            # Icoup_l = (eps) * sum_local
            # Icoup_nl = (eps) * sum_nonlocal
            Icoup_l =  sum_local
            Icoup_nl =  sum_nonlocal
            v_Icoup_l[i] += abs(Icoup_l)
            v_Icoup_nl[i] += abs(Icoup_nl)
        end
        v_Icoup_l[i] /= length(v_t)
        v_Icoup_nl[i] /= length(v_t)
    end
    local_contribution = mean(v_Icoup_l)
    nonlocal_contribution = mean(v_Icoup_nl)
    local_std_contribution = std(v_Icoup_l)
    nonlocal_std_contribution = std(v_Icoup_nl)
    return [local_contribution, nonlocal_contribution, local_std_contribution, nonlocal_std_contribution]
    # return [local_contribution, nonlocal_contribution, local_std_contribution, nonlocal_std_contribution, v_Icoup_l, v_Icoup_nl]
end

function dynamical_contributions(sol, v_p, loc_ranges::Array{Int64,1})
    m_contributions = zeros(Float64, (length(loc_ranges), 5))
    m_contributions[:,1] .= loc_ranges 
    for (i, loc_range) in enumerate(loc_ranges)
        m_contributions[i, 2:end] = dynamical_contributions(sol, v_p, loc_range)
    end
    return m_contributions
end


function dynamical_contributions_powerlaw(sol, p, loc_range::Int64)
    v_w0, eps, N_p, eta, alpha = p.v_w0, p.eps, p.N_p, p.eta, p.alpha #or getfield(p, 1)
    N = length(v_w0)
    v_Icoup_l = zeros(Float64, N) #local
    v_Icoup_nl = zeros(Float64, N) #nonlocal
    v_t = sol.t
    for i = 1:N
        for(idx, t) in enumerate(v_t)
            u = deepcopy(sol.u[idx])
            sum_local = 0.0; sum_nonlocal =0.0
            for l=1:N_p
                i_1 = i - l;
                i_2 = i + l;
                if (i_1 <= 0) i_1 += (N) end #boundary conditions
                if (i_2 > N) i_2 -= N end #boundary conditions

                #nothing like lazyness for bad code haha
                # j = i_1
                # dist = abs(i - j)
                # if (dist > N/2) dist = N - dist; end
                if (l <= loc_range)
                    # sum_local += sin(u[j] - u[i]) / (l^alpha)
                    sum_local += sin(u[i_1] - u[i]) / (l^alpha)
                    sum_local += sin(u[i_2] - u[i]) / (l^alpha)
                else
                    # sum_nonlocal += sin(u[j] - u[i]) / (l^alpha)
                    sum_nonlocal += sin(u[i_1] - u[i]) / (l^alpha)
                    sum_nonlocal += sin(u[i_2] - u[i]) / (l^alpha)
                end

                # j = i_2
                # # dist = abs(i - j)
                # # if (dist > N/2) dist = N - dist; end
                # # dist = l;
                # if (dist <= loc_range)
                #     sum_local += sin(u[j] - u[i]) / (l^alpha)
                # else
                #     sum_nonlocal += sin(u[j] - u[i]) / (l^alpha)
                # end


                # sum_u += (1/j^alpha)*( sin(u[i_1]-u[i]) + sin(u[i_2]-u[i]) );
            end
            I_coup_l = (eps/eta)*sum_local
            I_coup_nl = (eps/eta)*sum_nonlocal
            v_Icoup_l[i] += abs(I_coup_l)
            v_Icoup_nl[i] += abs(I_coup_nl)
        end
        v_Icoup_l[i] /= length(v_t)
        v_Icoup_nl[i] /= length(v_t)
    end

    local_contribution = mean(v_Icoup_l)
    nonlocal_contribution = mean(v_Icoup_nl)
    local_std_contribution = std(v_Icoup_l)
    nonlocal_std_contribution = std(v_Icoup_nl)
    return [local_contribution, nonlocal_contribution, local_std_contribution, nonlocal_std_contribution]
end

function dynamical_contributions_powerlaw(sol, p, loc_ranges::Array{Int64,1})
    m_contributions = zeros(Float64, (length(loc_ranges), 5))
    m_contributions[:,1] .= loc_ranges 
    for (i, loc_range) in enumerate(loc_ranges)
        m_contributions[i, 2:end] = dynamical_contributions_powerlaw(sol, p, loc_range)
    end
    return m_contributions
end


logrange(x1, x2, n) = (10^y for y in range(log10(x1), log10(x2), length=n))


#---- Synchronization
# s is a solution array
function order_parameter(s)
    θ  = 0
    for i in s
        θ += exp(im * i)
    end
    abs.(θ / length(s))
end
function orderparameter_stats_fromsol(sol)
    m_θ = transpose(sol[:, :])
    v_R = order_parameter(m_θ)
    v_Rstats =  stats_q(v_R)
    return v_Rstats, v_R #returns stats of R(t) and R(t)
end

"""
Calculates R(t), given matrix of phases of TxN #N x times
"""
function order_parameter(m_phases)
    totalt, N = size(m_phases)
    v_R = zeros(Float64, totalt)
    for idx =1:totalt 
        v_R[idx] = order_parameter_t(m_phases[idx,:])
    end
    return v_R
end

# calcualte order parameter for a vector with phases
function order_parameter_t(v_phase)
    θ  = 0
    for i in v_phase
        θ += exp(im * i)
    end
    return abs(θ / length(v_phase))
end

function complex_order_parameter_t(v_phase)
    θ  = 0 + 0im
    for i in v_phase
        θ += exp(im * i)
    end
    θ /= length(v_phase)
    return abs(θ), angle(θ)
end
#test: 
# v_phase = [0, pi/2, pi, 3pi/2]; R, ϕ = complex_order_parameter_t(v_phase)


function complex_order_parameter(m_phases)
    totalt, N = size(m_phases)
    v_R = zeros(Float64, totalt)
    v_ϕ = zeros(Float64, totalt)
    for idx =1:totalt 
        v_R[idx], v_ϕ[idx] = complex_order_parameter_t(m_phases[idx,:])
    end
    return v_R, v_ϕ
end


#m_phase: each line contains phases of neurons for a given time; each col a single neuron across time
#m_phase[i,:] == phases of neuron i for all times
# """
#     Chunks the network into communities of size `num_comm`, calculates the time series of R over each community. Returns a vector with the indices of the untis in each community, along witha matrix whose columns contain the Rcomm(t) for each community.
# """
# function order_parameter_community(m_phase, num_comm)
#     N, numtimes = size(m_phase)
#     v_idx_N_comm = chunk_array(1:N, num_comm)
#     m_Rcomm = zeros(Float64, (numtimes, num_comm))
#     for i=1:numtimes
#         v_phase = m_phase[:, i] #all phases for time i
#         # m_Rcomm[i,:] = [order_parameter_t(v_phase[v_idx_N_comm[idx]]) for idx=1:num_comm]
#         for j=1:num_comm
#             m_Rcomm[i,j] = order_parameter_t(v_phase[v_idx_N_comm[j]]) 
#         end
#     end
#     return v_idx_N_comm, m_Rcomm
# end
# """
#     Run order_parameter_community for each value of numcomunities in the vector. For each community, calcualte stats_q (7 statistics for each community) and concatenate it for every community and puts in a vector Do this for every numcommunities. Returns the vector of vectors
# """
# function order_parameter_community(sol, v_num_communities)
#     res = []
#     m_θ = sol[:,:]
#     for num_comm in v_num_communities
#         v_idxN_comm, m_Rcomm = order_parameter_community(m_θ, num_comm)
#         Rcomm_statsq = reduce(vcat, [stats_q(m_Rcomm[:, idx_comm]) for idx_comm=1:num_comm]) #apply stats_q for each Rcomm(t), and concatenates everything into a vector
#         push!(res, Rcomm_statsq)
#     end
# end

function order_parameter_community(m_phase, num_comm)
    N, numtimes = size(m_phase)
    v_idx_N_comm = chunk_array(1:N, num_comm)
    Rcomms_stats = [Float64[] for i=1:num_comm]
    for i=1:num_comm
        Rcomms = mapslices(order_parameter_t, m_phase[v_idx_N_comm[i], :], dims=1 )[1,:]
        Rcomms_stats[i] = stats_q(Rcomms)
    end
    return v_idx_N_comm, hcat(Rcomms_stats...)
end

# function order_parameter_community(sol, v_num_communities)
#     res = []
#     m_θ = sol[:,:]
#     for num_comm in v_num_communities
#         v_idxN_comm, Rstatscomms = order_parameter_community(m_θ, num_comm)
#         push!(res, Rcommcomms)
#     end
#     return res
# end

"""
Util function for calculating order parameter dividnig the network into local communities.
"""
function chunk_array(array, num_chunks)
    size_chunks = Int64(floor(length(array) / num_chunks)) #size of all (except, potentially, last chunk)
    num_regular_chunks = Int64(floor(length(array) / size_chunks))
    array_div = []
    for idx=1:num_regular_chunks-1
        idx_min = Int64((idx-1)*size_chunks+1 )
        idx_max = Int64(idx*size_chunks)
        push!(array_div, array[idx_min:idx_max])
    end

    push!(array_div, array[(num_regular_chunks-1)*size_chunks+1:end])
end

"""
Order parameter calculated on neighbors of eahc node i; should receive phase matrix as NxT
"""
function order_parameter_local(θs, adjl)
    N, numtimes = size(θs)
    Rlocal_stats = [Float64[] for i=1:N]
    for i=1:N
        nodes = [adjl[i]; i]
        Rlocal_t = mapslices(order_parameter_t, θs[nodes, :], dims=1)[1,:]
        Rlocal_stats[i] = stats_q(Rlocal_t)
    end
    return hcat(Rlocal_stats...)
end

"""
calculates instantaneous freqs from phases for system given in system_function
"""
function instafreqs(v_t, m_θ, v_p, system_function)
    N = size(m_θ)[2]
    du = zeros(Float64, N)
    m_ωinst = zeros(Float64, (length(v_t), N))
    for idx = 1:length(v_t)
        t = v_t[idx]
        u = m_θ[idx,:]
        system_function(du,u,v_p,t)
        m_ωinst[idx,:] = du
    end
    return m_ωinst
end


"""
Sort of wrapper to calculate more easility, starting from the dictionary
"""
function instafreqs(d_params, ts, θs)
	@unpack N, mtop, mfreq, mchange, epsi, tend, dtana = d_params
	v_ω = get_frequency(mchange, mfreq, d_params, DIR)
	v_adjl = get_topology(mtop, d_params, DIR)
	v_p = params(v_ω, epsi, v_adjl)
	Ωs = instafreqs(ts, θs, v_p, kuramotonetwork!)
end


"""
Calculate several statistics regarding the frequency synchronization of the system. These are:
mean(v_std_t), mean(v_iqi_t), mean(v_delta_t), std(v_std_t), std(v_iqi_t), std(v_delta_t
"""
function frequency_synchronization(sol, v_p, system_function)
        v_t = sol.t
        m_θ = sol[:,:]
        m_ω = instafreqs(v_t, transpose(m_θ), v_p, system_function)
        ω_mean = mean(m_ω, dims=1)[1,:]
        frequency_synchronization_stats = sync_freq(m_ω, v_t)
end

"""
utility for frequency_synchronization
"""
function sync_freq(m_ω, v_t)
    v_std_t = zeros(Float64, length(v_t))
    v_iqi_t = zeros(Float64, length(v_t))
    v_delta_t = zeros(Float64, length(v_t))
    # println(length(v_sf_t), size(m_ω))
    for idxt = 1:length(v_t)
        v_ω = m_ω[idxt, :]
        stats = stats_q(v_ω)
        v_std_t[idxt] = stats[2] #std
        v_iqi_t[idxt] = stats[6] - stats[5] #q3 - q1
        v_delta_t[idxt] = stats[3] - stats[4] #max - min
    end
    return [mean(v_std_t), mean(v_iqi_t), mean(v_delta_t), std(v_std_t), std(v_iqi_t), std(v_delta_t)]
end

"""
utility for frequency_synchronization for each point in time
"""
function sync_freq_insta(m_ω, v_t)
    v_std_t = zeros(Float64, length(v_t))
    v_iqi_t = zeros(Float64, length(v_t))
    v_delta_t = zeros(Float64, length(v_t))
    # println(length(v_sf_t), size(m_ω))
    for idxt = 1:length(v_t)
        v_ω = m_ω[idxt, :]
        stats = stats_q(v_ω)
        v_std_t[idxt] = stats[2] #std
        v_iqi_t[idxt] = stats[6] - stats[5] #q3 - q1
        v_delta_t[idxt] = stats[3] - stats[4] #max - min
    end
    return v_iqi_t, v_std_t, v_delta_t
end

"""
Calculate average average frequency, given the phases
"""
function average_frequency(sol, v_p, system_function)
        v_t = sol.t
        m_θ = sol[:,:]
        m_ω = instafreqs(v_t, transpose(m_θ), v_p, system_function)
        ω_mean = mean(m_ω, dims=1)[1,:]
end


"""
Calculate local and nonlocal degrees given an undirected unweighted adj list (WS)
"""
function calc_topological_contributions(v_adjl, loc_range)
    N = length(v_adjl)
    v_local_degree = zeros(Int64, N); v_nonlocal_degree = zeros(Int64, N)
    for i=1:N
        for j in v_adjl[i]
            dist = abs(i - j) #calc edge distance d_ij
            if (dist > N/2) dist = N - dist; end

            if (dist <= loc_range) #determine if local or nonlocal
                v_local_degree[i] += 1;
            else
                v_nonlocal_degree[i] +=1;
            end
        end
    end
    return v_local_degree, v_nonlocal_degree
end

"""
Calculate local and nonlocal degrees for a PL DD
"""
function calc_topological_contributions(N, alpha, loc_range)
    N_p = Int64((N-1)/2)
    eta = 0.0
    for j = 1:N_p
        eta += 1/j^alpha;
    end
    eta *= 2;

    #local
    sum = 0.
    for idx = 1:loc_range
        sum += 1.0/(idx^alpha)
    end
    local_contribution = (2/eta)*sum;

    #nonlocal
    sum = 0.
    for idx = (loc_range+1):N_p
        sum += 1.0/(idx^alpha)
    end
    nonlocal_contribution = (2/eta)*sum;

    return local_contribution, nonlocal_contribution
end
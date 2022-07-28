using Printf
using Statistics

logrange(x1, x2, n) = (10^y for y in range(log10(x1), log10(x2), length=n))



#Converts the standard adjacency vector into a vector of the in-neighbors (connections arriving at each i) of each node; see example below
function adjvec_to_adjlist(v_adj, N)
    v_adjl = [ Int64[] for i=1:N]
    for e in v_adj # e is the connection index
        i, j = floor(Int, e/N), floor(Int, e % N) #i = postynatpc,  j = presynaptic === i receives conn from j
        i += 1; j += 1;
        push!(v_adjl[i], j)
    end
    return v_adjl
end

function adjmat_to_adjlist(mat)
    N = size(mat)[1]
    v_adjl = [ Int64[] for i=1:N]
    for i=1:N
        v_inneighbors = findall(x->x==1, mat[i,:])
        v_adjl[i] = v_inneighbors
    end
    return v_adjl
end


function saveR(v_ε, v_R, fileName)
    # fileName
    open(fileName, "w") do io
        @printf(io, "#eps R \n")
        for idx=1:length(v_R)
            if(typeof(v_ε[1]) == Float64)
                @printf(io, "%.8f %f \n",  v_ε[idx], v_R[idx])
            else
                @printf(io, "%.8f %f \n", parse(Float64, v_ε[idx]), v_R[idx])
            end
        end
    end
end

function saveRxt(v_t, v_R, fileName; print_step=1)
    # fileName
    open(fileName, "w") do io
        @printf(io, "#t R \n")
        for idx=1:print_step:length(v_R)
            @printf(io, "%.6f %.4f \n",  v_t[idx], v_R[idx])
        end
    end
end

function stats(vec)
    return [mean(vec), std(vec), maximum(vec), minimum(vec)]
end


function stats_q(vec)
    return [mean(vec), std(vec), maximum(vec), minimum(vec), quantile(vec, 0.25), quantile(vec, 0.75), quantile(vec, 0.5)]
end

# function saveRtstats(v_ε, m_Rtstats, fileName)
#     # fileName
#     open(fileName, "w") do io
#         @printf(io, "#eps R \n")
#         for idx=1:length(v_ε)
#             # if(typeof(v_ε[1]) == Float64)
#             #     @printf(io, "%.8f %.5f %.5f %.5f %.5f \n",  v_ε[idx], m_Rtstats[idx,1], m_Rtstats[idx,2], m_Rtstats[idx,3], m_Rtstats[idx,4])
#             # else
#             #     @printf(io, "%.8f %.5f %.5f %.5f %.5f \n", parse(Float64, v_ε[idx]), m_Rtstats[idx, 1], m_Rtstats[idx,2], m_Rtstats[idx,3], m_Rtstats[idx,4])
#             # end

#             if(typeof(v_ε[1]) != Float64) v_ϵ = parse.(Float64, v_ϵ) end
#             @printf(io, "%.8f ",  v_ε[idx])
#             for idxj = 1:length(m_Rtstats[idx,:])
#                 @printf(io, "%.5f ",  m_Rtstats[idx, idxj])
#             end
#             @printf(io, "\n")


#         end
#     end
# end
function saveRtstats(v_ε, m_Rtstats, fileName)
    # fileName
    open(fileName, "w") do io
        @printf(io, "#eps R \n")
        for idx=1:length(v_ε)
            # if(typeof(v_ε[1]) == Float64)
            #     @printf(io, "%.8f %.5f %.5f %.5f %.5f \n",  v_ε[idx], m_Rtstats[idx,1], m_Rtstats[idx,2], m_Rtstats[idx,3], m_Rtstats[idx,4])
            # else
            #     @printf(io, "%.8f %.5f %.5f %.5f %.5f \n", parse(Float64, v_ε[idx]), m_Rtstats[idx, 1], m_Rtstats[idx,2], m_Rtstats[idx,3], m_Rtstats[idx,4])
            # end

            if(typeof(v_ε[1]) != Float64) v_ε = parse.(Float64, v_ε) end
            @printf(io, "%.8f ",  v_ε[idx])
            for idxj = 1:length(m_Rtstats[idx,:])
                @printf(io, "%.5f ",  m_Rtstats[idx, idxj])
            end
            @printf(io, "\n")


        end
    end
end

function saveVectorMatrix(fileOut, mat, vec)
    open(fileOut, "w") do io
        for idx=1:length(vec)
            @printf(io, "%f ", vec[idx])
            for j = 1:length(mat[idx,:])
                @printf(io, "%.8f ", mat[idx,j])
            end
            @printf(io, "\n")
        end
    end
end

function saveSolution(fileOut, sol)
    mkpath(dirname(fileOut))
    open(fileOut, "w") do io
        for idx=1:length(sol)
            @printf(io, "%f ", sol.t[idx])
            for j=1:length(sol.u[idx])
                @printf(io, "%.5f ", sol.u[idx][j])
            end
            @printf(io, "\n")
        end
    end
end

function saveSolution2(fileOut, sol)
    open(fileOut, "w") do io
        for idx=1:length(sol)
            @printf(io, "%f ", sol.t[idx])
            for j=1:length(sol.u[idx])
                @printf(io, "%.4f ", mod(sol.u[idx][j], 2pi))
            end
            @printf(io, "\n")
        end
    end
end


function swap_elements!(vec, el1, el2)
    a = vec[el1]
    vec[el1] = vec[el2]
    vec[el2] = a
    return vec
end

function shuffle_num_times(vec, num_shuffles; seed=1)
    rng = MersenneTwister(seed);
    N = length(vec)
    vec_sf = deepcopy(vec)
    v_pairs = [ Int64[] for i=1:num_shuffles]
    for i=1:num_shuffles #assuming that num_shuffles << N, so that the same pair won't occur
        v_pair = rand(rng, 1:N, 2)
        v_pairs[i] = v_pair
        vec_sf = swap_elements!(vec_sf, v_pair[1], v_pair[2])
    end
    return vec_sf, v_pairs
end

function shuffle_pairs(vec, v_pair)
    vec_sf = deepcopy(vec)
    vec_sf = swap_elements!(vec_sf, v_pair[1], v_pair[2])
    return vec_sf
end



#Example Adj Matrix
# 0 1 1
# 1 0 0
# 0 1 0
#result should be, in Julia notation
# [2,3]
# [1]
# [2]
# v = [0,1,0,1,0,1,1,0,0] #by col
# m_adj = reshape(v, 3,3)
# v_adj = [1,2,3,7]
# N = 3
# v_adjl = adjvec_to_adjlist(v_adj)
function local_maxima(x)
	x1 = @view x[1:end - 2]
	x2 = @view x[2:end - 1]
	x3 = @view x[3:end]
	collect(1:length(x2))[x1 .< x2 .> x3] .+ 1
end
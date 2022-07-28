using Distributions
using DelimitedFiles
using Random
using StatsBase
using Statistics
using LightGraphs



distmean = 0.0
diststd = 1.0
dist = Normal(distmean, diststd)

function graphtovector(g)
    vetor = []
    for i=1:N, j=1:N
        if(has_edge(g, i, j) == 1)
            push!(vetor, (i-1)*N + (j-1))
        end
    end
    return vetor
end
logrange(x1, x2, n) = (10^(y) for y in range(log10(x1), log10(x2), length=n))

#N = 101;
N = 501

#IC
v_seedic = 0:5

#Topology
k = 2
seednet = 1
# v_p = [0, 1e-3, 5e-3, 8e-3, 1e-2, 3e-2, 5e-2, 8e-2, 9e-2, 1e-1, 2e-1, 2.5e-1, 3e-1, 4e-1, 5e-1, 7e-1, 9e-1, 1] #original 22 values plus additinal ones for lyapunov spectrum plot
v_p = [0, 1e-3, 2e-3, 5e-3, 1e-2, 1.5e-2, 2e-2, 3e-2, 4e-2, 5e-2, 6e-2, 7e-2, 8e-2, 9e-2, 1e-1, 2e-1, 2.5e-1, 3e-1, 1]
v_p = [0, 1e-3, 2e-3, 5e-3, 1e-2, 1.25e-2, 1.5e-2, 2e-2, 2.5e-2, 3e-2, 3.5e-2, 4e-2, 4.5e-2, 5e-2, 5.5e-2, 6e-2, 6.5e-2, 7e-2, 7.5e-2, 8e-2, 8.5e-2, 9e-2, 9.5e-2, 1e-1, 1.3e-1, 1.5e-1, 1.8e-1, 2e-1, 2.5e-1, 3e-1, 4e-1, 6e-1, 1]
v_p = [0, 1e-3, 2e-3, 5e-3, 1e-2, 1.25e-2, 1.5e-2, 2e-2, 2.5e-2, 3e-2, 3.5e-2, 4e-2, 4.5e-2, 5e-2, 5.5e-2, 6e-2, 6.5e-2, 7e-2, 7.5e-2, 8e-2, 8.5e-2, 9e-2, 9.5e-2, 1e-1, 1.05e-1, 1.1e-1, 1.2e-1, 1.3e-1, 1.5e-1, 1.6e-1, 1.8e-1, 2e-1, 2.5e-1, 3e-1, 3.5e-1, 4e-1, 5e-1, 6e-1, 1]


distmean = 0.0
diststd = 1.0
seedfreq = 0
v_shuffleid = 1:10

#IC
for seedic in v_seedic
    Random.seed!(seedic)
    dist = Uniform(0, +2pi)
    v_CI = rand(dist, N)
    fileout = "data/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_0-seed_$(seedic).dat"
    if(isfile(fileout)) println("Already exists"); continue end
    mkpath(dirname(fileout))
    writedlm(fileout, v_CI)
end

#TOPOLOGY
for p in v_p
    fileout = "data/N_$(N)/topologies/undirected_ws_N_" * string(N) * "_p_" * string(p) * "_k_" * string(k) * "_seed_" * string(seednet)  * ".dat"
    if(isfile(fileout)) println("Already exists"); continue end

    g = watts_strogatz(N, k*2, p, seed=Int64(floor(seednet)), is_directed=false) #generates disconnectec networks for large p; worked for p = 1.0 though
    # g = watts_strogatz(N, 2, p, seed=Int64(floor(seed)), is_directed=false) #generates disconnectec networks for large p; worked for p = 1.0 though

    # L = calcL(g); C = graph_clustering_coefficient(g)
    # println("L = $(L), C=$(C)")

    # m = adjacency_matrix(g)
    vetor = graphtovector(g)
    mkpath(dirname(fileout))
    writedlm(fileout, vetor)
end


#FREQUENCIES
dist = Normal(distmean, diststd)
Random.seed!(seedfreq)
v_ω = rand(dist, N)
fileout = "data/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(distmean)-gamma_$(diststd)-seed_$(seedfreq)-shuffled-id_0.dat"
if(isfile(fileout)) println("Already exists"); else mkpath(dirname(fileout)); writedlm(fileout, v_ω) end

# println("β2 = $(kurtosis(v_ω)-1), γ1 = $(skewness(v_ω))")

for (idx, shuffleid) in enumerate(v_shuffleid)
    if(shuffleid == 0) continue end
    rng = MersenneTwister(shuffleid);
    v_shuffle = shuffle(rng, v_ω)
    fileout = "data/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(distmean)-gamma_$(diststd)-seed_$(seedfreq)-shuffled-id_$(shuffleid).dat"
    # if(isfile(fileout)) println("Already exists"); continue end
    writedlm(fileout, v_shuffle)
end

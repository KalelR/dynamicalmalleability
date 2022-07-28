using DrWatson
@quickactivate "dynamicalmalleability"
const DIR = projectdir()
const data_dir = "$(DIR)/data"
using Distributions, DelimitedFiles, Random, StatsBase, Statistics, LightGraphs
N = 501
v_seedic = [0]

k = 2
seednet = 1
v_p = [0.0,  0.08733,  0.19684, 1.0]

distmean = 0.0
diststd = 1.0
seedfreq = 0
v_shuffleid = 0:1

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


#IC
for seedic in v_seedic
    Random.seed!(seedic)
    distic = Uniform(-2pi, +2pi)
    v_CI = rand(distic, N)
    fileout = "$(data_dir)/inputs/N_$(N)/ics/initial-conditions-N_$(N)_max_2pi-min_-2pi-seed_$(seedic).dat"
    if(isfile(fileout)) println("Already exists"); continue end
    mkpath(dirname(fileout))
    writedlm(fileout, v_CI)
end

#TOPOLOGY
for p in v_p
    fileout = "$(data_dir)/inputs/N_$(N)/topologies/undirected_ws_N_" * string(N) * "_p_" * string(p) * "_k_" * string(k) * "_seed_" * string(seednet)  * ".dat"
    if(isfile(fileout)) println("Already exists"); continue end
    g = watts_strogatz(N, k*2, p, seed=Int64(floor(seednet)), is_directed=false) #generates disconnectec networks for large p; worked for p = 1.0 though
    vetor = graphtovector(g)
    mkpath(dirname(fileout))
    writedlm(fileout, vetor)
end


#FREQUENCIES
dist = Normal(distmean, diststd)
Random.seed!(seedfreq)
v_ω = rand(dist, N)
fileout = "$(data_dir)/inputs/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(distmean)-std_$(diststd)-seed_$(seedfreq)-shuffled-id_0.dat"
if(isfile(fileout)) println("Already exists"); else mkpath(dirname(fileout)); writedlm(fileout, v_ω) end

for (idx, shuffleid) in enumerate(v_shuffleid)
    if(shuffleid == 0) continue end
    rng = MersenneTwister(shuffleid);
    v_shuffle = shuffle(rng, v_ω)
    fileout = "$(data_dir)/inputs/N_$(N)/frequencies/distribution-frequencies-N_$(N)-gaussian-mean_$(distmean)-std_$(diststd)-seed_$(seedfreq)-shuffled-id_$(shuffleid).dat"
    writedlm(fileout, v_shuffle)
end
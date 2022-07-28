# To plot <R> versus eps and p for all the cases
include("../general_plots.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
using DelimitedFiles
include("$(DIR)/src/utils.jl")
using LinearAlgebra
quantifier = "Rstats"
data_dir = datadir()


epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1.0; height=1;
ylabel1 = L"\langle R \rangle"
ylabel2 = L"{\langle R \rangle}_{max} - {\langle R \rangle}_{min}"
v_ylabel=[ylabel1, ylabel2]

p_xlabel=[L"p"]
e_xlabel=[L"\epsilon"]
alpha_xlabel=[L"\alpha"]
p_offset = 5e-5
linewidths = [1.3,1.3]#[0.8, 1.2]
tick_size=9#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =12#10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels



#----- WS
#topology
m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel

#Finding max malleability
fileout = ""
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
dictnames = ["ku_ws_501_unit_p_eps4"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
fig, axs= plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=true)

dictname = dictnames[1]

R_all = collectresults(dictname, quantifier; data_dir=data_dir)
Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
Δmax, idx_p = findmax(Δs)
p = R_all[idx_p, 1]
Rs = R_all[idx_p, 2:end]
Rmax, idxRmax = findmax(Rs); idxRmax = parse(Int, string(idxRmax))
Rmin, idxRmin = findmin(Rs); idxRmin = parse(Int, string(idxRmin))

# Getting net params
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)
d_params = alldicts[idx_p]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
v_adjl = topology_params = get_topology(mtop, d_params, DIR)

d_params_Rmax = deepcopy(d_params); d_params_Rmax["idx_unit"] = idxRmax
d_params_Rmin = deepcopy(d_params); d_params_Rmin["idx_unit"] = idxRmin
v_ω = get_frequency(mchange, mfreq, d_params, DIR)
v_ω_Rmax = get_frequency(mchange, mfreq, d_params_Rmax, DIR)
v_ω_Rmin = get_frequency(mchange, mfreq, d_params_Rmin, DIR)


# TEST 1 - Trying |ω_i| versus d_i
degree(adjl, i) = length(adjl[i])
degrees(adjl) = [degree(adjl,i) for i = 1:length(adjl)]
d = degrees(v_adjl)

figure()
plot(d, abs.(v_ω_Rmax), "ko", alpha=0.8, label="maximum, R = $(Rmax), unit $(idxRmax), degree $(d[idxRmax])")
plot(d, abs.(v_ω_Rmin), "bo", alpha=0.8, label="minimum, R = $(Rmin), unit $(idxRmin), degree $(d[idxRmin])")
legend()
ylabel(L"|\mathbf{ω}|")
xlabel(L"\mathbf{d}")
title("For peak in single-unit change malleability")
savefig("$(plotsdir())/optimizationprotocols/optimization-protocol-test1-frequencies-versus-degree.png")

# figure()
# plot(d, v_ω, "ko", alpha=0.8)
# ylabel(L"\mathbf{ω}")
# xlabel(L"\mathbf{d}")
# title("For peak in single-unit change malleability")
# savefig("$(plotsdir())/optimizationprotocols/optimization-protocol-test1-frequencies-versus-degree-nomodule.png")

#TEST 2  - Neighbor average frequency versus own frequency
"""
Get average of i-th unit's neighbor's frequencies
"""
function neighbor_average_frequency(ωs, adjl, i)
    neighbor_ωs = ωs[adjl[i]]
    mean(neighbor_ωs)
end

NAF_Rmax = [neighbor_average_frequency(v_ω_Rmax, v_adjl, i) for i=1:N]
NAF_Rmin = [neighbor_average_frequency(v_ω_Rmin, v_adjl, i) for i=1:N]
fig, ax = subplots()
ax.plot(v_ω_Rmax, NAF_Rmax, "ko", alpha=0.8, label="maximum, R = $(Rmax), unit $(idxRmax), degree $(d[idxRmax])")
ax.plot(v_ω_Rmin, NAF_Rmin, "bo", alpha=0.8, label="minimum, R = $(Rmin), unit $(idxRmin), degree $(d[idxRmin])")
ax.set_ylabel(L"\overline{\omega_i}_{\Gamma_i}")
ax.set_xlabel(L"\omega_i")
ax.axis("equal")
legend()
title("For peak in single-unit change malleability")
savefig("$(plotsdir())/optimizationprotocols/optimization-protocol-test2-averageneighborfrequencies-versus-ownfrequency.png")
ax.set_xscale("log")
ax.set_yscale("log")
savefig("$(plotsdir())/optimizationprotocols/optimization-protocol-test2-averageneighborfrequencies-versus-ownfrequency-loglog.png")


#TEST 3 - Comparing J
function adjvec_to_adjmat_symmetric(v_adjl)
    # v_adjl = adjvec_to_adjlist(v_adj)
    N = length(v_adjl)
    m_adj = zeros(Int64, (N,N))
    for i=1:N
        m_adj[i,v_adjl[i]] .= 1
    end
    @assert(issymmetric(m_adj))
    return m_adj
end
function network_degrees(A)
    (N, N) = size(A)
    m_deg = zeros(Int64, (N,N))
    for i=1:N
        m_deg[i,i] = Int64(sum(A[i,:]))
    end
    return m_deg
end 

A = adjvec_to_adjmat_symmetric(v_adjl)
D = network_degrees(A)
L = D - A

function synchrony_alignment(ωs, L)
    λs, vs = eigvals(L), eigvecs(L)
    J = 0
    N = size(L, 1)
    for j=2:N 
        J += (1/λs[j]^2) * dot(vs[:, j], ωs)^2
    end
    J = J/N 
end
# J_Rmax = synchrony_alignment(v_ω_Rmax, L)
# J_Rmin = synchrony_alignment(v_ω_Rmin, L)

Js = zeros(Float64, N+1)
# Js[1] = synchrony_alignment(v_ω, L)
for i = 0:N 
    d_params_2 = deepcopy(d_params); d_params_2["idx_unit"] = i
    v_ω = get_frequency(mchange, mfreq, d_params_2, DIR)
    Js[i+1] = synchrony_alignment(v_ω, L)
end

figure()
plot(Js, Vector(Rs), "o")
ylabel(L"R_i")
xlabel(L"J_i")
title("For peak in single-unit change malleability")
savefig("$(plotsdir())/optimizationprotocols/optimization-protocol-test3-synchronyalignment-versus-R.png")


dictnames = ["ku_ws_501_shuf_p_eps4"]
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, haslegend=true)

R_all = collectresults(dictname, quantifier; data_dir=data_dir)
Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
Δmax, idx_p = findmax(Δs)
p = R_all[idx_p, 1]
Rs = R_all[idx_p, 2:end]
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)
d_params = alldicts[idx_p]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
v_adjl = topology_params = get_topology(mtop, d_params, DIR)

A = adjvec_to_adjmat_symmetric(v_adjl)
D = network_degrees(A)
L = D - A


Js = zeros(Float64, N+1)
# Js[1] = synchrony_alignment(v_ω, L)
for i = 0:N 
    d_params_2 = deepcopy(d_params); d_params_2["shuffleid"] = i
    v_ω = get_frequency(mchange, mfreq, d_params_2, DIR)
    Js[i+1] = synchrony_alignment(v_ω, L)
end



figure()
plot(Js, Vector(Rs), "o")
ylabel(L"R_i")
xlabel(L"J_i")
title("For peak in shuffling malleability")
savefig("$(plotsdir())/optimizationprotocols/optimization-protocol-test3-synchronyalignment-versus-R-shuffling.png")









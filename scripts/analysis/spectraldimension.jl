include("general_plots.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")


ps = ["0", "0001", "001", "001311", "002955",  "005817", "006661", "008733", "01", "01145", "013111", "017191", "025809", "050802", "1"]
p = ps[1]
dictname = "ku_ws_501_shuf_eps_p$(p)"
allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)
d_params = alldicts[1]
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
v_adjl = topology_params = get_topology(mtop, d_params, DIR)

A = adjlist_to_adjmat(v_adjl)

function degrees(A) 
        k = [sum(A[i,:]) for i=1:size(A,1)]
end

function normalized_laplacian(A)
    L = zeros(size(A))
    k = degrees(A)
    for i = 1:N 
        for j=1:N
            if i == j 
                L[i,j] = 1 - A[i,j]/k[i]
            else
                L[i,j] = -A[i,j]/k[i]
            end
        end 
        return L

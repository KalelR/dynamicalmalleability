include("../general_plots.jl")  
using PyCall
rcParams = PyDict(matplotlib["rcParams"])
rcParams["mathtext.fontset"] = "custom"
rcParams["mathtext.rm"] = "Bitstream Vera Sans"
rcParams["mathtext.it"] = "Bitstream Vera Sans:italic"
rcParams["mathtext.bf"] = "Bitstream Vera Sans:bold"
#looks good also, but a bit different


# ------ 1. Varying shuffleid and probability; fixed everything else
# dictname =  "ku_ws_501_shuf_p_eps4"
dictname =  "ku_ws_501_shuf_p_eps451282"
quantifier = "Rstats"
data_dir = datadir()
R_all = collectresults(dictname, quantifier; data_dir=data_dir)

ps = R_all[:,1]
shuffleids = 0:20
# shuffleids = 0:15
R_all_slc = R_all[:, collect(shuffleids).+2] #at 2 to skip the ps

x_zero_offset = 0
function plot_colormesh_R(R_all, x, y; ax="", fig="", x_zero_offset=5e-5)
	if(ax == "" || fig == "") fig, ax = subplots(constrained_layout=true) end
	# x_plot = prepare_v(x) .+ x_zero_offset
	# y_plot = [y; y[end]+1]
	# y_plot = prepare_v(y)
	x_plot = x .+ x_zero_offset
	y_plot = y
	# y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="viridis", vmin=0, vmax=1)
        # c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="viridis", vmin=0, vmax=1, shading="gouraud")
	return fig, ax, c 
end
fig, ax, c = plot_colormesh_R(R_all_slc, ps, shuffleids, x_zero_offset=x_zero_offset)

ax.set_xscale("log")
ax.set_xticks([x_zero_offset, 1e-3, 1e-2, 1e-1, 1])
ax.set_xticklabels(["0", L"10^{-3}", L"10^{-2}", L"10^{-1}", "1"])
ax.set_yticks(collect(shuffleids))
ax.set_xlim(1e-2, 1)
# ax.set_yticklabels(string.(collect(shuffleids)))
ax.set_ylabel("Shuffle id")
ax.set_xlabel(L"p")

cbar = fig.colorbar(c, aspect=30, orientation="horizontal")
cbar.set_label(L"\langle R \rangle")
column = 3.54 ##1 column = 2.3 inches
width= 1.0 *column;
height=(6.0/6)*width;
fig.set_size_inches(width, height)
savefig("$(plotsdir())/paper/sensitivity-R-shuffleid-p.png")


#--------- 1.1 Plot delta R, instead of R
function plot_colormesh_R(R_all, x, y; ax="", fig="", x_zero_offset=5e-5)
	if(ax == "" || fig == "") fig, ax = subplots(constrained_layout=true) end
	# x_plot = prepare_v(x) .+ x_zero_offset
	# y_plot = [y; y[end]+1]
	x_plot = x .+ x_zero_offset
	y_plot = y
	# y_plot = prepare_v(y)
	# y = collect(1:N+1); x = [v_t; v_t[end]+1]
	extreme = maximum([maximum(R_all), abs(minimum(R_all))])
        # c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="seismic")#, vmin=-0.5, vmax=0.5)
        c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="seismic", vmin=-extreme, vmax=extreme)
        # c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="PuOr", vmin=-extreme, vmax=extreme)
	return fig, ax, c 
end
x_zero_offset = 0

ΔR = mapslices(x->x .- R_all_slc[:,1], Matrix(R_all_slc), dims=1)[:, 2:end]
fig, ax, c = plot_colormesh_R(ΔR, ps, shuffleids, x_zero_offset=0)
ax.set_xscale("log")
ax.set_xticks([x_zero_offset, 1e-3, 1e-2, 1e-1, 1])
ax.set_xticklabels(["0", L"10^{-3}", L"10^{-2}", L"10^{-1}", "1"])
ax.set_xlim(1e-2, 1)
ax.set_ylabel("Shuffle id")
ax.set_xlabel(L"p")
ax.tick_params(axis="both", direction="in", which="both")
ax.set_yticks([0, 5, 10, 15, 20])
# ax.set_yticks([0, 5, 10, 15])
ax.set_yticklabels(["1", "6", "11", "16", "21"])
cbar = fig.colorbar(c, aspect=30, orientation="horizontal")
cbar.set_label(L"\delta \langle R \rangle = \langle R \rangle_{\mathrm{shuffle\,id}} - \langle R \rangle_{\mathrm{unshuffled}}")
column = 3.54 ##1 column = 2.3 inches
width= 1.0 *column;
height=(6.0/6)*width;
fig.set_size_inches(width, height)
fileout = "$(plotsdir())/paper/sensitivity-R-shuffleid-p-alternative-deltaR.png"
savefig(fileout, dpi=500)
fileout = "$(plotsdir())/paper/sensitivity-R-shuffleid-p-alternative-deltaR.pdf"
savefig(fileout)

# ------2. Varying idxunit and omega_new
# dictname =  "ku_ws_501_unit_pselect_eps4_varyomeganew"
dictname = "ku_ws_501_unit_p008733_eps2_varyomeganew"
# dictname = "ku_ws_501_unit_p008733_eps7_varyomeganew"
quantifier = "Rstats"
data_dir = datadir()
R_all = collectresults(dictname, quantifier; data_dir=data_dir)

ω_new = [-10.0, -8.28643, -6.86649, -5.68987, -4.71487, -3.90694, -3.23746, -2.6827, -2.223, -1.84207, -1.52642, -1.26486, -1.04811, -0.86851, -0.71969, -0.59636, -0.49417, -0.40949, -0.33932, -0.28118, -0.233, -0.19307, -0.15999, -0.13257, -0.10985, -0.09103, -0.07543, -0.06251, -0.05179, -0.04292, -0.03556, -0.02947, -0.02442, -0.02024, -0.01677, -0.01389, -0.01151, -0.00954, -0.00791, -0.00655, -0.00543, -0.0045, -0.00373, -0.00309, -0.00256, -0.00212, -0.00176, -0.00146, -0.00121, -0.001, 0.0, 0.001, 0.00121, 0.00146, 0.00176, 0.00212, 0.00256, 0.00309, 0.00373, 0.0045, 0.00543, 0.00655, 0.00791, 0.00954, 0.01151, 0.01389, 0.01677, 0.02024, 0.02442, 0.02947, 0.03556, 0.04292, 0.05179, 0.06251, 0.07543, 0.09103, 0.10985, 0.13257, 0.15999, 0.19307, 0.233, 0.28118, 0.33932, 0.40949, 0.49417, 0.59636, 0.71969, 0.86851, 1.04811, 1.26486, 1.52642, 1.84207, 2.223, 2.6827, 3.23746, 3.90694, 4.71487, 5.68987, 6.86649, 8.28643, 10.0]
unitids = R_all[:,1]
R = R_all[:, 2:end]


# unitids = R_all[1:5:end,1]
# R = R_all[1:5:end, 2:end]

x_zero_offset = 0
function plot_colormesh_R(R_all, x, y; ax="", fig="", x_zero_offset=5e-5, cmap="viridis")
	if(ax == "" || fig == "") fig, ax = subplots(constrained_layout=true) end
	# x_plot = prepare_v(x) .+ x_zero_offset
	# y_plot = [y; y[end]+1]
	x_plot = x .+ x_zero_offset
	y_plot = y
	# y_plot = prepare_v(y)
	# y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x_plot, y_plot, (Matrix(R_all)), cmap=cmap)#, vmin=0, vmax=1)
        # c = ax.pcolormesh(x_plot, y_plot, (Matrix(R_all)), cmap=cmap, shading="gouraud")#, vmin=0, vmax=1)
	return fig, ax, c 
end
fig, ax, c = plot_colormesh_R(R, ω_new, unitids, x_zero_offset=x_zero_offset, cmap="viridis")
# δR = R .- R_unchanged
# fig, ax, c = plot_colormesh_R(δR, ω_new, unitids, x_zero_offset=x_zero_offset, cmap="viridis_r")

# ax.set_xscale("symlog", linthresh=1e-2, linscale=0.05)
ax.set_xscale("symlog", linthresh=3e-1, linscale=0.05)
xticks([-10, -1, 0, 1, 10])
xticks([-10, -1, -0.5, 0, 0.5, 1, 10])
ax.get_xaxis().set_major_formatter(matplotlib.ticker.ScalarFormatter())
ax.get_xaxis().set_tick_params(which="minor", size=0)
ax.get_xaxis().set_tick_params(which="minor", width=0) 
ax.set_yticks([1, 100, 200, 300, 400, 501])
ax.set_ylabel("Unit No.")
# ax.set_yticklabels(string.(collect(shuffleids)))
ax.set_ylabel("Switched unit id")
ax.set_xlabel(L"\omega_{\mathrm{new}}")
ax.tick_params(axis="both", direction="in", which="both")

cbar = fig.colorbar(c, aspect=30, orientation="horizontal")
cbar.set_label(L"\langle R \rangle")
column = 3.54 ##1 column = 2.3 inches
width= 1.0 *column;
height=(6.0/6)*width;
fig.set_size_inches(width, height)
# fileout = "$(plotsdir())/sensitivity/sensitivity-deltaR-omeganew-unitid-$(dictname).png"
fileout = "$(plotsdir())/sensitivity/sensitivity-deltaR-omeganew-unitid-$(dictname)-1inevery5unit.png"
# fileout = "$(plotsdir())/sensitivity/sensitivity-deltaR-omeganew-unitid-$(dictname)-shading_gouraud.png"
savefigure(fig, ax, fileout)

# fig, ax = subplots(subplot_kw=Dict("projection"=> "3d"))
# x = ω_new 
# y = unitids 
# X = x' .* ones(501)
# Y = ones(101)' .* y
# ax.plot_surface(X, Y, Matrix(R), cmap="viridis")

# ------2. Varying idxunit and omega_add
# dictname =  "ku_ws_501_unit_pselect_eps4_varyomegaadd"
# dictname = "ku_ws_501_unit_p008733_eps2_varyomegaadd"
# dictname = "ku_ws_501_unit_p008733_eps7_varyomegaadd"
dictname = "ku_ws_501_unit_p01145_eps451282_varyomegaadd"
# dictname = "ku_ws_501_unit_p019684_eps451282_varyomegaadd"
quantifier = "Rstats"
data_dir = datadir()
R_all = collectresults(dictname, quantifier; data_dir=data_dir)
        # [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
ω_add = [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0] 


unitids = R_all[:,1]
R = R_all[:, 2:end]

R_unchanged = R[:, 51]  # same simulation, delta omega = 0 on each unit so should have the same value of R
R_unchanged = R_unchanged[1]
δR = R .- R_unchanged

# selectunits = floor.(Int, range(1, 501, length=50))
selectunits = floor.(Int, range(1, 501, length=80))
δR = δR[selectunits, :]
unitids = unitids[selectunits]
x_zero_offset = 0
function plot_colormesh_R(R_all, x, y; ax="", fig="", x_zero_offset=5e-5, cmap="viridis")
	if(ax == "" || fig == "") fig, ax = subplots(constrained_layout=true) end
	x_plot = prepare_v(x) .+ x_zero_offset
	y_plot = [y; y[end]+1]
	# y_plot = prepare_v(y)
	# y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x_plot, y_plot, (Matrix(R_all)), cmap=cmap, vmin=-0.5, vmax=0.5)
        # c = ax.pcolormesh(x_plot, y_plot, (Matrix(R_all)), cmap=cmap)
	return fig, ax, c 
end
# fig, ax, c = plot_colormesh_R(δR, ω_add, unitids, x_zero_offset=x_zero_offset, cmap="viridis_r")
fig, ax, c = plot_colormesh_R(δR, ω_add, unitids, x_zero_offset=x_zero_offset, cmap="seismic")
# fig, ax, c = plot_colormesh_R(δR, ω_add, unitids, x_zero_offset=x_zero_offset, cmap="viridis")
# fig, ax, c = plot_colormesh_R(δR[1:5:500, :], ω_add, unitids[1:5:500], x_zero_offset=x_zero_offset, cmap="viridis_r")
idxright = findfirst(x->x==1, maximum(abs.(Matrix(δR[:, 52:end])), dims=1)[1,:] .> 0.1); ωright = ω_add[51+idxright]
idxleft = findlast(x->x==1, maximum(abs.(Matrix(δR[:, 1:51])), dims=1)[1,:] .> 0.1); ωleft = ω_add[idxleft+1]
ax.axvline(ωright, color="black", linestyle="--")
ax.axvline(ωleft, color="black", linestyle="--")


# ax.set_xscale("symlog", linthresh=3e-1, linscale=0.2)
# ax.set_xscale("symlog", linthresh=1e-2, linscale=0.01)
# xticks([-10, -1, -0.3, 0.3, 1, 10])
# ax.get_xaxis().set_major_formatter(matplotlib.ticker.ScalarFormatter())
# ax.get_xaxis().set_tick_params(which="minor", size=0)
# ax.get_xaxis().set_tick_params(which="minor", width=0) 
yticks([1, 100, 200, 300, 400, 501])
ax.set_ylabel("Unit No.")
# ax.set_xlabel(L"\delta \omega \equiv \omega_i - \omega_{i, \mathrm{original}}")
ax.set_xlabel(L"\delta \omega")
ax.tick_params(axis="both", direction="in", which="both")

cbar = fig.colorbar(c, aspect=30, orientation="horizontal")
# cbar.set_label(L"\delta \langle R \rangle")
cbar.set_label(L"\delta \langle R \rangle = \langle R \rangle_{\delta\omega} - \langle R \rangle_0}")
# cbar.set_label(L"\langle R \rangle - \langle R \rangle_0}")
column = 3.54 ##1 column = 2.3 inches
width= 1.0 *column;
height=(6.0/6)*width;
fig.set_size_inches(width, height)
fileout = "$(plotsdir())/paper/sensitivity/sensitivity-deltaR-deltaomega-unitid-$(dictname)-80unitsonly.png"
# fileout = "$(plotsdir())/sensitivity/sensitivity-deltaR-deltaomega-unitid-$(dictname)-every5units.png"
# savefigure(fig, ax, fileout)
savefig(fileout, dpi=500)
fileout = "$(plotsdir())/paper/sensitivity/sensitivity-deltaR-deltaomega-unitid-$(dictname)-80unitsonly.pdf"
savefig(fileout)


#3. Resampling topology
dictname =  "ku_ws_501_resampletopology_p_019684_eps451282_shuffleid_netid"
quantifier = "Rstats"
data_dir = datadir()
R_all = collectresults(dictname, quantifier; data_dir=data_dir)

shuffleids = 0:19
netids = [335, 221, 185, 6, 366, 202, 293, 473, 475, 9, 294, 111, 192, 282, 261, 19, 279, 191, 420, 94, 244]
R_all = Matrix(R_all[:,2:end])

x_zero_offset = 0
function plot_colormesh_R(R_all, x, y; ax="", fig="", x_zero_offset=5e-5, cmap="viridis")
	if(ax == "" || fig == "") fig, ax = subplots(constrained_layout=true) end
	x_plot = x .+ x_zero_offset
	y_plot = y
        # c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="viridis", vmin=0, vmax=1)
        c = ax.imshow(transpose(Matrix(R_all)), cmap=cmap, vmin=0, vmax=1, origin="lower")
	return fig, ax, c 
end

# fig, ax, c = plot_colormesh_R(R_all, shuffleids, 0:20, x_zero_offset=x_zero_offset, cmap="viridis")
fig, ax, c = plot_colormesh_R(R_all, shuffleids, 0:20, x_zero_offset=x_zero_offset, cmap="seismic")
ax.set_xticks([0, 4, 9, 14, 19])
ax.set_xticklabels(["1", "5", "10", "15", "20"])
ax.set_yticks([0, 4, 9, 14, 19])
ax.set_yticklabels(["1", "5", "10", "15", "20"])
ax.set_xlabel("Shuffle id")
ax.set_ylabel("Network id")
ax.set_xlim(-0.5,19.5)
# cbar = fig.colorbar(c, aspect=30, orientation="horizontal")
cbar = fig.colorbar(c, ax=ax)
cbar.set_label(L"\langle R \rangle")
column = 3.54 ##1 column = 2.3 inches
width= 1.0 *column;
height=(6.0/6)*width;
fig.set_size_inches(width, height)
ax.set_aspect("auto")

Rmaxs, idxs_cart = findmax(R_all, dims=2)
# idxs = [idx[1] for idx in idxs_cart][1,:]
for idx in idxs_cart[:,1]
	x = idx[1] -1
	y = idx[2] -1
	annotate("X", (x,y), ha="center", va="center" )
end


savefig("$(plotsdir())/paper/sensitivity/resampling-topology-sensitivity-networkid-shuffleid.png", dpi=500)


# #------ X? Coloring
# using Clustering, Distances
# dictname =  "ku_ws_501_shuf_p_eps4"
# quantifier = "Rstats"
# data_dir = datadir()
# min_neighbors = 1
# ε_optimal = 0.01

# function collectresults_singleparameter(dictname, quantifier, parameter; data_dir)
# 	names_results, _= get_resultnames(dictname, quantifier, ""; data_dir = data_dir)
# 	df = DataFrame()
# 	for (idx_name, name_result) in enumerate(names_results)
# 		df_trial = CSV.File(name_result, header=false) |> DataFrame
# 		idx_line = findall(x->x==parameter, df_trial[:,1])
# 		if length(idx_line) == 0 continue end
# 		idx_line = idx_line[1]
# 		df[!, string(idx_name)] = Vector(df_trial[idx_line, 2:end])
# 	end
# 	return df
# end


# # ps = [0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0]
# ps=[0.0, 0.001, 0.01, 0.08733, 0.1, 0.13111, 1.0]
# no_attractors = zeros(Int64, length(ps))
# # for (idx_p, p) ∈ enumerate(ps)
# @Threads.threads for idx_p =1:length(ps)
# 	p = ps[idx_p]
# 	println(idx_p)
# 	Rstats = Matrix(collectresults_singleparameter(dictname, "Rstats", p, data_dir=data_dir))
# 	# Rstats[3,:] ./= maximum(Rstats[3,:])
# 	features = Rstats
# 	no_attractors[idx_p], ball_radius, clusters, sizes = colourize(features, min_neighbors; ε_optimal=ε_optimal)
# 	# println(no_attractors[idx_p], ball_radius, sizes)
# end

# figure()
# ax=gca()
# plot(ps, no_attractors, "-")
# xscale("log")

# function colourize(features, min_neighbors; ε_optimal=0.0)
# 	if(ε_optimal == 0.0)	ε_optimal = optimal_radius(features; min_neighbors=min_neighbors) end
# 	clusters = dbscan(features, ε_optimal, min_neighbors=min_neighbors)
# 	clusters, sizes = sort_clusters_calc_size(clusters) 
# 	k = length(sizes[sizes .>= min_neighbors]) #number of real clusters (size above minimum
# 	return k, ε_optimal, clusters, sizes
# end

# function optimal_radius(features; min_neighbors)
# 	feat_ranges = maximum(features, dims=2)[:,1] .- minimum(features, dims=2)[:,1];
# 	# ϵ_grid = range(minimum(feat_ranges)/200, minimum(feat_ranges), length=200)
# 	ϵ_grid = range(0, 0.3, length=20)
# 	#TODO: this hard-coded 200 is perhaps not ideal. Should we change it?
# 	k_grid = zeros(size(ϵ_grid)) #number of clusters
# 	s_grid = zeros(size(ϵ_grid)) #min silhouette values (which we want to maximize)

# 	#vary ϵ to find the best one (which will maximize the minimum sillhoute)
# 	for i=1:length(ϵ_grid)
# 		clusters = dbscan(features, ϵ_grid[i], min_neighbors=min_neighbors)
# 		dists = pairwise(Euclidean(), features)
# 		class_labels = cluster_props(clusters, features)
# 		if length(clusters) ≠ 1 #silhouette undefined if only one cluster.
# 		sils = silhouettes(class_labels, dists) #values == 0 are due to boundary points
# 		nonzero_sils = sils[sils .!= 0.0]
# 		if(length(nonzero_sils) == 0) s_grid[i] = -1; continue end
# 		s_grid[i] = minimum(nonzero_sils) #minimum silhouette value of core points
# 		else
# 		#TODO: what should be done in this case?
# 		s_grid[i] = -2; #this would effecively ignore the single-cluster solution
# 		end
# 	end

# 	max, idx = findmax(s_grid)
# 	ϵ_optimal = ϵ_grid[idx]
# end

# """
# Util function for classify_solution. It returns the size of all the DBSCAN clusters and the
# assignment vector, in whch the i-th component is the cluster index of the i-th feature
# """
# function cluster_props(clusters, data; include_boundary=true)
#     assign = zeros(Int, size(data)[2])
#     for (idx, cluster) in enumerate(clusters)
#         assign[cluster.core_indices] .= idx
#         if cluster.boundary_indices != []
#             if include_boundary
#                 assign[cluster.boundary_indices] .= idx
#             else
#                 assign[cluster.boundary_indices] .= -1
#             end
#         end
#     end
#     return assign
# end
# """
# Util function for classify_solution. Calculates the clusters' (DbscanCluster) size and sorts
# them according in decrescent order according to the size.
# """
# function sort_clusters_calc_size(clusters)
#     sizes = [cluster.size for cluster in clusters]
#     idxsort = sortperm(sizes,rev=true)
#     return clusters[idxsort], sizes[idxsort]
# end




# # quantifier = "Rstats"
# # dictname = "ku_ws_501_unit_p_eps4"
# # # dictname = "ku_ws_501_unit_p_eps2" #Deltamax = 0.53
# # # dictname = "ku_ws_501_unit_p_eps8" #Deltamax = 0.9452
# # # dictname = "ku_ws_501_unit_eps_p013111" #0.44
# # # dictname = "ku_ws_501_unit_eps_p008733" #0.78
# # # dictname = "ku_ws_501_unit_eps_p007627" #0.69"
# # # dictname = "ku_ws_501_unit_eps_p01" #0.7
# # # dictname = "ku_ws_501_unit_p_eps4"
# # R_all = collectresults(dictname, quantifier; data_dir=data_dir)
# # control_parameter = R_all[:,1]
# # R_all = R_all[:,2:end]

# # Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
# # max, idxmaxΔ = findmax(Δs)
# # cpmax = control_parameter[idxmaxΔ]

# # maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# # minR, idxminR = findmin(R_all[idxmaxΔ, :])


# # fig, axs = plot_R(control_parameter, R_all; x_zero_offset =5e-5, xscale="log")
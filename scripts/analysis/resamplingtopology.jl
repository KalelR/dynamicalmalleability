# To plot <R> versus eps and p for all the cases
include("general_plots.jl")
epsilon_colors = ["#0000cc", "#ff8000", "#e60000"]
epsilon_colors_weaker =  ["#3333ff", "#ffa64d", "#ff6666"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
width = 1; height=1;
# width = 1/2; height=0.6;

ylabel1 = L"\langle R \rangle"
ylabel2 = L"{\langle R \rangle}_{max} - {\langle R \rangle}_{min}"
v_ylabel=[ylabel1, ylabel2]

p_xlabel=[L"p"]
e_xlabel=[L"\epsilon"]
alpha_xlabel=[L"\alpha"]
# p_offset = 5e-5
p_offset = 0.0003
linewidths = [0.8, 1.2]
tick_size=7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels
linewidths = [1.3,1.3]#[0.8, 1.2]
tick_size=9#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =12#10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels

# fmt = "png"
fmt = "pdf"
quantifier = "Rstats"


m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
v_xticks = [p_offset, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (p_offset, 1+0.1)
v_xlabel= p_xlabel
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
dictnames = ["ku_ws_501_resampletopology_p_eps451282"]
fileout="$(plotsdir())/resamplingtopology/malleability-$(dictnames[1]).png"
fig, axs= plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths)


# minorticks_off()
idx_quantity=2
R_all = collectresults(dictnames[1], quantifier; data_dir=data_dir, idx_quantity)
ps = Vector(R_all[:,1])
R_all = Matrix(R_all[:, 2:end])
Δs = mapslices(gap, R_all[:, 2:end], dims=2)

maxdelta, idx = findmax(Δs)
p = ps[idx[1]]
idxs_sort = sortperm(R_all[idx[1], :])
println("$(idxs_sort[1:10]), $(idxs_sort[end-10:end])")


# ------------------------------------------------------------------- SENSITIVITY ------------------------------------------------------------------ #
dictname =  "ku_ws_501_resampletopology_p_019684_eps451282_shuffleid_netid"
quantifier = "Rstats"
data_dir = datadir()
R_all = collectresults(dictname, quantifier; data_dir=data_dir)

shuffleids = 0:19
netids = [335, 221, 185, 6, 366, 202, 293, 473, 475, 9, 294, 111, 192, 282, 261, 19, 279, 191, 420, 94, 244]
R_all = Matrix(R_all[:,2:end])

x_zero_offset = 0
function plot_colormesh_R(R_all, x, y; ax="", fig="", x_zero_offset=5e-5)
	if(ax == "" || fig == "") fig, ax = subplots(constrained_layout=false) end
	x_plot = x .+ x_zero_offset
	y_plot = y
        # c = ax.pcolormesh(x_plot, y_plot, transpose(Matrix(R_all)), cmap="viridis", vmin=0, vmax=1)
        c = ax.imshow(transpose(Matrix(R_all)), cmap="viridis", vmin=0, vmax=1, origin="lower")
	return fig, ax, c 
end



fig, ax, c = plot_colormesh_R(R_all, shuffleids, 0:20, x_zero_offset=x_zero_offset)
ax.set_xticks(collect(shuffleids))
ax.set_yticks(0:20)
ax.set_xlabel("Shuffle id")
ax.set_ylabel("Network id")

# cbar = fig.colorbar(c, aspect=30, orientation="horizontal")
cbar = fig.colorbar(c, ax=ax)
cbar.set_label(L"\langle R \rangle")
column = 3.54 ##1 column = 2.3 inches
width= 1.0 *column;
height=(6.0/6)*width;
# fig.set_size_inches(width, height)
fig.tight_layout(pad=0.3)

Rmaxs, idxs_cart = findmax(R_all, dims=2)
# idxs = [idx[1] for idx in idxs_cart][1,:]
for idx in idxs_cart[:,1]
	x = idx[1] -1
	y = idx[2] -1
	annotate("X", (x,y), ha="center", va="center" )
end


savefig("$(plotsdir())/resamplingtopology/sensitivity-networkid-shuffleid.png")
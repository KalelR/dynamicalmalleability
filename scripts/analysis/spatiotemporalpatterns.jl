include("general_plots.jl")
using PyCall, DelimitedFiles
axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]

# --------------------------------------------------------------- Plot For varying p --------------------------------------------------------------- #
# colorR = "#098608"
colorR = "#d45b02"
align = false
# align = false

epsi = 4.10256
shuffleid = 0
ps = [0.001, 0.006, 1e-2, 0.02254, 0.08733, 1e-1, 0.15013, 1e0]
    
numL, numC = 1, length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (j, p) in enumerate(ps)
    phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
    Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
    ax=axs[j]
    global c
    c, _, t  = plot_spatiotemporal!(fig, ax, phasename; align=align)
    ax2 = plot_R!(fig, ax, Rname, t, j, i, numC)
end

# xlim = (3000, 4000); xticks=[]
# beautify_spatiotemporal!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align, hascbar=false)
axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
    axs[end, j].set_xticks([3000, 3500])
    s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
    axs[end, j].set_xlabel(L"t")
end
for i =1:numL
    axs[i, 1].set_ylabel("Unit No.")
    if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
    axs[i,1].set_yticks([1, 250, 501])
    # if(shuffle) axs[i, end].text(1.05, 0.5, "Shuffle No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
    if(shuffle) axs[i,end].set_title("Shuffle $(shuffleids[i])", x=1.6, y = 0.2, fontsize=label_size-3, rotation=-90, pad=5)
    else
    axs[i, end].text(1.42, 0.5, "Switched Unit\nNo = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
    end
end

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=1.2*column;
fig.set_size_inches(width, height)
fig.tight_layout(rect=[0.0, 0.0, 0.99, 1.0])
# fig.subplots_adjust(wspace=0.15)
fig.subplots_adjust(wspace=0.10, hspace=0.1)
filename = "$(plotsdir())/spatiotemporal/spatiotemporalpatterns-shuffling-$(dictname).png" 
if align==true filename = "$(plotsdir())/spatiotemporal/spatiotemporalpatterns-shuffling-aligned-$(dictname).png" end
mkpath(dirname(filename))
savefig(filename, dpi=300)




#One unit
ps = [0, 0.19684, 1.0] #unit
unitids = [0, 158, 298]
shuffleid = 0
align = false
# align = true
tend = "100000.00000000001"; ttrans = "0.0"; ps = [0.0, 0.08733, 0.19684, 1.0]; unitids = [0, 118, 391]
tend = "1e6"; ttrans = "0.0";
# tend = "3999.9999999999995"; ttrans = "1250.0"
ω_new = 3.0
epsi = 4.51282


numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_$(ω_new).dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_$(ω_new).dat"
        ax=axs[i,j]
        global c
        c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
        ax2 = plot_R!(fig, ax, Rname, t, j, i, numC)
    end
end
beautify_spatiotemporal_unit!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=unitids, shuffle=false, axes_grid1=axes_grid1, align=align)
axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
    axs[end, j].set_xticks([3000, 3500, 4000])
end

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
fig.tight_layout(rect=[0.0, 0.08, 1., 1.01])
# fig.subplots_adjust(wspace=0.15)
filename = "$(plotsdir())/spatiotemporal/spatiotemporalpatterns-oneunit-$(dictname).png"
if align==true filename = "$(plotsdir())/spatiotemporal/spatiotemporalpatterns-oneunit-aligned-$(dictname).png" end
mkpath(dirname(filename))
savefig(filename, dpi=300)
# savefig(filename)




# # ------------------------------------------------------------ PLOT FOR VARYING EPSILON ------------------------------------------------------------ #
# # colorR = "#098608"
# colorR = "#d45b02"
# align = true
# # align = false
# dictname = "ku_ws_501_shuf_eps_p013111_selectphases"
# p = 0.13111
# shuffleids = [0, 68, 381]
# shuffle = true
# epsis = [0.0, 0.61538,  1.02564,  1.4359,  2.05128, 3.07692, 4.10256, 5.12821, 8.0]
    




# numL, numC = length(shuffleids), length(epsis)
# fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

# for (i, shuffleid) in enumerate(shuffleids)
#     for (j, epsi) in enumerate(epsis)
#         phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/phases-control_epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
#         Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/Rt-control_epsi_$(epsi)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
#         ax=axs[i,j]
#         global c
#         c, _, t  = plot_spatiotemporal!(fig, ax, phasename; align=align)
#         ax2 = plot_R!(fig, ax, Rname, t, j, i, numC)
#     end
# end
# # xlim = (3000, 4000); xticks=[]
# # beautify_spatiotemporal!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align, hascbar=false)
# axs[1,1].set_xlim(3000, 4000)
# for j=1:numC 
#     axs[end, j].set_xticks([3000, 3500])
#     s  = "\\epsilon = $(epsis[j])"; axs[1,j].set_title(latexstring(s))
#     axs[end, j].set_xlabel(L"t")
# end
# for i =1:numL
#     axs[i, 1].set_ylabel("Unit No.")
#     if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
#     axs[i,1].set_yticks([1, 250, 501])
#     # if(shuffle) axs[i, end].text(1.05, 0.5, "Shuffle No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
#     if(shuffle) axs[i,end].set_title("Shuffle $(shuffleids[i])", x=1.6, y = 0.2, fontsize=label_size-3, rotation=-90, pad=5)
#     else
#     axs[i, end].text(1.42, 0.5, "Switched Unit\nNo = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
#     end
# end

# column = 3.54 ##1 column = 2.3 inches
# width= 3.5 *column;
# height=1.2*column;
# fig.set_size_inches(width, height)
# fig.tight_layout(rect=[0.0, 0.0, 0.99, 1.0])
# # fig.subplots_adjust(wspace=0.15)
# fig.subplots_adjust(wspace=0.10, hspace=0.1)
# filename = "$(plotsdir())/spatiotemporal/spatiotemporalpatterns-shuffling-$(dictname).png" 
# if align==true filename = "$(plotsdir())/spatiotemporal/spatiotemporalpatterns-shuffling-aligned-$(dictname).png" end
# mkpath(dirname(filename))
# savefig(filename, dpi=300)




# #One unit
# ps = [0, 0.19684, 1.0] #unit
# unitids = [0, 158, 298]
# shuffleid = 0
# align = false
# # align = true


# numL, numC = length(unitids), length(ps)
# fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

# for (i, unitid) in enumerate(unitids)
#     for (j, p) in enumerate(ps)
#         phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
#         Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
#         ax=axs[i,j]
#         global c
#         c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
#         ax2 = plot_R!(fig, ax, Rname, t, j, i, numC)
#     end
# end
# beautify_spatiotemporal_unit!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=unitids, shuffle=false, axes_grid1=axes_grid1, align=align)
# axs[1,1].set_xlim(3000, 4000)
# for j=1:numC 
#     axs[end, j].set_xticks([3000, 3500, 4000])
# end

# column = 3.54 ##1 column = 2.3 inches
# width= 2.0 *column;
# height=(4.0/6)*width;
# fig.set_size_inches(width, height)
# fig.tight_layout(rect=[0.0, 0.08, 1., 1.01])
# # fig.subplots_adjust(wspace=0.15)
# filename = "$(plotsdir())/paper/spatiotemporalpatterns-oneunit.png"
# if align==true filename = "$(plotsdir())/paper/spatiotemporalpatterns-oneunit-aligned.png" end
# mkpath(dirname(filename))
# savefig(filename, dpi=300)
# # savefig(filename)







# # --- Determine the shuffleids and probabiltiies to use 
# #Shuffling
# quantifier = "Rstats"
# dictname = "ku_ws_501_shuf_p_eps4"
# # dictname = "ku_ws_501_unit_p_eps4"
# dictname = "ku_ws_501_shuf_eps_p013111"
# R_all = collectresults(dictname, quantifier; data_dir=data_dir)
# control_parameter = R_all[:,1]
# R_all = R_all[:,2:end]
# fig, axs = plot_R(control_parameter, R_all; x_zero_offset =5e-5, xscale="log")

# Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
# max, idxmaxΔ = findmax(Δs)
# cpmax = control_parameter[idxmaxΔ]

# maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# minR, idxminR = findmin(R_all[idxmaxΔ, :])


# julia> max, idxmaxΔ = findmax(Δs)
# (0.94506, 28)

# cpmax = control_parameter[idxmaxΔ]
# 0.13111

# maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# (0.97088, Symbol("68"))
# Shuffleid = 68 - 1

# julia> minR, idxminR = findmin(R_all[idxmaxΔ, :])
# (0.00672, Symbol("381"))

# Shuffleid = 381 - 1


# #One unit

# julia> cpmax = control_parameter[idxmaxΔ]
# 0.19688999999999998

# julia> maxR, idxmaxR = findmax(R_all[idxmaxΔ, :])
# (0.96418, Symbol("159"))

# julia> minR, idxminR = findmin(R_all[idxmaxΔ, :])
# (0.01912, Symbol("299"))




# --------------------------------------------------- Instantaneous frequencies for changing unit -------------------------------------------------- #
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
std = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
shuffleid = 0
epsi = 4.51282
# epsi = 8.0
# ps = [0.0, 0.19684, 1.0]
ps = [0.0, 0.08733, 0.19684, 1.0]
# tend = "3999.9999999999995"; ttrans = "1250.0"
# tend = "100000.00000000001"; ttrans = "0.0"
tend = "1e6"; ttrans = "0.0";

numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all", squeeze=false)
global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, std, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsi, v_adjl)
        data = readdlm(phasename);
        data = data[1:10:end, :]
        v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        ax=axs[i,j]
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x, y, Ωs', cmap="viridis", vmin=-0.08, vmax=-0.05)
    end
end

plot_handle = c
ax = axs[end,2]
axins = axes_grid1.inset_axes(ax,
           width="250%",  # width = 5% of parent_bbox width
           height="10%",  # height : 50%
           loc="upper center",
        #    bbox_to_anchor=(0.0, -1.52, 1, 1), #x0, y0, width height
           bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
           bbox_transform=ax.transAxes,
           borderpad=0,
           )
cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
cbar.set_label(L"\theta", fontsize=label_size)
cbar.solids.set_edgecolor("face")
# cbar.set_ticks(-pi:pi:pi)
# cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align)

# axs[1,1].set_xlim(0,20000)

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
fig.subplots_adjust(bottom=0.4)
filename = "$(plotsdir())/paper/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit-tend_$(tend).png" 
# filename = "$(plotsdir())/paper/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit-tend_$(tend)-zoomin.png" 
# filename = "$(plotsdir())/paper/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit-tend_$(tend)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)

# --------------------------------------------------- Average instantaneous frequencies for changing unit -------------------------------------------------- #
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")

N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
std = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
shuffleid = 0
epsi = 4.51282
# ps = [0.0, 0.19684, 1.0]
ps = [0.0, 0.08733, 0.19684, 1.0]
# tend = "3999.9999999999995"; ttrans = "1250.0"
tend = "100000.00000000001"; ttrans = "0.0"
# tend = "1e6"; ttrans = "0.0"; ps = [0.0]

numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_$(ω_new).dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, std, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsi, v_adjl)
        data = readdlm(phasename);
        data = data[10000:1:end, :]
        v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        println(length(v_t))
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        ax=axs[i,j]
        # c = ax.scatter(1:N, mean(Ωs, dims=1), color="black", s=10)
        # c = ax.scatter(v_ω, mean(Ωs, dims=1), color="black", s=10)
        c = ax.scatter(v_ω, maximum(Ωs, dims=1), color="black", s=10)
    end
end

axs[end, 2].set_xlabel("Unit No.")
axs[2,1].set_ylabel(L"\langle \dot{\theta} \rangle")
axs[1,1].set_xlim(0, 501)
for i=1:numC axs[end,i].set_xticks([1, 100, 200, 300, 400, 501]) end


column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
# fig.subplots_adjust(bottom=0.2)
filename = "$(plotsdir())/paper/spatiotemporal/meanfrequencies-per-unitnumbers-oneunit.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


# --------------------------------------------------- Phases and R for changing unit, without having Rt printed -------------------------------------------------- #
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
std = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
shuffleid = 0
epsi = 4.51282
# ps = [0.0, 0.19684, 1.0]
ps = [0.0, 0.08733, 0.19684, 1.0]
# tend = "3999.9999999999995"; ttrans = "1250.0"
tend = "100000.00000000001"; ttrans = "0.0"
# tend = "1e6"; ttrans = "0.0"
tend = "1e6"; ttrans = "0.0";

numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        data = readdlm(phasename);
        data = data[1:10:end, :]
        v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Rs = order_parameter(m_θ)
        ax=axs[i,j]
        global c
        # c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x, y, m_θ', cmap="twilight", vmin=-π, vmax=+π)
        ax2 = plot_R!(fig, ax, Rs, v_t, j, i, numC)
    end
end

# axs[1,1].set_xlim(0,20000)

# plot_handle = c
# ax = axs[end,2]
# axins = axes_grid1.inset_axes(ax,
#            width="250%",  # width = 5% of parent_bbox width
#            height="10%",  # height : 50%
#            loc="upper center",
#         #    bbox_to_anchor=(0.0, -1.52, 1, 1), #x0, y0, width height
#            bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
#            bbox_transform=ax.transAxes,
#            borderpad=0,
#            )
# cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
# cbar.set_label(L"\theta", fontsize=label_size)
# cbar.solids.set_edgecolor("face")
# cbar.set_ticks(-pi:pi:pi)
# cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align)


column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
fig.set_size_inches(width, height)
fig.subplots_adjust(bottom=0.4)
# filename = "$(plotsdir())/paper/spatiotemporal/phases-and-R-oneunit-omeganew_$(ω_new)-tend_$(tend).png" 
# filename = "$(plotsdir())/paper/spatiotemporal/phases-and-R-oneunit-omeganew_$(ω_new)-tend_$(tend)-zoomin.png" 
filename = "$(plotsdir())/paper/spatiotemporal/phases-and-R-oneunit-p_0-omeganew_$(ω_new)-tend_$(tend).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


# ------------------------------------- Plotting frequency synchronizaiton measures for the sims plotted above ------------------------------------- #

DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
σ = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
shuffleid = 0
epsi = 4.51282
# epsi = 8.0
# ps = [0.0, 0.19684, 1.0]
ps = [0.0, 0.08733, 0.19684, 1.0]
# tend = "3999.9999999999995"; ttrans = "1250.0"
# tend = "100000.00000000001"; ttrans = "0.0"
tend = "1e6"; ttrans = "0.0";

numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all", squeeze=false)
global c
for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, σ, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsi, v_adjl)
        data = readdlm(phasename);
        data = data[1:10:end, :]
        v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)

        meanfreq = mean(Ωs, dims=1)[1,:]
        iqis, stds, deltas = sync_freq_insta(Ωs, v_t)

        ax=axs[i,j]
        ax.plot(v_t, iqis, "-", label="iqi")
        ax.plot(v_t, stds, "-", label="std", alpha=0.4)
        ax.plot(v_t, deltas, "-", label="gap", alpha=0.2)
    end
end
axs[1,1].legend()

axs[1,1].set_ylim(1e-6, 0.1)
axs[1,1].set_yscale("log")

axs[1,1].set_xscale("log")
axs[1,1].set_xlim(1,1e6)

column = 3.54 ##1 column = 2.3 inches
width= 2.0 *column;
height=(4.0/6)*width;
# fig.set_size_inches(width, height)
# fig.subplots_adjust(bottom=0.4)
# filename = "$(plotsdir())/paper/spatiotemporal/frequencysynchronization-oneunit-tend_$(tend).png" 
# filename = "$(plotsdir())/paper/spatiotemporal/frequencysynchronization-oneunit-tend_$(tend)-zoomin.png" 
filename = "$(plotsdir())/paper/spatiotemporal/frequencysynchronization-oneunit-tend_$(tend)-loglog.png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)







# ------------------------------------------------ Video phases per idx unit for several time points ----------------------------------------------- #
using DrWatson
@quickactivate "malleability"
# using GLMakie,  ParameterizedFunctions, DelimitedFiles
using CairoMakie,  ParameterizedFunctions, DelimitedFiles
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
σ = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
shuffleid = 0
epsi = 4.51282
# epsi = 8.0
# ps = [0.0, 0.19684, 1.0]
ps = [0.0, 0.08733, 0.19684, 1.0]
# tend = "3999.9999999999995"; ttrans = "1250.0"
# tend = "100000.00000000001"; ttrans = "0.0"
tend = "1e6"; ttrans = "0.0";
DIR = projectdir()
data_dir =datadir()

framerate = 20
datastep = 10
dataduration = datastep *1000
dataduration_2 = datastep *1000
videotstep= 2


datastep = 2
dataduration = datastep *1000
dataduration_2 = datastep *1000
videotstep= 1

for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        data = readdlm(phasename);
        # datacut = data[1:datastep:dataduration, :]
        datacut = [data[1:datastep:dataduration, :]; data[end-dataduration_2:datastep:end, :] ]
        v_t = datacut[:,1]; m_θ = datacut[:, 2:end]; m_θ = mod.(m_θ, 2pi); m_θ_t = transpose(m_θ)
        GC.gc()

        idxunits = 1:N
        timestamps = range(1, length(v_t), step=1)
        time = Observable(1)
        ys = @lift(m_θ[$time, :])
        fig = scatter(idxunits, ys, color = :black, markersize = 10, axis = (title = @lift("t = $(round(v_t[$time], digits = 1))"), xlabel=L"\mathrm{idx\;unit}", ylabel=L"\theta", xlabelsize = 22, ylabelsize = 22), figure = (resolution = (800, 600),))
        limits!(0,N, 0, 2pi)
        filename = "$(plotsdir())/paper/spatiotemporal/animations/phases-per-idxunit-oneunit-tend_$(tend)-unitid_$(unitid)-p_$(p)-datastep_$(datastep)-framerate_$(framerate)-videotend_$(dataend).mp4"; mkpath(dirname(filename))
        record(fig, filename, timestamps; framerate = framerate) do t
            time[] = t
        end

        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, σ, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsi, v_adjl)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        meanfreqs = mean(Ωs, dims=1)[1,:]
        meanfreq = mean(meanfreqs)
        m_θ_sub = similar(m_θ)
        for i=1:N 
            m_θ_sub[:, i] = mod.(  m_θ[:, i] .- mod.(meanfreq .* v_t, 2π), 2π)
        end
        
        idxunits = 1:N
        timestamps = range(1, length(v_t), step=videotstep)
        time = Observable(1)
        ys = @lift(m_θ_sub[$time, :])
        fig = scatter(idxunits, ys, color = :black, markersize = 10, axis = (title = @lift("t = $(round(v_t[$time], digits = 1))"), xlabel=L"\mathrm{idx\;unit}", ylabel=L"\theta - \Omega t", xlabelsize = 22, ylabelsize = 22), figure = (resolution = (800, 600),))
        limits!(0,N, 0, 2pi)
        filename = "$(plotsdir())/paper/spatiotemporal/animations/subtractedaverage-phases-per-idxunit-oneunit-tend_$(tend)-unitid_$(unitid)-p_$(p)-datastep_$(datastep)-framerate_$(framerate)-videotend_$(dataend)-videotstep_$(videotstep).mp4"; mkpath(dirname(filename))
        record(fig, filename, timestamps; framerate = framerate) do t
            time[] = t
        end

    end
end



# fig, axs = subplots()
# for i=1:N 
#     plot(Ωs[:, i])
# end
# axs.axvline(meanfreq)
# --------------------------------------------------- CHANGING EPSILON (05/april) -------------------------------------------------- #
dictname = "ku_ws_501_shuf_eps_select_p_select_units_select_phases_tend1000k_3"
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
system_function = kuramotonetwork!
ω_new = 3.0
N = 501
k = 2 
seednet = 1
mu = 0.0
σ = 1.0
seedfreq = 0 
unitids = [0, 118, 391]
shuffleid = 0
epsis_real = [0.0, 0.61538, 2.05128, 4.51282, 6.5641, 6.97436, 8.0]
epsis = [0.0, 0.61538, 2.05128, 4.51282, "6.564099999999999", 6.97436, 8.0]
ps = [0.0, 0.08733, 0.19684, 1.0]
tend = "1e6"; ttrans = "0.0";

p = ps[4]
numL, numC = length(unitids), length(epsis)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
global c
for (i, unitid) in enumerate(unitids)
    for (j, epsi) in enumerate(epsis)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        data = readdlm(phasename);
        data = data[1:10:end, :]
        v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Rs = order_parameter(m_θ)
        ax=axs[i,j]
        global c
        # c, _, t  = plot_spatiotemporal!(fig, ax, phasename, align=align)
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x, y, m_θ', cmap="twilight", vmin=-π, vmax=+π)
        ax2 = plot_R!(fig, ax, Rs, v_t, j, i, numC)
        ax.set_title("$(epsi)")
    end
end

for i=2:numL
    idxunit = unitids[i]
    for j=1:numC 
        axs[i,j].axhline(idxunit, linestyle="dashed", color="#FF0D00", alpha=0.8, linewidth=2.5)
    end 
end

# axs[1,1].set_xlim(0,20000)

# plot_handle = c
# ax = axs[end,2]
# axins = axes_grid1.inset_axes(ax,
#            width="250%",  # width = 5% of parent_bbox width
#            height="10%",  # height : 50%
#            loc="upper center",
#         #    bbox_to_anchor=(0.0, -1.52, 1, 1), #x0, y0, width height
#            bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
#            bbox_transform=ax.transAxes,
#            borderpad=0,
#            )
# cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
# cbar.set_label(L"\theta", fontsize=label_size)
# cbar.solids.set_edgecolor("face")
# cbar.set_ticks(-pi:pi:pi)
# cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align)


# column = 3.54 ##1 column = 2.3 inches
# width= 2.0 *column;
# height=(4.0/6)*width;
# fig.set_size_inches(width, height)
# fig.subplots_adjust(bottom=0.4)
# filename = "$(plotsdir())/paper/spatiotemporal/phases-and-R-oneunit-omeganew_$(ω_new)-tend_$(tend).png" 
# filename = "$(plotsdir())/paper/spatiotemporal/phases-and-R-oneunit-omeganew_$(ω_new)-tend_$(tend)-zoomin.png" 
filename = "$(plotsdir())/spatiotemporal/phases-and-R-oneunit-p_$(p)-epsis-omeganew_$(ω_new)-tend_$(tend).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


# Insta freqs
numL, numC = length(unitids), length(epsis)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all", squeeze=false)
global c
for (i, unitid) in enumerate(unitids)
    for (j, epsi) in enumerate(epsis)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, σ, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsis_real[j], v_adjl)
        data = readdlm(phasename);
        data = data[1:20:end, :]
        v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        meanfreqs = mean(Ωs, dims=1)[1,:]
        statsfreqs = stats_q(meanfreqs)
        iqi = statsfreqs[6] - statsfreqs[5]
        vmax = statsfreqs[1] + 1.5*iqi; vmin = statsfreqs[1] - 1.5*iqi
        iqis, stds, deltas = sync_freq_insta(Ωs, v_t)

        ax=axs[i,j]
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        c = ax.pcolormesh(x, y, Ωs', cmap="viridis", vmin=vmin, vmax=vmax)
        fig.colorbar(c, ax=ax)
        ax.set_title("$(epsi), $(round(mean(iqis), digits=5))\n$(round(mean(stds), digits=5))")
    end
end

# plot_handle = c
# ax = axs[end,2]
# axins = axes_grid1.inset_axes(ax,
#            width="250%",  # width = 5% of parent_bbox width
#            height="10%",  # height : 50%
#            loc="upper center",
#         #    bbox_to_anchor=(0.0, -1.52, 1, 1), #x0, y0, width height
#            bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
#            bbox_transform=ax.transAxes,
#            borderpad=0,
#            )
# cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
# cbar.set_label(L"\theta", fontsize=label_size)
# cbar.solids.set_edgecolor("face")
# cbar.set_ticks(-pi:pi:pi)
# cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
# beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align)

# axs[1,1].set_xlim(0,20000)

# column = 3.54 ##1 column = 2.3 inches
# width= 2.0 *column;
# height=(4.0/6)*width;
# fig.set_size_inches(width, height)
# fig.subplots_adjust(bottom=0.4)
filename = "$(plotsdir())/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit-p_$(p)-epsis-tend_$(tend).png" 
# filename = "$(plotsdir())/paper/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit-tend_$(tend)-zoomin.png" 
# filename = "$(plotsdir())/paper/spatiotemporal/instantaneousfrequencies-per-unitnumbers-oneunit-tend_$(tend)-epsi_$(epsi).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


#video 
using DrWatson
@quickactivate "malleability"
# using GLMakie,  ParameterizedFunctions, DelimitedFiles
using CairoMakie,  ParameterizedFunctions, DelimitedFiles
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
DIR = projectdir()
data_dir =datadir()
framerate = 20
datastep = 10
dataduration = datastep *1000
dataduration_2 = datastep *1000
videotstep= 2


datastep = 2
dataduration = datastep *1000
dataduration_2 = datastep *1000
videotstep= 1

for (i, unitid) in enumerate(unitids)
    for (j, epsi) in enumerate(epsis)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-mstudy_phases-seedic_0-seednet_1/phases-control_epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_$(tend)-ttrans_$(ttrans)-ω_new_3.0.dat"
        data = readdlm(phasename);
        # datacut = data[1:datastep:dataduration, :]
        datacut = [data[1:datastep:dataduration, :]; data[end-dataduration_2:datastep:end, :] ]
        v_t = datacut[:,1]; m_θ = datacut[:, 2:end]; m_θ = mod.(m_θ, 2pi); m_θ_t = transpose(m_θ)
        GC.gc()

        idxunits = 1:N
        timestamps = range(1, length(v_t), step=1)
        time = Observable(1)
        ys = @lift(m_θ[$time, :])
        fig = scatter(idxunits, ys, color = :black, markersize = 10, axis = (title = @lift("t = $(round(v_t[$time], digits = 1)), p = $(p), epsi = $(epsi)"), xlabel=L"\mathrm{idx\;unit}", ylabel=L"\theta", xlabelsize = 22, ylabelsize = 22), figure = (resolution = (800, 600),))
        limits!(0,N, 0, 2pi)
        filename = "$(plotsdir())/spatiotemporal/animations/phases-per-idxunit-oneunit-tend_$(tend)-unitid_$(unitid)-p_$(p)-epsi_$(epsi)-datastep_$(datastep)-framerate_$(framerate)-videotend_$(dataduration).mp4"; mkpath(dirname(filename))
        record(fig, filename, timestamps; framerate = framerate) do t
            time[] = t
        end

        v_adjl = get_wattsstrogatz(N, p, k, seednet, DIR)
        v_ω_original = get_frequency_gauss(N, mu, σ, seedfreq, shuffleid, DIR)
        v_ω = alt_frequency_oneunit(unitid,  ω_new, v_ω_original)
        v_p = params(v_ω, epsis_real[j], v_adjl)
        Ωs = instafreqs(v_t, m_θ, v_p, system_function)
        meanfreqs = mean(Ωs, dims=1)[1,:]
        meanfreq = mean(meanfreqs)
        m_θ_sub = similar(m_θ)
        for i=1:N 
            m_θ_sub[:, i] = mod.(  m_θ[:, i] .- mod.(meanfreq .* v_t, 2π), 2π)
        end
        
        idxunits = 1:N
        timestamps = range(1, length(v_t), step=videotstep)
        time = Observable(1)
        ys = @lift(m_θ_sub[$time, :])
        fig = scatter(idxunits, ys, color = :black, markersize = 10, axis = (title = @lift("t = $(round(v_t[$time], digits = 1)), p = $(p), epsi = $(epsi)"), xlabel=L"\mathrm{idx\;unit}", ylabel=L"\theta - \Omega t", xlabelsize = 22, ylabelsize = 22), figure = (resolution = (800, 600),))
        limits!(0,N, 0, 2pi)
        filename = "$(plotsdir())/spatiotemporal/animations/subtractedaverage-phases-per-idxunit-oneunit-tend_$(tend)-unitid_$(unitid)-p_$(p)-epsi_$(epsi)-datastep_$(datastep)-framerate_$(framerate)-videotend_$(dataduration)-videotstep_$(videotstep).mp4"; mkpath(dirname(filename))
        record(fig, filename, timestamps; framerate = framerate) do t
            time[] = t
        end

    end
end
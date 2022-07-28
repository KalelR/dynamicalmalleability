
include("../general_plots.jl")
using PyCall, DelimitedFiles
axes_grid1 = pyimport("mpl_toolkits.axes_grid1.inset_locator")
# PyCall.PyDict(plt."rcParams")["text.latex.preamble"] = [raw"\usepackage{siunitx}",raw"\usepackage{amsmath}", raw"\usepackage{amssymb}"]
data_dir = datadir()
# --------------------------------------------------------------- Plot For varying p --------------------------------------------------------------- #
# colorR = "#098608"
colorR = "#d45b02"
align = false
# align = false
dictname = "ku_lyap_ws_501_shuf_p_ic_3_selectphases"
epsi = 4.10256
shuffleid = 0
seedic = 1
ps = [0.001, 0.006, 1e-2, 0.02254, 0.08733, 1e-1, 0.15013, 1e0]
    
numL, numC = length(ps), 1
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (j, p) in enumerate(ps)
    phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_$(seedic)-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_25499.999999999996-ttrans_0.0.dat"
    Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_$(seedic)-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_25499.999999999996-ttrans_0.0.dat"
    ax=axs[j]
    global c
    c, _, t  = plot_spatiotemporal!(fig, ax, phasename; align=align)
    ax2 = plot_R!(fig, ax, Rname, t, 1, j, numC)
end

# xlim = (3000, 4000); xticks=[]
# beautify_spatiotemporal!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align, hascbar=false)
# axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
#     axs[end, j].set_xticks([3000, 3500])
    axs[end, j].set_xlabel(L"t")
end
for i =1:numL
    s  = "\\mathrm{p} = $(ps[i])"; axs[i].set_title(latexstring(s), x=1.05, y = 0.2, fontsize=label_size-5, rotation=-90, pad=8)
#     axs[i, 1].set_ylabel("Unit No.")
    axs[i,1].set_yticks([1, 250, 501])
end
# fig.suptitle("Seed ic = $(seedic)")

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=2*column;
fig.set_size_inches(width, height)
fig.tight_layout()
# fig.subplots_adjust(wspace=0.15)
fig.subplots_adjust(wspace=0.10, hspace=0.1)
filename = "$(plotsdir())/lyapunovs/spatiotemporalpatterns-in-lyapunovs-shuffling-$(dictname).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)




#One unit
ps = [0, 0.19684, 1.0] #unit
unitids = [0, 158, 298]
shuffleid = 0
align = false
# align = true


numL, numC = length(unitids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (i, unitid) in enumerate(unitids)
    for (j, p) in enumerate(ps)
        phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/phases-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
        Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/Rt-control_p_$(p)-epsi_$(epsi)-idx_unit_$(unitid)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
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



# -------------------------------------------------------------- Phases with lyapunovs ------------------------------------------------------------- #

function plot_spatiotemporal!(fig, ax, phasename, lyap_t; align=false, xticks=[], xlim=())
        data = CSV.File(phasename, header=false) |> DataFrame
        m_θ = Matrix(data); m_θ = mod.( m_θ, 2pi) .- pi;
        t_end, N = size(m_θ)
        v_t = range(lyap_t[1], lyap_t[end], length=t_end)
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        if(align) idxperm = sortperm(m_θ[:,1]); m_θ = m_θ[idxperm, :]; end #-----align phases!
        c = ax.pcolormesh(x, y, m_θ', cmap="twilight", vmin=-pi, vmax=pi)
        return c, m_θ, v_t
end

function plot_R!(v_R, fig, ax, Rname, t, j=0, i=1, numC=0; colorR="red")
    ax2 = ax.twinx()
    ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
    ax2.set_ylim(0,1)
    ax2.tick_params(axis="y", colors=colorR)
    ax2.yaxis.label.set_color(colorR)

    if(j != numC) ax2.set_yticks([]) end
    if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
    return ax2 
end

include("$(srcdir())/quantifiers.jl")

# colorR = "#098608"
colorR = "#d45b02"
align = false
# align = false
dictname = "ku_lyap_ws_501_shuf_p_25000QRs_states"
epsi = 4.10256
shuffleid = 0
seedic = 1
ps = [0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0]
 
numL, numC = length(ps), 1
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")
include("$(srcdir())/analysis/lyapunovs_src.jl")

for (j, p) in enumerate(ps)
    phasename = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/phases2-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
    Rname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/Rt-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
    lyapsname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-mintegration_lyapunovs_states-seedic_0-seednet_1/conv_lyapu_spectrum-control_p_$(p)-dt_qr_1.0-epsi_4.10256-mu_0.0-num_QRs_25000-seedfreq_0-shuffleid_0-std_1.0-tend_3000.0-ttrans_conv_10-ttrans_steady_2500.dat"
    ax=axs[j]
    global c
    lyap_t, lyaps = get_finite_time_lyapunovs(lyapsname)


    c, m_θ, t  = plot_spatiotemporal!(fig, ax, phasename, lyap_t; align=align)
    Rs = order_parameter(m_θ)
    ax2 = plot_R!(Rs, fig, ax, Rname, t, 1, j, numC)
end

# xlim = (3000, 4000); xticks=[]
# beautify_spatiotemporal!(fig, axs; xticks=xticks, xlim=xlim, plot_handle = c, ps=ps, shuffleids=shuffleids, axes_grid1=axes_grid1, align=align, hascbar=false)
# axs[1,1].set_xlim(3000, 4000)
for j=1:numC 
#     axs[end, j].set_xticks([3000, 3500])
    axs[end, j].set_xlabel(L"t")
end
for i =1:numL
    s  = "\\mathrm{p} = $(ps[i])"; axs[i].set_title(latexstring(s), x=1.05, y = 0.2, fontsize=label_size-5, rotation=-90, pad=8)
#     axs[i, 1].set_ylabel("Unit No.")
    axs[i,1].set_yticks([1, 250, 501])
end
# fig.suptitle("Seed ic = $(seedic)")

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=2*column;
fig.set_size_inches(width, height)
fig.tight_layout()
# fig.subplots_adjust(wspace=0.15)
fig.subplots_adjust(wspace=0.10, hspace=0.1)
filename = "$(plotsdir())/lyapunovs/real-spatiotemporalpatterns-in-lyapunovs-shuffling-$(dictname).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


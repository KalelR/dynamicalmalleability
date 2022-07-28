#Plot mean R, max R, min R against topology (either p or alpha)

DIR = pwd()[1:findfirst("Malleability", pwd())[1]-1] * "Malleability"
include("$(DIR)/Analysis/Plotters/generic-plotters.jl")
include("$(DIR)/src/Kuramoto/current-parameters.jl")
using Statistics
# label_size -= 1.0

function collect_data(v_files, v_parameters; hasheader=true)
    m_data = []
    for (idx, par) in enumerate(v_parameters)
            fileName = v_files[idx]
            if(!isfile(fileName)) println("No such file: $(fileName)"); continue end
            if(hasheader) data = readdlm(fileName, header=true)[1]
            else data = readdlm(fileName) end
            if(idx == 1) m_data = zeros(Float64, (length(v_parameters), size(data)[1], size(data)[2])) end
            m_data[idx, :, :] = data
    end
    return m_data
end



function plot_allrealizationsy_deltay_versus_x(idx_data, v_par_realizations2, v_par_control, m_files, ; v_colors = ["black"], numbins=10, s_sharex="none", s_sharey="none", v_bins=[], v_xlabel=[""], v_ylabel=[""], v_title=[""], v_sidetext=[""], width="", height="", x_zero_offset=0.0, islog=true, m_yticks=[], v_xticks=[], v_xticklabels=[], v_xlim=(), v_colors2=["gray"], haslegend=false)

        numL = 2
        numC = 1
        fig, axs = subplots(numL, numC, squeeze=false, constrained_layout=true, sharex=s_sharex, sharey=s_sharey)
        # color2 = "#e6b800"
        # color2= "#1f601f"
        color2="#006600"
        color3 = "#422057FF"
        line1 = 0; line2 = 0
        for (idx_c, par_control) in enumerate(v_par_control)
                idx = 1
                v_files = m_files[idx_c]
                if(typeof(v_par_realizations2) == Array{UnitRange{Int64}, 1})
                        v_par_realizations = v_par_realizations2[idx_c]
                        # m_data = collect_data(v_files, v_par_realizations[idx_c])
                        # println(v_par_realizations)
                else
                        v_par_realizations = v_par_realizations2
                end
                        println(v_par_realizations)
                        m_data = collect_data(v_files, v_par_realizations)

                v_x = m_data[1,:,1]
                m_y = m_data[:,:,idx_data] #each realization is in a diff row, for each one, y verus x is along cols
                # v_meany = mean(m_y, dims=1)[1,:] #takes average over all realizations, so size  should be 1x(number of parameters)
                v_maxy = maximum(m_y, dims=1)[1,:] #takes average over all realizations, so size  should be 1x(number of parameters)
                v_miny = minimum(m_y, dims=1)[1,:] #takes average over all realizations, so size  should be 1x(number of parameters)
                v_x[1] += x_zero_offset;
                # for i=1:length(v_par_realizations)
                for i=length(v_par_realizations):-1:1
                        if (i==1) color1 = v_colors[idx_c]; alpha1=1.0
                        else color1=v_colors2[idx_c]; alpha1=0.05
                        end
                        if(i==1) line1=axs[1,idx].plot(v_x, m_y[i,:], "-", color=color1, alpha=alpha1, label="Unperturbed frequencies")
                        elseif(i == 2) line2=axs[1,idx].plot(v_x, m_y[i,:], "-", color=color1, alpha=alpha1, label="Switching one unit")
                        else axs[1,idx].plot(v_x, m_y[i,:], "-", color=color1, alpha=alpha1)
                        end
                end
                if (haslegend)
                    lg = axs[1,idx].legend([line1, line2], ["Original sequence", "Switching one unit"] )
                    handles, labels = axs[1,1].get_legend_handles_labels()
                    order = [2,1]
                    lg=axs[1,idx].legend([handles[idx] for idx in order],[labels[idx] for idx in order], fontsize=label_size-5)
                    for lh in lg.legendHandles
                            # lh._legmarker.set_alpha(1)
                            lh.set_alpha(1)
                    end
                end
                if(islog) axs[1 ,idx].set_xscale("log") end
                # # axs[1, idx].spines["top"].set_visible(false);

                v_stdy = std(m_y, dims=1)[1,:] #takes average over all realizations, so size  should be 1x(number of parameters)
                v_deltay = v_maxy .- v_miny
                # axs[2, idx].plot(v_x, v_deltay, "o-", color="C0")
                # axs[2, idx].plot(v_x, v_deltay, "o-", color=color2, label=L"\Delta")
                axs[2, idx].plot(v_x, v_deltay, "-", color=v_colors[idx_c], label=L"\Delta")
                # ax2 = axs[2,idx].twinx()
                # ax2.plot(v_x, v_stdy, "s-", color=color3, alpha=1.0, label=L"\chi")
                # ax2.set_ylabel(L"\chi", fontsize=label_size, color=color3)
                # ax2.tick_params(axis="y", colors=color3)
                # axs[2,idx].tick_params(axis="y", colors=color2)
                if(islog) axs[2 ,idx].set_xscale("log") end


                axs[1, idx].spines["top"].set_visible(false);
                axs[1, idx].spines["right"].set_visible(false);
                axs[2, idx].spines["top"].set_visible(false);
                axs[2, idx].spines["right"].set_visible(false);
        end

        axs[1,1].set_ylim(bottom=0)
        axs[2,1].set_ylim(bottom=0)
        # if(m_xticks != []) for i=1:size(m_xticks)[1] for j = 1:size(m_xticks)[2] axs[i,j].set_xticks(m_xticks[i,j,:]) end end
        # if(m_xticklabels != []) for i=1:size(m_xticklabels)[1] for j = 1:size(m_xticklabels)[2] axs[i,j].set_xticklabels(m_xticklabels[i,j, :]) end end
        # for i=1:numL, j=1:numC axs[i, j].spines["top"].set_visible(false); axs[i, j].spines["right"].set_visible(false); end

        # axs[2,1].tick_params(axis="y", colors=color2)
        for i=1:numC
                axs[end,i].set_xlabel(v_xlabel[i], fontsize=label_size)
        end
        for i=1:numL
                # axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", color2][i])
                axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", "black"][i])
        end
        axs[1,1].set_yticks(m_yticks[1])
        axs[2,1].set_yticks(m_yticks[2])
        if(v_xticks != []) axs[end,1].set_xticks(v_xticks)end
        if(v_xticklabels != []) axs[end,1].set_xticklabels(v_xticklabels) end
        if(v_xlim != ()) axs[end,1].set_xlim(v_xlim) end
        # fig.align_ylabels(axs)
        column = 3.54 ##1 column = 2.3 inches
        if(width!="" && height != "") width *= column; height *= width; fig.set_size_inches(width, height) end
        return fig, axs
end


#************8888Run codes by using inclue, not copy pasting!!!************************8

k = 2 #default
# v_p_rewiring = [1e-3, 4e-3, 8e-3, 1e-2, 2e-2, 4e-2, 5e-2, 6e-2, 7e-2, 8e-2, 9e-2, 1e-1, 2e-1, 3e-1, 4e-1, 4.5e-1, 4.8e-1, 4.9e-1, 5e-1, 7e-1, 9e-1, 1] #original, old, 22 values
# v_p_rewiring = [0, 1e-3, 4e-3, 8e-3, 1e-2, 1.5e-2, 2e-2, 4e-2, 5e-2, 6e-2, 7e-2, 8e-2, 9e-2, 1e-1,1.05e-1, 1.1e-1, 1.2e-1, 1.5e-1,1.8e-1, 2e-1, 3e-1, 4e-1, 4.5e-1, 4.8e-1, 4.9e-1, 5e-1, 7e-1, 9e-1, 1] #added vlaues to
v_p_rewiring = [0, 1e-4, 5e-4, 1e-3, 2e-3, 3e-3, 4e-3, 5e-3, 8e-3, 1e-2, 1.25e-2, 1.5e-2, 1.7e-2, 2e-2, 4e-2, 5e-2, 7e-2, 9e-2, 1e-1, 1.2e-1, 1.5e-1, 2e-1, 3e-1, 4e-1, 6e-1, 8e-1, 1] #more detail for N = 1002
seed_CI = 0
# v_idx_N = 1:N;
local_range = 2

#----------------- gaussian
N = 1001
k =4
idx_data = 2 # idx = 2 chooses mean(R(t)); idx = 3 chooses std(R(t)); 4 chooses max, 5 min
seednet = 1
v_seeds = [1]
shuffleid = 0
v_epsi = [2.0]
# v_epsi = [0.8]
epsi = v_epsi[1]
v_ω_new = [10.0]
ω_new = v_ω_new[1]
t_end = 2500.
t_trans = 1500.
μ = 0.
σ = 1.0


ylabel1 = ""
ylabel2 = ""


#---- WS
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
# v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
# v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
# v_xlim = (5e-5, 1+0.1)
# #---topology
# #1 - WS, 1 Neuron
# v_idx_N = 0:N
# m_files = [["$(DIR)/data/Results/RE/varyfreq/wattsstrogatz/N_$(N)-k_$(k)/gaussian/Rstats-eps_$(epsi)-idxN_$(idx_N)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_all-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new).dat" for idx_N in v_idx_N] for epsi in v_epsi]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_idx_N, v_epsi, m_files; v_colors=["black", "black", "black"], v_colors2=["gray", "gray", "gray"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"p"], width=1/2, height=6.0/6, x_zero_offset=5e-5, islog=true, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #half colum
# savefig("$(DIR)/data/Results/Paper/1.png", dpi=300)
# close("all"); GC.gc()

# ylabel1 = L"<\langle R \rangle"
# ylabel2 = L"<\Delta"
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_idx_N, v_epsi, m_files; v_colors=["black", "black", "black"], v_colors2=["gray", "gray", "gray"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"p"], width=1/2, height=6.0/6, x_zero_offset=5e-5, islog=true, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, haslegend=true) #half colum
# savefig("$(DIR)/data/Results/Paper/figelements-1.png", dpi=300)
# close("all"); GC.gc()

# #2 - WS, Shuffling
# ylabel1 = ""
# ylabel2 = ""
# v_shuffleid = 0:500
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.4, 0.8]]
# m_files = [["$(DIR)/data/Results/RE/Shuffles/wattsstrogatz/fixed-eps/N_$(N)-k_$(k)/gaussian/Rstats-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_all-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid).dat"
# for shuffleid in v_shuffleid] for epsi in v_epsi]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_shuffleid, v_epsi, m_files; v_colors=["black", "black", "black"], v_colors2=["gray", "gray", "gray"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"p"], width=1/2, height=6.0/6, x_zero_offset=5e-5, islog=true, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #half colum
# savefig("$(DIR)/data/Results/Paper/2.png", dpi=300)
# close("all"); GC.gc()

# #----coupling
# #3 - WS, 1Neuron, eps
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.3, 0.6]]
# v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 2.5, 5.0]; v_xlim = (0, 5)
# v_p_rewiring = [0.0, 0.02, 1.0]
# v_idx_N = 0:N;
# m_files = [["$(DIR)/data/Results/RE/varyfreq/wattsstrogatz/fixedp/N_$(N)-k_$(k)/gaussian/Rstats-eps_all-idxN_$(idx_N)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new).dat"
#  for idx_N in v_idx_N] for p_rewiring in v_p_rewiring]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_idx_N, v_p_rewiring, m_files;v_colors=["#0000cc", "#ff8000", "#e60000"], v_colors2 = ["#3333ff", "#ffa64d", "#ff6666"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"\epsilon"], width=1/2, height=6.0/6, x_zero_offset=0, islog=false, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #
# savefig("$(DIR)/data/Results/Paper/3.png", dpi=300)
# close("all"); GC.gc()


# # #4 - WS, Shuffling, eps
# v_p_rewiring = [0.0, 0.02, 1.0]
# v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 2.5, 5.0]; v_xlim = (0, 5)
# v_p_rewiring = [0.0, 0.02, 1.0]
# v_shuffleid = 0:500 #was missing p = 1.0, running now
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.4, 0.8]]
# m_files = [["$(DIR)/data/Results/RE/Shuffles/wattsstrogatz/fixed-p/N_$(N)-k_$(k)/gaussian/Rstats-eps_all-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid).dat"
#  for shuffleid in v_shuffleid] for p_rewiring in v_p_rewiring]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_shuffleid, v_p_rewiring, m_files;v_colors=["#0000cc", "#ff8000", "#e60000"], v_colors2 = ["#3333ff", "#ffa64d", "#ff6666"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"\epsilon"], width=1/2, height=6.0/6, x_zero_offset=0, islog=false, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #
# savefig("$(DIR)/data/Results/Paper/4b.png", dpi=300)
# close("all"); GC.gc()

#---- PL
t_end = 1000.
t_trans = 500.
v_alpha = [0, 0.5, 1.0, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0, 2.1, 2.2, 2.4, 2.5, 3.0]
N = 501

#---topology
v_epsi = [8.0]

# # #5 - PL, 1 Neuron
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.2, 0.4]]
# v_xticks = [0, 1, 2, 3]; v_xticklabels = [L"0", L"1", L"2", L"3"]; v_xlim = (0, 3.0)
# v_idx_N = 0:N;
# m_files = [[ "$(DIR)/data/Results/RE/varyfreq/powerlaw/fixed-eps/Rstats-eps_$(epsi)-idxN_$(idx_N)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-powerlaw-$(N)-alpha_all-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new).dat"
#  for idx_N in v_idx_N] for epsi in v_epsi]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_idx_N, v_epsi, m_files; v_colors=["black", "black", "black"], v_colors2=["gray", "gray", "gray"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"\alpha"], width=1/2, height=6.0/6, x_zero_offset=0, islog=false, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #half colum
# savefig("$(DIR)/data/Results/Paper/5b.png", dpi=300)
# close("all"); GC.gc()

# #6 - PL, Shuffle
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.4, 0.8]]
# v_xticks = [0, 1, 2, 3]; v_xticklabels = [L"0", L"1", L"2", L"3"]; v_xlim = (0, 3.0)

# v = 0:300 #running for 500
# m_files = [["$(DIR)/data/Results/RE/Shuffles/powerlaw/fixed-eps/Rstats-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-powerlaw-$(N)-alpha_all-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid).dat"
#  for shuffleid in v] for epsi in v_epsi]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v, v_epsi, m_files;v_colors=["black", "black", "black"], v_colors2=["gray", "gray", "gray"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"\alpha"], width=1/2, height=6.0/6, x_zero_offset=0, islog=false, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #half colum
# savefig("$(DIR)/data/Results/Paper/6b.png", dpi=300)
# close("all"); GC.gc()

#-----eps
v_alpha = [0.5, 1.8, 2.5]
v_alpha = [2.5, 1.8, 0.5]
v_xlim = (0, 10)
#7 - PL, 1 Neuron, eps
v_idx_N = [0:100, 0:N, 0:N]
# v_idx_N = [0:N, 0:N, 0:N] #2.5 running
m_yticks = [[0., 0.5, 1.0], [0.0, 0.2, 0.4]]
v_xticks = [0, 5, 10]; v_xticklabels = [L"0", L"5", L"10"]; v_xlim = (0, 10.0)
m_files = [["$(DIR)/data/Results/RE/varyfreq/powerlaw/Rstats-eps_all-idxN_$(idx_N)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-powerlaw-$(N)-alpha_$(alpha)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new).dat"
 for idx_N in v_idx_N[idx]] for (idx, alpha) in enumerate(v_alpha)]; #
fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_idx_N, v_alpha, m_files;v_colors=["#0000cc", "#ff8000", "#e60000"], v_colors2 = ["#3333ff", "#ffa64d", "#ff6666"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"\epsilon"], width=1/2, height=6.0/6, x_zero_offset=0, islog=false, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #
savefig("$(DIR)/data/Results/Paper/7b.png", dpi=300)
# close("all"); GC.gc()

# #8 - PL, Shuffling, eps
# v_shuffleid = 0:200;
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.4, 0.8]]
# v_xticks = [0, 5, 10]; v_xticklabels = [L"0", L"5", L"10"]; v_xlim = (0, 10.0)
# m_files = [["$(DIR)/data/Results/RE/varyfreq/powerlaw/Rstats-eps_all-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-powerlaw-$(N)-alpha_$(alpha)-gaussian-mu_$(μ)-std_$(σ)-seed_$(seedfreq)-truncated-max_70-min_-70-shuffled-id_$(shuffleid).dat"
#  for shuffleid in v_shuffleid] for alpha in v_alpha]; #
# fig, axs = plot_allrealizationsy_deltay_versus_x(idx_data, v_shuffleid, v_alpha, m_files;v_colors=["#0000cc", "#ff8000", "#e60000"], v_colors2 = ["#3333ff", "#ffa64d", "#ff6666"], s_sharex="all", v_ylabel=[ylabel1, ylabel2], v_xlabel=[L"\epsilon"], width=1/2, height=6.0/6, x_zero_offset=0, islog=false, m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim) #
# savefig("$(DIR)/data/Results/Paper/8b.png", dpi=300)
# # close("all"); GC.gc()

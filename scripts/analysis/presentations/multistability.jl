include("../general_plots.jl")

#First, for shuffling 

dictname = "ku_ws_501_multi_eps_p013111"
# dictname = "ku_ws_501_unit_p_eps4"
R_all = collectresults(dictname, quantifier; data_dir=data_dir)
c_params = R_all[:,1]
R_all = R_all[:,2:end]
fig, axs = plot_R(c_params, R_all; x_zero_offset =5e-5, xscale="linear")
savefig("$(plotsdir())/paper/multistability-ws.png")


quantifier = "Rstats"
dictname = "ku_pl_501_multi_alpha_eps646154"
R_all = collectresults(dictname, quantifier; data_dir=data_dir)
c_params = R_all[:,1]
R_all = R_all[:,2:end]
fig, axs = plot_R(c_params, R_all; x_zero_offset =0, xscale="linear")
savefig("$(plotsdir())/paper/multistability-pl.png")




width = 1.0; height=1
ylabel1 = L"\langle R \rangle"
ylabel2 = L"{\langle R \rangle}_{max} - {\langle R \rangle}_{min}"
p_xlabel=[L"p"]
p_color = ["black", "black", "black"]
p_color_weaker = ["gray", "gray", "gray"]
p_offset = 5e-5
strongcolors = p_color; weakcolors = p_color_weaker; x_scale="log"; x_zero_offset = p_offset
m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 1.0]]
v_xticks = [5e-5, 1e-3, 1e-2, 1e-1, 1]
v_xticklabels = [L"0",  L"10^{-3}", L"10^{-2}", L"10^{-1}", L"1"]
v_xlim = (5e-5, 1+0.1)
v_xlabel= p_xlabel
v_ylabel=[ylabel1, ylabel2]
linewidths = [1.3,1.3]#[0.8, 1.2]
tick_size=9#7
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
label_size =12#10
rc("axes", labelsize=label_size)    # fontsize of the x and y labels

function beautify_plot!(fig, axs; v_xlabel=[""], v_ylabel=[""], v_title=[""], v_sidetext=[""], m_yticks=[], v_xticks=[], v_xticklabels=[], v_xlim=(), haslegend=false, kwargs...)
    numL = 2; numC = 1
    for ax in axs
        ax.spines["top"].set_visible(false);
        ax.spines["right"].set_visible(false);
    end

    if (haslegend)
        ax = axs[1]
        lines = ax.get_lines()
        lg = ax.legend([lines[end], lines[end-1]], ["Original IC", "Shuffling ICs"] )
        for lh in lg.legendHandles
                lh.set_alpha(1)
        end
    end


    axs[1,1].set_ylim(bottom=0)
    axs[2,1].set_ylim(bottom=0)

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
end 



dictname=["ku_ws_501_multi_p_eps4"]
quantifier = "Rstats"
# R_all = collectresults(dictname, quantifier; data_dir=data_dir)
# c_params = R_all[:,1]
# R_all = R_all[:,2:end]
# fig, axs = plot_R(c_params, R_all; x_zero_offset =5e-5, xscale="log")


fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-varyingics.png"
fig, axs= plot_R_all(dictname, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=true)
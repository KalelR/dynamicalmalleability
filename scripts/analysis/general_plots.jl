using DrWatson
@quickactivate "dynamicalmalleability"
using PyPlot#, CSV, DataFrames, Statistics
DIR = projectdir()
data_dir =datadir()
include("$(DIR)/src/drwatson-organization.jl")
include("$(DIR)/data/inputs/alldictionaries.jl")

# ----------------------------------------------------------------- PLOT PARAMETERS ---------------------------------------------------------------- #
font_size = 10 #pt; default in latex
label_size = 12
legend_size = 8
title_size = 12
tick_size = 8
rc("font", size=font_size)          # controls default text sizes
rc("axes", titlesize=1.1*font_size)     # fontsize of the axes title (title)
rc("axes", labelsize=label_size)    # fontsize of the x and y labels
rc("xtick", labelsize=tick_size)    # fontsize of the tick labels
rc("ytick", labelsize=tick_size)    # fontsize of the tick labels
rc("legend", fontsize=legend_size)    # legend fontsize
rc("figure", titlesize=title_size)  # fontsize of the figure title (suptitle)
column = 3.54 ##1 column = 2.3 inches


# #---------------- PLOT 
function beautify_plot!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false)
    numL, numC = size(axs)
    for j=1:numC
        axs[end, j].set_xlabel(L"t")

    end

    for i =1:numL
        axs[i, 1].set_ylabel("Unit No.")
        if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
        axs[i,1].set_yticks([1, 250, 501])

    end
end
function plot_R!(fig, ax, Rname, t, j=0, i=1, numC=0; colorR="red")
    data = readdlm(Rname); v_R = data[:,1]
    ax2 = ax.twinx()
    ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
    ax2.set_ylim(0,1)
    ax2.tick_params(axis="y", colors=colorR)
    ax2.yaxis.label.set_color(colorR)
    ax2.set_yticks([0, 0.5, 1.0])
    if(j != numC) ax2.set_yticks([]) end
    if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
    return ax2 
end


function plot_spatiotemporal!(fig, ax, phasename; align=false, xticks=[], xlim=())
        data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
        t_end, N = size(m_θ)
        y = collect(1:N+1); x = [v_t; v_t[end]+1]
        if(align) idxperm = sortperm(m_θ_t[:,1]); m_θ_t = m_θ_t[idxperm, :]; end #-----align phases!
        c = ax.pcolormesh(x, y, m_θ_t, cmap="twilight", vmin=-pi, vmax=pi)
        return c, m_θ_t, v_t
end
# """
# quantifierinsta = the insta quantifier, eg phases
# """
# function get_resultnames(dictname, quantifier, quantifierinsta; data_dir = "", saveformat=".dat")
#     allparams, paramtypes = return_dict(dictname)
#     v_ignore_params = ["dtana"]
#     dicts = dict_list(allparams)
#     keys_NP, keys_NP2, keys_RP, keys_CP, dicts_NP, dicts_NP2, dicts_RP, dicts_CP = get_dict_types(dicts, paramtypes)
#     inst_resultnames  = [];     resultnames = [];
#     for (i1, d1) in enumerate(dicts_NP)
#         for (i11, d11) in enumerate(dicts_NP2)
#             for (i2, d2) in enumerate(dicts_RP)
#                 for i3=1:length(dicts_CP)
#                     d3 = dicts_CP[i3];  d = merge(d1, d11, d2, d3)
#                     inst_resultname =  resultname(quantifierinsta, d1, d11, d2, d3, v_ignore_params,saveformat; data_dir=data_dir)
#                     push!(inst_resultnames, inst_resultname)
#                 end
#                 cp = collect(keys(dicts_CP[1]))[1]
#                 dict_CP_extra = deepcopy(dicts_CP[1])
#                 dict_CP_extra[cp] = "all"
#                 resname = resultname(quantifier, d1, d11, d2, dict_CP_extra, v_ignore_params, saveformat; data_dir=data_dir)
#                 push!(resultnames, resname)
#             end
#         end
#     end
#     return resultnames, inst_resultnames
# end

# # data_dir = datadir()
# # resultnames, inst_resultnames = get_resultnames("ku_ws_501_unit_eps_p007627", quantifier, "phases"; data_dir = data_dir )

# # Rall = collectresults("ku_ws_501_unit_eps_p007627", "Rstats"; data_dir=data_dir)
# # ----------------------------------------------------------------- COLLECT RESULTS ---------------------------------------------------------------- #
# """
# idx_quantity = 2 means the average of the stats_q over the quantifier
# """
# function collectresults(dictname::String, quantifier::String; idx_quantity=2, data_dir, realizationids=nothing)
#     names_results, _= get_resultnames(dictname, quantifier, ""; data_dir = data_dir)
#     df = collectresults(names_results, idx_quantity, realizationids)
# end


# function plot_R(R_all)
#     numrealizations = size(R_all)[2] - 1
#     fig, axs= subplots(2, sharex=true, constrained_layout=true)
#     for idx_realization = 1:numrealizations
#         alpha, color = (idx_realization == 1) ? (1.0, "black") : (0.1, "#006600")
#         axs[1].plot(R_all[:,1], R_all[:,1+idx_realization], "-", alpha=alpha, color=color)
#     end
#     Δs = [maximum(R_all[i,2:end]) - minimum(R_all[i,2:end]) for i=1:size(R_all)[1]]
#     # Δs = [std(R_all[i,2:end]) for i=1:size(R_all)[1]]
#     axs[2].plot(R_all[:,1], Δs, "-")
#     return fig, axs
# end


# function prepare_v(v)
#     v = collect(v)
#     offset = (v[end]-v[end-1])/2.0
#     return [v; v[end]+offset]
# end
# function plot_basins(v_u0, R; unit1, unit2, ax="", fig="", cmap="viridis")
#     if(ax == "" || fig == "") fig, ax = subplots(tight_layout=true) end

#     x = y = prepare_v(v_u0)
#     c = ax.pcolormesh(x,y, Matrix(R), cmap=cmap)
#     cbar = fig.colorbar(c, ax=ax)
#     s_ylabel = "\\theta_{$(unit2)}(0)"
#     s_xlabel = "\\theta_{$(unit1)}(0)"
#     ax.set_ylabel(latexstring(s_ylabel))
#     ax.set_xlabel(latexstring(s_xlabel))
#     ax.set_xticks([0, 3, 6])
#     ax.set_yticks([0, 3, 6])
#     cbar.set_label(L"\langle R \rangle", fontsize=label_size)
#     cbar.ax.tick_params(labelsize=tick_size)
#     return fig, ax, cbar
# end

# function plot_basins(v_u0, v_u02, R; unit1, unit2, ax="", fig="", cmap="viridis")
#     if(ax == "" || fig == "") fig, ax = subplots(tight_layout=true) end

#     x = prepare_v(v_u0)
#     y = prepare_v(v_u02)
#     c = ax.pcolormesh(x,y, Matrix(R), cmap=cmap)
#     cbar = fig.colorbar(c, ax=ax)
#     s_ylabel = "\\theta_{$(unit1)}(0)"
#     s_xlabel = "\\theta_{$(unit2)}(0)"
#     ax.set_ylabel(latexstring(s_ylabel))
#     ax.set_xlabel(latexstring(s_xlabel))
#     ax.set_xlim(v_u0[1], v_u0[end])
#     ax.set_ylim(v_u02[1], v_u02[end])
#     # ax.set_xticks([0, 3, 6])
#     # ax.set_yticks([0, 3, 6])
#     cbar.set_label(L"\langle R \rangle", fontsize=label_size)
#     cbar.ax.tick_params(labelsize=tick_size)
#     return fig, ax, cbar
# end

# """
# plots the attractor ids, not the data values themselves
# """
# function plot_basins_attractorids(v_u0, v_u02, R_all; unit1, unit2, ax="", fig="", cmap="viridis")
#     uniquevals = sort(unique(Matrix(R_all)))
#     idxs_uniquevals_data = [findall(x->x==uniqueval, Matrix(R_all)) for uniqueval in uniquevals]
#     attractor_ids = zeros(size(R_all))
#     for (attractor_id) = 1:length(idxs_uniquevals_data)
#         idxs_data = idxs_uniquevals_data[attractor_id]
#         attractor_ids[idxs_data] .=  attractor_id
#     end
#     # cmap_unique = matplotlib.cm.get_cmap(cmap, length(uniqueval-))
#     cmap_unique = matplotlib.cm.get_cmap(cmap, length(uniquevals))
#     # cmap_unique = cmap

#     if(ax == "" || fig == "") fig, ax = subplots(tight_layout=true) end

#     # x = prepare_v(v_u0)
#     # y = prepare_v(v_u02)
#     x =v_u0
#     y = v_u02
#     c = ax.pcolormesh(x,y, attractor_ids, cmap=cmap_unique, vmin=minimum(attractor_ids), vmax=maximum(attractor_ids)+1)
#     cbar = fig.colorbar(c, ax=ax, orientation="horizontal")
#     s_ylabel = "\\theta_{$(unit1)}(0)"
#     s_xlabel = "\\theta_{$(unit2)}(0)"
#     ax.set_ylabel(latexstring(s_ylabel))
#     ax.set_xlabel(latexstring(s_xlabel))
#     ax.set_xlim(v_u0[1], v_u0[end])
#     ax.set_ylim(v_u02[1], v_u02[end])
#     ax.tick_params(axis="both", direction="in", which="both")
#     cbar.solids.set_rasterized(true)
#     cbar.solids.set_edgecolor("face")
#     cbar.ax.tick_params(axis="both", direction="in", which="both")
#     cbar.set_ticks(collect(1:length(uniquevals)+1).+0.5)
#     cbar.set_ticklabels(string.(collect(1:length(uniquevals)+1)))
#     # ax.set_xticks([0, 3, 6])
#     # ax.set_yticks([0, 3, 6])
#     cbar.set_label(L"\mathrm{Attractor\;number,\;based\;on\;} \langle R \rangle", fontsize=label_size)
#     cbar.ax.tick_params(labelsize=tick_size)
#     return fig, ax, cbar, uniquevals, attractor_ids
# end


# function resize!(fig; width="", height="", kwargs...)
#     if (width != "")
#         column = 3.54
#         width = width*column; height *= height*column;
#         fig.set_size_inches(width, height)
#     end
# end

# function savefigure(fig, axs, fileout; width="", height="", kwargs...)
#     DrWatson.recursively_clear_path(fileout)
# 	mkpath(dirname(fileout))
#     # savefig(fileout, dpi=300, bbox_inches="tight")
#     savefig(fileout, dpi=300)
# end


# # ------------------------------------------------------------------ FOR <R> PLOTS ----------------------------------------------------------------- #


function gap(v1)
    maximum(v1) - minimum(v1)
end

function plot_R_all(dictnames, quantifier, fileout, idx_quantity=2; data_dir=data_dir, x_zero_offset=0, xscale="linear", strongcolors=["black"], weakcolors=["black"], kwargs...)
    fig = ""; axs = ""
    for (i, dictname) in enumerate(dictnames)
        R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
        cp = R_all[:,1]
        R_all = R_all[:,2:end]
        fig, axs = plot_R(cp, R_all; axs=axs, fig=fig, x_zero_offset=x_zero_offset, xscale=xscale, strongcolor=strongcolors[i], weakcolor=weakcolors[i], kwargs...)
    end
    resize!(fig; kwargs...)
    fig.tight_layout()
    fig.subplots_adjust(hspace=0.25, bottom=0.15, left=0.18, top=0.97, right=0.97)
    beautify_plot!(fig, axs; kwargs...)
    if(fileout != "") savefigure(fig, axs, fileout; kwargs...) end
    return fig, axs
end


# function plot_syncfreq_all(dictnames, quantifier, fileout, idx_quantity=2; data_dir=data_dir, x_zero_offset=0, xscale="linear", strongcolors=["black"], weakcolors=["black"], strongalpha=1.0, weakalpha=0.1, kwargs...)
#     fig = ""; axs = ""
#     for (i, dictname) in enumerate(dictnames)
#         R_all = collectresults(dictname, quantifier; data_dir=data_dir, idx_quantity)
#         cp = R_all[:,1]
#         R_all = R_all[:,2:end]
#         for j=1:size(R_all,2) R_all[:, j] = 1 .- R_all[:, j] ./ R_all[1,j] end
#         fig, axs = plot_R(cp, R_all; axs=axs, fig=fig, x_zero_offset=x_zero_offset, xscale=xscale, strongcolor=strongcolors[i], weakcolor=weakcolors[i], kwargs...)
#     end
#     resize!(fig; kwargs...)
#     fig.tight_layout()
#     fig.subplots_adjust(hspace=0.5, bottom=0.26, left=0.18, top=0.95, right=0.95)
#     beautify_plot!(fig, axs; kwargs...)
#     if(fileout != "") savefigure(fig, axs, fileout; kwargs...) end
#     return fig, axs
# end

# function plot_R(cp, R_all; axs="", fig="", x_zero_offset=0, xscale="linear", strongcolor="black", weakcolor="black", strongalpha=1.0, weakalpha=0.1, linewidths=[1.0,1.0], deltameasure="gap", kwargs...)
# # function plot_R(cp, R_all; axs="", fig="", x_zero_offset=0, xscale="linear", strongcolor="black", weakcolor="black", strongalpha=0.8, weakalpha=0.05, linewidths=[1.0,1.0], kwargs...)
#         if(axs == "" || fig == "") fig, axs = subplots(2, sharex=true, constrained_layout=true) end
#         cp .+= x_zero_offset;
#         numrealizations = size(R_all)[2] - 1
#         # for idx_realization = 1:numrealizations
#         for idx_realization = numrealizations:-1:1 #so that idxrealization is plotted on top
#                 alpha, color = (idx_realization == 1) ? (strongalpha, strongcolor) : (weakalpha, weakcolor)
#                 axs[1].plot(cp, R_all[:,idx_realization], "-", alpha=alpha, color=color, linewidth=linewidths[1])
#                 axs[1].tick_params(axis="both", direction="in", which="both")
#         end
#         if deltameasure == "gap"
#             Δs = [gap(R_all[i,:]) for i=1:size(R_all)[1]]
#         else
#             Δs = [std(R_all[i,:]) for i=1:size(R_all)[1]]
#         end
#         axs[2].plot(cp, Δs, "-", color=strongcolor, linewidth=linewidths[2])
#         axs[2].set_xscale(xscale)
#         axs[2].tick_params(axis="both", direction="in", which="both")
#         return fig, axs
# end




# """
# Lazy version
# """
# function beautify_plot!(fig, axs; v_xlabel=[""], v_ylabel=[""], v_title=[""], v_sidetext=[""], m_yticks=[], v_xticks=[], v_xticklabels=[], v_xlim=(), haslegend=false, kwargs...)
#     numL = 2; numC = 1
#     for ax in axs
#         ax.spines["top"].set_visible(false);
#         ax.spines["right"].set_visible(false);
#     end

#     if (haslegend)
#         ax = axs[1]
#         lines = ax.get_lines()
#         lg = ax.legend([lines[end], lines[end-1]], ["Original sequence", "Switching one unit"] )
#         for lh in lg.legendHandles
#                 lh.set_alpha(1)
#         end
#     end


#     axs[1,1].set_ylim(bottom=0)
#     axs[2,1].set_ylim(bottom=0)

#     for i=1:numC
#             axs[end,i].set_xlabel(v_xlabel[i], fontsize=label_size)
#     end
#     for i=1:numL
#             # axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", color2][i])
#             axs[i, 1].set_ylabel(v_ylabel[i], fontsize=label_size, color=["black", "black"][i])
#     end
#     if m_yticks != []
#         axs[1,1].set_yticks(m_yticks[1])
#         axs[2,1].set_yticks(m_yticks[2])

#         axs[1,1].set_ylim(0, m_yticks[1][end])
#         axs[2,1].set_ylim(0, m_yticks[2][end])
#     end
#     if(v_xticks != []) axs[end,1].set_xticks(v_xticks)end
#     if(v_xticklabels != []) axs[end,1].set_xticklabels(v_xticklabels) end
#     if(v_xlim != ()) axs[end,1].set_xlim(v_xlim) end
# end



# #------------ SPATIOTEMPORAL PATTERNS --------------
# function plot_spatiotemporal!(fig, ax, phasename; align=false, xticks=[], xlim=())
#         data = readdlm(phasename); v_t = data[:,1]; m_θ = data[:, 2:end]; m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
#         t_end, N = size(m_θ)
#         y = collect(1:N+1); x = [v_t; v_t[end]+1]
#         if(align) idxperm = sortperm(m_θ_t[:,1]); m_θ_t = m_θ_t[idxperm, :]; end #-----align phases!
#         c = ax.pcolormesh(x, y, m_θ_t, cmap="twilight", vmin=-pi, vmax=pi)
#         return c, m_θ_t, v_t
# end

# function plot_spatiotemporal!(fig, ax, m_θ::Matrix, v_t; align=false, xticks=[], xlim=())
#     m_θ = mod.( m_θ, 2pi) .- pi; m_θ_t = transpose(m_θ)
#     t_end, N = size(m_θ)
#     y = collect(1:N+1); x = [v_t; v_t[end]+1]
#     if(align) idxperm = sortperm(m_θ_t[:,1]); m_θ_t = m_θ_t[idxperm, :]; end #-----align phases!
#     c = ax.pcolormesh(x, y, m_θ_t, cmap="twilight", vmin=-pi, vmax=pi)
#     return c, m_θ_t, v_t
# end

# function plot_R!(fig, ax, Rname, t, j=0, i=1, numC=0; colorR="red")
#     data = readdlm(Rname); v_R = data[:,1]
#     ax2 = ax.twinx()
#     ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
#     ax2.set_ylim(0,1)
#     ax2.tick_params(axis="y", colors=colorR)
#     ax2.yaxis.label.set_color(colorR)

#     if(j != numC) ax2.set_yticks([]) end
#     if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
#     return ax2
# end

# function plot_R!(fig, ax, v_R::Vector, t, j=0, i=1, numC=0; colorR="red")
#     ax2 = ax.twinx()
#     ax2.plot(t, v_R, "-", color=colorR, linewidth=5);
#     ax2.set_ylim(0,1)
#     ax2.tick_params(axis="y", colors=colorR)
#     ax2.yaxis.label.set_color(colorR)

#     if(j != numC) ax2.set_yticks([]) end
#     if(j == numC) ax2.set_ylabel(L"R(t)", fontsize=label_size) end
#     return ax2
# end

# function beautify_spatiotemporal!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false, hascbar=true)
#     numL, numC = size(axs)
#     for j=1:numC
#         axs[end, j].set_xlabel(L"t")
#         # axs[1,ij].set_xticks([1500, 2000])
#         s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
#         # if xticks != [] axs[end,j].set_xticks(xticks) end
#     end

#     for i =1:numL
#         axs[i, 1].set_ylabel("Unit No.")
#         if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
#         axs[i,1].set_yticks([1, 250, 501])
#         if(shuffle) axs[i, end].text(1.35, 0.5, "Shuffle No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
#         else
#         axs[i, end].text(1.35, 0.5, "Switched Unit\nNo = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
#         end
#     end


#     # if xlim != () axs[1,1].set_xlim(xlim) end
#     if(hascbar)
#     ax = axs[end,2]
#     axins = axes_grid1.inset_axes(ax,
#                width="250%",  # width = 5% of parent_bbox width
#                height="10%",  # height : 50%
#                loc="upper center",
#             #    bbox_to_anchor=(0.0, -1.52, 1, 1), #x0, y0, width height
#                bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
#                bbox_transform=ax.transAxes,
#                borderpad=0,
#                )
#     cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
#     cbar.set_label(L"\theta", fontsize=label_size)
#     cbar.solids.set_edgecolor("face")
#     cbar.set_ticks(-pi:pi:pi)
#     cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
#     end
# end

# function beautify_spatiotemporal_unit!(fig, axs; xticks=xticks, xlim=xlim, plot_handle, ps, shuffleids, shuffle=true, axes_grid1, align=false)
#     numL, numC = size(axs)
#     for j=1:numC
#         axs[end, j].set_xlabel(L"t")
#         # axs[1,ij].set_xticks([1500, 2000])
#         s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
#         # if xticks != [] axs[end,j].set_xticks(xticks) end
#     end

#     for i =1:numL
#         axs[i, 1].set_ylabel("Unit No.")
#         if (align==true) axs[i, 1].set_ylabel("Aligned\n Unit No.") end
#         axs[i,1].set_yticks([1, 250, 501])
#         if(shuffle) axs[i, end].text(1.35, 0.5, "Shuffle No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
#         else
#         axs[i, end].text(1.35, 0.5, "Switched Unit\n   No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
#         end
#     end


#     # if xlim != () axs[1,1].set_xlim(xlim) end

#     ax = axs[end,2]
#     axins = axes_grid1.inset_axes(ax,
#                width="250%",  # width = 5% of parent_bbox width
#                height="10%",  # height : 50%
#                loc="upper center",
#                bbox_to_anchor=(0.0, -1.4, 1, 1), #x0, y0, width height
#             #    bbox_to_anchor=(0.0, -1.2, 1, 1), #x0, y0, width height
#                bbox_transform=ax.transAxes,
#                borderpad=0,
#                )
#     cbar=fig.colorbar(plot_handle, cax=axins, orientation="horizontal")
#     cbar.set_label(L"\theta", fontsize=label_size)
#     cbar.solids.set_edgecolor("face")
#     cbar.set_ticks(-pi:pi:pi)
#     cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
# end

# #----------------- SURFACES ----------------
# """
# If Z is size NxM, x should be size M, y should be size N
# """
# function meshgrid(x,y)
# 	X = x' .* ones(length(y))
# 	Y = ones(length(x))' .* y
# 	return X, Y
# end

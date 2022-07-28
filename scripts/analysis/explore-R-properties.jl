# To plot <R> versus eps and p for all the cases
include("general_plots.jl")

quantifier = "Rstats"
data_dir = datadir()

# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
# dictname = "ku_ws_501_shuf_eps_p008733"
# dictname = "ku_ws_501_unit_eps_p0"
# dictname = "ku_ws_501_unit_p_eps4"
# mode = "ic_shuffle"
# dictname = "ku_ws_501_shufics_eps_selected_p008733"
# dictname = "ku_ws_501_shufics_eps_selected_p013111" #acho que nao terminou de rodar
# dictname = "ku_ws_501_shufics_eps_selected_p1"
# dictname = "ku_ws_501_shufics_eps_selected_p0"

mode = "freq_shuffle"
# dictname = "ku_ws_501_shuf_eps_selected_p008733"
# dictname = "ku_ws_501_shuf_eps_selected_p013111" #acho que nao terminou de rodar
dictname = "ku_ws_501_shuf_eps_selected_p1"
# dictname = "ku_ws_501_shuf_eps_selected_p0"

allparams, paramtypes = return_dict(dictname)
alldicts = dict_list(allparams)

# idx =1
# idx = 8 #epsi = 1.43
# idx = 13 #2.46
# idx = 20 #3.89

# R_all = collectresults(dictname, quantifier; data_dir=data_dir) #normal
# R_all = collectresults(dictname, quantifier; data_dir=data_dir, realizationids=101:9500) #shuf
R_all = collectresults(dictname, quantifier; data_dir=data_dir, realizationids=601:10000) #shufics
@unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]


# bins = 0:0.01:1 #0.08733, 0.13111
bins = 0:0.005:1 #p = 1, 0
bins = 0:0.001:1 #p = 1, 0
bins = 0.25:0.001:0.35 #p = 1
bins = 0.08:0.0001:0.12 #p = 0
bins = 0.9925:0.00001:1.0 #p = 0
# for idx = [8, 13, 20] #for 1rst trial, with the 1rst dictnames
for idx in [1,2] #for eps_selected
epsi = R_all[idx,1]
R = Vector(R_all[idx, 2:end])
figure()
hist(R, bins=bins)
title("ϵ = $(epsi), p = $(p), number of shuffles = $(length(R)), $(mode)")
xlim(bins[1], bins[end])
savefig("$(plotsdir())/statistics-R/histogram_$(epsi)_p_$(p)_$(mode)_$(dictname)_$(bins).png", dpi=300)
end




# ---------------------------------------------------------- FREQUENCY AND IC DISTRIBUTION --------------------------------------------------------- #

function collectresults(names_results, idx_quantity, realizationids)
        df = DataFrames.DataFrame()
            # println("$(names_results)")
        if isnothing(realizationids) realizationids = 1:length(names_results) end
        # if isnothing(realizationids) realizationids = 1:10 end
        for (idx, idx_realization) in enumerate(realizationids)
            filename = names_results[idx_realization]
            if(isfile(filename) == false) println("No file $(filename)"); continue end
            df_single = CSV.File(filename, header=false) |> DataFrames.DataFrame
            if(idx == 1)
                df[!, "cp"] = df_single[:,1]
            end
            # println("$(idx_realization), $(df_single), $(filename)")
            df[!, string(idx)] = df_single[:,idx_quantity]
        end 
        return df
    end

density=false
ps = ["0", "008733", "013111", "1"]
ps = ["0", "008733", "013111", "019684", "1"]
fig, axs = subplots(length(ps),3, sharex="all", constrained_layout=true)


# fig, axs = subplots(4,3, sharex="none")
for (i, p) in enumerate(ps)
        dictname_f = "ku_ws_501_shuf_eps_selected_p$(p)"
        dictname_i = "ku_ws_501_shufics_eps_selected_p$(p)"



        allparams, paramtypes = return_dict(dictname_f); alldicts = dict_list(allparams)
        @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]

        R_all_i = collectresults(dictname_i, quantifier; data_dir=data_dir) #shufics
        R_all_f = collectresults(dictname_f, quantifier; data_dir=data_dir) #shufics


        # bins = 0:0.01:1 #0.08733, 0.13111
        bins = 0:0.005:1 #0.08733, 0.13111
        # bins = 0:0.005:1 #p = 1, 0
        # bins = 0:0.001:1 #p = 1, 0
        # bins = 0.25:0.001:0.35 #p = 1
        # bins = 0.08:0.0001:0.12 #p = 0
        # bins = 0.9925:0.00001:1.0 #p = 0
        # for idx = [8, 13, 20] #for 1rst trial, with the 1rst dictnames
        for j = 1:3 #for eps_selected
        epsi = R_all_i[j,1]
        R_i = Vector(R_all_i[j, 2:end])
        R_f = Vector(R_all_f[j, 2:end])
        axs[i,j].hist(R_f, bins=bins, color="purple", label="shuffling frequencies", density=density)
        axs[i,j].hist(R_i, bins=bins, color="orange", label="shuffling ics", alpha=0.75, density=density)

        # axs[i,j].hist(R_f, bins=50, color="purple", label="shuffling frequencies", density=density)
        # axs[i,j].hist(R_i, bins=50, color="orange", label="shuffling ics", alpha=0.75, density=density)


        # axs[i,j].hist(R_f, color="purple", label="shuffling frequencies", density=density)
        # axs[i,j].hist(R_i, color="orange", label="shuffling ics", alpha=0.75, density=density)
        # axs[i,j].set_title("ϵ = $(epsi) \n p = $(p) \n no = $(length(R_i))", pad=-15)
        # axs[i,j].set_title("ϵ = $(epsi)  p = $(p)  no = $(length(R_i))")
        axs[i,j].set_title("ϵ = $(epsi)")
        # if j==3 axs[i, j].text(1.35, 0.5, "p  = $(p)", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3) end
                if j==3 axs[i, j].text(1.01, 0.5, "p  = $(p)", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3) end
        # axs[i,j].set_xlim(bins[1], bins[end])
end 
end

axs[1,1].legend()
# for i=1:size(axs,2) axs[end,i].set_xlabel(L"\langle R \rangle") end 
# for i=1:size(axs,1) axs[i, 1].set_ylabel("Density of realizations") end
for i=3:3 axs[i, 1].set_ylabel("Density of realizations") end
for i=2:2 axs[end,i].set_xlabel(L"\langle R \rangle") end 
fig.align_ylabels(axs[:,1])
# resize!(fig, width=2.0, height=1.35)
# fig.subplots_adjust(pad=)
savefig("$(plotsdir())/statistics-R/allhistogram_$(ps)-density_$(density).png", dpi=300)

axs[1,1].set_xscale("log")
axs[1,1].set_xlim(0.05, 1.0)
savefig("$(plotsdir())/statistics-R/allhistogram_$(ps)-density_$(density)-logx.png", dpi=300)

axs[1,1].set_xscale("linear")
axs[1,1].set_xlim(0.0, 1.0)
for i=1:5, j=1:3 axs[i,j].set_yscale("log") end
savefig("$(plotsdir())/statistics-R/allhistogram_$(ps)-density_$(density)-logy.png", dpi=300)


# ------------------------------------------- Counting number of attractors by considering <R> and freqs ------------------------------------------- #

density=false
ps = ["0", "008733", "013111", "1"]
fig, axs = subplots(4,3, sharex="all")
# fig, axs = subplots(4,3, sharex="none")
for (i, p) in enumerate(ps)
dictname_f = "ku_ws_501_shuf_eps_selected_p$(p)"
dictname_i = "ku_ws_501_shufics_eps_selected_p$(p)"



# allparams, paramtypes = return_dict(dictname_f); alldicts = dict_list(allparams)
# @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]

# R_all_i = collectresults(dictname_i, quantifier; data_dir=data_dir) #shufics
# σ_all_i = collectresults(dictname_i, "syncfreqstats", idx_quantity=2; data_dir=data_dir) #shufics, std
# γ_all_i = collectresults(dictname_i, "syncfreqstats", idx_quantity=3; data_dir=data_dir) #shufics, iqi

# R_all_f = collectresults(dictname_f, quantifier; data_dir=data_dir) #shufics
# σ_all_f = collectresults(dictname_f, "syncfreqstats", idx_quantity=2; data_dir=data_dir) #shufics, std


# figure()
# scatter(Vector(σ_all_i[2,3:end]), Vector(R_all_i[2,2:end]))
# figure()
# scatter(Vector(σ_all_f[2,2:end]), Vector(R_all_f[2,2:end]))


# bins = 0:0.01:1 #0.08733, 0.13111
bins = 0:0.005:1 #0.08733, 0.13111
# bins = 0:0.005:1 #p = 1, 0
# bins = 0:0.001:1 #p = 1, 0
# bins = 0.25:0.001:0.35 #p = 1
# bins = 0.08:0.0001:0.12 #p = 0
# bins = 0.9925:0.00001:1.0 #p = 0
# for idx = [8, 13, 20] #for 1rst trial, with the 1rst dictnames
for j = 1:3 #for eps_selected
epsi = R_all_i[j,1]
R_i = Vector(R_all_i[j, 2:end])
R_f = Vector(R_all_f[j, 2:end])
axs[i,j].hist(R_f, bins=bins, color="purple", label="shuffling frequencies", density=density)
axs[i,j].hist(R_i, bins=bins, color="orange", label="shuffling ics", alpha=0.75, density=density)

# axs[i,j].hist(R_f, bins=50, color="purple", label="shuffling frequencies", density=density)
# axs[i,j].hist(R_i, bins=50, color="orange", label="shuffling ics", alpha=0.75, density=density)


# axs[i,j].hist(R_f, color="purple", label="shuffling frequencies", density=density)
# axs[i,j].hist(R_i, color="orange", label="shuffling ics", alpha=0.75, density=density)
# axs[i,j].set_title("ϵ = $(epsi) \n p = $(p) \n no = $(length(R_i))", pad=-15)
# axs[i,j].set_title("p = $(p), ϵ = $(epsi)  no = $(length(R_i))")

# axs[i,j].set_xlim(bins[1], bins[end])
end 

end

axs[1,1].legend()
for i=1:size(axs,2) axs[end,i].set_xlabel(L"\langle R \rangle") end 
# for i=1:size(axs,1) axs[i, 1].set_ylabel("Density of realizations") end
for i=3:3 axs[i, 1].set_ylabel("Density of realizations") end
fig.align_ylabels(axs[:,1])
# savefig("$(plotsdir())/statistics-R/allhistogram_$(ps)-density_$(density).png", dpi=300)


# ------------------------------------------------------- Plotting joint scatter + histogram ------------------------------------------------------- #
using Seaborn, Pandas
ps = ["0", "008733", "013111", "019684", "1"]
# ps = ["1"]

xl = L"\mathrm{IQI}(\dot{\theta}_i)"
yl = L"\langle R \rangle"

for (i, p) in enumerate(ps)
        dictname_f = "ku_ws_501_shuf_eps_selected_p$(p)"
        dictname_i = "ku_ws_501_shufics_eps_selected_p$(p)"

        allparams, paramtypes = return_dict(dictname_f); alldicts = dict_list(allparams)
        @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]

        R_all_i = collectresults(dictname_i, quantifier; data_dir=data_dir) #shufics
        R_all_f = collectresults(dictname_f, quantifier; data_dir=data_dir) #shufics

        σ_all_i = collectresults(dictname_i, "syncfreqstats", idx_quantity=2; data_dir=data_dir) #shufics, std
        σ_all_f = collectresults(dictname_f, "syncfreqstats", idx_quantity=2; data_dir=data_dir) #shufics, std
        # γ_all_i = collectresults(dictname_i, "syncfreqstats", idx_quantity=3; data_dir=data_dir) #shufics, iqi

        for j = 1:3 #for eps_selected
                epsi = R_all_i[j,1]

                d1 = Pandas.DataFrame(Dict(:σ => σ_all_f[j, 2:end], :R => R_all_f[j, 2:end], :type => ["malleability" for i=1:length(R_all_f[j, 2:end])]))
                d2 = Pandas.DataFrame(Dict(:σ => σ_all_i[j, 2:end], :R => R_all_i[j, 2:end], :type => ["multistability" for i=1:length(R_all_i[j, 2:end])]))
                data= Pandas.concat([d1,d2], ignore_index=true)

                # plot = jointplot(x=:σ, y=:R, data=data, hue=:type, alpha=0.1)
                plot = jointplot(x=:σ, y=:R, data=data, alpha=0.1)
                plot.set_axis_labels(xl, yl)
                plot.ax_joint.legend(title="")
                plot.ax_joint.set_title("p = $(p), ϵ = $(epsi)")
                resize!(plot.fig, width=0.85, height=0.85)

                savefig("$(plotsdir())/statistics-R/jointplots/jointplot-p_$(p)-epsi_$(epsi).png", dpi=300)
                # axs[i,j].set_title("ϵ = $(epsi)")
                # if j==3 axs[i, j].text(1.01, 0.5, "p  = $(p)", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3) end
end 
end



# #test
# p = ps[2]
# j = 3
# dictname_f = "ku_ws_501_shuf_eps_selected_p$(p)"
# dictname_i = "ku_ws_501_shufics_eps_selected_p$(p)"
# allparams, paramtypes = return_dict(dictname_f); alldicts = dict_list(allparams)
# @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]
# R_all_i = collectresults(dictname_i, quantifier; data_dir=data_dir) #shufics
# R_all_f = collectresults(dictname_f, quantifier; data_dir=data_dir) #shufics
# σ_all_i = collectresults(dictname_i, "syncfreqstats", idx_quantity=2; data_dir=data_dir) #shufics, std
# σ_all_f = collectresults(dictname_f, "syncfreqstats", idx_quantity=2; data_dir=data_dir) #shufics, std


# using andas
# d1 = Pandas.DataFrame(Dict(:σ => σ_all_i[j, 2:end], :R => R_all_i[j, 2:end], :type => ["multistability" for i=1:length(R_all_i[2, 2:end])]))
# d2 = Pandas.DataFrame(Dict(:σ => σ_all_f[j, 2:end], :R => R_all_f[j, 2:end], :type => ["malleability" for i=1:length(R_all_f[2, 2:end])]))
# data= Pandas.concat([d1,d2], ignore_index=true)


# figure()
# PyPlot.hist(Vector(σ_all_i[j,2:end]), bins=50)
# figure()
# PyPlot.hist(Vector(R_all_i[j,2:end]), bins=50)








# --------------------------------------------------------------- Distributions from --------------------------------------------------------------- #

density=false
ps = ["0", "008733", "013111", "019684", "025809", "050802", "066608", "1"]
ps = ["0", "008733", "013111", "015013", "017191", "019684", "025809", "050802", "1"]
fig, axs = subplots(length(ps),1, sharex="all", squeeze=false)
for (i, p) in enumerate(ps)
dictname_f = "ku_ws_501_shuf_eps_p$(p)"

R_all = collectresults(dictname_f, quantifier; data_dir=data_dir) #shufics
# allparams, paramtypes = return_dict(dictname_f); alldicts = dict_list(allparams)
# @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = alldicts[1]
# R_all_f = collectresults(dictname_f, quantifier; data_dir=data_dir) #shufics
bins = 0:0.005:1 #0.08733, 0.13111

# j = 23 
j = 32 
# epsi = R_all_i[j,1]
R_f = Vector(R_all[j, 2:end])
# axs[i,1].hist(R_f, bins=bins, color="purple", label="shuffling frequencies", density=density)
axs[i,1].hist(R_f, bins=100, color="purple", label="shuffling frequencies", density=density)
# axs[i,j].set_title("ϵ = $(epsi)  p = $(p)  no = $(length(R_i))")
# axs[i,j].set_xlim(bins[1], bins[end])

end

axs[1,1].legend()
for i=1:size(axs,2) axs[end,i].set_xlabel(L"\langle R \rangle") end 
for i=1:size(axs,1) axs[i, 1].set_ylabel("Density of realizations") end
fig.align_ylabels(axs[:,1])
# savefig("$(plotsdir())/statistics-R/allhistogram_$(ps)-density_$(density).png", dpi=300)









# d_params = alldicts[idx]
# @unpack N, mtop, mfreq, mchange, epsi, tend, dtana, p, shuffleid, seedic = d_params
# phasename = names_phases[idx]
# data = CSV.File(phasename, header=false) |> DataFrame; t = data[:,1]; m_θ = Matrix(data[:, 2:end-1]); m_θ = mod.( m_θ, 2pi) #.- pi;

# #2. topology, shuffling
# x_zero_offset = p_offset
# fileout = "$(plotsdir())/presentations/transitiontosynchronization-topology-shuffling.png"
# dictnames = ["ku_ws_501_shuf_p_eps4"]
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
# plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, haslegend=true)


# #coupling

# fileout = "$(plotsdir())/presentations/transitiontosynchronization-coupling-originalrealization.png"
# strongcolors = p_color; weakcolors = p_color_weaker; x_scale="linear"; x_zero_offset = 0
# dictnames = ["ku_ws_501_unit_eps_p1"] 
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.5, 0.95]]
# fig, axs= plot_R_single(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height, linewidths=linewidths, haslegend=false)
# axs[1].set_xticks(v_xticks)
# axs[1].set_xticklabels(v_xticklabels) 
# axs[1].set_xlim(v_xlim) 
# savefig(fileout, dpi=300)






# #3. coupling, 1 unit
# v_xlabel = e_xlabel
# x_zero_offset = 0.0; strongcolors = epsilon_colors; weakcolors = epsilon_colors_weaker; x_scale="linear"
# v_xticklabels = [L"0.0", L"2.5", L"5.0"]; v_xticks = [0, 2.5, 5.0]; v_xlim = (0, 5)
# # dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p013111", "ku_ws_501_unit_eps_p1"]
# dictnames = ["ku_ws_501_unit_eps_p0", "ku_ws_501_unit_eps_p008733", "ku_ws_501_unit_eps_p1"] #higher Delta
# fileout = "$(plotsdir())/presentations/transitiontosynchronization-coupling-varyingoneunit.png"
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.35, 0.70]]
# plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)



# #4. coupling, shuffling
# fileout = "$(plotsdir())/presentations/transitiontosynchronization-coupling-shuffling.png"
# dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p013111", "ku_ws_501_shuf_eps_p1"]
# # dictnames = ["ku_ws_501_shuf_eps_p0", "ku_ws_501_shuf_eps_p008733", "ku_ws_501_shuf_eps_p1"] #a bit nicer looking, slightly smaller delta
# m_yticks = [[0., 0.5, 1.0], [0.0, 0.45, 0.90]]
# plot_R_all(dictnames, quantifier, fileout; data_dir=data_dir, x_zero_offset=x_zero_offset, xscale=x_scale, strongcolors=strongcolors, weakcolors=weakcolors, strongalpha=1.0, weakalpha=0.1,  m_yticks=m_yticks, v_xticks=v_xticks, v_xticklabels=v_xticklabels, v_xlim=v_xlim, v_ylabel=v_ylabel, v_xlabel=v_xlabel, width=width, height=height)


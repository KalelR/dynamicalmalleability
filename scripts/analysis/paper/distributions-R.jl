include("../general_plots.jl")
using PyCall
rcParams = PyDict(matplotlib["rcParams"])
rcParams["mathtext.fontset"] = "custom"
rcParams["mathtext.rm"] = "Bitstream Vera Sans"
rcParams["mathtext.it"] = "Bitstream Vera Sans:italic"
rcParams["mathtext.bf"] = "Bitstream Vera Sans:bold"
#looks good also, but a bit different
# rcParams["mathtext.fontset"] = "stix"
# rcParams["font.family"] = "STIXGeneral"
# rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
# figure()
# title(L"\langle R \rangle \Delta")
# ylabel(L"\text{Probability}")

using StatsBase

function histogram(vector, bins, stat="probability")
	a=fit(Histogram, vector, bins)
	if stat=="probability" 
		weights = a.weights ./ sum(a.weights)
	else
		weights = a.weights
	end
	return a.edges, weights
end

quantifier = "Rstats"
data_dir = datadir()


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
        # axs[i,j].hist(R_f, bins=bins, color="purple", label="shuffling frequencies", density=density)
        # axs[i,j].hist(R_i, bins=bins, color="orange", label="shuffling ics", alpha=0.75, density=density)

	edges, weights_i = histogram(R_i, bins)
	edges, weights_f = histogram(R_f, bins)

        axs[i,j].plot(bins[1:end-1], weights_f, color="purple", label="shuffling frequencies")
	axs[i,j].fill_between(bins[1:end-1], weights_f, color="purple", alpha=0.6 )

        axs[i,j].plot(bins[1:end-1], weights_i, color="orange", label="shuffling ics", alpha=0.75)
	axs[i,j].fill_between(bins[1:end-1], weights_i, color="orange", alpha=0.4 )

        axs[i,j].set_title("ϵ = $(epsi)", x=0.5, y=0.75)

	if j==3 axs[i, j].text(1.01, 0.5, "p  = $(p)", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3) end
        # axs[i,j].set_xlim(bins[1], bins[end])
end 
end

axs[1,1].set_xlim(0,1)
axs[end, 2].legend(fontsize=10, frameon=false, bbox_to_anchor=(0.5, -0.7), ncol=2, loc="center")
# axs[end, end].legend(fontsize=8.5, frameon=false, bbox_to_anchor=(0.5, 0., 0.5, 0.5))
for i=3:3 axs[i, 1].set_ylabel("Probability") end
for i=2:2 axs[end,i].set_xlabel(L"\langle R \rangle") end 
fig.align_ylabels(axs[:,1])
resize!(fig, width=2.0, height=1.35)
fig.subplots_adjust(wspace=0.18, left=0.08, right=0.97, top=0.98, bottom=0.12, hspace=0.18)
savefig("$(plotsdir())/paper/distributions/allhistogram_$(ps)-density_$(density).png", dpi=300)


# axs[1,1].set_xlim(0.0, 1.0)
for i=1:5, j=1:3 axs[i,j].set_yscale("log") end
savefig("$(plotsdir())/paper/distributions/allhistogram_$(ps)-density_$(density)-logy.png", dpi=300)
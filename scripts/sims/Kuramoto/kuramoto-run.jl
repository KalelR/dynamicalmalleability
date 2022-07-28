#organizar os arquivos e testar se shuffles/troca de unidade tao funcionando! 
using DrWatson
@quickactivate "dynamicalmalleability"
using LSODA, OrdinaryDiffEq, DelimitedFiles, Random, Tables, CSV
const DIR = projectdir()
const data_dir = "$(DIR)/data"
include("$(DIR)/src/drwatson-organization.jl")
include("$(DIR)/src/utils.jl")
include("$(DIR)/src/savers.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto.jl")
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/quantifiers.jl")
include("$(DIR)/src/sims/Kuramoto/kuramoto-makesims.jl")
include("$(DIR)/data/inputs/alldictionaries.jl")

function main(ARGS)
	dictname = ARGS[1]
	println("$(ARGS), dictname")
	if(dictname == "") @error("missing parameter") end
	allparams, paramtypes = return_dict(dictname)

	v_ignore_params = ["dtana"]
	dicts = dict_list(allparams)
	keys_NP, keys_NP2, keys_RP, keys_CP, dicts_NP, dicts_NP2, dicts_RP, dicts_CP = get_dict_types(dicts, paramtypes)

	savemode = ARGS[2]
	if savemode == "details"
		dict_quantifiers = Dict("phases"=>[], "Rstats"=>[], "Rt" => [], "meanfreqs"=>[])
	elseif savemode == "phases"
		dict_quantifiers = Dict("phases"=>[])
	elseif savemode == "averages" #just averages
		dict_quantifiers = Dict("Rstats"=>[], "meanfreqs"=>[], "syncfreqstats"=>[])
	elseif savemode == "averages_Rfreq" #just averages
		dict_quantifiers = Dict("Rstats"=>[],  "syncfreqstats"=>[])
	elseif savemode == "features" #features, for comparing attractors for multistability
		dict_quantifiers = Dict("features"=>[])
	elseif savemode == "features_pl" #features, for comparing attractors for multistability
		dict_quantifiers = Dict("features_pl"=>[])
	else 
		dict_quantifiers = Dict("Rstats"=>[])
	end

	for (i1, d1) in enumerate(dicts_NP)
		for (i11, d11) in enumerate(dicts_NP2)
			for (i2, d2) in enumerate(dicts_RP)
				v_res = [Dict() for i=1:length(dicts_CP)]
				@Threads.threads for i3=1:length(dicts_CP)
					d3 = dicts_CP[i3];  d = merge(d1, d11, d2, d3)
					res = makesim_kuramoto(d, dict_quantifiers, DIR) #------------------ SIMULATE
					saver!(res, v_res,  d1, d11, d2, d3, v_ignore_params, ".dat"; data_dir=data_dir)
					v_res[i3] = res
				end
				saver(v_res, d1, d11, d2, dicts_CP[1], v_ignore_params, ".dat"; data_dir=data_dir)
			end
		end
	end
end 

main(ARGS)

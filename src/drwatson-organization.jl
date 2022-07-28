

function safesave2(filename, data; kwargs...)
	DrWatson.recursively_clear_path(filename)
	mkpath(dirname(filename))
	CSV.write(filename, data; kwargs...)
end

function save2(filename, data; kwargs...)
mkpath(dirname(filename))
CSV.write(filename, data; kwargs...)
end



"""
specific function to name the results
"""
function resultname(quantifier, dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params, format=".csv"; data_dir="")
	dir = savename(dict_NP,equals="_", connector="-", sort=true, ignores=v_ignore_params, digits=20)
	subdir = savename(dict_NP2,equals="_", connector="-", sort=true, ignores=v_ignore_params, digits=20)
	cp = savename(dict_CP,equals="_", connector="-", sort=true, ignores=v_ignore_params, digits=20)
	specifics = savename(dict_RP,equals="_", connector="-", sort=true, ignores=v_ignore_params, digits=20)
	if data_dir == "" data_dir = datadir() end
	name = "$(data_dir)/$(dir)/$(subdir)/$(quantifier)-control_$(cp)-$(specifics)$(format)"
end



function plotname(quantifier, dict_NP, RPk::String, CPk::String, v_ignore_params, format=".png")
	dir = savename(dict_NP, equals="_", connector="-", sort=true, digits=20)
#  subdir = savename(dict_RP,equals="_", connector="-", sort=true, ignores=v_ignore_params)
	# datadir("simulations", dir, "$(quantifier)_$(CPk)_$(subdir)_$(dir).csv")
	"$(DIR)/plots/simulations/$(dir)/$(quantifier)_$(RPk)_$(CPk)_$(dir)$(format)"
end

function plotname(quantifier, dict_NP, RPk, CPk::String, v_ignore_params, format=".png")
	dir = savename(dict_NP, equals="_", connector="-", sort=true, digits=20)
	subdir = savename(dict_RP,equals="_", connector="-", sort=true, ignores=v_ignore_params)
	# datadir("simulations", dir, "$(quantifier)_$(CPk)_$(subdir)_$(dir).csv")
	"$(DIR)/plots/simulations/$(dir)/$(quantifier)_$(subdir)_$(CPk)_$(dir)$(format)"
end


function subdicts(main_dict, select_keys)
	dicts2 = deepcopy(main_dict)
	for i = 1:length(dicts2)
	for k in keys(dicts2[i])
	if(k ∉ select_keys)
		delete!(dicts2[i], k)
	end
	end
	end
	dicts2 = unique(dicts2)
end

function cat_vec_vecvecs_2_mat(vec1, vec2)
numL = length(vec1)
numC = 1 + length(vec2[1])
mat = zeros(Float64, numL, numC)
mat[:,1] = vec1
for i = 1:length(vec2)
	mat[i, 2:end] .= vec2[i]
end
return mat
end


function get_dict_types(dicts, paramtypes)
	keys_NP = [k for (k,v) in paramtypes if v == "NP"]
	keys_NP2 = get_keys_from_dictvalue(paramtypes, "NP2")
	keys_CP = get_keys_from_dictvalue(paramtypes, "CP")
	keys_RP = get_keys_from_dictvalue(paramtypes, "RP")
	dicts_NP = subdicts(dicts, keys_NP)
	dicts_NP2 = subdicts(dicts, keys_NP2)
	dicts_RP = subdicts(dicts, keys_RP)
	dicts_CP = subdicts(dicts, keys_CP)
	return keys_NP, keys_NP2, keys_RP, keys_CP, dicts_NP, dicts_NP2, dicts_RP, dicts_CP
end
#untested
function get_values_from_dictkey(dict, key::String)
	values = [v for (k,v) in dict if k==key][1]
end
function get_keys_from_dictvalue(dict, value)
	keys = [k for (k,v) in dict if v==value]
end



#------------ FOR RESULT ANALYSIS

function collect_name_results(quantifier, dictname; format=".dat", data_dir=data_dir)
    v_ignore_params = ["dtana"]
    allparams, paramtypes = return_dict(dictname)
    dicts = dict_list(allparams)
    keys_NP, keys_NP2, keys_RP, keys_CP, dicts_NP, dicts_NP2, dicts_RP, dicts_CP = get_dict_types(dicts, paramtypes)
    names_results = [[resultname(quantifier, dicts_NP[1], dicts_NP2[1], dict_RP, dict_CP, v_ignore_params, format; data_dir=data_dir) for dict_CP in dicts_CP] for dict_RP in dicts_RP]
    cp_key, cp_values = get_control_parameter(allparams, paramtypes)
    return names_results, cp_key, cp_values
end

"""
Assuming that *only one* parameter (besides CP) is repeating, this function returns that parameter's key. For instance, if I'm changing the rewiring probability across several shuffleids, this will return "shuffleid". It is userful for building a dataframe.
This function could be MUCH more clear haha, but I'm tired and this is not really important...
"""
function get_changing_realization_parameter(allparams, paramtypes)
    wherevectorvaluesindict = typeof.(values(allparams)) .<: AbstractVector
    vectorvalues = collect(keys(allparams))[wherevectorvaluesindict]
    cp_key = collect(keys(paramtypes))[values(paramtypes) .== "CP"] 
    changing_param_key = vectorvalues[vectorvalues .!= cp_key][1]
    changing_param_values = allparams[changing_param_key]
    return changing_param_key, changing_param_values
end

function get_control_parameter(allparams, paramtypes)
    cp_key = collect(keys(paramtypes))[values(paramtypes) .== "CP"][1]
    cp_values = allparams[cp_key]
#     cp_values = collect(values(allparams))[values(paramtypes) .== "CP"] 
    return cp_key, cp_values
end

function get_parameters(dictname, args...)
	v_ignore_params = ["dtana"]
	allparams, paramtypes = return_dict(dictname)
	# @unpack args... = allparams
	v = []
	for param in args
		push!(v, allparams[string(param)])
	end
	return v
end


function get_control_parameter_key_values(dictname)
	v_ignore_params = ["dtana"]
	allparams, paramtypes = return_dict(dictname)
	# dicts = dict_list(allparams) 
	# keys_NP, keys_NP2, keys_RP, keys_CP, dicts_NP, dicts_NP2, dicts_RP, dicts_CP = get_dict_types(dicts, paramtypes)
	cp_key, cp_values = get_control_parameter(allparams, paramtypes)
	return cp_key, cp_values
end







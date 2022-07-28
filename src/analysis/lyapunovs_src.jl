

"""
For new code, using CHaosTTools.COnvergence
"""
function get_infinite_time_lyapunovs(filename)
	# lyaps = readdlm(filename)
	lyaps = myreadfile(filename)
	λ_mean = sort(lyaps[end, 2:end], rev=true) #infinite-time lyaps, sorted in decrescent order
	# λ_mean = sort(lyaps[5500, 2:end], rev=true) #infinite-time lyaps, sorted in decrescent order
end

function myreadfile(filename)
	f = open(filename)
	lines = readlines(f)
	a = []
	for (idx, l) in enumerate(lines)
		# println(idx)
		if(occursin("\0", l)) continue end
		push!(a, parse.(Float64, split(l)))
	end
	return hcat(a...)'
end
# a = myreadfile(filename)

function get_lyap_info(dictname; Rname="")
	cp_k, cp_vals = get_control_parameter_key_values(dictname)
	cp_vals = cp_vals; cp_k = cp_k
	N, p, mfreq, seedic, num_QRs, epsi = get_parameters(dictname, "N", "p", "mfreq", "seedic", "num_QRs", "epsi")

	a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
	all_lyaps = zeros(Float64, (N, length(cp_vals)))
	println("$(cp_vals), $(names_lyaps)")
	for (i, filename) in enumerate(names_lyaps)
		all_lyaps[:,i] = get_infinite_time_lyapunovs(filename)
	end


	if Rname ≠ ""
		Rfilename = Rname
	else 
		Rfilename, _ = get_resultnames(dictname, "Rstatslyaps", "")
	end

	R_all = CSV.File(Rfilename, header=false) |> DataFrame

	return cp_k, cp_vals, all_lyaps, R_all, N, p, mfreq, seedic, num_QRs, epsi
end

"""
returns max, and 2 closest to zero
"""
function get_convergence_lyapunovs(filename)
	# lyaps = readdlm(filename)
	lyaps = myreadfile(filename)
	t = lyaps[:,1]
	λ = lyaps[:,2:end]
	# λ = lyaps[1:5500,2:end]
	# t = lyaps[1:5500]
	idxs_zero = sortperm(abs.(λ[end,:]))[1:4]
	idx_max = findmax(λ[end,:])[2]
	idxs = union(idxs_zero, idx_max); sort!(idxs)
	return t, λ[:, idxs]
end

function get_lyap_info_finitetime(dictname)
	cp_k, cp_vals = get_control_parameter_key_values(dictname)
	cp_vals = cp_vals[1]; cp_k = cp_k[1]
	N, p, mfreq, seedic, num_QRs, epsi = get_parameters(dictname, "N", "p", "mfreq", "seedic", "num_QRs", "epsi")

	a, names_lyaps = get_resultnames(dictname, "", "conv_lyapu_spectrum")
	all_lyaps = zeros(Float64, (N, length(cp_vals)))
	for (i, filename) in enumerate(names_lyaps)
		all_lyaps[:,i] = get_inconvergence_lyapunovs(filename)
		t, lyaps = get_convergence_lyapunovs(filename)

	end


	Rfilename, _ = get_resultnames(dictname, "Rstatslyaps", "")
	R_all = CSV.File(Rfilename, header=false) |> DataFrame

	return cp_k, cp_vals, all_lyaps, R_all, N, p, mfreq, seedic, num_QRs, epsi
end

"""
Starting from the convergence lyapunovs, returns the intstantaoues lyapunovs (i.e. ln.(diag(R)))
"""
function get_instantaneous_lyapunovs(filename)
	lyaps = myreadfile(filename)
	t = lyaps[:,1]
	λ = lyaps[:,2:end]
	insta_lyaps = similar(λ)
	for idx = size(λ)[1]:-1:2
		insta_lyaps[idx, :] = (λ[idx, :] .- λ[idx-1, :]) * t[idx]
	end
	insta_lyaps[1, :] = λ[1, :]
	return insta_lyaps, t
end

function get_convergence_lyapunovs(filename; printbiggest=true)
	# lyaps = readdlm(filename)
	lyaps = myreadfile(filename)
	t = lyaps[:,1]
	λ = lyaps[:,2:end]
	sort_idxs = sortperm(λ[end,:], rev=true)
	λ = λ[:, sort_idxs]
	idx_zero = argmin(abs.(λ[end,:]))
	idx_max = 1 #argmax(finalλs)
	idxs = idx_max:idx_zero+1
	if printbiggest == true
		return t, λ[:, idxs]
	else
		return t, λ[:, :]
	end
end
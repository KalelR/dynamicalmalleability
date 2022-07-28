
"""
General saver function. Any quantifier that has to be saved within the first loop (like the phases) it does so, then remotes it from the `res` dict. Keeps until the last loop all the quantifiers that need to be saved later.
    Then, calls their appropriate specific savers

    save_vres = if true, save; if false, push res to v_res
"""
function saver!(res, v_res, dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params, saveformat=".dat"; data_dir="")
    res["cp"] = collect(values(dict_CP))[1]
    if "phases" ∈ keys(res)
        resname = resultname("phases", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save_sol_kuramoto(resname, res["phases"])
        # saveSolution(resname, res["phases"])
        delete!(res, "phases")
    end

    if "features" ∈ keys(res)
        resname = resultname("features", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["features"]); header=false)
        delete!(res, "features")
    end

    if "features_pl" ∈ keys(res)
        resname = resultname("features_pl", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["features_pl"]); header=false)
        delete!(res, "features_pl")
    end

    if "lyapunovs" ∈ keys(res)
        resname = resultname("conv_lyapu_spectrum", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        saveLyapunovs(resname, res["lyapunovs"]; print_step=1)
        delete!(res, "lyapunovs")
    end
    if "Rt" ∈ keys(res)
        resname = resultname("Rt", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["Rt"]); header=false)
        delete!(res, "Rt")
    end

    if "phases2" ∈ keys(res)
        resname = resultname("phases2", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        res["phases2"] = mod.(res["phases2"], 2pi)
        res["phases2"] = round.(res["phases2"], digits=5)
        save2(resname, Tables.table(res["phases2"]); header=false)
        delete!(res, "phases2")
    end

    if "phasestrajectory" ∈ keys(res)
        resname = resultname("phasestrajectory", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        res["phasestrajectory"] = mod.(res["phasestrajectory"], 2pi)
        res["phasestrajectory"] = round.(res["phasestrajectory"], digits=5)
        save2(resname, Tables.table(res["phasestrajectory"]); header=false)
        delete!(res, "phasestrajectory")
    end

    if "instafreqs" ∈ keys(res)
        resname = resultname("instafreqs", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["instafreqs"]); header=false)
        delete!(res, "instafreqs")
    end

    if "maximumlyapunovconvergence" ∈ keys(res)
        resname = resultname("maximumlyapunovconvergence", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["maximumlyapunovconvergence"]); header=false)
        delete!(res, "maximumlyapunovconvergence")
    end

    if "maximumlyapunovconvergencetime" ∈ keys(res)
        resname = resultname("maximumlyapunovconvergencetime", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["maximumlyapunovconvergencetime"]); header=false)
        delete!(res, "maximumlyapunovconvergencetime")
    end

    if "maximumlyapunovinstantaneous" ∈ keys(res)
        resname = resultname("maximumlyapunovinstantaneous", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["maximumlyapunovinstantaneous"]); header=false)
        delete!(res, "maximumlyapunovinstantaneous")
    end

    if "maximumlyapunovinstantaneoustime" ∈ keys(res)
        resname = resultname("maximumlyapunovinstantaneoustime", dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params,saveformat; data_dir=data_dir)
        save2(resname, Tables.table(res["maximumlyapunovinstantaneoustime"]); header=false)
        delete!(res, "maximumlyapunovinstantaneoustime")
    end


end

"""
For end of loop
"""
function saver(v_res, dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params, saveformat=".dat"; data_dir="")
    cp = collect(keys(dict_CP))[1]
    dict_CP_extra = deepcopy(dict_CP)
    dict_CP_extra[cp] = "all"
    save_res(v_res, cp, dict_NP, dict_NP2, dict_RP, dict_CP_extra, v_ignore_params, saveformat; rounddigits=5, issafe=false, data_dir=data_dir)
end

function save_res(v_res, key_CP, dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params, format; rounddigits="inf", issafe=true, data_dir)
    v_cp = [res["cp"] for res in v_res]
    for k_res in keys(v_res[1])
        if(k_res == "cp") continue end
        # if(k_res ∉ v_savekeys) continue end
        resname = resultname(k_res, dict_NP, dict_NP2, dict_RP, dict_CP, v_ignore_params, format; data_dir=data_dir)
        println("$(resname)")
        v_res_save = prepare_save_res(v_res, k_res, v_cp; rounddigits=rounddigits)

        if(issafe) 
            safesave2(resname, Tables.table(v_res_save); header=false)
        else
            save2(resname, Tables.table(v_res_save); header=false)
        end
    end
end


function prepare_save_res(res, k_res, v_cp; rounddigits=5)
    sortidxs = sortperm(v_cp)
    res = res[sortidxs]; v_cp = v_cp[sortidxs] #sort according to the value of v_cp
    res_q = [[v_cp[i]; res[i][k_res]] for i = 1:length(res)] #get results (of quantifier k_res) together to print, and put the value of cp before
    res = hcat(res_q...)'
    if(rounddigits != "inf")
        res = round.(res, digits=rounddigits)
    end
    return res 
end


""" 
saves lyapunovs, receiving matrix in the form containgin in each row the time value and the lyap spectrum corresponding; it is therefore numtimes x 1+dimensions
"""
function saveLyapunovs(fileOut, m_λ; print_step=1)
    mkpath(dirname(fileOut))
    open(fileOut, "w") do io
        for i=1:print_step:size(m_λ)[1] 
            @printf(io, "%f ", m_λ[i, 1])
            for j = 2:size(m_λ)[2]
                @printf(io, "%.8f ", m_λ[i, j])
            end
            @printf(io, "\n")
        end
    end
end

function save_sol_kuramoto(fileOut, sol)
    mkpath(dirname(fileOut))
    open(fileOut, "w") do io
        for idx=1:length(sol)
            @printf(io, "%f ", sol.t[idx])
            for j=1:length(sol.u[idx])
                @printf(io, "%f ", mod(sol.u[idx][j], 2pi))
            end
            @printf(io, "\n")
        end
    end
end
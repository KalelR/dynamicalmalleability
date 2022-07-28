"""
Contain all the dictionaries I've used in relevant simulations. Just pass it the name of the realization, and it returns a vector with [params, paramtypes]. The name I'm following is
ku_model_N_changemode_cp
"""
function return_dict(dictname)

    if(dictname == "ku_ws_501_unit_p_eps451282_omeganew3")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>[0.0,  0.08733,  0.19684, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 4.51282,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => [0, 118, 391],
    "ω_new" => 3.0,
    #simulation
    "tend" => 4000.,
    "ttrans" => 3000.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "CP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "RP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    "idx_unit" => "RP",
    "ω_new" => "RP",
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end



    @error("No dictionary found")
end
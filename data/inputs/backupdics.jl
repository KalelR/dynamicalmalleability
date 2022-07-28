"""
Contain all the dictionaries I've used in relevant simulations. Just pass it the name of the realization, and it returns a vector with [params, paramtypes]. The name I'm following is
ku_model_N_changemode_cp
"""
function return_dict(dictname)
if(dictname == "ku_ws_501_shuf_p")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:100),
"shuffleid" => collect(0:150),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_p_2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:100),
"shuffleid" => collect(151:300),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_p_3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(301:600),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_p_eps_1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:600),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_p_eps_3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 3.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:600),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_e")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.25641, 0.51282, 0.76923, 1.02564, 1.28205, 1.53846, 1.79487, 2.05128, 2.30769, 2.5641, 2.82051, 3.07692, 3.33333, 3.58974, 3.84615, 4.10256, 4.35897, 4.61538, 4.87179, 5.12821, 5.38462, 5.64103, 5.89744, 6.15385, 6.41026, 6.66667, 6.92308, 7.17949, 7.4359, 7.69231, 7.94872, 8.20513, 8.46154, 8.71795, 8.97436, 9.23077, 9.48718, 9.74359, 10.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:600),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_cauchy_e")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.25641, 0.51282, 0.76923, 1.02564, 1.28205, 1.53846, 1.79487, 2.05128, 2.30769, 2.5641, 2.82051, 3.07692, 3.33333, 3.58974, 3.84615, 4.10256, 4.35897, 4.61538, 4.87179, 5.12821, 5.38462, 5.64103, 5.89744, 6.15385, 6.41026, 6.66667, 6.92308, 7.17949, 7.4359, 7.69231, 7.94872, 8.20513, 8.46154, 8.71795, 8.97436, 9.23077, 9.48718, 9.74359, 10.0],
"x0" => 0.0,
"gamma" => 0.5,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => collect(0:600),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end

if(dictname == "ku_ws_501_shuf_cauchy_p")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
# "shuffleid" => collect(0:100),
"shuffleid" => collect(0:150),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_cauchy_p_2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
# "shuffleid" => collect(0:100),
"shuffleid" => collect(151:300),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_ws_501_shuf_cauchy_p_3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => collect(301:600),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_test")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => [0,1,2],
#simulation
"tend" => 100,
"ttrans" => 50.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]
end
if(dictname == "ku_test_oneunit")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => [0,1,2],
"ω_new" => 10.0,
#simulation
"tend" => 100,
"ttrans" => 50.,
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
"x0" => "RP",
"gamma" => "RP",
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
)] end


#------------------------------------------------------------=====================================

# ------------------------------------------------------------- MALLEABILITY, SHUFFLING ------------------------------------------------------------ #


if(dictname == "ku_ws_501_shuf_p_eps4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:500),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_p_eps451282")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
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
    "shuffleid" => collect(0:500),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
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
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end


    if(dictname == "ku_ws_501_shuf_p_eps451282_moreshuffles")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
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
        # "shuffleid" => collect(501:1500),
        "shuffleid" => collect(0:1500),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
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
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

if(dictname == "ku_ws_501_shuf_p_eps8")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 8.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:500),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end




if(dictname == "ku_ws_501_shuf_eps_p1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>1.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_p001")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.01,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shuf_eps_p002955")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.02955,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
if(dictname == "ku_ws_501_shuf_eps_p005817")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.05817,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shuf_eps_p0001")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.001,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shuf_eps_p001311")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.01311,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shuf_eps_p006661")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.06661,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
if(dictname == "ku_ws_501_shuf_eps_p017191")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.17191,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
if(dictname == "ku_ws_501_shuf_eps_p050802")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.50802,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shuf_eps_p01")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.1,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
if(dictname == "ku_ws_501_shuf_eps_p01145")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.1145,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
if(dictname == "ku_ws_501_shuf_eps_p025809")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.25809,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_shuf_eps_p0003")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.003,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_shuf_eps_p001145")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>0.01145,
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end


        if(dictname == "ku_ws_501_shuf_eps_p001968")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" =>0.01968,
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end

            if(dictname == "ku_ws_501_shuf_eps_p007627")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>0.07627,
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end
                if(dictname == "ku_ws_501_shuf_eps_p015013")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 2, #NP
                    "p" =>0.15013,
                    "seednet" => 1,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
                    #simulation
                    "tend" => 3000.,
                    "ttrans" => 1250.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end

                    if(dictname == "ku_ws_501_shuf_eps_p019684")
                        return [Dict(
                        #topology
                        "N" => 501, #NP
                        "k" => 2, #NP
                        "p" =>0.19684,
                        "seednet" => 1,
                        "mtop" => "WS",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => 0,
                        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
                        #simulation
                        "tend" => 3000.,
                        "ttrans" => 1250.,
                        "dtana" => 1.0,
                        "mchange"=>"shuffling",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        )]                        end

                        if(dictname == "ku_ws_501_shuf_eps_p066608")
                            return [Dict(
                            #topology
                            "N" => 501, #NP
                            "k" => 2, #NP
                            "p" =>0.66608,
                            "seednet" => 1,
                            "mtop" => "WS",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" => 0,
                            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            # "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
                            #simulation
                            "tend" => 3000.,
                            "ttrans" => 1250.,
                            "dtana" => 1.0,
                            "mchange"=>"shuffling",
                            ),
                            Dict(
                            #topology
                            "N" => "NP",
                            "k" => "NP",
                            "p" => "RP", #----important one, might change to CP
                            "seednet" => "NP2",
                            "mtop" => "NP",
                            #dynamical
                            "mmodel" => "NP",
                            "seedic" => "NP2",
                            "epsi" =>  "CP", #CP ----- important one, might change to RP
                            "mu" => "RP",
                            "std" => "RP",
                            "mfreq" => "NP",
                            "seedfreq" => "RP",
                            "shuffleid" => "RP", #shuffleid, 0 == original frequency
                            #simulation
                            "tend" => "RP",
                            "ttrans" => "RP",
                            "dtana" => "RP",
                            "mchange" => "NP2",
                            )]                        end

if(dictname == "ku_ws_501_shuf_eps_p0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_p013111")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_p008733")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:500),
# "shuffleid" => collect(501:1000),
"shuffleid" => collect(0:1000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_ws_501_shuf_eps_selected_p008733")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [0.5, 2.46154, 5.12821],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:20000),
# "shuffleid" => collect(16001:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"shuffleid" => "CP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_selected_p019684")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.19684,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    # "epsi" => [0.5, 2.46154, 6.97436],
    # "epsi" => [0.61538, 1.0, 8.0],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => collect(0:20000),
    # "shuffleid" => collect(13001:20000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    "mstudy"=>"distributions",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    "shuffleid" => "CP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "mstudy" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shuf_eps_selected_p0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [2.46154, 5.12821, 8.0],
# "epsi" => [0.61538, 1.0, 6.97436],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:20000),
# "shuffleid" => collect(13208:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"shuffleid" => "CP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end


if(dictname == "ku_ws_501_shuf_eps_selected_p013111")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.5, 2.46154, 5.12821],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:20000),
# "shuffleid" => collect(10001:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end


if(dictname == "ku_ws_501_shuf_eps_selected_p1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>1.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [0.61538, 1.0, 5.12821],
# "epsi" => [ 2.46154, 6.97436, 8],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:20000),
# "shuffleid" => collect(11638:20000),
# "shuffleid" => collect(13001:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"shuffleid" => "CP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_extended_p0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [10.0, 15.0, 20.0, 40.0, 60, 80, 100, 500],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:501),
#simulation
"tend" => 7000.,
"ttrans" => 5000.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_extended_p008733")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.08733,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [10.0, 15.0, 20.0, 50, 100],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => collect(0:501),
    #simulation
    "tend" => 5000.,
    "ttrans" => 3000.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

# ===================================================================================

if(dictname == "ku_ws_501_unit_p_eps2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
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
)]  end


if(dictname == "ku_ws_501_unit_p_eps4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
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


if(dictname == "ku_ws_501_unit_p_eps4_omeganew0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 0.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
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

if(dictname == "ku_ws_501_unit_p_eps4_omeganew4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 4.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
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


if(dictname == "ku_ws_501_unit_p_eps451282_omeganew3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
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
"idx_unit" => collect(0:501),
"ω_new" => 3.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
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

if(dictname == "ku_ws_501_unit_p_eps4_omeganew2")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 4.10256,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 2.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
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

if(dictname == "ku_ws_501_unit_p_eps8")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 8.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
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

if(dictname == "ku_ws_501_unit_eps_p013111")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p008733")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p007627")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.07627,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p01")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.1,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 1.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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



if(dictname == "ku_ws_501_unit_eps_p013111_omeganew4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 4.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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


if(dictname == "ku_ws_501_unit_eps_p008733_omeganew4")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 0.08733,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 4.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
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


if(dictname == "ku_ws_501_unit_eps_p0_omeganew4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 4.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p1_omeganew4")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 1.0,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 4.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p013111_omeganew3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 3.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p019684_omeganew3")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 0.19684,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 3.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p008733_omeganew3")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 0.08733,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 3.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
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


if(dictname == "ku_ws_501_unit_eps_p0_omeganew3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 3.0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_ws_501_unit_eps_p1_omeganew3")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 1.0,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 3.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
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



# --------------------------------------------------------------------- BASINS --------------------------------------------------------------------- #
if(dictname == "ku_ws_501_basins_eps410256_pselected")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0, 0.13111,0.06661, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0,1],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"unit1" => 1,
"unit2" => [2, 150, 249, 250, 350, 500],
"u01" => collect(range(0, 2pi, length=50)),
"u02" => collect(range(0, 2pi, length=50)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end
if(dictname == "ku_ws_501_basins_eps410256_pselected_2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0,1],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"unit1" => 1,
"unit2" => [2, 150, 249, 250, 350, 500],
"u01" => collect(range(0, 2pi, length=50)),
"u02" => collect(range(0, 2pi, length=50)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps451282_p013111_unit_selected_unit2_selected")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
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
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"unit1" => [132, 354],
"unit2" => [43, 324],
"u01" => collect(range(0, 2pi, length=150)),
"u02" => collect(range(0, 2pi, length=150)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps451282_p013111_unit_132_unit2_43")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 0.13111,
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
    #simulation
    "tend" => 3001.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"ictwounits",
    "unit1" => 132,
    "unit2" => 43,
    "u01" => collect(range(1, 5.74, length=625)),
    "u02" => collect(range(0, 4.5, length=625)),
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "unit1" => "RP",
    "unit2" => "RP",
    "u01" => "CP",
    "u02" => "RP",
    )]                        end
    if(dictname == "ku_ws_501_basins_eps451282_p013111_unit_354_unit2_43")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" => 0.13111,
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
        #simulation
        "tend" => 3001.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"ictwounits",
        "unit1" => 354,
        "unit2" => 43,
        "u01" => collect(range(0, 2pi, length=750)),
        "u02" => collect(range(1.5, 4.8, length=500)),
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
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
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        "unit1" => "RP",
        "unit2" => "RP",
        "u01" => "CP",
        "u02" => "RP",
        )]                        end

        if(dictname == "ku_ws_501_basins_eps451282_p013111_unit_132_unit2_324")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" => 0.13111,
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
            #simulation
            "tend" => 3001.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"ictwounits",
            "unit1" => 132,
            "unit2" => 324,
            "u01" => collect(range(0, 3, length=500)),
            "u02" => collect(range(0.5, 2pi, length=750)),
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
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
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "unit1" => "RP",
            "unit2" => "RP",
            "u01" => "CP",
            "u02" => "RP",
            )]                        end


        if(dictname == "ku_ws_501_basins_eps451282_p013111_unit_354_unit324")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" => 0.13111,
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
            #simulation
            "tend" => 3001.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"ictwounits",
            "unit1" => 354,
            "unit2" => 324,
            "u01" => collect(range(0, 2pi, length=750)),
            "u02" => collect(range(2.6, 5.5, length=500)),
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
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
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "unit1" => "RP",
            "unit2" => "RP",
            "u01" => "CP",
            "u02" => "RP",
            )]                        end






if(dictname == "ku_ws_501_basins_eps410256_pselected_3_details")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => [2, 250, 350, 500],
"u01" => collect(range(pi, 2pi, length=250)),
"u02" => collect(range(pi, 2pi, length=250)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",

)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_details_unit2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => collect(range(2, 5.41, length=250)),
"u02" => collect(range(0, 2pi, length=500)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_details_unit350")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 350,
"u01" => collect(range(0, 4.38, length=350)),
"u02" => collect(range(0.85, 6.06, length=400)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_details_unit500")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 500,
"u01" => collect(range(1.75, 5.5, length=350)),
"u02" => collect(range(0, 2pi, length=400)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_random")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"randomlychosen",
"unit1" => 1,
"unit2" => [2, 150, 249, 250, 350, 500],
"u01" => [0.5393, 0.56526, 0.58335, 0.84389, 0.92309, 1.09446, 1.21497, 1.42874, 1.53148, 1.54627, 1.56315, 1.58104, 1.62938, 1.7258, 1.77898, 1.7857, 2.25004, 2.41036, 2.5071, 2.6365, 3.15589, 3.47831, 3.51237, 3.7188, 3.8366, 3.85899, 4.01143, 4.08884, 4.09308, 4.11251, 4.57594, 4.58768, 4.62908, 4.67361, 4.71559, 4.71708, 4.82287, 4.85592, 5.05577, 5.05943, 5.08303, 5.53418, 5.80422, 5.82684, 5.85238, 5.97228, 6.07702, 6.17281, 6.17312, 6.18117],
"u02" => [0.5393, 0.56526, 0.58335, 0.84389, 0.92309, 1.09446, 1.21497, 1.42874, 1.53148, 1.54627, 1.56315, 1.58104, 1.62938, 1.7258, 1.77898, 1.7857, 2.25004, 2.41036, 2.5071, 2.6365, 3.15589, 3.47831, 3.51237, 3.7188, 3.8366, 3.85899, 4.01143, 4.08884, 4.09308, 4.11251, 4.57594, 4.58768, 4.62908, 4.67361, 4.71559, 4.71708, 4.82287, 4.85592, 5.05577, 5.05943, 5.08303, 5.53418, 5.80422, 5.82684, 5.85238, 5.97228, 6.07702, 6.17281, 6.17312, 6.18117],
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end


if(dictname == "ku_ws_501_basins_eps410256_pselected_random_unit350")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"randomlychosen_severalfiles",
"unit1" => 1,
"unit2" => 350,
"u01" => [0.86419, 3.72785, 1.38092, 3.11784, 1.08411, 1.4045, 3.19411, 2.24085, 2.02458, 1.32838, 1.40085, 2.0788, 1.03973, 3.18164, 4.2896, 2.91975, 3.87186, 2.58203, 1.24256, 3.17055, 2.60657, 2.57294, 0.35153, 1.75223, 2.42487, 1.23016, 2.10586, 2.02472, 0.39509, 1.21651, 3.26816, 2.29571, 0.78992, 2.03896, 1.24535, 4.0091, 0.64267, 1.13643, 4.18973, 1.02889, 0.51499, 0.50063, 1.9578, 3.45296, 2.74839, 3.8188, 1.38726, 2.28969, 3.08527, 1.67396, 3.06278, 4.15667, 3.69093, 2.42525, 2.20642, 3.806, 4.06924, 0.7756, 1.0389, 0.22296, 0.16797, 3.60963, 0.16792, 4.20108, 0.11875, 3.09249, 3.59352, 3.83296, 2.75632, 2.90492, 2.67403, 1.69863, 2.81281, 3.43644, 2.11557, 1.22867, 0.79638, 3.179, 4.15946, 2.44276, 1.92646, 0.01455, 1.95732, 3.7806, 4.22928, 3.42168, 2.68435, 1.77775, 2.65519, 1.2988, 1.79908, 2.55944, 3.28523, 0.51231, 3.95774, 2.23193, 3.94951, 1.91385, 2.74187, 1.77657, 1.16752, 1.2615, 1.68434, 2.50385, 1.62203, 3.7578, 3.99018, 2.06783, 3.14697, 2.37574, 2.84117, 0.66626, 1.29904, 3.507, 3.71709, 3.64384, 0.37658, 4.31163, 4.14767, 4.1225, 3.96001, 2.18638, 1.11254, 3.96275, 0.78201, 4.04828, 0.79904, 1.19507, 2.84146, 0.2662, 2.6803, 2.69854, 4.37492, 0.45243, 2.88037, 0.24415, 0.88159, 3.79716, 1.62494, 3.63224, 0.21841, 3.70512, 1.72565, 1.16585, 0.30981, 3.45818, 2.66431, 1.26341, 3.18882, 0.93936, 2.5667, 0.09496, 2.44961, 3.62754, 2.80911, 1.33559, 3.47006, 0.82939, 1.32004, 3.31908, 3.97947, 0.42209, 1.91289, 1.23925, 0.03325, 2.9365, 2.57028, 1.3873, 0.32192, 2.3247, 1.52178, 1.7134, 3.37733, 4.0705, 1.10232, 1.91129, 0.97567, 2.07542, 1.67447, 1.8831, 2.88961, 1.68067, 2.41757, 2.46564, 1.93814, 3.48117, 3.73791, 1.73863, 2.45602, 1.3461, 0.38899, 0.13688, 1.91896, 0.90778, 4.31542, 2.55726, 1.44753, 3.7433, 2.6683, 2.45437, 3.47756, 4.30641, 3.40005, 1.38529, 2.71623, 0.41313, 1.25945, 3.80096, 2.49248, 3.0718, 3.09099, 0.29498, 1.08855, 0.4675, 2.45534, 0.0388, 0.60547, 0.97991, 0.72952, 0.67753, 1.17379, 3.01861, 0.53434, 1.56635, 0.16175, 4.29548, 2.28635, 3.72237, 3.65918, 1.89072, 4.27482, 3.98009, 0.77032, 1.43402, 0.46866, 2.41356, 3.07445, 2.35481, 2.74933, 1.44718, 2.18787, 4.19332, 2.11825, 3.0133, 3.98679, 1.92271, 0.1987, 3.23554, 3.51582, 0.17973, 3.58468, 0.96725, 2.58918, 0.74422, 3.56493, 0.37633, 3.1119, 2.83732, 0.26786, 2.25652, 3.1224, 3.45015, 1.73514, 0.73623, 1.75228, 0.90935, 0.23884, 3.17773, 1.78649, 4.11117, 2.14468, 0.68611, 3.64449, 4.23235, 1.41561, 2.02983, 1.09556, 2.46652, 2.00906, 3.01033, 4.15933, 2.13875, 4.11665, 2.58478, 1.2603, 0.79981, 0.61982, 2.96683, 1.62626, 0.21815, 1.65907, 4.2217, 2.15483, 0.58623, 0.72688, 0.07469, 3.0199, 1.0317, 3.83695, 4.1253, 3.44754, 0.41293, 3.72858, 3.86339, 2.91687, 0.71099, 4.09604, 2.69948, 2.78632, 1.75654, 1.87919, 2.52166, 1.59156, 3.59935, 3.48141, 0.27307, 2.18917, 4.11228, 4.34108, 2.70246, 3.48863, 2.71898, 3.93533, 0.3595, 4.16654, 3.38773, 1.5582, 0.68687, 2.71542, 1.4945, 0.30257, 2.37411, 1.96447, 2.45335, 3.21592, 0.86723, 1.4189, 0.20131, 4.04154, 0.88144, 4.11865, 1.15113, 2.20185, 1.67968, 3.19674, 0.90235, 1.92235, 2.40469, 2.5854, 2.00486],
"u02" => [1.8698, 0.96748, 2.25798, 5.77271, 4.12969, 4.26016, 4.50132, 3.57302, 3.9302, 1.89577, 2.98063, 3.12268, 1.44246, 6.01612, 5.58144, 2.52006, 2.45681, 4.15387, 5.46799, 1.87765, 3.31586, 5.04411, 3.61066, 1.43771, 4.26983, 3.48158, 1.27474, 3.27884, 4.88783, 2.3576, 5.4305, 1.44307, 5.94883, 1.82021, 5.95227, 4.4302, 5.24049, 1.88687, 2.31093, 1.33335, 2.83164, 5.9612, 4.60782, 1.80297, 1.46853, 0.91783, 4.38261, 3.30556, 1.02874, 4.16448, 3.54655, 1.49398, 3.32137, 3.50565, 5.00963, 4.76017, 3.74995, 3.0389, 3.81552, 4.60794, 4.46637, 2.89394, 2.14227, 2.39576, 3.27797, 3.54761, 4.2135, 1.45528, 3.23028, 1.35888, 4.58433, 5.1828, 1.68301, 2.20524, 5.80258, 3.44019, 4.85572, 2.43128, 1.09342, 4.51483, 5.08749, 3.54001, 2.61285, 0.95996, 4.31829, 2.94489, 3.31675, 1.00534, 2.27067, 2.84521, 1.8705, 2.05156, 4.48334, 3.76382, 4.953, 1.15253, 5.3081, 5.50482, 5.85707, 1.48938, 2.90908, 5.90169, 2.1735, 4.76909, 1.76286, 4.71403, 1.15647, 4.90966, 4.2374, 3.22634, 1.45168, 2.91612, 5.95079, 5.39896, 2.84121, 2.61691, 2.37842, 5.24875, 1.66254, 1.65793, 2.93967, 5.11461, 1.413, 3.05919, 1.02836, 5.88119, 1.14348, 5.1014, 4.89836, 3.39543, 5.43548, 4.62478, 5.85479, 6.0126, 2.73914, 4.52549, 5.69211, 2.61097, 4.273, 2.78321, 2.01463, 4.00545, 4.04805, 2.44889, 4.02143, 5.36081, 2.96398, 2.71218, 1.91723, 2.82764, 2.76383, 5.72076, 3.9829, 1.9066, 2.89267, 4.44235, 3.35687, 4.97774, 1.17647, 4.26214, 0.89069, 5.66306, 1.62904, 4.34557, 2.15371, 4.91488, 2.42765, 3.55017, 1.9055, 3.32317, 3.56042, 1.3857, 4.46048, 1.57915, 2.68767, 2.88974, 3.99756, 3.76899, 4.18285, 5.80922, 4.71332, 3.00993, 3.01576, 1.74015, 2.90027, 1.77182, 0.9149, 1.92569, 1.05467, 5.55415, 1.08937, 1.68757, 4.44069, 2.29984, 4.18926, 1.80879, 1.0611, 2.64773, 1.49725, 2.02669, 2.1939, 2.42935, 2.95781, 4.95769, 1.14807, 5.49162, 2.04581, 0.90303, 2.63016, 1.0507, 5.3246, 1.72561, 2.64898, 6.00717, 5.00917, 1.68117, 4.13784, 2.16543, 1.13024, 3.1134, 2.5843, 5.77287, 3.37565, 5.19674, 3.39891, 3.17049, 4.80174, 4.47907, 1.63925, 4.45087, 2.14344, 5.73705, 3.35662, 0.93406, 1.24821, 3.39613, 1.40813, 2.1542, 1.08065, 1.6311, 1.50595, 4.22669, 4.54724, 4.524, 4.06643, 4.77577, 5.89466, 1.75083, 4.98754, 1.97855, 5.87256, 4.34073, 2.32493, 1.52074, 4.57589, 3.82423, 3.08831, 3.49711, 1.14084, 5.40512, 1.41754, 1.26969, 5.48832, 2.89929, 1.52406, 1.76158, 1.97073, 2.12117, 2.92684, 1.49239, 3.9588, 2.19122, 3.86391, 5.97798, 4.04827, 4.65443, 5.58783, 4.47019, 3.67217, 5.6233, 1.51725, 1.25707, 5.81375, 3.5728, 3.7213, 1.75262, 3.77168, 2.82789, 1.39158, 1.27209, 1.90876, 2.94928, 5.01503, 3.02842, 2.71996, 2.55377, 1.16597, 2.11565, 1.49988, 2.24801, 2.91742, 1.7301, 0.86022, 2.43659, 3.39745, 4.03275, 4.20772, 5.47304, 3.86726, 1.5282, 1.60662, 2.67222, 3.51047, 1.75959, 1.95082, 1.6048, 3.18684, 4.07883, 5.94452, 2.35207, 1.13119, 4.99948, 5.00217, 5.06629, 5.28855, 2.57095, 5.08355, 5.70512, 1.47307, 2.67959, 5.22478, 3.71871, 4.91479, 4.83833, 5.41431, 3.974, 4.64576, 2.41089, 6.00102, 5.69401, 5.20252, 4.27443, 1.50202, 4.70416, 4.59916, 2.80017, 5.41196, 3.12301, 1.47195, 6.03208, 5.86088, 2.77123, 4.12953, 1.85273, 4.16301, 5.87228, 5.22366, 3.80114, 1.6365, 5.33813, 5.23591, 5.04118, 1.83493, 6.02941, 0.93092, 3.53463, 1.86702, 3.63823, 2.24093, 3.72907, 2.75507, 2.42522, 5.94845, 1.2591, 4.71919, 1.44564, 5.84233, 5.12359, 1.79654, 4.91525, 4.32579, 2.74139, 5.50917, 4.35695, 2.99301, 4.86331, 3.97638, 1.53193, 5.95316, 3.51859, 4.23795, 2.38348, 5.50785, 5.8348, 4.75469, 2.20286, 2.38471, 3.98318, 2.7734, 2.58214],

),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end


if(dictname == "ku_ws_501_basins_eps410256_pselected_random_unit500")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"randomlychosen_severalfiles",
"unit1" => 1,
"unit2" => 500,
"u01" => [1.75248, 1.75862, 1.77073, 1.77141, 1.79085, 1.80715, 1.81015, 1.82058, 1.82278, 1.82771, 1.83139, 1.8345, 1.84985, 1.86468, 1.93381, 1.94047, 1.95006, 1.96598, 1.97728, 1.98287, 1.98802, 1.99116, 2.01693, 2.02969, 2.03145, 2.05222, 2.0614, 2.06535, 2.07896, 2.08851, 2.08912, 2.11094, 2.1196, 2.12019, 2.13204, 2.19201, 2.19323, 2.20655, 2.20728, 2.21053, 2.21785, 2.22338, 2.23588, 2.23737, 2.24468, 2.2549, 2.2727, 2.2909, 2.29093, 2.29124, 2.29307, 2.29403, 2.29636, 2.30776, 2.30973, 2.31984, 2.32228, 2.32654, 2.33494, 2.3502, 2.36037, 2.36941, 2.37849, 2.39535, 2.40671, 2.42598, 2.4303, 2.43286, 2.44293, 2.47224, 2.48549, 2.48719, 2.49857, 2.50512, 2.50894, 2.52174, 2.52191, 2.52581, 2.53103, 2.53369, 2.53563, 2.53785, 2.54214, 2.54223, 2.57164, 2.60057, 2.61456, 2.62876, 2.63762, 2.63792, 2.67593, 2.67908, 2.6849, 2.70039, 2.73568, 2.75211, 2.75851, 2.76904, 2.77631, 2.78826, 2.79674, 2.79717, 2.80402, 2.81414, 2.81777, 2.82749, 2.8307, 2.83499, 2.85745, 2.85766, 2.86889, 2.88702, 2.90742, 2.91508, 2.93955, 2.95718, 2.97496, 2.97587, 2.98206, 2.98907, 3.01687, 3.01713, 3.02058, 3.03872, 3.07022, 3.07367, 3.07534, 3.07645, 3.07812, 3.09451, 3.09696, 3.10452, 3.11503, 3.13027, 3.13191, 3.13865, 3.14237, 3.15329, 3.17982, 3.25315, 3.2658, 3.26955, 3.27132, 3.28953, 3.30215, 3.32921, 3.32963, 3.33371, 3.3414, 3.35023, 3.35422, 3.35495, 3.35987, 3.36081, 3.39285, 3.40866, 3.41734, 3.41936, 3.4227, 3.42323, 3.42665, 3.45225, 3.45728, 3.46162, 3.47768, 3.49721, 3.52793, 3.54276, 3.55184, 3.55331, 3.57108, 3.57925, 3.59606, 3.59984, 3.60935, 3.62325, 3.6331, 3.65879, 3.66814, 3.70422, 3.71052, 3.72209, 3.73677, 3.74092, 3.74315, 3.74385, 3.7447, 3.76126, 3.76363, 3.76371, 3.76538, 3.77666, 3.79807, 3.80428, 3.80741, 3.8239, 3.83082, 3.8398, 3.86209, 3.88958, 3.89357, 3.89411, 3.89558, 3.90244, 3.91514, 3.91588, 3.94539, 3.94749, 3.94944, 3.95443, 3.96895, 3.97502, 3.98231, 3.98495, 4.00237, 4.0042, 4.01357, 4.02588, 4.02647, 4.04583, 4.07362, 4.07386, 4.07847, 4.08761, 4.08991, 4.09046, 4.09902, 4.0999, 4.11354, 4.12494, 4.14625, 4.192, 4.19863, 4.2048, 4.20536, 4.20897, 4.21116, 4.21542, 4.22415, 4.22448, 4.22889, 4.25016, 4.26194, 4.26689, 4.29648, 4.30825, 4.34025, 4.34655, 4.35803, 4.35978, 4.36211, 4.3787, 4.3925, 4.40539, 4.41419, 4.42218, 4.4288, 4.43489, 4.45594, 4.45714, 4.47479, 4.47693, 4.47984, 4.49176, 4.49615, 4.49927, 4.50986, 4.51058, 4.51672, 4.52123, 4.55534, 4.56227, 4.5708, 4.58178, 4.60934, 4.65605, 4.66119, 4.66578, 4.67953, 4.69464, 4.70023, 4.7047, 4.71466, 4.71977, 4.72643, 4.74853, 4.75052, 4.75362, 4.76239, 4.76538, 4.76742, 4.77173, 4.79973, 4.80098, 4.80589, 4.81033, 4.81235, 4.81668, 4.82297, 4.84506, 4.84814, 4.85511, 4.88764, 4.88965, 4.89102, 4.89434, 4.90382, 4.92905, 4.95289, 4.95521, 4.96739, 5.0015, 5.02541, 5.04565, 5.0539, 5.05939, 5.10272, 5.12583, 5.12886, 5.1462, 5.15782, 5.16748, 5.17616, 5.17634, 5.17914, 5.18156, 5.18877, 5.18937, 5.2032, 5.21436, 5.22243, 5.24952, 5.2577, 5.26056, 5.28389, 5.2882, 5.29484, 5.30475, 5.31366, 5.37687, 5.38523, 5.39304, 5.40184, 5.41166, 5.42408, 5.43604, 5.43876, 5.44609, 5.45894, 5.49523],
"u02" => [0.01819, 0.02665, 0.02876, 0.02949, 0.03197, 0.04378, 0.06035, 0.06434, 0.07537, 0.07791, 0.09615, 0.09729, 0.11009, 0.15047, 0.15133, 0.15214, 0.15489, 0.15938, 0.16046, 0.16397, 0.20976, 0.2565, 0.25904, 0.35044, 0.35636, 0.36417, 0.37335, 0.38868, 0.38903, 0.39764, 0.40549, 0.4061, 0.43111, 0.43503, 0.44762, 0.45451, 0.46968, 0.48644, 0.49279, 0.52785, 0.54122, 0.54509, 0.58158, 0.5845, 0.61305, 0.61529, 0.62896, 0.65199, 0.68525, 0.72933, 0.74694, 0.76061, 0.77324, 0.78172, 0.78721, 0.79611, 0.82851, 0.82855, 0.83045, 0.84398, 0.85179, 0.86267, 0.88081, 0.90084, 0.92332, 0.93338, 0.95268, 0.95622, 0.96493, 0.96644, 0.96678, 0.97027, 1.00286, 1.00667, 1.01586, 1.02121, 1.02896, 1.05551, 1.07167, 1.07972, 1.11794, 1.15316, 1.15601, 1.16408, 1.17527, 1.19959, 1.20149, 1.20212, 1.24535, 1.2583, 1.27932, 1.28477, 1.29976, 1.30402, 1.31254, 1.32712, 1.373, 1.37601, 1.38237, 1.41305, 1.43765, 1.44244, 1.47835, 1.49511, 1.49732, 1.51709, 1.54282, 1.56212, 1.57388, 1.61242, 1.6156, 1.65272, 1.66688, 1.66877, 1.67312, 1.67517, 1.68656, 1.68706, 1.69003, 1.69621, 1.69909, 1.71259, 1.71997, 1.72035, 1.73416, 1.73537, 1.75477, 1.80989, 1.858, 1.88543, 1.88758, 1.8924, 1.89395, 1.9089, 1.91544, 1.92822, 2.01321, 2.01982, 2.0861, 2.08848, 2.08906, 2.09859, 2.10691, 2.14204, 2.1791, 2.18657, 2.19058, 2.21751, 2.2414, 2.25395, 2.26206, 2.27074, 2.28709, 2.28739, 2.31144, 2.31907, 2.33908, 2.40469, 2.40792, 2.42182, 2.43226, 2.43886, 2.4581, 2.4621, 2.47617, 2.49232, 2.52153, 2.52281, 2.56369, 2.57348, 2.5892, 2.60107, 2.62325, 2.63447, 2.66988, 2.67257, 2.68349, 2.69003, 2.69634, 2.71152, 2.73162, 2.75309, 2.75482, 2.76381, 2.79106, 2.82468, 2.8273, 2.82776, 2.86174, 2.88448, 2.88792, 2.9061, 2.91409, 2.91561, 2.91784, 2.91956, 2.93902, 2.94918, 2.97787, 2.99607, 3.01459, 3.02768, 3.04179, 3.05239, 3.08231, 3.11552, 3.11619, 3.12096, 3.1389, 3.14347, 3.15183, 3.17073, 3.17818, 3.18585, 3.18915, 3.20962, 3.21366, 3.2214, 3.22888, 3.24739, 3.27239, 3.28507, 3.29612, 3.32728, 3.35449, 3.38941, 3.41213, 3.42219, 3.43435, 3.44015, 3.44737, 3.46743, 3.48125, 3.48322, 3.48982, 3.50316, 3.51097, 3.51877, 3.54372, 3.56824, 3.58443, 3.58865, 3.59875, 3.60879, 3.63438, 3.63541, 3.63807, 3.65657, 3.71439, 3.82143, 3.8291, 3.84465, 3.84465, 3.88228, 3.88262, 3.8834, 3.88393, 3.88656, 3.89325, 3.90225, 3.93708, 3.95825, 3.95898, 3.95934, 3.97123, 3.98682, 3.9974, 4.02541, 4.02601, 4.03142, 4.06872, 4.07247, 4.0889, 4.11728, 4.12949, 4.13826, 4.1436, 4.17336, 4.17652, 4.18571, 4.19216, 4.22606, 4.23171, 4.24326, 4.25741, 4.27929, 4.289, 4.28941, 4.29005, 4.29233, 4.302, 4.30234, 4.30307, 4.31013, 4.31369, 4.31829, 4.33091, 4.34158, 4.35063, 4.35755, 4.35954, 4.37344, 4.39272, 4.40566, 4.44455, 4.45191, 4.45243, 4.46614, 4.47614, 4.47829, 4.47987, 4.48403, 4.49505, 4.5164, 4.54033, 4.57772, 4.58379, 4.64163, 4.69649, 4.73263, 4.73469, 4.74901, 4.82382, 4.84426, 4.84838, 4.89366, 4.89659, 4.90981, 4.916, 4.92182, 4.93465, 4.93515, 4.95704, 4.98272, 4.99733, 5.00905, 5.01252, 5.03243, 5.0467, 5.05272, 5.05943, 5.06676, 5.06969, 5.07845, 5.11403, 5.13976, 5.16165, 5.17796, 5.18119, 5.18632, 5.28158, 5.30567, 5.31317, 5.34216, 5.34949, 5.35662, 5.39385, 5.40612, 5.44789, 5.46319, 5.46828, 5.4911, 5.53327, 5.55643, 5.61903, 5.62206, 5.64148, 5.65578, 5.67518, 5.68685, 5.69619, 5.70313, 5.70501, 5.71521, 5.75767, 5.76787, 5.78729, 5.78826, 5.79075, 5.82556, 5.8425, 5.89448, 5.98508, 6.01792, 6.0553, 6.08067, 6.08564, 6.09462, 6.12592, 6.13578, 6.15841, 6.1897, 6.20903, 6.22051, 6.22455, 6.2278, 6.22856, 6.25049, 6.25184, 6.27303],

),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_random_unit2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"randomlychosen_severalfiles",
"unit1" => 1,
"unit2" => 2,
"u01" => [2.00435, 2.00493, 2.01119, 2.01124, 2.01605, 2.0163, 2.01908, 2.02351, 2.02952, 2.05742, 2.06645, 2.07086, 2.07491, 2.08969, 2.09168, 2.09406, 2.09431, 2.10239, 2.10654, 2.11401, 2.13308, 2.13849, 2.16287, 2.16629, 2.18845, 2.20772, 2.22986, 2.25146, 2.25735, 2.27127, 2.30775, 2.34816, 2.35275, 2.3601, 2.36939, 2.37369, 2.3803, 2.38964, 2.39836, 2.45039, 2.45335, 2.46444, 2.46825, 2.47235, 2.48063, 2.48472, 2.49376, 2.50311, 2.50323, 2.50408, 2.53127, 2.53214, 2.53268, 2.54307, 2.58905, 2.59601, 2.62287, 2.63573, 2.65866, 2.68037, 2.68314, 2.72157, 2.7474, 2.76169, 2.76764, 2.77771, 2.78417, 2.79711, 2.79821, 2.79977, 2.8084, 2.81628, 2.85049, 2.86231, 2.88669, 2.89338, 2.89696, 2.90701, 2.94241, 2.96579, 2.96649, 2.96867, 2.9868, 3.00087, 3.0173, 3.0236, 3.02932, 3.0518, 3.07657, 3.0778, 3.07916, 3.08583, 3.10054, 3.10098, 3.12384, 3.12757, 3.13058, 3.13677, 3.17527, 3.18909, 3.2292, 3.23991, 3.24611, 3.28272, 3.28938, 3.30396, 3.3173, 3.34097, 3.35254, 3.39312, 3.3955, 3.40846, 3.41697, 3.44643, 3.45603, 3.46494, 3.47219, 3.47319, 3.48874, 3.51083, 3.54278, 3.57415, 3.58275, 3.58751, 3.59831, 3.6037, 3.63719, 3.63742, 3.64659, 3.65237, 3.67298, 3.68833, 3.69954, 3.70949, 3.72135, 3.7321, 3.75335, 3.75386, 3.76381, 3.77609, 3.77772, 3.77946, 3.78286, 3.79144, 3.80087, 3.81707, 3.82199, 3.82343, 3.82828, 3.83421, 3.83472, 3.91607, 3.92382, 3.93291, 3.94981, 3.95062, 3.95939, 3.98276, 3.99083, 4.01538, 4.01758, 4.03615, 4.04523, 4.06262, 4.06527, 4.06735, 4.0724, 4.07436, 4.0858, 4.095, 4.09916, 4.15088, 4.16211, 4.21462, 4.22519, 4.22703, 4.27159, 4.29641, 4.30842, 4.31746, 4.3196, 4.32944, 4.33577, 4.34164, 4.34384, 4.36335, 4.41034, 4.41787, 4.47695, 4.49523, 4.51961, 4.54804, 4.57128, 4.5816, 4.5932, 4.60499, 4.60681, 4.61123, 4.6124, 4.64466, 4.6491, 4.66297, 4.71771, 4.74152, 4.74979, 4.75357, 4.76966, 4.78439, 4.78687, 4.79787, 4.80895, 4.83347, 4.83734, 4.86463, 4.86605, 4.87601, 4.90069, 4.94149, 4.9812, 4.98274, 5.0092, 5.03071, 5.13181, 5.13506, 5.13766, 5.15276, 5.15696, 5.17943, 5.18007, 5.18072, 5.1816, 5.18982, 5.21073, 5.21561, 5.2279, 5.24005, 5.24096, 5.24172, 5.25477, 5.26108, 5.26269, 5.26573, 5.26629, 5.32415, 5.34792, 5.35585, 5.36713, 5.36821, 5.38045, 5.40094],
"u02" => [0.02872, 0.0296, 0.03092, 0.04859, 0.04934, 0.05429, 0.09466, 0.10532, 0.11937, 0.12614, 0.13053, 0.13579, 0.14188, 0.16861, 0.17242, 0.17498, 0.18209, 0.18586, 0.18913, 0.22409, 0.22767, 0.235, 0.23764, 0.24152, 0.24362, 0.32853, 0.33302, 0.3343, 0.36052, 0.36159, 0.36481, 0.36515, 0.36629, 0.37454, 0.38315, 0.39029, 0.42499, 0.42989, 0.43427, 0.45187, 0.46059, 0.46158, 0.46448, 0.48909, 0.51365, 0.51931, 0.53138, 0.53877, 0.552, 0.58211, 0.5982, 0.63006, 0.65525, 0.68483, 0.73072, 0.73765, 0.76105, 0.76146, 0.7721, 0.77598, 0.7792, 0.80616, 0.81011, 0.82808, 0.84183, 0.88557, 0.89458, 0.90466, 0.92676, 0.93039, 0.93203, 0.95677, 0.96206, 0.96427, 0.97127, 0.98463, 1.00449, 1.01215, 1.03042, 1.04819, 1.05028, 1.0594, 1.08644, 1.13376, 1.13646, 1.16595, 1.16871, 1.19628, 1.24925, 1.27206, 1.27365, 1.27505, 1.29343, 1.30484, 1.32229, 1.33684, 1.34249, 1.3568, 1.3804, 1.39103, 1.39675, 1.41198, 1.41667, 1.42855, 1.43115, 1.44223, 1.44624, 1.45237, 1.45646, 1.46062, 1.46102, 1.47133, 1.49025, 1.49874, 1.49908, 1.50246, 1.50364, 1.50579, 1.51584, 1.51986, 1.53276, 1.57193, 1.59881, 1.59998, 1.61504, 1.6194, 1.66664, 1.68039, 1.68993, 1.69596, 1.70972, 1.72253, 1.73313, 1.73566, 1.78188, 1.80742, 1.81405, 1.82679, 1.82731, 1.84766, 1.84798, 1.85629, 1.85952, 1.86598, 1.87607, 1.8883, 1.88934, 1.89231, 1.90958, 1.95327, 1.96685, 2.00945, 2.03601, 2.04168, 2.04452, 2.05185, 2.06213, 2.07374, 2.07567, 2.07605, 2.07635, 2.08049, 2.08297, 2.0935, 2.09479, 2.09901, 2.10177, 2.10402, 2.12938, 2.13116, 2.13395, 2.15696, 2.15905, 2.16746, 2.17268, 2.17449, 2.17845, 2.19722, 2.21548, 2.21594, 2.22318, 2.226, 2.22627, 2.22685, 2.24717, 2.24888, 2.28044, 2.28781, 2.30939, 2.30965, 2.34679, 2.36355, 2.36836, 2.36842, 2.38885, 2.42575, 2.43128, 2.47893, 2.49604, 2.51181, 2.51366, 2.51688, 2.53673, 2.54592, 2.55685, 2.56379, 2.58691, 2.60234, 2.6046, 2.61197, 2.62432, 2.63015, 2.63112, 2.63124, 2.67371, 2.67812, 2.68103, 2.68162, 2.71871, 2.73147, 2.7385, 2.74383, 2.75917, 2.77311, 2.82191, 2.82872, 2.83519, 2.8401, 2.85373, 2.85712, 2.86498, 2.87647, 2.88256, 2.8877, 2.89558, 2.90704, 2.90851, 2.91958, 2.92304, 2.93039, 2.93463, 2.98504, 3.02801, 3.03676, 3.03692, 3.03899, 3.0457, 3.04757, 3.06666, 3.07394, 3.07517, 3.08642, 3.09311, 3.10381, 3.12595, 3.13504, 3.15675, 3.17801, 3.18783, 3.19063, 3.22459, 3.23838, 3.24819, 3.25277, 3.27389, 3.28721, 3.29646, 3.3178, 3.35404, 3.36147, 3.36283, 3.3701, 3.373, 3.4044, 3.41132, 3.44848, 3.46456, 3.47399, 3.48067, 3.48082, 3.48899, 3.5097, 3.52402, 3.53388, 3.53591, 3.58294, 3.60912, 3.66256, 3.71052, 3.71673, 3.72445, 3.73479, 3.74589, 3.75374, 3.75376, 3.75666, 3.77791, 3.78038, 3.78114, 3.78449, 3.78818, 3.79877, 3.81229, 3.8211, 3.83493, 3.8413, 3.85447, 3.86839, 3.86977, 3.89349, 3.89772, 3.91674, 3.91842, 3.94099, 3.96299, 3.97127, 3.9738, 3.98613, 3.98856, 3.9991, 4.00783, 4.02333, 4.03567, 4.03907, 4.04091, 4.04118, 4.05121, 4.05754, 4.06337, 4.06917, 4.08334, 4.08372, 4.09413, 4.10627, 4.11509, 4.12244, 4.1229, 4.1295, 4.1388, 4.13964, 4.15172, 4.1567, 4.16042, 4.19666, 4.19783, 4.20426, 4.20849, 4.23592, 4.2381, 4.30549, 4.32858, 4.33947, 4.38629, 4.40368, 4.41057, 4.4538, 4.45518, 4.46093, 4.50376, 4.51287, 4.51474, 4.51671, 4.52714, 4.54825, 4.57268, 4.5838, 4.59455, 4.59528, 4.60313, 4.60522, 4.61976, 4.63271, 4.6368, 4.64272, 4.64283, 4.65059, 4.65455, 4.66773, 4.6897, 4.69428, 4.69461, 4.71177, 4.71404, 4.72963, 4.74233, 4.74983, 4.77493, 4.81269, 4.82343, 4.84545, 4.84818, 4.9196, 4.94938, 4.96368, 4.9736, 4.97612, 4.9923, 5.00214, 5.00636, 5.01264, 5.0273, 5.03987, 5.05685, 5.06115, 5.07048, 5.07755, 5.10598, 5.1175, 5.13011, 5.13793, 5.14462, 5.17186, 5.17572, 5.20635, 5.23645, 5.23798, 5.25621, 5.27647, 5.28707, 5.29054, 5.31013, 5.32407, 5.33539, 5.34997, 5.35899, 5.36868, 5.38709, 5.39146, 5.40603, 5.4109, 5.41237, 5.41284, 5.41386, 5.44615, 5.45276, 5.45327, 5.46779, 5.47176, 5.48731, 5.50417, 5.52632, 5.53059, 5.56115, 5.58504, 5.59237, 5.59397, 5.65506, 5.6789, 5.68619, 5.70548, 5.71638, 5.72855, 5.77081, 5.77518, 5.78378, 5.79565, 5.80557, 5.82153, 5.83566, 5.84126, 5.86423, 5.88609, 5.88746, 5.88837, 5.89199, 5.91527, 5.91971, 5.9333, 5.95665, 5.98205, 5.99032, 5.99647, 5.99771, 6.01534, 6.06026, 6.06394, 6.06562, 6.09805, 6.09805, 6.10445, 6.10498, 6.10638, 6.10796, 6.12401, 6.13585, 6.13824, 6.14017, 6.15073, 6.16275, 6.17362, 6.17733, 6.17979, 6.18276, 6.22264, 6.22573, 6.22824, 6.23864, 6.25722, 6.26634, 6.26794],
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end


if(dictname == "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"moredetails",
"unit1" => 1,
"unit2" => 2,
"u01" => collect(range(2, 5.41, length=500)),
"u02" => collect(range(1.8, 5.8, length=1000)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit500")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"moredetails",
"unit1" => 1,
"unit2" => 500,
"u01" => collect(range(1.75, 5.5, length=750)),
"u02" => collect(range(0, 2pi, length=1000)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit2_lsoda")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => [0.06661],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 4.10256,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => [0],
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"ictwounits",
    "mchange2"=>"moredetails",
    "unit1" => 1,
    "unit2" => 2,
    "u01" => collect(range(2, 5.41, length=250)),
    "u02" => collect(range(1.8, 5.8, length=500)),
    "solver" => "lsoda",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "mchange2" => "NP2",
    "unit1" => "RP",
    "unit2" => "RP",
    "u01" => "CP",
    "u02" => "RP",
    "solver" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit2_lsoda_unitchange1100")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => [0.06661],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 4.10256,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => [1,100],
    "ω_new" => 10.0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>("oneunit", "ictwounits"),
    "mchange2"=>"moredetails",
    "unit1" => 1,
    "unit2" => 2,
    "u01" => collect(range(2, 5.41, length=250)),
    "u02" => collect(range(1.8, 5.8, length=500)),
    "solver" => "lsoda",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    "mchange2" => "NP2",
    "unit1" => "RP",
    "unit2" => "RP",
    "u01" => "CP",
    "u02" => "RP",
    "solver" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_basins_eps410256_pselected_3_moredetails_unit2_lsoda_shuffleid2")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" => [0.06661],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => 4.10256,
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => [2],
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"ictwounits",
        "mchange2"=>"moredetails",
        "unit1" => 1,
        "unit2" => 2,
        "u01" => collect(range(2, 5.41, length=250)),
        "u02" => collect(range(1.8, 5.8, length=500)),
        "solver" => "lsoda",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
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
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        "mchange2" => "NP2",
        "unit1" => "RP",
        "unit2" => "RP",
        "u01" => "CP",
        "u02" => "RP",
        "solver" => "NP2",
        )]                        end










# =========================================================================== POWERLAW




if(dictname == "ku_pl_501_shuf_eps_alpha19")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.9,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:2),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_alpha_eps8")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 8.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:2),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_pl_501_shuf_eps_alpha19_detail")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.9,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [1.23077, 4.0, 5.23077,  6.15385, 6.46154, 8.0, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:2),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_alpha_eps553_detail")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 1.0, 1.69231,  1.84615, 1.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 5.53486,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:2),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end
if(dictname == "ku_pl_501_shuf_eps_alpha19_detail_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.9,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [1.23077, 4.0, 5.23077,  6.15385, 6.46154, 8.0, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:2),
#simulation
"tend" => 1250.,
"ttrans" => 0.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_pl_501_shuf_p_eps646154_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(31:125),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_p_eps646154_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(155:250),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_p_eps646154")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:501),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha176923_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(36:125),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha176923_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(134:250),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha176923")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:501),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha3_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(73:125),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha3_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(211:250),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:501),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end
if(dictname == "ku_pl_501_shuf_eps_alpha0_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:125),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha0_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(195:250),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end



if(dictname == "ku_pl_501_shuf_eps_alpha153846_1")
    return [Dict(
    #topology
    "N" => 501, #NP
    "alpha" =>1.53846,
    "mtop" => "PL",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => collect(0:125),
    #simulation
    "tend" => 1250.,
    "ttrans" => 500.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "alpha" => "RP", #----important one, might change to CP
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
    
    if(dictname == "ku_pl_501_shuf_eps_alpha153846_2")
        return [Dict(
        #topology
        "N" => 501, #NP
        "alpha" =>1.53846,
        "mtop" => "PL",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => collect(126:250),
        #simulation
        "tend" => 1250.,
        "ttrans" => 500.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "alpha" => "RP", #----important one, might change to CP
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end
        if(dictname == "ku_pl_501_shuf_eps_alpha153846_3")
            return [Dict(
            #topology
            "N" => 501, #NP
            "alpha" =>1.53846,
            "mtop" => "PL",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => collect(251:375),
            #simulation
            "tend" => 1250.,
            "ttrans" => 500.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "alpha" => "RP", #----important one, might change to CP
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end
            if(dictname == "ku_pl_501_shuf_eps_alpha153846_4")
                return [Dict(
                #topology
                "N" => 501, #NP
                "alpha" =>1.53846,
                "mtop" => "PL",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => collect(376:500),
                #simulation
                "tend" => 1250.,
                "ttrans" => 500.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "alpha" => "RP", #----important one, might change to CP
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end

                if(dictname == "ku_pl_501_shuf_eps_alpha153846")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "alpha" =>1.53846,
                    "mtop" => "PL",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => collect(0:500),
                    #simulation
                    "tend" => 1250.,
                    "ttrans" => 500.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "alpha" => "RP", #----important one, might change to CP
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end



if(dictname == "ku_pl_501_shuf_eps_alpha0")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:501),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

#------ one unit

if(dictname == "ku_pl_501_unit_eps_alpha176923_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(103:125),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha176923_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(243:250),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha176923")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha0_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(119:125),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha0_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(238:250),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha0")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha3_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(75:125),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha3_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(125:250),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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


if(dictname == "ku_pl_501_unit_alpha_eps646154_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(123:125),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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

if(dictname == "ku_pl_501_unit_alpha_eps646154_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(224:250),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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

if(dictname == "ku_pl_501_unit_alpha_eps646154")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 10.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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



if(dictname == "ku_pl_501_unit_eps_alpha176923_omeganew3_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:250),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha176923_omeganew3_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(251:501),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha176923_omeganew3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha0_omeganew3_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:250),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha0_omeganew3_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(251:501),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha0_omeganew3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>0.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:501),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha3_omeganew3_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:250),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha3_omeganew3_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>3.0,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(251:501),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
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

if(dictname == "ku_pl_501_unit_eps_alpha3_omeganew3")
    return [Dict(
    #topology
    "N" => 501, #NP
    "alpha" =>3.0,
    "mtop" => "PL",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(0:501),
    "ω_new" => 3.0,
    #simulation
    "tend" => 1250.,
    "ttrans" => 500.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "alpha" => "RP", #----important one, might change to CP
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
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
    


    if(dictname == "ku_pl_501_unit_eps_alpha153846_omeganew3_1")
        return [Dict(
        #topology
        "N" => 501, #NP
        "alpha" =>1.53846,
        "mtop" => "PL",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        "idx_unit" => collect(0:250),
        "ω_new" => 3.0,
        #simulation
        "tend" => 1250.,
        "ttrans" => 500.,
        "dtana" => 1.0,
        "mchange"=>"oneunit",
        ),
        Dict(
        #topology
        "N" => "NP",
        "alpha" => "RP", #----important one, might change to CP
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
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

        if(dictname == "ku_pl_501_unit_eps_alpha153846_omeganew3_2")
            return [Dict(
            #topology
            "N" => 501, #NP
            "alpha" =>1.53846,
            "mtop" => "PL",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => 0,
            "idx_unit" => collect(251:500),
            "ω_new" => 3.0,
            #simulation
            "tend" => 1250.,
            "ttrans" => 500.,
            "dtana" => 1.0,
            "mchange"=>"oneunit",
            ),
            Dict(
            #topology
            "N" => "NP",
            "alpha" => "RP", #----important one, might change to CP
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
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

            if(dictname == "ku_pl_501_unit_eps_alpha153846_omeganew3")
                return [Dict(
                #topology
                "N" => 501, #NP
                "alpha" =>1.53846,
                "mtop" => "PL",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0,
                "idx_unit" => collect(0:500),
                "ω_new" => 3.0,
                #simulation
                "tend" => 1250.,
                "ttrans" => 500.,
                "dtana" => 1.0,
                "mchange"=>"oneunit",
                ),
                Dict(
                #topology
                "N" => "NP",
                "alpha" => "RP", #----important one, might change to CP
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
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









#----------------------------- NOW TO 501

if(dictname == "ku_pl_501_shuf_p_eps646154_3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(344:501),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_p_eps646154_4")
    return [Dict(
    #topology
    "N" => 501, #NP
    "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
    "mtop" => "PL",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 6.46154,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => collect(468:501),
    #simulation
    "tend" => 1250.,
    "ttrans" => 500.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "alpha" => "CP", #----important one, might change to CP
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
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end



if(dictname == "ku_pl_501_shuf_eps_alpha176923_3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>1.76923,
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(306:375),
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"alpha" => "RP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_shuf_eps_alpha176923_4")
    return [Dict(
    #topology
    "N" => 501, #NP
    "alpha" =>1.76923,
    "mtop" => "PL",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => collect(498:501),
    #simulation
    "tend" => 1250.,
    "ttrans" => 500.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "alpha" => "RP", #----important one, might change to CP
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_pl_501_shuf_eps_alpha3_3")
        return [Dict(
        #topology
        "N" => 501, #NP
        "alpha" =>3.0,
        "mtop" => "PL",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => collect(251:375),
        #simulation
        "tend" => 1250.,
        "ttrans" => 500.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "alpha" => "RP", #----important one, might change to CP
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

        if(dictname == "ku_pl_501_shuf_eps_alpha3_4")
            return [Dict(
            #topology
            "N" => 501, #NP
            "alpha" =>3.0,
            "mtop" => "PL",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => collect(453:501),
            #simulation
            "tend" => 1250.,
            "ttrans" => 500.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "alpha" => "RP", #----important one, might change to CP
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end
            if(dictname == "ku_pl_501_shuf_eps_alpha0_3")
                return [Dict(
                #topology
                "N" => 501, #NP
                "alpha" =>0.0,
                "mtop" => "PL",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => collect(251:375),
                #simulation
                "tend" => 1250.,
                "ttrans" => 500.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "alpha" => "RP", #----important one, might change to CP
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end

                if(dictname == "ku_pl_501_shuf_eps_alpha0_4")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "alpha" =>0.0,
                    "mtop" => "PL",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => collect(376:501),
                    #simulation
                    "tend" => 1250.,
                    "ttrans" => 500.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "alpha" => "RP", #----important one, might change to CP
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end


if(dictname == "ku_pl_501_unit_alpha_eps646154_omeganew3_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(0:250),
# "idx_unit" => collect(224:250),
"ω_new" => 3.0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
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

if(dictname == "ku_pl_501_unit_alpha_eps646154_omeganew3_2")
    return [Dict(
    #topology
    "N" => 501, #NP
    "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
    "mtop" => "PL",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 6.46154,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "idx_unit" => collect(251:501),
    # "idx_unit" => collect(458:501),
    "ω_new" => 3.0,
    #simulation
    "tend" => 1250.,
    "ttrans" => 500.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    ),
    Dict(
    #topology
    "N" => "NP",
    "alpha" => "CP", #----important one, might change to CP
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

    if(dictname == "ku_pl_501_unit_alpha_eps646154_omeganew3")
        return [Dict(
        #topology
        "N" => 501, #NP
        "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
        "mtop" => "PL",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => 6.46154,
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        "idx_unit" => collect(0:501),
        # "idx_unit" => collect(458:501),
        "ω_new" => 3.0,
        #simulation
        "tend" => 1250.,
        "ttrans" => 500.,
        "dtana" => 1.0,
        "mchange"=>"oneunit",
        ),
        Dict(
        #topology
        "N" => "NP",
        "alpha" => "CP", #----important one, might change to CP
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
                    #------ one unit

                    if(dictname == "ku_pl_501_unit_eps_alpha176923_3")
                        return [Dict(
                        #topology
                        "N" => 501, #NP
                        "alpha" =>1.76923,
                        "mtop" => "PL",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => 0,
                        "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        "shuffleid" => 0,
                        "idx_unit" => collect(275:375),
                        "ω_new" => 10.0,
                        #simulation
                        "tend" => 1250.,
                        "ttrans" => 500.,
                        "dtana" => 1.0,
                        "mchange"=>"oneunit",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "alpha" => "RP", #----important one, might change to CP
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
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

                        if(dictname == "ku_pl_501_unit_eps_alpha176923_4")
                            return [Dict(
                            #topology
                            "N" => 501, #NP
                            "alpha" =>1.76923,
                            "mtop" => "PL",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" => 0,
                            "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            "shuffleid" => 0,
                            "idx_unit" => collect(498:501),
                            "ω_new" => 10.0,
                            #simulation
                            "tend" => 1250.,
                            "ttrans" => 500.,
                            "dtana" => 1.0,
                            "mchange"=>"oneunit",
                            ),
                            Dict(
                            #topology
                            "N" => "NP",
                            "alpha" => "RP", #----important one, might change to CP
                            "mtop" => "NP",
                            #dynamical
                            "mmodel" => "NP",
                            "seedic" => "NP2",
                            "epsi" =>  "CP", #CP ----- important one, might change to RP
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

                            if(dictname == "ku_pl_501_unit_eps_alpha0_3")
                                return [Dict(
                                #topology
                                "N" => 501, #NP
                                "alpha" =>0.0,
                                "mtop" => "PL",
                                #dynamical
                                "mmodel" => "kuramoto",
                                "seedic" => 0,
                                "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                                "mu" => 0.0,
                                "std" => 1.0,
                                "mfreq" => "gauss",
                                "seedfreq" => 0,
                                "shuffleid" => 0,
                                "idx_unit" => collect(251:375),
                                "ω_new" => 10.0,
                                #simulation
                                "tend" => 1250.,
                                "ttrans" => 500.,
                                "dtana" => 1.0,
                                "mchange"=>"oneunit",
                                ),
                                Dict(
                                #topology
                                "N" => "NP",
                                "alpha" => "RP", #----important one, might change to CP
                                "mtop" => "NP",
                                #dynamical
                                "mmodel" => "NP",
                                "seedic" => "NP2",
                                "epsi" =>  "CP", #CP ----- important one, might change to RP
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

                                if(dictname == "ku_pl_501_unit_eps_alpha0_4")
                                    return [Dict(
                                    #topology
                                    "N" => 501, #NP
                                    "alpha" =>0.0,
                                    "mtop" => "PL",
                                    #dynamical
                                    "mmodel" => "kuramoto",
                                    "seedic" => 0,
                                    "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                                    "mu" => 0.0,
                                    "std" => 1.0,
                                    "mfreq" => "gauss",
                                    "seedfreq" => 0,
                                    "shuffleid" => 0,
                                    "idx_unit" => collect(376:501),
                                    "ω_new" => 10.0,
                                    #simulation
                                    "tend" => 1250.,
                                    "ttrans" => 500.,
                                    "dtana" => 1.0,
                                    "mchange"=>"oneunit",
                                    ),
                                    Dict(
                                    #topology
                                    "N" => "NP",
                                    "alpha" => "RP", #----important one, might change to CP
                                    "mtop" => "NP",
                                    #dynamical
                                    "mmodel" => "NP",
                                    "seedic" => "NP2",
                                    "epsi" =>  "CP", #CP ----- important one, might change to RP
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

                                    if(dictname == "ku_pl_501_unit_eps_alpha3_3")
                                        return [Dict(
                                        #topology
                                        "N" => 501, #NP
                                        "alpha" =>3.0,
                                        "mtop" => "PL",
                                        #dynamical
                                        "mmodel" => "kuramoto",
                                        "seedic" => 0,
                                        "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                                        "mu" => 0.0,
                                        "std" => 1.0,
                                        "mfreq" => "gauss",
                                        "seedfreq" => 0,
                                        "shuffleid" => 0,
                                        "idx_unit" => collect(356:375),
                                        "ω_new" => 10.0,
                                        #simulation
                                        "tend" => 1250.,
                                        "ttrans" => 500.,
                                        "dtana" => 1.0,
                                        "mchange"=>"oneunit",
                                        ),
                                        Dict(
                                        #topology
                                        "N" => "NP",
                                        "alpha" => "RP", #----important one, might change to CP
                                        "mtop" => "NP",
                                        #dynamical
                                        "mmodel" => "NP",
                                        "seedic" => "NP2",
                                        "epsi" =>  "CP", #CP ----- important one, might change to RP
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

                                        if(dictname == "ku_pl_501_unit_eps_alpha3_4")
                                            return [Dict(
                                            #topology
                                            "N" => 501, #NP
                                            "alpha" =>3.0,
                                            "mtop" => "PL",
                                            #dynamical
                                            "mmodel" => "kuramoto",
                                            "seedic" => 0,
                                            "epsi" => [0.0, 0.30769, 0.61538, 0.92308, 1.23077, 1.53846, 1.84615, 2.15385, 2.46154, 2.76923, 3.07692, 3.38462, 3.69231, 4.0, 4.30769, 4.61538, 4.92308, 5.23077, 5.53846, 5.84615, 6.15385, 6.46154, 6.76923, 7.07692, 7.38462, 7.69231, 8.0, 8.30769, 8.61538, 8.92308, 9.23077, 9.53846, 9.84615, 10.15385, 10.46154, 10.76923, 11.07692, 11.38462, 11.69231, 12.0],
                                            "mu" => 0.0,
                                            "std" => 1.0,
                                            "mfreq" => "gauss",
                                            "seedfreq" => 0,
                                            "shuffleid" => 0,
                                            "idx_unit" => collect(395:501),
                                            "ω_new" => 10.0,
                                            #simulation
                                            "tend" => 1250.,
                                            "ttrans" => 500.,
                                            "dtana" => 1.0,
                                            "mchange"=>"oneunit",
                                            ),
                                            Dict(
                                            #topology
                                            "N" => "NP",
                                            "alpha" => "RP", #----important one, might change to CP
                                            "mtop" => "NP",
                                            #dynamical
                                            "mmodel" => "NP",
                                            "seedic" => "NP2",
                                            "epsi" =>  "CP", #CP ----- important one, might change to RP
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


                                            if(dictname == "ku_pl_501_unit_alpha_eps646154_3")
                                                return [Dict(
                                                #topology
                                                "N" => 501, #NP
                                                "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
                                                "mtop" => "PL",
                                                #dynamical
                                                "mmodel" => "kuramoto",
                                                "seedic" => 0,
                                                "epsi" => 6.46154,
                                                "mu" => 0.0,
                                                "std" => 1.0,
                                                "mfreq" => "gauss",
                                                "seedfreq" => 0,
                                                "shuffleid" => 0,
                                                "idx_unit" => collect(268:375),
                                                "ω_new" => 10.0,
                                                #simulation
                                                "tend" => 1250.,
                                                "ttrans" => 500.,
                                                "dtana" => 1.0,
                                                "mchange"=>"oneunit",
                                                ),
                                                Dict(
                                                #topology
                                                "N" => "NP",
                                                "alpha" => "CP", #----important one, might change to CP
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

                                                if(dictname == "ku_pl_501_unit_alpha_eps646154_4")
                                                    return [Dict(
                                                    #topology
                                                    "N" => 501, #NP
                                                    "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
                                                    "mtop" => "PL",
                                                    #dynamical
                                                    "mmodel" => "kuramoto",
                                                    "seedic" => 0,
                                                    "epsi" => 6.46154,
                                                    "mu" => 0.0,
                                                    "std" => 1.0,
                                                    "mfreq" => "gauss",
                                                    "seedfreq" => 0,
                                                    "shuffleid" => 0,
                                                    "idx_unit" => collect(401:501),
                                                    "ω_new" => 10.0,
                                                    #simulation
                                                    "tend" => 1250.,
                                                    "ttrans" => 500.,
                                                    "dtana" => 1.0,
                                                    "mchange"=>"oneunit",
                                                    ),
                                                    Dict(
                                                    #topology
                                                    "N" => "NP",
                                                    "alpha" => "CP", #----important one, might change to CP
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



if(dictname == "ku_ws_501_basins_eps410256_pselected_3_details")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => [2, 250, 350, 500],
"u01" => collect(range(pi, 2pi, length=250)),
"u02" => collect(range(pi, 2pi, length=250)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",

)]                        end

if(dictname == "ku_ws_501_basins_eps410256_pselected_3_details_unit2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.06661],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => collect(range(2, 5.41, length=250)),
"u02" => collect(range(0, 2pi, length=500)),
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "CP",
"u02" => "RP",
)]                        end





# ================================================== LYAPUNOVS ====================
if(dictname == "ku_lyap_ws_501_shuf_p_1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 1,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 1,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_80000QRs")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 80000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_80000QRs_v2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"lyapunovversion" => "2",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 80000, #20000,
"ttrans_conv" => 0,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"lyapunovversion" => "2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_150000QRs")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.07627,  0.15013, 0.17191, 0.33839,  0.44367],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 150000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_e")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [5.94872, 8.0, 7.58974],
# "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641,  6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0], #wo 6.76
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_e_80000QRs")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [5.94872, 8.0, 7.58974],
# "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641,  6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0], #wo 6.76
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 80000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_e_80000QRs_pt2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [5.94872, 8.0, 7.58974],
# "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"epsi" => [4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641,  6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0], #wo 6.76
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 80000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_e_80000QRs_pt1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [5.94872, 8.0, 7.58974],
# "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744], #wo 6.76
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 80000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_e_15000QRs_pt2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [5.94872, 8.0, 7.58974],
# "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"epsi" => [4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641,  6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0], #wo 6.76
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 150000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=>2,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber"=>"RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_e_15000QRs_pt1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [5.94872, 8.0, 7.58974],
# "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744], #wo 6.76
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 150000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=>1,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber"=>"RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_e2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_ic_2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_ic_3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end
if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_T_50000")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"T" => 50000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"T" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_oldcode")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.01, 0.01311, 0.01501, 0.08733, 0.1, 0.1145, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_oldcode",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5500,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_cauchy_shuf_p")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 4000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 2.0,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps17")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 1.7,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_cauchy_shuf_p_ic0_eps15")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 1.5,
"x0" => 0.0,
"gamma" => 0.5,
"mfreq" => "cauchy",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
"x0" => "RP",
"gamma" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end



if(dictname == "ku_lyap_ws_501_shuf_p_ic_4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 2,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_eps2")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 2.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_eps17")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 1.6,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_eps14")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 1.4,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_eps10")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.001, 0.006, 0.01, 0.01145, 0.02254, 0.03384, 0.03875, 0.04437, 0.0508, 0.06661, 0.08733, 0.1, 0.1145,  0.19684, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 1.0,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end




if(dictname == "ku_lyap_ws_501_shuf_eps_ic_3_p008733")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => [0, 1, 2, 3, 4.10256, 5, 6, 7, 8],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end
if(dictname == "ku_lyap_ws_501_shuf_eps_ic_3_p1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>1.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => [0, 1, 1.5, 2, 2.5, 3, 4.10256, 5, 6, 7, 8],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_eps_ic_3_p003384")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.03384,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => [0, 1, 1.5, 2, 2.5, 3, 4.10256, 5, 6, 7, 8],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_altq0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 5000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mQ0"=>"altorthonormal",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mQ0" => "NP2",
"filenumber" => "RP",
)]    end



if(dictname == "ku_lyap_ws_501_shuf_p_altq0_30000QRs")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 30000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mQ0"=>"altorthonormal",
"filenumber"=> 2,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mQ0" => "NP2",
"filenumber" => "RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_25000QRs_states")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"filenumber" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"step_exactly" => false,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"step_exactly" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_25000QRs_states_steptrue")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"step_exactly" => true,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"step_exactly" => "RP",
)]    end






if(dictname == "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse_dt10")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 10.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"step_exactly" => false,
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"step_exactly" => "RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_25000QRs_states_stepfalse_dts")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.02254],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => [0.001, 0.01, 0.05, 0.1, 1.0, 5.0, 50.0, 10.0, 100.0],
"dtana" => 1.0,
"mchange"=>"shuffling",
"step_exactly" => false,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "CP",
"dtana" => "RP",
"mchange" => "NP2",
"step_exactly" => "RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_T_100000")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovconvergence_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"T" => 100000,
"ttrans_conv" => 10,
"dtana" => 1.0,
"Δt_lyap" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"T" => "RP",
"ttrans_conv" => "RP",
"Δt_lyap" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_p_T_2000000_fromfile")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovconvergence_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"T" => 2000000,
"ttrans_conv" => 10,
"dtana" => 1.0,
"Δt_lyap" => 1.0,
"mchange"=>"shuffling",
"lyapunovcalculation" => "icsfromfile",
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
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"T" => "RP",
"ttrans_conv" => "RP",
"Δt_lyap" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"lyapunovcalculation" => "RP",
)]    end


if(dictname == "ku_ws_lyap_501_shuf_p_eps410256-icsfrombasins-unit22_v2_steptrue")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.06661,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"lyapunovversion" => "2",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 80000, #20000,
"ttrans_conv" => 0,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => 3.99944,
"u02" => [0.9947327440224195, 1.4983948928945305, 2.505719190638753, 2.996789785789061,  3.563409703270186, 3.7648745628190308, 4.016705637255086, 5.024029934999309, 5.6536076210894475],
"step_exactly" => true,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"mintegration" => "NP2",
"lyapunovversion" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "RP",
"u02" => "CP",
"step_exactly" => "RP",
)]    end

if(dictname == "ku_ws_lyap_501_shuf_p_eps410256-icsfrombasins-unit22_v3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.06661,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"lyapunovversion" => "3",
"tend" => 3000.,
"ttrans_steady" => 0,
"num_QRs" => 80000, #20000,
"ttrans_conv" => 0,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => 3.99944,
"u02" => [0.9947327440224195, 1.4983948928945305, 2.505719190638753, 2.996789785789061,  3.563409703270186, 3.7648745628190308, 4.016705637255086, 5.024029934999309, 5.6536076210894475],
"step_exactly" => true,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"mintegration" => "NP2",
"lyapunovversion" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "RP",
"u02" => "CP",
"step_exactly" => "RP",
)]    end




if(dictname == "ku_lyap_ws_501_shuf_e_25000QRs_states_stepfalse")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.20513, 0.41026, 1.02564, 2.05218, 2.87179, 3.07692, 3.28205, 4.10256, 5.94872,  7.38462, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"step_exactly" => false,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"step_exactly" => "RP",
)]    end

if(dictname == "ku_lyap_ws_501_shuf_e_25000QRs_states_steptrue")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" => 0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.20513, 0.41026, 1.02564, 2.05218, 2.87179, 3.07692, 3.28205, 4.10256, 5.94872,  7.38462, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"tend" => 3000.,
"ttrans_steady" => 2500,
"num_QRs" => 25000, #20000,
"ttrans_conv" => 10,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
"step_exactly" => true,
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"mintegration" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"step_exactly" => "RP",
)]    end


if(dictname == "ku_lyap_ws_501_shuf_p_80000QRs_states_steptrue_v3")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"mintegration" => "lyapunovs_states",
"lyapunovversion" => "3",
"tend" => 3000.,
"ttrans_steady" => 0,
"num_QRs" => 80000, #20000,
"ttrans_conv" => 0,
"dt_qr" => 1.0,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"mintegration" => "NP2",
"lyapunovversion" => "NP2",
"tend" => "RP",
"ttrans_steady" => "RP",
"num_QRs" => "RP",
"ttrans_conv" => "RP",
"dt_qr" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


# ----------------------------------------------------------------- MULTISTABILITY ----------------------------------------------------------------- #

if(dictname == "ku_ws_501_multi_eps_p013111")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(0:501),
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"icshuffleid" => "RP",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_multi_eps_p008733")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.08733,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "icshuffleid" => collect(0:501),
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shufflingics",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "icshuffleid" => "RP",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end


    if(dictname == "ku_ws_501_multi_eps_p0")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>0.0,
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "icshuffleid" => collect(0:501),
        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shufflingics",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "icshuffleid" => "RP",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

        if(dictname == "ku_ws_501_multi_eps_p1")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" =>1.0,
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "icshuffleid" => collect(0:501),
            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 6.35897, 6.5641, 6.76923, 6.97436, 7.17949, 7.38462, 7.58974, 7.79487, 8.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => 0,
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shufflingics",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "icshuffleid" => "RP",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]       end

if(dictname == "ku_ws_501_multi_p_eps4")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(0:501),
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
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
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end
if(dictname == "ku_ws_501_multi_p_eps451282")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>[0.0],#, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "icshuffleid" => collect(0:501),
    # "icshuffleid" => collect(0:4),
    "epsi" => 4.51282,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shufflingics",
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
    "icshuffleid" => "RP",
    "epsi" =>  "RP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_multi_p_eps451282_k1")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 1, #NP
        "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "icshuffleid" => collect(0:501),
        "epsi" => 4.51282,
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shufflingics",
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
        "icshuffleid" => "RP",
        "epsi" =>  "RP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end



        if(dictname == "ku_ws_501_multi_p_eps8_k1")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 1, #NP
            "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "icshuffleid" => collect(0:501),
            "epsi" => 8.0,
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => 0,
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shufflingics",
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
            "icshuffleid" => "RP",
            "epsi" =>  "RP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end



            if(dictname == "ku_ws_501_multi_p_eps12_k1")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 1, #NP
                "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "icshuffleid" => collect(0:501),
                "epsi" => 12.0,
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0,
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shufflingics",
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
                "icshuffleid" => "RP",
                "epsi" =>  "RP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end


                if(dictname == "ku_ws_501_multi_eps_p0_k1")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 1, #NP
                    "p" =>0.0,
                    "seednet" => 1,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    # "icshuffleid" => collect(0:501),
                    "icshuffleid" => collect(0:133),
                    "epsi" => collect(range(0, 100, length=50)),
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    #simulation
                    "tend" => 12000.,
                    "ttrans" => 10000.,
                    "dtana" => 1.0,
                    "mchange"=>"shufflingics",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "icshuffleid" => "RP",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end

                    if(dictname == "ku_ws_501_multi_eps_p1_k1")
                        return [Dict(
                        #topology
                        "N" => 501, #NP
                        "k" => 1, #NP
                        "p" =>1.0,
                        "seednet" => 1,
                        "mtop" => "WS",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => 0,
                        "icshuffleid" => collect(0:501),
                        "epsi" => collect(range(0, 100, length=50)),
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        "shuffleid" => 0,
                        #simulation
                        "tend" => 12000.,
                        "ttrans" => 10000.,
                        "dtana" => 1.0,
                        "mchange"=>"shufflingics",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "icshuffleid" => "RP",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        )]                        end



                        if(dictname == "ku_ws_501_multi_p_eps451282_features")
                            return [Dict(
                            #topology
                            "N" => 501, #NP
                            "k" => 2, #NP
                            "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
                            "seednet" => 1,
                            "mtop" => "WS",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" => 0,
                            "icshuffleid" => collect(0:501),
                            "epsi" => 4.51282,
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            "shuffleid" => 0,
                            #simulation
                            # "tend" => 3000.,
                            # "ttrans" => 1250.,
                            "tend" => 6000.,
                            "ttrans" => 4500.,
                            "dtana" => 1.0,
                            "mchange"=>"shufflingics",
                            "mstudy"=>"features",
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
                            "icshuffleid" => "RP",
                            "epsi" =>  "RP", #CP ----- important one, might change to RP
                            "mu" => "RP",
                            "std" => "RP",
                            "mfreq" => "NP",
                            "seedfreq" => "RP",
                            "shuffleid" => "RP", #shuffleid, 0 == original frequency
                            #simulation
                            "tend" => "RP",
                            "ttrans" => "RP",
                            "dtana" => "RP",
                            "mchange" => "NP2",
                            "mstudy" => "NP2",
                            )]                        end

                       if(dictname == "ku_ws_501_multi_p_eps451282_k1_features")
                            return [Dict(
                            #topology
                            "N" => 501, #NP
                            "k" => 1, #NP
                            "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
                            "seednet" => 1,
                            "mtop" => "WS",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" => 0,
                            "icshuffleid" => collect(0:501),
                            "epsi" => 4.51282,
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            "shuffleid" => 0,
                            #simulation
                            # "tend" => 3000.,
                            # "ttrans" => 1250.,
                            "tend" => 6000.,
                            "ttrans" => 4500.,
                            "dtana" => 1.0,
                            "mchange"=>"shufflingics",
                            "mstudy"=>"features",
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
                            "icshuffleid" => "RP",
                            "epsi" =>  "RP", #CP ----- important one, might change to RP
                            "mu" => "RP",
                            "std" => "RP",
                            "mfreq" => "NP",
                            "seedfreq" => "RP",
                            "shuffleid" => "RP", #shuffleid, 0 == original frequency
                            #simulation
                            "tend" => "RP",
                            "ttrans" => "RP",
                            "dtana" => "RP",
                            "mchange" => "NP2",
                            "mstudy" => "NP2",
                            )]                        end

                            if(dictname == "ku_ws_501_multi_eps_p0_k1_features")
                                return [Dict(
                                #topology
                                "N" => 501, #NP
                                "k" => 1, #NP
                                "p" =>0.0,
                                "seednet" => 1,
                                "mtop" => "WS",
                                #dynamical
                                "mmodel" => "kuramoto",
                                "seedic" => 0,
                                "icshuffleid" => collect(0:501),
                                # "icshuffleid" => collect(0:449),
                                "epsi" => collect(range(0, 2000, length=50)),
                                "mu" => 0.0,
                                "std" => 1.0,
                                "mfreq" => "gauss",
                                "seedfreq" => 0,
                                "shuffleid" => 0,
                                #simulation
                                "tend" => 7000.,
                                "ttrans" => 3000.,
                                "dtana" => 1.0,
                                "mchange"=>"shufflingics",
                                ),
                                Dict(
                                #topology
                                "N" => "NP",
                                "k" => "NP",
                                "p" => "RP", #----important one, might change to CP
                                "seednet" => "NP2",
                                "mtop" => "NP",
                                #dynamical
                                "mmodel" => "NP",
                                "seedic" => "NP2",
                                "icshuffleid" => "RP",
                                "epsi" =>  "CP", #CP ----- important one, might change to RP
                                "mu" => "RP",
                                "std" => "RP",
                                "mfreq" => "NP",
                                "seedfreq" => "RP",
                                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                #simulation
                                "tend" => "RP",
                                "ttrans" => "RP",
                                "dtana" => "RP",
                                "mchange" => "NP2",
                                )]                        end
  


                            if(dictname == "ku_pl_501_multi_alpha_eps646154_1_features")
                                return [Dict(
                                #topology
                                "N" => 501, #NP
                                "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
                                "mtop" => "PL",
                                #dynamical
                                "mmodel" => "kuramoto",
                                "seedic" => 0,
                                # "icshuffleid" => collect(0:125),
                                "icshuffleid" => collect(27:125),
                                "epsi" => 6.46154,
                                "mu" => 0.0,
                                "std" => 1.0,
                                "mfreq" => "gauss",
                                "seedfreq" => 0,
                                "shuffleid" => 0,
                                #simulation
                                "tend" => 1250.,
                                "ttrans" => 500.,
                                # "tend" => 50.,
                                # "ttrans" => 10.,
                                "dtana" => 1.0,
                                "mchange"=>"shufflingics",
                                "mstudy"=>"features",
                                ),
                                Dict(
                                #topology
                                "N" => "NP",
                                "alpha" => "CP", #----important one, might change to CP
                                "mtop" => "NP",
                                #dynamical
                                "mmodel" => "NP",
                                "seedic" => "NP2",
                                "icshuffleid" => "RP",
                                "epsi" =>  "RP", #CP ----- important one, might change to RP
                                "mu" => "RP",
                                "std" => "RP",
                                "mfreq" => "NP",
                                "seedfreq" => "RP",
                                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                #simulation
                                "tend" => "RP",
                                "ttrans" => "RP",
                                "dtana" => "RP",
                                "mchange" => "NP2",
                                "mstudy" => "NP2",
                                )]                        end
                            
                                if(dictname == "ku_global_501_icshuf_eps_features")
                                    return [Dict(
                                    #topology
                                    "N" => 501, #NP
                                    "mtop" => "global",
                                    #dynamical
                                    "mmodel" => "kuramoto",
                                    "seedic" => 0,
                                    "epsi" => collect(range(0,5,length=55)),
                                    "mu" => 0.0,
                                    "std" => 1.0,
                                    "mfreq" => "gauss",
                                    "seedfreq" => 0,
                                    "shuffleid" => 0,
                                    "icshuffleid" => collect(0:501),
                                    #simulation
                                    "tend" => 30000.,
                                    "ttrans" => 6000.,
                                    "dtana" => 1.0,
                                    "mchange"=>"shufflingics",
                                "mstudy"=>"features",
                                    ),
                                    Dict(
                                    #topology
                                    "N" => "NP",
                                    "mtop" => "NP",
                                    #dynamical
                                    "mmodel" => "NP",
                                    "seedic" => "NP2",
                                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                                    "mu" => "RP",
                                    "std" => "RP",
                                    "mfreq" => "NP",
                                    "seedfreq" => "RP",
                                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                    "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                                    #simulation
                                    "tend" => "RP",
                                    "ttrans" => "RP",
                                    "dtana" => "RP",
                                    "mchange" => "NP2",
                                "mstudy" => "NP2",
                                    )]                        end

                                    if(dictname == "ku_global_501_icrand_eps_features")
                                        return [Dict(
                                        #topology
                                        "N" => 501, #NP
                                        "mtop" => "global",
                                        #dynamical
                                        "mmodel" => "kuramoto",
                                        "seedic" => collect(0:501),
                                        "epsi" => collect(range(0,5,length=55)),
                                        "mu" => 0.0,
                                        "std" => 1.0,
                                        "mfreq" => "gauss",
                                        "seedfreq" => 0,
                                        "shuffleid" => 0,
                                        "icshuffleid" => 0 ,
                                        #simulation
                                        "tend" => 30000.,
                                        "ttrans" => 6000.,
                                        "dtana" => 1.0,
                                        "mchange"=>"randics",
                                    "mstudy"=>"features",
                                        ),
                                        Dict(
                                        #topology
                                        "N" => "NP",
                                        "mtop" => "NP",
                                        #dynamical
                                        "mmodel" => "NP",
                                        "seedic" => "NP2",
                                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                                        "mu" => "RP",
                                        "std" => "RP",
                                        "mfreq" => "NP",
                                        "seedfreq" => "RP",
                                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                        "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                                        #simulation
                                        "tend" => "RP",
                                        "ttrans" => "RP",
                                        "dtana" => "RP",
                                        "mchange" => "NP2",
                                    "mstudy" => "NP2",
                                        )]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_1")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(0:125),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_2")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(189:250),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_3")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(313:375),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end



if(dictname == "ku_pl_501_multi_alpha_eps646154_4")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(443:501),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

# "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
if(dictname == "ku_pl_501_multi_alpha_eps646154")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"icshuffleid" => collect(0:501),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_1_resample")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => collect(0:125),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"resample",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "RP",
"icshuffleid" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_2_resample")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => collect(126:250),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"resample",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_3_resample")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => collect(251:375),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"resample",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end



if(dictname == "ku_pl_501_multi_alpha_eps646154_4_resample")
return [Dict(
#topology
"N" => 501, #NP
"alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
"mtop" => "PL",
#dynamical
"mmodel" => "kuramoto",
"seedic" => collect(376:501),
"epsi" => 6.46154,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 1250.,
"ttrans" => 500.,
"dtana" => 1.0,
"mchange"=>"resample",
),
Dict(
#topology
"N" => "NP",
"alpha" => "CP", #----important one, might change to CP
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "RP",
"epsi" =>  "RP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_pl_501_multi_alpha_eps646154_resample")
    return [Dict(
    #topology
    "N" => 501, #NP
    "alpha" =>[0.0, 0.07692, 0.15385, 0.23077, 0.30769, 0.38462, 0.46154, 0.53846, 0.61538, 0.69231, 0.76923, 0.84615, 0.92308, 1.0, 1.07692, 1.15385, 1.23077, 1.30769, 1.38462, 1.46154, 1.53846, 1.61538, 1.69231, 1.76923, 1.84615, 1.92308, 2.0, 2.07692, 2.15385, 2.23077, 2.30769, 2.38462, 2.46154, 2.53846, 2.61538, 2.69231, 2.76923, 2.84615, 2.92308, 3.0],
    "mtop" => "PL",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => collect(0:501),
    "epsi" => 6.46154,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    #simulation
    "tend" => 1250.,
    "ttrans" => 500.,
    "dtana" => 1.0,
    "mchange"=>"resample",
    ),
    Dict(
    #topology
    "N" => "NP",
    "alpha" => "CP", #----important one, might change to CP
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "RP",
    "epsi" =>  "RP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end
if(dictname == "ku_ws_501_shufics_eps_selected_p008733")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [0.5, 2.46154, 5.12821],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"icshuffleid" => collect(0:20000),
# "icshuffleid" => collect(7847:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"icshuffleid" => "CP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shufics_eps_selected_p019684")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.19684,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    # "epsi" => [0.5, 2.46154, 6.97436],
    # "epsi" => [0.61538, 1.0, 8.0],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "icshuffleid" => collect(0:20000),
    # "icshuffleid" => collect(7674:20000),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shufflingics",
    "mstudy"=>"distributions",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    "icshuffleid" => "CP",
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "mstudy" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_shufics_eps_selected_p0")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [2.46154, 5.12821, 8.0],
# "epsi" => [0.61538, 1.0, 6.97436],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"icshuffleid" => collect(0:20000),
# "icshuffleid" => collect(10001:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"icshuffleid" => "CP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end


if(dictname == "ku_ws_501_shufics_eps_selected_p013111")
return [Dict(
# topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.5, 2.46154, 5.12821],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"icshuffleid" => collect(0:20000),
# "icshuffleid" => collect(10001:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
"icshuffleid" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end


if(dictname == "ku_ws_501_shufics_eps_selected_p1")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>1.0,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
# "epsi" => [2.46154, 6.97436, 8],
"epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"icshuffleid" => collect(0:20000),
# "icshuffleid" => collect(14948:20000),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shufflingics",
"mstudy"=>"distributions",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"icshuffleid" => "CP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mstudy" => "NP2",
)]                        end


# --------------------------------------------------------------------- PHASES --------------------------------------------------------------------- #
if(dictname == "ku_ws_501_shuf_p_eps4_selectphases")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0, 0.001, 0.01, 0.01145, 0.02254, 0.03384, 0.04437, 0.07627, 0.1, 0.13111, 0.33839, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0, 67, 380, 488],
#simulation
"tend" => 4000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end



if(dictname == "ku_ws_501_unit_p_eps4_selectphases")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>[0, 0.001, 0.01, 0.01145, 0.02254, 0.03384, 0.04437, 0.07627, 0.1, 0.13111, 0.33839, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => [0, 158, 298],
"ω_new" => 10.0,
#simulation
"tend" => 4000.,
"ttrans" => 1250.,
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


if(dictname == "ku_ws_501_shuf_eps_p013111_selectphases")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.61538,  1.02564,  1.4359,  2.05128, 3.07692, 4.10256, 5.12821, 6.15385,  7.17949, 8.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0, 68, 381],
#simulation
"tend" => 4000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_select_phases")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>[0.0, 0.08733, 0.19684, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [4.51282, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "ω_new" => 3.0,
    "idx_unit" => [0, 118, 391],
    #simulation
    "tend" => 4000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit",
    "mstudy" => "phases",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
"ω_new" => "RP",
"idx_unit" => "RP",
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "mstudy" => "NP2",
    )]                        end


    if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_select_phases_tend100k")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>[0.0, 0.08733, 0.19684, 1.0],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [4.51282, 8.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        "ω_new" => 3.0,
        "idx_unit" => [0, 118, 391],
        #simulation
        "tend" => 100000.,
        "ttrans" => 0.,
        "dtana" => 5.0,
        "mchange"=>"oneunit",
        "mstudy" => "phases",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
    "ω_new" => "RP",
    "idx_unit" => "RP",
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        "mstudy" => "NP2",
        )]                        end

        if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_select_phases_tend1000k")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" =>[0.0, 0.08733, 0.19684, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [4.51282, 8.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => 0,
            "ω_new" => 3.0,
            "idx_unit" => [0, 118, 391],
            #simulation
            "tend" => 1000000.,
            "ttrans" => 0.,
            "dtana" => 10.0,
            "mchange"=>"oneunit",
            "mstudy" => "phases",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
        "ω_new" => "RP",
        "idx_unit" => "RP",
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "mstudy" => "NP2",
            )]                        end

            if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_select_phases_tend1000k_2")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>[0.001,0.01, 0.02254, 0.04437, 0.07627],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [4.51282],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0,
                "ω_new" => 3.0,
                "idx_unit" => [0, 118, 391],
                #simulation
                "tend" => 1000000.,
                "ttrans" => 0.,
                "dtana" => 10.0,
                "mchange"=>"oneunit",
                "mstudy" => "phases",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
            "ω_new" => "RP",
            "idx_unit" => "RP",
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end

        if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_select_phases_tend1000k_3")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" =>[0.0, 0.08733, 0.19684, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.61538, 2.05128, 4.51282, 6.5641, 6.97436, 8.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => 0,
            "ω_new" => 3.0,
            "idx_unit" => [0, 118, 391],
            #simulation
            "tend" => 1000000.,
            "ttrans" => 0.,
            "dtana" => 10.0,
            "mchange"=>"oneunit",
            "mstudy" => "phases",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
        "ω_new" => "RP",
        "idx_unit" => "RP",
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "mstudy" => "NP2",
            )]                        end

            if(dictname == "ku_ws_501_shuf_eps_select_p_0_units_select_phases_tend1000k")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>[0.0],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [1000, 10000],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0,
                "ω_new" => 3.0,
                "idx_unit" => [0],
                #simulation
                "tend" => 1000000.,
                "ttrans" => 0.,
                "dtana" => 10.0,
                "mchange"=>"oneunit",
                "mstudy" => "phases",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
            "ω_new" => "RP",
            "idx_unit" => "RP",
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end

           if(dictname == "ku_ws_501_shuf_eps_select_p_0_units_select_phases_tend5k")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>[0.0],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [1000, 10000],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0,
                "ω_new" => 3.0,
                "idx_unit" => [0],
                #simulation
                "tend" => 5000.,
                "ttrans" => 0.,
                "dtana" => 10.0,
                "mchange"=>"oneunit",
                "mstudy" => "phases",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
            "ω_new" => "RP",
            "idx_unit" => "RP",
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end

                if(dictname == "ku_ws_501_shuf_eps_select_p_019684_units_select_phases_tend5k")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 2, #NP
                    "p" =>[0.19684],
                    "seednet" => 1,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [1000, 10000],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "ω_new" => 3.0,
                    "idx_unit" => [0],
                    #simulation
                    "tend" => 5000.,
                    "ttrans" => 0.,
                    "dtana" => 10.0,
                    "mchange"=>"oneunit",
                    "mstudy" => "phases",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                "ω_new" => "RP",
                "idx_unit" => "RP",
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end

                if(dictname == "ku_ws_501_shuf_eps_select_p_019684_units_select_phases_tend1000k")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 2, #NP
                    "p" =>[0.19684 ],
                    "seednet" => 1,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [500, 1000, 10000],
                    # "epsi" => [20, 50, 100, 500, 1000, 10000],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "ω_new" => 3.0,
                    "idx_unit" => [0],
                    #simulation
                    "tend" => 1000000.,
                    "ttrans" => 0.,
                    "dtana" => 10.0,
                    "mchange"=>"oneunit",
                    "mstudy" => "phases",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                "ω_new" => "RP",
                "idx_unit" => "RP",
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end

            if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_select_phases_tend20k")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>[0.0, 0.08733, 0.19684, 1.0],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [4.51282,1.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0,
                "ω_new" => 3.0,
                "idx_unit" => [0, 118, 391],
                #simulation
                "tend" => 20000.,
                "ttrans" => 0.,
                "dtana" => 1.0,
                "mchange"=>"oneunit",
                "mstudy" => "phases",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
            "ω_new" => "RP",
            "idx_unit" => "RP",
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end




    if(dictname == "ku_ws_501_shuf_eps_select_p_0_units_select_phases")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>0.0,
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [4.51282, 8.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        "ω_new" => 3.0,
        "idx_unit" => [0, 118, 391],
        #simulation
        "tend" => 4000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"oneunit",
        "mstudy" => "phases",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
    "ω_new" => "RP",
    "idx_unit" => "RP",
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        "mstudy" => "NP2",
        )]                        end


        if(dictname == "ku_ws_501_shuf_eps_select_p_0_units_selected_phases")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" =>0.0,
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
            "ω_new" => 3.0,
            "idx_unit" => [0, 251, 216],
            #simulation
            "tend" => 20000.,
            "ttrans" => 0.,
            "dtana" => 1.0,
            "mchange"=>"oneunit",
            "mstudy" => "phases",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
        "ω_new" => "RP",
        "idx_unit" => "RP",
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "mstudy" => "NP2",
            )]                        end


            if(dictname == "ku_ws_501_shuf_eps_select_p_008733_units_selected_phases")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>0.08733,
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
                "ω_new" => 3.0,
                "idx_unit" => [0, 283, 67],
                #simulation
                "tend" => 20000.,
                "ttrans" => 0.,
                "dtana" => 1.0,
                "mchange"=>"oneunit",
                "mstudy" => "phases",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
            "ω_new" => "RP",
            "idx_unit" => "RP",
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end

                if(dictname == "ku_ws_501_shuf_eps_select_p_019684_units_selected_phases")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 2, #NP
                    "p" =>0.19684,
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
                    "ω_new" => 3.0,
                    "idx_unit" => [0, 391, 118],
                    #simulation
                    "tend" => 20000.,
                    "ttrans" => 0.,
                    "dtana" => 1.0,
                    "mchange"=>"oneunit",
                    "mstudy" => "phases",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                "ω_new" => "RP",
                "idx_unit" => "RP",
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end

                    if(dictname == "ku_ws_501_shuf_eps_select_p_1_units_selected_phases")
                        return [Dict(
                        #topology
                        "N" => 501, #NP
                        "k" => 2, #NP
                        "p" =>1.0,
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
                        "ω_new" => 3.0,
                        "idx_unit" => [0, 296, 466],
                        #simulation
                        "tend" => 20000.,
                        "ttrans" => 0.,
                        "dtana" => 1.0,
                        "mchange"=>"oneunit",
                        "mstudy" => "phases",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    "ω_new" => "RP",
                    "idx_unit" => "RP",
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        "mstudy" => "NP2",
                        )]                        end




if(dictname == "ku_lyap_ws_501_shuf_p_ic_3_selectphases")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0.001, 0.006, 1e-2, 0.02254, 0.08733, 1e-1, 0.15013, 1e0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 25500.,
"ttrans" => 0.,
"dtana" => 1.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


if(dictname == "ku_ws_501_shuf_eps_p013111_tend100000")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.13111,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026,1.02564, 2.05128, 2.87179, 3.07692, 7.38462, 8.0 ],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
#simulation
"tend" => 100000.,
"ttrans" => 0.,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mintegration" => "longtime",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
"mintegration" => "NP2",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_ws_501_shuf_p_eps410256_tend100000")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => [0, 0.001, 0.006, 0.01, 0.02254, 0.02581, 0.03384, 0.08733, 0.13111, 0.15013, 1e0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 1,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 100000.,
"ttrans" => 0.,
"dtana" => 1.0,
"mchange"=>"shuffling",
"mintegration" => "longtime",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mintegration" => "NP2",
)]    end

if(dictname == "ku_ws_501_shuf_p_eps410256-icsfrombasins-unit22")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.06661,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 20000.,
"ttrans" => 0.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => 3.99944,
"u02" => [0.9947327440224195, 1.4983948928945305, 2.505719190638753, 2.996789785789061,  3.563409703270186, 3.7648745628190308, 4.016705637255086, 5.024029934999309, 5.6536076210894475],
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "RP",
"u02" => "CP",
)]    end


if(dictname == "ku_ws_501_shuf_p_eps410256-icsfrombasins-unit22")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.06661,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 20000.,
"ttrans" => 0.,
"dtana" => 1.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => 3.99944,
"u02" => [0.9947327440224195, 1.4983948928945305, 2.505719190638753, 2.996789785789061,  3.563409703270186, 3.7648745628190308, 4.016705637255086, 5.024029934999309, 5.6536076210894475],
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "RP",
"u02" => "CP",
)]    end


if(dictname == "ku_ws_501_shuf_p_T600000s_states")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 600000.0,
"ttrans" => 0.0,
"dtana" => 10.0,
"mchange"=>"shuffling",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]    end


if(dictname == "ku_ws_501_shuf_p_eps410256-icsfrombasins-T600000")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" => 0.06661,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 600000.,
"ttrans" => 0.0,
"dtana" => 10.0,
"mchange"=>"ictwounits",
"mchange2"=>"details",
"unit1" => 1,
"unit2" => 2,
"u01" => 3.99944,
"u02" => [0.9947327440224195, 1.4983948928945305, 2.505719190638753, 2.996789785789061,  3.563409703270186, 3.7648745628190308, 4.016705637255086, 5.024029934999309, 5.6536076210894475],
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"mchange2" => "NP2",
"unit1" => "RP",
"unit2" => "RP",
"u01" => "RP",
"u02" => "CP",
)]    end



if(dictname == "ku_ws_501_shuf_p_T600000s_states_lsoda")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
# "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
"p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => [0],
#simulation
"tend" => 600000.0,
"ttrans" => 0.0,
"dtana" => 10.0,
"mchange"=>"shuffling",
"solver" => "lsoda",
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
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
"solver" => "NP2"
)]    end

if(dictname == "ku_ws_501_shuf_p_eps410256-icsfrombasins-T600000_lsoda")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" => 0.06661,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => 4.10256,
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => [0],
    #simulation
    "tend" => 600000.,
    "ttrans" => 0.0,
    "dtana" => 10.0,
    "mchange"=>"ictwounits",
    "mchange2"=>"details",
    "unit1" => 1,
    "unit2" => 2,
    "u01" => 3.99944,
    "u02" => [0.9947327440224195, 1.4983948928945305, 2.505719190638753, 2.996789785789061,  3.563409703270186, 3.7648745628190308, 4.016705637255086, 5.024029934999309, 5.6536076210894475],
    "solver" => "lsoda",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "mchange2" => "NP2",
    "unit1" => "RP",
    "unit2" => "RP",
    "u01" => "RP",
    "u02" => "CP",
    "solver" => "NP2"
    )]    end


    if(dictname == "ku_ws_501_shuf_eps_p013111_tend600000_lsoda")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>0.13111,
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.20513, 0.41026,1.02564, 2.05128, 2.87179, 3.07692, 7.38462, 8.0 ],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => 0,
        #simulation
        "tend" => 600000.,
        "ttrans" => 0.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        "solver" => "lsoda",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        "mintegration" => "NP2",
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        "solver" => "NP2"
        )]                        end

        if(dictname == "ku_ws_501_shuf_p_T600000s_states_lsoda_shuffleid12")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            # "p" =>[0.1145, 0.03384, 0.07627, 0.01, 0.01501, 0.02254, 0.0508, 0.002],
            "p" =>[0.0, 0.006, 0.02254, 0.03384, 0.03875,  0.08733, 0.22539, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => 4.10256,
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => [1,2],
            #simulation
            "tend" => 600000.0,
            "ttrans" => 0.0,
            "dtana" => 10.0,
            "mchange"=>"shuffling",
            "solver" => "lsoda",
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
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "solver" => "NP2"
            )]    end




# ------------------------------------------------------------------- SENSITIVITY ------------------------------------------------------------------ #
if(dictname == "ku_ws_501_unit_pselect_eps4_varyomeganew")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.19684,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_new" => [-10.0, -8.28643, -6.86649, -5.68987, -4.71487, -3.90694, -3.23746, -2.6827, -2.223, -1.84207, -1.52642, -1.26486, -1.04811, -0.86851, -0.71969, -0.59636, -0.49417, -0.40949, -0.33932, -0.28118, -0.233, -0.19307, -0.15999, -0.13257, -0.10985, -0.09103, -0.07543, -0.06251, -0.05179, -0.04292, -0.03556, -0.02947, -0.02442, -0.02024, -0.01677, -0.01389, -0.01151, -0.00954, -0.00791, -0.00655, -0.00543, -0.0045, -0.00373, -0.00309, -0.00256, -0.00212, -0.00176, -0.00146, -0.00121, -0.001, 0.0, 0.001, 0.00121, 0.00146, 0.00176, 0.00212, 0.00256, 0.00309, 0.00373, 0.0045, 0.00543, 0.00655, 0.00791, 0.00954, 0.01151, 0.01389, 0.01677, 0.02024, 0.02442, 0.02947, 0.03556, 0.04292, 0.05179, 0.06251, 0.07543, 0.09103, 0.10985, 0.13257, 0.15999, 0.19307, 0.233, 0.28118, 0.33932, 0.40949, 0.49417, 0.59636, 0.71969, 0.86851, 1.04811, 1.26486, 1.52642, 1.84207, 2.223, 2.6827, 3.23746, 3.90694, 4.71487, 5.68987, 6.86649, 8.28643, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_new" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end



if(dictname == "ku_ws_501_unit_pselect_eps4_varyomegaadd")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.19684,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit_add",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_add" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_unit_p019684_eps451282_varyomegaadd")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.19684,
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
    "idx_unit" => collect(1:501),
    "ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit_add",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    "idx_unit" => "CP",
    "ω_add" => "RP",
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_unit_p01145_eps451282_varyomegaadd_2")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>0.1145,
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
        "idx_unit" => collect(1:501),
        "ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
        # "ω_add" => [-8.0, -7.83838, -7.67677, -7.51515, -7.35354, -7.19192, -7.0303, -6.86869, -6.70707, -6.54545, -6.38384, -6.22222, -6.06061, -5.89899, -5.73737, -5.57576, -5.41414, -5.25253, -5.09091, -4.92929, -4.76768, -4.60606, -4.44444, -4.28283, -4.12121, -3.9596, -3.79798, -3.63636, -3.47475, -3.31313, -3.15152, -2.9899, -2.82828, -2.66667, -2.50505, -2.34343, -2.18182, -2.0202, -1.85859, -1.69697, -1.53535, -1.37374, -1.21212, -1.05051, -0.88889, -0.72727, -0.56566, -0.40404, -0.24242, -0.1, -0.08081, -0.05, -0.01, -0.001, 0.0, 0.001, 0.01, 0.05, 0.08081, 0.1, 0.24242, 0.40404, 0.56566, 0.72727, 0.88889, 1.05051, 1.21212, 1.37374, 1.53535, 1.69697, 1.85859, 2.0202, 2.18182, 2.34343, 2.50505, 2.66667, 2.82828, 2.9899, 3.15152, 3.31313, 3.47475, 3.63636, 3.79798, 3.9596, 4.12121, 4.28283, 4.44444, 4.60606, 4.76768, 4.92929, 5.09091, 5.25253, 5.41414, 5.57576, 5.73737, 5.89899, 6.06061, 6.22222, 6.38384, 6.54545, 6.70707, 6.86869, 7.0303, 7.19192, 7.35354, 7.51515, 7.67677, 7.83838, 8.0],
        #simulation
        "tend" => 3001.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"oneunit_add",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
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
        "idx_unit" => "CP",
        "ω_add" => "RP",
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end
    


if(dictname == "ku_ws_501_unit_p01145_eps451282_varyomegaadd_linspace")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.1145,
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
    "idx_unit" => collect(1:501),
    # "ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
    "ω_add" => [-8.0, -7.83838, -7.67677, -7.51515, -7.35354, -7.19192, -7.0303, -6.86869, -6.70707, -6.54545, -6.38384, -6.22222, -6.06061, -5.89899, -5.73737, -5.57576, -5.41414, -5.25253, -5.09091, -4.92929, -4.76768, -4.60606, -4.44444, -4.28283, -4.12121, -3.9596, -3.79798, -3.63636, -3.47475, -3.31313, -3.15152, -2.9899, -2.82828, -2.66667, -2.50505, -2.34343, -2.18182, -2.0202, -1.85859, -1.69697, -1.53535, -1.37374, -1.21212, -1.05051, -0.88889, -0.72727, -0.56566, -0.40404, -0.24242, -0.1, -0.08081, -0.05, -0.01, -0.001, 0.0, 0.001, 0.01, 0.05, 0.08081, 0.1, 0.24242, 0.40404, 0.56566, 0.72727, 0.88889, 1.05051, 1.21212, 1.37374, 1.53535, 1.69697, 1.85859, 2.0202, 2.18182, 2.34343, 2.50505, 2.66667, 2.82828, 2.9899, 3.15152, 3.31313, 3.47475, 3.63636, 3.79798, 3.9596, 4.12121, 4.28283, 4.44444, 4.60606, 4.76768, 4.92929, 5.09091, 5.25253, 5.41414, 5.57576, 5.73737, 5.89899, 6.06061, 6.22222, 6.38384, 6.54545, 6.70707, 6.86869, 7.0303, 7.19192, 7.35354, 7.51515, 7.67677, 7.83838, 8.0],
    #simulation
    "tend" => 3001.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"oneunit_add",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
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
    "idx_unit" => "CP",
    "ω_add" => "RP",
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

if(dictname == "ku_ws_501_unit_pselect_eps4_varyomeganew")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.19684,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_new" => [-10.0, -8.28643, -6.86649, -5.68987, -4.71487, -3.90694, -3.23746, -2.6827, -2.223, -1.84207, -1.52642, -1.26486, -1.04811, -0.86851, -0.71969, -0.59636, -0.49417, -0.40949, -0.33932, -0.28118, -0.233, -0.19307, -0.15999, -0.13257, -0.10985, -0.09103, -0.07543, -0.06251, -0.05179, -0.04292, -0.03556, -0.02947, -0.02442, -0.02024, -0.01677, -0.01389, -0.01151, -0.00954, -0.00791, -0.00655, -0.00543, -0.0045, -0.00373, -0.00309, -0.00256, -0.00212, -0.00176, -0.00146, -0.00121, -0.001, 0.0, 0.001, 0.00121, 0.00146, 0.00176, 0.00212, 0.00256, 0.00309, 0.00373, 0.0045, 0.00543, 0.00655, 0.00791, 0.00954, 0.01151, 0.01389, 0.01677, 0.02024, 0.02442, 0.02947, 0.03556, 0.04292, 0.05179, 0.06251, 0.07543, 0.09103, 0.10985, 0.13257, 0.15999, 0.19307, 0.233, 0.28118, 0.33932, 0.40949, 0.49417, 0.59636, 0.71969, 0.86851, 1.04811, 1.26486, 1.52642, 1.84207, 2.223, 2.6827, 3.23746, 3.90694, 4.71487, 5.68987, 6.86649, 8.28643, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_new" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_ws_501_unit_pselect_eps4_varyomegaadd")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.19684,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 4.10256,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit_add",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_add" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_unit_p008733_eps2_varyomeganew")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.87179,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_new" => [-10.0, -8.28643, -6.86649, -5.68987, -4.71487, -3.90694, -3.23746, -2.6827, -2.223, -1.84207, -1.52642, -1.26486, -1.04811, -0.86851, -0.71969, -0.59636, -0.49417, -0.40949, -0.33932, -0.28118, -0.233, -0.19307, -0.15999, -0.13257, -0.10985, -0.09103, -0.07543, -0.06251, -0.05179, -0.04292, -0.03556, -0.02947, -0.02442, -0.02024, -0.01677, -0.01389, -0.01151, -0.00954, -0.00791, -0.00655, -0.00543, -0.0045, -0.00373, -0.00309, -0.00256, -0.00212, -0.00176, -0.00146, -0.00121, -0.001, 0.0, 0.001, 0.00121, 0.00146, 0.00176, 0.00212, 0.00256, 0.00309, 0.00373, 0.0045, 0.00543, 0.00655, 0.00791, 0.00954, 0.01151, 0.01389, 0.01677, 0.02024, 0.02442, 0.02947, 0.03556, 0.04292, 0.05179, 0.06251, 0.07543, 0.09103, 0.10985, 0.13257, 0.15999, 0.19307, 0.233, 0.28118, 0.33932, 0.40949, 0.49417, 0.59636, 0.71969, 0.86851, 1.04811, 1.26486, 1.52642, 1.84207, 2.223, 2.6827, 3.23746, 3.90694, 4.71487, 5.68987, 6.86649, 8.28643, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_new" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_ws_501_unit_p008733_eps2_varyomegaadd")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 2.87179,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit_add",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_add" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_501_unit_p008733_eps7_varyomeganew")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 7.17949,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_new" => [-10.0, -8.28643, -6.86649, -5.68987, -4.71487, -3.90694, -3.23746, -2.6827, -2.223, -1.84207, -1.52642, -1.26486, -1.04811, -0.86851, -0.71969, -0.59636, -0.49417, -0.40949, -0.33932, -0.28118, -0.233, -0.19307, -0.15999, -0.13257, -0.10985, -0.09103, -0.07543, -0.06251, -0.05179, -0.04292, -0.03556, -0.02947, -0.02442, -0.02024, -0.01677, -0.01389, -0.01151, -0.00954, -0.00791, -0.00655, -0.00543, -0.0045, -0.00373, -0.00309, -0.00256, -0.00212, -0.00176, -0.00146, -0.00121, -0.001, 0.0, 0.001, 0.00121, 0.00146, 0.00176, 0.00212, 0.00256, 0.00309, 0.00373, 0.0045, 0.00543, 0.00655, 0.00791, 0.00954, 0.01151, 0.01389, 0.01677, 0.02024, 0.02442, 0.02947, 0.03556, 0.04292, 0.05179, 0.06251, 0.07543, 0.09103, 0.10985, 0.13257, 0.15999, 0.19307, 0.233, 0.28118, 0.33932, 0.40949, 0.49417, 0.59636, 0.71969, 0.86851, 1.04811, 1.26486, 1.52642, 1.84207, 2.223, 2.6827, 3.23746, 3.90694, 4.71487, 5.68987, 6.86649, 8.28643, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_new" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_ws_501_unit_p008733_eps7_varyomegaadd")
return [Dict(
#topology
"N" => 501, #NP
"k" => 2, #NP
"p" =>0.08733,
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => 7.17949,
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => 0,
"idx_unit" => collect(1:501),
"ω_add" => [-10.0, -8.68511, -7.54312, -6.55129, -5.68987, -4.94171, -4.29193, -3.72759, -3.23746, -2.81177, -2.44205, -2.12095, -1.84207, -1.59986, -1.3895, -1.20679, -1.04811, -0.9103, -0.7906, -0.68665, -0.59636, -0.51795, -0.44984, -0.39069, -0.33932, -0.29471, -0.25595, -0.2223, -0.19307, -0.16768, -0.14563, -0.12649, -0.10985, -0.09541, -0.08286, -0.07197, -0.06251, -0.05429, -0.04715, -0.04095, -0.03556, -0.03089, -0.02683, -0.0233, -0.02024, -0.01758, -0.01526, -0.01326, -0.01151, -0.01, 0.0, 0.01, 0.01151, 0.01326, 0.01526, 0.01758, 0.02024, 0.0233, 0.02683, 0.03089, 0.03556, 0.04095, 0.04715, 0.05429, 0.06251, 0.07197, 0.08286, 0.09541, 0.10985, 0.12649, 0.14563, 0.16768, 0.19307, 0.2223, 0.25595, 0.29471, 0.33932, 0.39069, 0.44984, 0.51795, 0.59636, 0.68665, 0.7906, 0.9103, 1.04811, 1.20679, 1.3895, 1.59986, 1.84207, 2.12095, 2.44205, 2.81177, 3.23746, 3.72759, 4.29193, 4.94171, 5.68987, 6.55129, 7.54312, 8.68511, 10.0],
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"oneunit_add",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
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
"idx_unit" => "CP",
"ω_add" => "RP",
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end



# ------------------------------------------------------------------ GLOBAL NETWORK ----------------------------------------------------------------- #


if(dictname == "ku_global_501_shuf_eps")
return [Dict(
#topology
"N" => 501, #NP
    "mtop" => "global",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => collect(range(0,5,length=55)),
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
"shuffleid" => collect(0:501),
#simulation
"tend" => 10000.,
"ttrans" => 6000.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end


if(dictname == "ku_global_501_icshuf_eps")
    return [Dict(
    #topology
    "N" => 501, #NP
    "mtop" => "global",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => collect(range(0,5,length=55)),
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    "shuffleid" => 0,
    "icshuffleid" => collect(0:501),
    #simulation
    "tend" => 10000.,
    "ttrans" => 6000.,
    "dtana" => 1.0,
    "mchange"=>"shufflingics",
    ),
    Dict(
    #topology
    "N" => "NP",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    "icshuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end





    if(dictname == "ku_global_50_shuf_eps")
        return [Dict(
        #topology
        "N" => 50, #NP
            "mtop" => "global",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => collect(range(0,5,length=55)),
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => collect(0:501),
        #simulation
        "tend" => 10000.,
        "ttrans" => 6000.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end
        
        
        if(dictname == "ku_global_50_icshuf_eps")
            return [Dict(
            #topology
            "N" => 50, #NP
            "mtop" => "global",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => collect(range(0,5,length=55)),
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => 0,
            "icshuffleid" => collect(0:501),
            #simulation
            "tend" => 10000.,
            "ttrans" => 6000.,
            "dtana" => 1.0,
            "mchange"=>"shufflingics",
            ),
            Dict(
            #topology
            "N" => "NP",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            "icshuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end
        



            if(dictname == "ku_global_501_freqrand_eps")
                return [Dict(
                #topology
                "N" => 501, #NP
                    "mtop" => "global",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => collect(range(0,5,length=55)),
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => collect(0:501),
                "shuffleid" => 0, 
                #simulation
                "tend" => 10000.,
                "ttrans" => 6000.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end
                
                
                if(dictname == "ku_global_501_icrand_eps")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "mtop" => "global",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => collect(0:501),
                    "epsi" => collect(range(0,5,length=55)),
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "icshuffleid" => 0,
                    #simulation
                    "tend" => 10000.,
                    "ttrans" => 6000.,
                    "dtana" => 1.0,
                    "mchange"=>"randics",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "RP",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end
                
              if(dictname == "ku_global_501_icrand_eps_maxmulti")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "mtop" => "global",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => collect(0:5000),
                    "epsi" =>  1.7592592592592593,
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "icshuffleid" => 0,
                    #simulation
                    "tend" => 10000.,
                    "ttrans" => 6000.,
                    "dtana" => 1.0,
                    "mchange"=>"randics",
                    "mstudy"=>"veryfing_multistability",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "CP",
                    "epsi" =>  "RP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end


              if(dictname == "ku_global_501_icrand_eps_maxmulti2")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "mtop" => "global",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => collect(0:5000),
                    "epsi" =>  1.4814814814814814,
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "icshuffleid" => 0,
                    #simulation
                    "tend" => 10000.,
                    "ttrans" => 6000.,
                    "dtana" => 1.0,
                    "mchange"=>"randics",
                    "mstudy"=>"veryfing_multistability",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "CP",
                    "epsi" =>  "RP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end

                    if(dictname == "ku_global_501_icrand_eps_maxmulti3")
                        return [Dict(
                        #topology
                        "N" => 501, #NP
                        "mtop" => "global",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => collect(0:5000),
                        "epsi" =>  1.6,
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        "shuffleid" => 0,
                        "icshuffleid" => 0,
                        #simulation
                        "tend" => 10000.,
                        "ttrans" => 6000.,
                        "dtana" => 1.0,
                        "mchange"=>"randics",
                        "mstudy"=>"veryfing_multistability",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "CP",
                        "epsi" =>  "RP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        "mstudy" => "NP2",
                        )]                        end

                        if(dictname == "ku_global_501_icrand_eps_1.6_phases")
                            return [Dict(
                            #topology
                            "N" => 501, #NP
                            "mtop" => "global",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" => [245, 3671, 3906, 3565],
                            "epsi" =>  1.6,
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            "shuffleid" => 0,
                            "icshuffleid" => 0,
                            #simulation
                            "tend" => 10000.,
                            "ttrans" => 0.,
                            "dtana" => 1.0,
                            "mchange"=>"randics",
                            "mstudy"=>"veryfing_multistability",
                            ),
                            Dict(
                            #topology
                            "N" => "NP",
                            "mtop" => "NP",
                            #dynamical
                            "mmodel" => "NP",
                            "seedic" => "CP",
                            "epsi" =>  "RP", #CP ----- important one, might change to RP
                            "mu" => "RP",
                            "std" => "RP",
                            "mfreq" => "NP",
                            "seedfreq" => "RP",
                            "shuffleid" => "RP", #shuffleid, 0 == original frequency
                            "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                            #simulation
                            "tend" => "RP",
                            "ttrans" => "RP",
                            "dtana" => "RP",
                            "mchange" => "NP2",
                            "mstudy" => "NP2",
                            )]                        end
    
                            if(dictname == "ku_global_501_icrand_eps_1.759_phases")
                                return [Dict(
                                #topology
                                "N" => 501, #NP
                                "mtop" => "global",
                                #dynamical
                                "mmodel" => "kuramoto",
                                "seedic" => [1687, 2541, 3037, 457],
                                "epsi" =>  1.7592592592592593,
                                "mu" => 0.0,
                                "std" => 1.0,
                                "mfreq" => "gauss",
                                "seedfreq" => 0,
                                "shuffleid" => 0,
                                "icshuffleid" => 0,
                                #simulation
                                "tend" => 10000.,
                                "ttrans" => 0.,
                                "dtana" => 1.0,
                                "mchange"=>"randics",
                                "mstudy"=>"veryfing_multistability",
                                ),
                                Dict(
                                #topology
                                "N" => "NP",
                                "mtop" => "NP",
                                #dynamical
                                "mmodel" => "NP",
                                "seedic" => "CP",
                                "epsi" =>  "RP", #CP ----- important one, might change to RP
                                "mu" => "RP",
                                "std" => "RP",
                                "mfreq" => "NP",
                                "seedfreq" => "RP",
                                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                "icshuffleid" => "RP", #shuffleid, 0 == original frequency
                                #simulation
                                "tend" => "RP",
                                "ttrans" => "RP",
                                "dtana" => "RP",
                                "mchange" => "NP2",
                                "mstudy" => "NP2",
                                )]                        end


            if(dictname == "ku_global_501_dist_freqrand")
                return [Dict(
                #topology
                "N" => 501, #NP
                    "mtop" => "global",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [1.0, 1.3, 1.5, 1.8, 2.0, 4.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => collect(0:20000),
                "shuffleid" => 0, 
                #simulation
                "tend" => 5000.,
                "ttrans" => 2000.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                "mstudy"=>"distributions",
                ),
                Dict(
                #topology
                "N" => "NP",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "RP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "CP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end
                
                            if(dictname == "ku_global_501_dist_icrand")
                return [Dict(
                #topology
                "N" => 501, #NP
                    "mtop" => "global",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => collect(0:20000),
                "epsi" => [1.0, 1.3, 1.5, 1.8, 2.0, 4.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                "shuffleid" => 0, 
                #simulation
                "tend" => 5000.,
                "ttrans" => 2000.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                "mstudy"=>"distributions",
                ),
                Dict(
                #topology
                "N" => "NP",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "CP",
                "epsi" =>  "RP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "NP2",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end



            if(dictname == "ku_global_5000_dist_freqrand")
                return [Dict(
                #topology
                "N" => 5000, #NP
                    "mtop" => "global",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 1.0, 1.3, 1.5, 1.8, 2.0, 4.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => collect(0:20000),
                "shuffleid" => 0, 
                #simulation
                "tend" => 5000.,
                "ttrans" => 2000.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                "mstudy"=>"distributions",
                ),
                Dict(
                #topology
                "N" => "NP",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "RP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "CP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end



                    # ----------------------------------------------------------------- SCALING STUDIES ---------------------------------------------------------------- #

if(dictname == "ku_ws_25_shuf_eps_pseveral")
return [Dict(
#topology
"N" => 25, #NP
"k" => 2, #NP
"p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
"seednet" => 1,
"mtop" => "WS",
#dynamical
"mmodel" => "kuramoto",
"seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
"mu" => 0.0,
"std" => 1.0,
"mfreq" => "gauss",
"seedfreq" => 0,
# "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
"shuffleid" => collect(0:500),
#simulation
"tend" => 3000.,
"ttrans" => 1250.,
"dtana" => 1.0,
"mchange"=>"shuffling",
),
Dict(
#topology
"N" => "NP",
"k" => "NP",
"p" => "RP", #----important one, might change to CP
"seednet" => "NP2",
"mtop" => "NP",
#dynamical
"mmodel" => "NP",
"seedic" => "NP2",
"epsi" =>  "CP", #CP ----- important one, might change to RP
"mu" => "RP",
"std" => "RP",
"mfreq" => "NP",
"seedfreq" => "RP",
"shuffleid" => "RP", #shuffleid, 0 == original frequency
#simulation
"tend" => "RP",
"ttrans" => "RP",
"dtana" => "RP",
"mchange" => "NP2",
)]                        end

if(dictname == "ku_ws_25_shuf_eps_pseveral_1")
    return [Dict(
    #topology
    "N" => 25, #NP
    "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:250),
    # "shuffleid" => collect(251:500),
    "shuffleid" => collect(0:500),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_25_shuf_eps_pseveral_2")
        return [Dict(
        #topology
        "N" => 25, #NP
        "k" => 2, #NP
        "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
        "seednet" => 2,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        # "shuffleid" => collect(0:250),
        # "shuffleid" => collect(251:500),
        "shuffleid" => collect(0:500),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end 


        if(dictname == "ku_ws_25_shuf_eps_pseveral_3")
            return [Dict(
            #topology
            "N" => 25, #NP
            "k" => 2, #NP
            "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            "seednet" => 3,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:250),
            # "shuffleid" => collect(251:500),
            "shuffleid" => collect(0:500),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end 

            if(dictname == "ku_ws_25_shuf_eps_pseveral_4")
                return [Dict(
                #topology
                "N" => 25, #NP
                "k" => 2, #NP
                "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                "seednet" => 4,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                # "shuffleid" => collect(0:250),
                # "shuffleid" => collect(251:500),
                "shuffleid" => collect(0:500),
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end 
            
                if(dictname == "ku_ws_25_shuf_eps_pseveral_5")
                    return [Dict(
                    #topology
                    "N" => 25, #NP
                    "k" => 2, #NP
                    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                    "seednet" => 5,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    # "shuffleid" => collect(0:250),
                    # "shuffleid" => collect(251:500),
                    "shuffleid" => collect(0:500),
                    #simulation
                    "tend" => 3000.,
                    "ttrans" => 1250.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end 

                
if(dictname == "ku_ws_50_shuf_eps_pseveral")
    return [Dict(
    #topology
    "N" => 50, #NP
    "k" => 2, #NP
"p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
"shuffleid" => collect(0:500),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end


if(dictname == "ku_ws_100_shuf_eps_pseveral")
    return [Dict(
    #topology
    "N" => 100, #NP
    "k" => 2, #NP
"p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => 0,
    # "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
"shuffleid" => collect(0:500),
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "CP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "RP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_100_shuf_eps_pseveral_1")
        return [Dict(
        #topology
        "N" => 100, #NP
        "k" => 2, #NP
        "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        # "shuffleid" => collect(0:250),
        # "shuffleid" => collect(251:500),
        "shuffleid" => collect(0:500),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end 

        if(dictname == "ku_ws_100_shuf_eps_pseveral_2")
            return [Dict(
            #topology
            "N" => 100, #NP
            "k" => 2, #NP
            "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            "seednet" => 2,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:250),
            # "shuffleid" => collect(251:500),
            "shuffleid" => collect(0:500),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end 
            if(dictname == "ku_ws_100_shuf_eps_pseveral_3")
                return [Dict(
                #topology
                "N" => 100, #NP
                "k" => 2, #NP
                "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                "seednet" => 3,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                # "shuffleid" => collect(0:250),
                # "shuffleid" => collect(251:500),
                "shuffleid" => collect(0:500),
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end 

                if(dictname == "ku_ws_100_shuf_eps_pseveral_4")
                    return [Dict(
                    #topology
                    "N" => 100, #NP
                    "k" => 2, #NP
                    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                    "seednet" => 4,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    # "shuffleid" => collect(0:250),
                    # "shuffleid" => collect(251:500),
                    "shuffleid" => collect(0:500),
                    #simulation
                    "tend" => 3000.,
                    "ttrans" => 1250.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end 

                    if(dictname == "ku_ws_100_shuf_eps_pseveral_5")
                        return [Dict(
                        #topology
                        "N" => 100, #NP
                        "k" => 2, #NP
                        "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                        "seednet" => 5,
                        "mtop" => "WS",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => 0,
                        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        # "shuffleid" => collect(0:250),
                        # "shuffleid" => collect(251:500),
                        "shuffleid" => collect(0:500),
                        #simulation
                        "tend" => 3000.,
                        "ttrans" => 1250.,
                        "dtana" => 1.0,
                        "mchange"=>"shuffling",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        )]                        end 


    if(dictname == "ku_ws_200_shuf_eps_pseveral")
        return [Dict(
        #topology
        "N" => 200, #NP
        "k" => 2, #NP
"p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        # "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
"shuffleid" => collect(0:500),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

        if(dictname == "ku_ws_400_shuf_eps_pseveral")
            return [Dict(
            #topology
            "N" => 400, #NP
            "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
# "shuffleid" => collect(270:500),
"shuffleid" => collect(0:500),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end

    if(dictname == "ku_ws_1000_shuf_eps_pseveral_2")
        return [Dict(
        #topology
        "N" => 1000, #NP
        "k" => 2, #NP
"p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
# "p" =>[0.08733, 0.1, 0.13111, 0.25809, 1.0],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        # "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
# "shuffleid" => collect(270:500),
"shuffleid" => collect(0:500),
        #simulation
        "tend" => 3001.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

        # if(dictname == "ku_ws_2000_shuf_eps_pseveral_2")
    #         return [Dict(
    #         #topology
    #         "N" => 1000, #NP
    #         "k" => 2, #NP
    # "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
    #         "seednet" => 1,
    #         "mtop" => "WS",
    #         #dynamical
    #         "mmodel" => "kuramoto",
    #         "seedic" => 0,
    # "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
    #         "mu" => 0.0,
    #         "std" => 1.0,
    #         "mfreq" => "gauss",
    #         "seedfreq" => 0,
    #         # "shuffleid" => collect(0:250),
    # # "shuffleid" => collect(251:500),
    # # "shuffleid" => collect(270:500),
    # "shuffleid" => collect(0:500),
    #         #simulation
    #         "tend" => 3001.,
    #         "ttrans" => 1250.,
    #         "dtana" => 1.0,
    #         "mchange"=>"shuffling",
    #         ),
    #         Dict(
    #         #topology
    #         "N" => "NP",
    #         "k" => "NP",
    #         "p" => "RP", #----important one, might change to CP
    #         "seednet" => "NP2",
    #         "mtop" => "NP",
    #         #dynamical
    #         "mmodel" => "NP",
    #         "seedic" => "NP2",
    #         "epsi" =>  "CP", #CP ----- important one, might change to RP
    #         "mu" => "RP",
    #         "std" => "RP",
    #         "mfreq" => "NP",
    #         "seedfreq" => "RP",
    #         "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #         #simulation
    #         "tend" => "RP",
    #         "ttrans" => "RP",
    #         "dtana" => "RP",
    #         "mchange" => "NP2",
    #         )]                        end

            if(dictname == "ku_ws_2000_shuf_eps_pseveral_1")
                return [Dict(
                #topology
                "N" => 2000, #NP
                "k" => 2, #NP
                "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                # "p" =>[0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                # "p" =>[ 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                # "shuffleid" => collect(0:250),
                # "shuffleid" => collect(420:500),
                "shuffleid" => collect(0:500),
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end 

                if(dictname == "ku_ws_2000_shuf_eps_pseveral_2")
                    return [Dict(
                    #topology
                    "N" => 2000, #NP
                    "k" => 2, #NP
                    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                    # "p" =>[0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                    # "p" =>[0.25809, 1.0],
                    "seednet" => 2,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    # "shuffleid" => collect(0:250),
                    # "shuffleid" => collect(251:500),
                    "shuffleid" => collect(0:500),
                    #simulation
                    "tend" => 3000.,
                    "ttrans" => 1250.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end 

                    if(dictname == "ku_ws_2000_shuf_eps_pseveral_3")
                        return [Dict(
                        #topology
                        "N" => 2000, #NP
                        "k" => 2, #NP
                        "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                        # "p" =>[0.13111, 0.25809, 1.0],
                        "seednet" => 3,
                        "mtop" => "WS",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => 0,
                        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        # "shuffleid" => collect(0:250),
                        # "shuffleid" => collect(251:500),
                        "shuffleid" => collect(0:500),
                        #simulation
                        "tend" => 3000.,
                        "ttrans" => 1250.,
                        "dtana" => 1.0,
                        "mchange"=>"shuffling",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        )]                        end 


                        if(dictname == "ku_ws_2000_shuf_eps_pseveral_4")
                            return [Dict(
                            #topology
                            "N" => 2000, #NP
                            "k" => 2, #NP
                            "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                        # "p" =>[0.13111, 0.25809, 1.0],
                            "seednet" => 4,
                            "mtop" => "WS",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" => 0,
                            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            # "shuffleid" => collect(0:250),
                            # "shuffleid" => collect(251:500),
                            "shuffleid" => collect(0:500),
                            #simulation
                            "tend" => 3000.,
                            "ttrans" => 1250.,
                            "dtana" => 1.0,
                            "mchange"=>"shuffling",
                            ),
                            Dict(
                            #topology
                            "N" => "NP",
                            "k" => "NP",
                            "p" => "RP", #----important one, might change to CP
                            "seednet" => "NP2",
                            "mtop" => "NP",
                            #dynamical
                            "mmodel" => "NP",
                            "seedic" => "NP2",
                            "epsi" =>  "CP", #CP ----- important one, might change to RP
                            "mu" => "RP",
                            "std" => "RP",
                            "mfreq" => "NP",
                            "seedfreq" => "RP",
                            "shuffleid" => "RP", #shuffleid, 0 == original frequency
                            #simulation
                            "tend" => "RP",
                            "ttrans" => "RP",
                            "dtana" => "RP",
                            "mchange" => "NP2",
                            )]                        end 


                            if(dictname == "ku_ws_2000_shuf_eps_pseveral_5")
                                return [Dict(
                                #topology
                                "N" => 2000, #NP
                                "k" => 2, #NP
                                "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                                # "p" =>[ 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                                "seednet" => 5,
                                "mtop" => "WS",
                                #dynamical
                                "mmodel" => "kuramoto",
                                "seedic" => 0,
                                "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                                "mu" => 0.0,
                                "std" => 1.0,
                                "mfreq" => "gauss",
                                "seedfreq" => 0,
                                # "shuffleid" => collect(0:250),
                                # "shuffleid" => collect(251:500),
                                "shuffleid" => collect(0:500),
                                #simulation
                                "tend" => 3000.,
                                "ttrans" => 1250.,
                                "dtana" => 1.0,
                                "mchange"=>"shuffling",
                                ),
                                Dict(
                                #topology
                                "N" => "NP",
                                "k" => "NP",
                                "p" => "RP", #----important one, might change to CP
                                "seednet" => "NP2",
                                "mtop" => "NP",
                                #dynamical
                                "mmodel" => "NP",
                                "seedic" => "NP2",
                                "epsi" =>  "CP", #CP ----- important one, might change to RP
                                "mu" => "RP",
                                "std" => "RP",
                                "mfreq" => "NP",
                                "seedfreq" => "RP",
                                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                #simulation
                                "tend" => "RP",
                                "ttrans" => "RP",
                                "dtana" => "RP",
                                "mchange" => "NP2",
                                )]                        end 















    if(dictname == "ku_ws_5000_shuf_eps_pseveral")
        return [Dict(
        #topology
        "N" => 5000, #NP
        "k" => 2, #NP
"p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
"epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        # "shuffleid" => collect(0:250),
# "shuffleid" => collect(251:500),
"shuffleid" => collect(0:500),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "CP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

        if(dictname == "ku_ws_5000_shuf_eps_pseveral_2")
            return [Dict(
            #topology
            "N" => 5000, #NP
            "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
    # "p" =>[0.25809, 1.0],
            "seednet" => 2,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:250),
    # "shuffleid" => collect(274:500),
    "shuffleid" => collect(0:500),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end

            if(dictname == "ku_ws_5000_shuf_eps_pseveral_1")
                return [Dict(
                #topology
                "N" => 5000, #NP
                "k" => 2, #NP
        "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
        # "p" =>[0.25809, 1.0],
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                # "shuffleid" => collect(0:250),
        # "shuffleid" => collect(274:500),
        "shuffleid" => collect(0:500),
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end

            if(dictname == "ku_ws_5000_shuf_eps_pseveral_3")
                return [Dict(
                #topology
                "N" => 5000, #NP
                "k" => 2, #NP
        "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
        # "p" =>[0.25809, 1.0],
                "seednet" => 3,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
        "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => 0,
                # "shuffleid" => collect(0:250),
        # "shuffleid" => collect(123:500),
        "shuffleid" => collect(0:500),
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "CP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "RP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                )]                        end

                if(dictname == "ku_ws_5000_shuf_eps_pseveral_4")
                    return [Dict(
                    #topology
                    "N" => 5000, #NP
                    "k" => 2, #NP
            "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            # "p" =>[0.25809, 1.0],
                    "seednet" => 4,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
            "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    # "shuffleid" => collect(0:250),
            # "shuffleid" => collect(339:500),
            "shuffleid" => collect(0:500),
                    #simulation
                    "tend" => 3000.,
                    "ttrans" => 1250.,
                    "dtana" => 1.0,
                    "mchange"=>"shuffling",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    )]                        end

                    if(dictname == "ku_ws_5000_shuf_eps_pseveral_5")
                        return [Dict(
                        #topology
                        "N" => 5000, #NP
                        "k" => 2, #NP
                "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
                # "p" =>[1.0],
                        "seednet" => 5,
                        "mtop" => "WS",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" => 0,
                "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        # "shuffleid" => collect(0:250),
                # "shuffleid" => collect(339:500),
                "shuffleid" => collect(0:500),
                        #simulation
                        "tend" => 3000.,
                        "ttrans" => 1250.,
                        "dtana" => 1.0,
                        "mchange"=>"shuffling",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "NP2",
                        "epsi" =>  "CP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        )]                        end



        if(dictname == "ku_ws_10000_shuf_eps_pseveral")
            return [Dict(
            #topology
            "N" => 10000, #NP
            "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:250),
    # "shuffleid" => collect(251:500),
    "shuffleid" => collect(0:500),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end
           
        if(dictname == "ku_ws_10000_shuf_eps_pseveral_1")
            return [Dict(
            #topology
            "N" => 10000, #NP
            "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => collect(0:250),
    # "shuffleid" => collect(251:500),
    # "shuffleid" => collect(0:500),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end


        if(dictname == "ku_ws_10000_shuf_eps_pseveral_2")
            return [Dict(
            #topology
            "N" => 10000, #NP
            "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.003, 0.01, 0.01311, 0.02955, 0.05817, 0.08733, 0.1, 0.13111, 0.25809, 1.0],
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
    "epsi" => [0.0, 0.20513, 0.41026, 0.61538, 0.82051, 1.02564, 1.23077, 1.4359, 1.64103, 1.84615, 2.05128, 2.25641, 2.46154, 2.66667, 2.87179, 3.07692, 3.28205, 3.48718, 3.69231, 3.89744, 4.10256, 4.30769, 4.51282, 4.71795, 4.92308, 5.12821, 5.33333, 5.53846, 5.74359, 5.94872, 6.15385, 8.0, 10.0, 15.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            # "shuffleid" => collect(0:250),
    # "shuffleid" => collect(251:500),
    "shuffleid" => [250; collect(490:500)],
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "CP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end

if(dictname == "ku_ws_501_resampletopology_p_eps451282")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>[0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0],
    "seednet" => collect(1:500),
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
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"resampletopology",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "CP", #----important one, might change to CP
    "seednet" => "RP",
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
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_resampletopology_p_019684_eps451282_shuffleid_netid")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" => 0.19684,
        "seednet" => [335, 221, 185, 6, 366, 202, 293, 473, 475, 9, 294, 111, 192, 282, 261, 19, 279, 191, 420, 94, 244],
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        "epsi" => 4.51282,
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => 0,
        "shuffleid" => collect(0:19),
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"resampletopology",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "RP",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "RP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "RP",
        "shuffleid" => "CP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        )]                        end

        if(dictname == "ku_ws_501_resampletopology_p_008733_eps451282_shuffleid_netid")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" => 0.08733,
            "seednet" => [465, 160, 116, 451, 267, 375, 297, 172, 406, 234, 274, 5, 96, 219, 263, 319, 345, 180, 64, 460],
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => 4.51282,
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => 0,
            "shuffleid" => collect(0:19),
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"resampletopology",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "RP",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "RP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "RP",
            "shuffleid" => "CP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            )]                        end

            #distributions by resampling

if(dictname == "ku_ws_501_shuf_eps_selected_p008733_resample")
    return [Dict(
    #topology
    "N" => 501, #NP
    "k" => 2, #NP
    "p" =>0.08733,
    "seednet" => 1,
    "mtop" => "WS",
    #dynamical
    "mmodel" => "kuramoto",
    "seedic" => 0,
    "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
    "mu" => 0.0,
    "std" => 1.0,
    "mfreq" => "gauss",
    "seedfreq" => collect(0:20000),
    "shuffleid" => 0,
    #simulation
    "tend" => 3000.,
    "ttrans" => 1250.,
    "dtana" => 1.0,
    "mchange"=>"shuffling",
    "mstudy"=>"distributions",
    ),
    Dict(
    #topology
    "N" => "NP",
    "k" => "NP",
    "p" => "RP", #----important one, might change to CP
    "seednet" => "NP2",
    "mtop" => "NP",
    #dynamical
    "mmodel" => "NP",
    "seedic" => "NP2",
    "epsi" =>  "RP", #CP ----- important one, might change to RP
    "mu" => "RP",
    "std" => "RP",
    "mfreq" => "NP",
    "seedfreq" => "CP",
    "shuffleid" => "RP", #shuffleid, 0 == original frequency
    #simulation
    "tend" => "RP",
    "ttrans" => "RP",
    "dtana" => "RP",
    "mchange" => "NP2",
    "mstudy" => "NP2",
    )]                        end

    if(dictname == "ku_ws_501_shuf_eps_selected_p0_resample")
        return [Dict(
        #topology
        "N" => 501, #NP
        "k" => 2, #NP
        "p" =>0.0,
        "seednet" => 1,
        "mtop" => "WS",
        #dynamical
        "mmodel" => "kuramoto",
        "seedic" => 0,
        # "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
        "epsi" => [8.0],
        "mu" => 0.0,
        "std" => 1.0,
        "mfreq" => "gauss",
        "seedfreq" => collect(0:20000),
        "shuffleid" => 0,
        #simulation
        "tend" => 3000.,
        "ttrans" => 1250.,
        "dtana" => 1.0,
        "mchange"=>"shuffling",
        "mstudy"=>"distributions",
        ),
        Dict(
        #topology
        "N" => "NP",
        "k" => "NP",
        "p" => "RP", #----important one, might change to CP
        "seednet" => "NP2",
        "mtop" => "NP",
        #dynamical
        "mmodel" => "NP",
        "seedic" => "NP2",
        "epsi" =>  "RP", #CP ----- important one, might change to RP
        "mu" => "RP",
        "std" => "RP",
        "mfreq" => "NP",
        "seedfreq" => "CP",
        "shuffleid" => "RP", #shuffleid, 0 == original frequency
        #simulation
        "tend" => "RP",
        "ttrans" => "RP",
        "dtana" => "RP",
        "mchange" => "NP2",
        "mstudy" => "NP2",
        )]                        end

        if(dictname == "ku_ws_501_shuf_eps_selected_p1_resample")
            return [Dict(
            #topology
            "N" => 501, #NP
            "k" => 2, #NP
            "p" =>1.0,
            "seednet" => 1,
            "mtop" => "WS",
            #dynamical
            "mmodel" => "kuramoto",
            "seedic" => 0,
            "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
            "mu" => 0.0,
            "std" => 1.0,
            "mfreq" => "gauss",
            "seedfreq" => collect(0:20000),
            "shuffleid" => 0,
            #simulation
            "tend" => 3000.,
            "ttrans" => 1250.,
            "dtana" => 1.0,
            "mchange"=>"shuffling",
            "mstudy"=>"distributions",
            ),
            Dict(
            #topology
            "N" => "NP",
            "k" => "NP",
            "p" => "RP", #----important one, might change to CP
            "seednet" => "NP2",
            "mtop" => "NP",
            #dynamical
            "mmodel" => "NP",
            "seedic" => "NP2",
            "epsi" =>  "RP", #CP ----- important one, might change to RP
            "mu" => "RP",
            "std" => "RP",
            "mfreq" => "NP",
            "seedfreq" => "CP",
            "shuffleid" => "RP", #shuffleid, 0 == original frequency
            #simulation
            "tend" => "RP",
            "ttrans" => "RP",
            "dtana" => "RP",
            "mchange" => "NP2",
            "mstudy" => "NP2",
            )]                        end

            if(dictname == "ku_ws_501_shuf_eps_selected_p019684_resample")
                return [Dict(
                #topology
                "N" => 501, #NP
                "k" => 2, #NP
                "p" =>0.19684,
                "seednet" => 1,
                "mtop" => "WS",
                #dynamical
                "mmodel" => "kuramoto",
                "seedic" => 0,
                # "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
                "epsi" => [5.12821, 6.97436, 8.0],
                "mu" => 0.0,
                "std" => 1.0,
                "mfreq" => "gauss",
                "seedfreq" => collect(0:20000),
                "shuffleid" => 0,
                #simulation
                "tend" => 3000.,
                "ttrans" => 1250.,
                "dtana" => 1.0,
                "mchange"=>"shuffling",
                "mstudy"=>"distributions",
                ),
                Dict(
                #topology
                "N" => "NP",
                "k" => "NP",
                "p" => "RP", #----important one, might change to CP
                "seednet" => "NP2",
                "mtop" => "NP",
                #dynamical
                "mmodel" => "NP",
                "seedic" => "NP2",
                "epsi" =>  "RP", #CP ----- important one, might change to RP
                "mu" => "RP",
                "std" => "RP",
                "mfreq" => "NP",
                "seedfreq" => "CP",
                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                #simulation
                "tend" => "RP",
                "ttrans" => "RP",
                "dtana" => "RP",
                "mchange" => "NP2",
                "mstudy" => "NP2",
                )]                        end

                if(dictname == "ku_ws_501_shufics_eps_selected_p008733_resample")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 2, #NP
                    "p" =>0.08733,
                    "seednet" => 1,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" =>  collect(0:20000),
                    "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "icshuffleid" => 0,
                    #simulation
                    "tend" => 3000.,
                    "ttrans" => 1250.,
                    "dtana" => 1.0,
                    "mchange"=>"resampleics",
                    "mstudy"=>"distributions",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "CP",
                    "epsi" =>  "RP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                    "icshuffleid" => "RP",
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end

                    if(dictname == "ku_ws_501_shufics_eps_selected_p0_resample")
                        return [Dict(
                        #topology
                        "N" => 501, #NP
                        "k" => 2, #NP
                        "p" =>0.0,
                        "seednet" => 1,
                        "mtop" => "WS",
                        #dynamical
                        "mmodel" => "kuramoto",
                        "seedic" =>  collect(0:20000),
                        "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
                        "mu" => 0.0,
                        "std" => 1.0,
                        "mfreq" => "gauss",
                        "seedfreq" => 0,
                        "shuffleid" => 0,
                        "icshuffleid" => 0,
                        #simulation
                        "tend" => 3000.,
                        "ttrans" => 1250.,
                        "dtana" => 1.0,
                        "mchange"=>"resampleics",
                        "mstudy"=>"distributions",
                        ),
                        Dict(
                        #topology
                        "N" => "NP",
                        "k" => "NP",
                        "p" => "RP", #----important one, might change to CP
                        "seednet" => "NP2",
                        "mtop" => "NP",
                        #dynamical
                        "mmodel" => "NP",
                        "seedic" => "CP",
                        "epsi" =>  "RP", #CP ----- important one, might change to RP
                        "mu" => "RP",
                        "std" => "RP",
                        "mfreq" => "NP",
                        "seedfreq" => "RP",
                        "shuffleid" => "RP", #shuffleid, 0 == original frequency
                        "icshuffleid" => "RP",
                        #simulation
                        "tend" => "RP",
                        "ttrans" => "RP",
                        "dtana" => "RP",
                        "mchange" => "NP2",
                        "mstudy" => "NP2",
                        )]                        end

                        if(dictname == "ku_ws_501_shufics_eps_selected_p1_resample")
                            return [Dict(
                            #topology
                            "N" => 501, #NP
                            "k" => 2, #NP
                            "p" =>1.0,
                            "seednet" => 1,
                            "mtop" => "WS",
                            #dynamical
                            "mmodel" => "kuramoto",
                            "seedic" =>  collect(0:20000),
                            "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
                            "mu" => 0.0,
                            "std" => 1.0,
                            "mfreq" => "gauss",
                            "seedfreq" => 0,
                            "shuffleid" => 0,
                            "icshuffleid" => 0,
                            #simulation
                            "tend" => 3000.,
                            "ttrans" => 1250.,
                            "dtana" => 1.0,
                            "mchange"=>"resampleics",
                            "mstudy"=>"distributions",
                            ),
                            Dict(
                            #topology
                            "N" => "NP",
                            "k" => "NP",
                            "p" => "RP", #----important one, might change to CP
                            "seednet" => "NP2",
                            "mtop" => "NP",
                            #dynamical
                            "mmodel" => "NP",
                            "seedic" => "CP",
                            "epsi" =>  "RP", #CP ----- important one, might change to RP
                            "mu" => "RP",
                            "std" => "RP",
                            "mfreq" => "NP",
                            "seedfreq" => "RP",
                            "shuffleid" => "RP", #shuffleid, 0 == original frequency
                            "icshuffleid" => "RP",
                            #simulation
                            "tend" => "RP",
                            "ttrans" => "RP",
                            "dtana" => "RP",
                            "mchange" => "NP2",
                            "mstudy" => "NP2",
                            )]                        end

                            if(dictname == "ku_ws_501_shufics_eps_selected_p019684_resample")
                                return [Dict(
                                #topology
                                "N" => 501, #NP
                                "k" => 2, #NP
                                "p" =>0.19684,
                                "seednet" => 1,
                                "mtop" => "WS",
                                #dynamical
                                "mmodel" => "kuramoto",
                                "seedic" =>  collect(0:20000),
                                "epsi" => [0.61538, 1.0, 2.46154, 5.12821, 6.97436, 8.0],
                                "mu" => 0.0,
                                "std" => 1.0,
                                "mfreq" => "gauss",
                                "seedfreq" => 0,
                                "shuffleid" => 0,
                                "icshuffleid" => 0,
                                #simulation
                                "tend" => 3000.,
                                "ttrans" => 1250.,
                                "dtana" => 1.0,
                                "mchange"=>"resampleics",
                                "mstudy"=>"distributions",
                                ),
                                Dict(
                                #topology
                                "N" => "NP",
                                "k" => "NP",
                                "p" => "RP", #----important one, might change to CP
                                "seednet" => "NP2",
                                "mtop" => "NP",
                                #dynamical
                                "mmodel" => "NP",
                                "seedic" => "CP",
                                "epsi" =>  "RP", #CP ----- important one, might change to RP
                                "mu" => "RP",
                                "std" => "RP",
                                "mfreq" => "NP",
                                "seedfreq" => "RP",
                                "shuffleid" => "RP", #shuffleid, 0 == original frequency
                                "icshuffleid" => "RP",
                                #simulation
                                "tend" => "RP",
                                "ttrans" => "RP",
                                "dtana" => "RP",
                                "mchange" => "NP2",
                                "mstudy" => "NP2",
                                )]                        end


                if(dictname == "ku_ws_501_shuf_eps_select_p_select_units_0_phases_tend1000k")
                    return [Dict(
                    #topology
                    "N" => 501, #NP
                    "k" => 2, #NP
                    "p" =>[0.0, 0.08733, 0.19684, 1.0 ],
                    "seednet" => 1,
                    "mtop" => "WS",
                    #dynamical
                    "mmodel" => "kuramoto",
                    "seedic" => 0,
                    "epsi" => [0.1,  0.61538, 0.8, 1.0, 1.5, 2.46154, 4.51282, 5.12821, 8.0],
                    "mu" => 0.0,
                    "std" => 1.0,
                    "mfreq" => "gauss",
                    "seedfreq" => 0,
                    "shuffleid" => 0,
                    "ω_new" => 3.0,
                    "idx_unit" => [0],
                    #simulation
                    "tend" => 20000.,
                    "ttrans" => 0.,
                    "dtana" => 10.0,
                    "mchange"=>"oneunit",
                    "mstudy" => "phases",
                    ),
                    Dict(
                    #topology
                    "N" => "NP",
                    "k" => "NP",
                    "p" => "RP", #----important one, might change to CP
                    "seednet" => "NP2",
                    "mtop" => "NP",
                    #dynamical
                    "mmodel" => "NP",
                    "seedic" => "NP2",
                    "epsi" =>  "CP", #CP ----- important one, might change to RP
                    "mu" => "RP",
                    "std" => "RP",
                    "mfreq" => "NP",
                    "seedfreq" => "RP",
                    "shuffleid" => "RP", #shuffleid, 0 == original frequency
                "ω_new" => "RP",
                "idx_unit" => "RP",
                    #simulation
                    "tend" => "RP",
                    "ttrans" => "RP",
                    "dtana" => "RP",
                    "mchange" => "NP2",
                    "mstudy" => "NP2",
                    )]                        end



@error("No dictionary found")
end
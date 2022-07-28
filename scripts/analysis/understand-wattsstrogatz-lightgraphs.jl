include("general_plots.jl")
using PyCall, DelimitedFiles
DIR =  projectdir()
include("$(DIR)/src/sims/Kuramoto/parameters.jl")
include("$(DIR)/src/utils.jl")
include("$(srcdir())/quantifiers.jl")
N = 501
k = 2 
seednet = 1


ps = [0.0, 0.001, 0.002, 0.003, 0.006, 0.01, 0.01145, 0.01311, 0.01501, 0.01719, 0.01968, 0.02254, 0.02581, 0.02955, 0.03384, 0.03875, 0.04437, 0.0508, 0.05817, 0.06661, 0.07627, 0.08733, 0.1, 0.1145, 0.13111, 0.15013, 0.17191, 0.19684, 0.22539, 0.25809, 0.29552, 0.33839, 0.38747, 0.44367, 0.50802, 0.58171, 0.66608, 0.7627, 0.87333, 1.0]

p = 0
a1 = get_wattsstrogatz(N, p, k, seednet, DIR)

ns = [0]
for p in ps[2:end]
	a2 = get_wattsstrogatz(N, p, k, seednet, DIR)
	nswitchedconns = sum([length(findall(x->x ∉ a1[i], a2[i])) for i=1:N])
	push!(ns, nswitchedconns)
	println("$(nswitchedconns)")
end

plot(ps, ns)
plot(ps, N*k*2 .* ps)

a2 = get_wattsstrogatz(N, 0.001, k, seednet, DIR);
a = [findall(x->x ∉ a1[i], a2[i]) for i =1:N]
chosenunits1 = findall(x->x != [], a)

# a3 = get_wattsstrogatz(N, 0.002, k, seednet, DIR);
# a3[a1 .!= a3]
# a1[a1 .!= a3]
a4 = get_wattsstrogatz(N, 0.003, k, seednet, DIR)
a = [findall(x->x ∉ a1[i], a4[i]) for i =1:N]
chosenunits2 = findall(x->x != [], a)
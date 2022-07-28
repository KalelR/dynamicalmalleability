include("general_plots.jl")
include("$(srcdir())/sims/Kuramoto/parameters.jl")
using PyCall, DelimitedFiles

epsi = 4.10256
ps = [0, 0.13111, 1.0] #shuffle
# shuffleids = [0, 67, 380]
unitids = [0, 158, 298]
# ps = [0, 0.001, 0.01, 0.01145, 0.02254, 0.03384, 0.04437, 0.07627, 0.1, 0.13111, 0.33839, 1.0]
ps = [0, 0.001, 0.01, 0.02254, 0.04437, 0.07627, 0.1, 0.13111, 1.0]
shuffle= false
# mode = "shuffling"
dictname = "ku_ws_501_shuf_p_eps4_selectphases"


mode = "oneunit"
dictname = "ku_ws_501_unit_p_eps4_selectphases"

function plot_meanfreqs!(ax, Ω, color="black"; ω=[])
	if ω == []
		N = length(Ω)
		h = ax.plot(1:N, Ω, ".", color=color)
	else 
		h = ax.plot(ω, Ω, ".", color=color)
	end
end

function readfrequency(freqname, p)
        df = CSV.File(freqname, header=false) |> DataFrame
	idx_line = findall(x -> x==p, df[:,1])[1]
	Vector(df[idx_line, 2:end])
end

numL, numC = length(shuffleids), length(ps)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

# for (i, shuffleid) in enumerate(shuffleids)
for (i, idxunit) in enumerate(unitids)
	# freqname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/meanfreqs-control_p_all-epsi_$(epsi)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
	freqname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/meanfreqs-control_p_all-epsi_$(epsi)-idx_unit_$(idxunit)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
    for (j, p) in enumerate(ps)
	# ω = get_frequency("shuffling", "gauss", Dict("N"=>501, "mu"=>0.0, "std"=>1.0, "seedfreq"=>0, "shuffleid"=>shuffleid))
	ω=[]
	Ω = readfrequency(freqname, p)
	ax = axs[i,j]
	plot_meanfreqs!(ax, Ω, "C0", ω=ω)
    end
end

for i=1:numL 
	axs[i, 1].set_ylabel(L"\Omega \equiv \langle \dot{\theta} \rangle")
end

for j=1:numC
        # axs[i, end].text(1.35, 0.5, "Shuffle No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
        s  = "\\mathrm{p} = $(ps[j])"; axs[1,j].set_title(latexstring(s))
	axs[end, j].set_xlabel("Unit No.")
	# axs[end, j].set_xlabel("ω")
end

for i =1:numL
    if(shuffle) axs[i,end].set_title("Shuffle $(shuffleids[i])", x=1.05, y = 0.2, fontsize=label_size-3, rotation=-90, pad=5)
    else
	axs[i,end].set_title("Unit ids $(unitids[i])", x=1.05, y = 0.2, fontsize=label_size-3, rotation=-90, pad=5)
    end
end

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=1.2*column;
fig.set_size_inches(width, height)
fig.tight_layout()
fig.subplots_adjust(wspace=0.10, hspace=0.1)
# filename = "$(plotsdir())/meanfreqs/meanfreqs-versus-naturalfreqs-$(mode)-$(dictname).png" 
filename = "$(plotsdir())/meanfreqs/meanfreqs-versus-indices-$(mode)-$(dictname).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)




# ----------------------------------------------------------------- VARYING EPSILON ---------------------------------------------------------------- #
dictname = "ku_ws_501_shuf_eps_p013111_selectphases"
p = 0.13111
shuffleids = [0, 68, 381]
shuffle = true
epsis = [0.0, 0.61538,  1.02564,  1.4359,  2.05128, 3.07692, 4.10256, 5.12821, 8.0]
 

numL, numC = length(shuffleids), length(epsis)
fig, axs = subplots(numL, numC,constrained_layout=true, sharex="all", sharey="all")

for (i, shuffleid) in enumerate(shuffleids)
# for (i, idxunit) in enumerate(unitids)
	freqname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_shuffling-seedic_0-seednet_1/meanfreqs-control_epsi_all-mu_0.0-p_$(p)-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0.dat"
	# freqname = "$(data_dir)/N_501-k_2-mfreq_gauss-mmodel_kuramoto-mtop_WS/mchange_oneunit-seedic_0-seednet_1/meanfreqs-control_p_all-epsi_$(epsi)-idx_unit_$(idxunit)-mu_0.0-seedfreq_0-shuffleid_$(shuffleid)-std_1.0-tend_3999.9999999999995-ttrans_1250.0-ω_new_10.0.dat"
    for (j, epsi) in enumerate(epsis)
	# ω = get_frequency("shuffling", "gauss", Dict("N"=>501, "mu"=>0.0, "std"=>1.0, "seedfreq"=>0, "shuffleid"=>shuffleid))
	ω=[]
	Ω = readfrequency(freqname, epsi)
	ax = axs[i,j]
	plot_meanfreqs!(ax, Ω, "C0", ω=ω)
    end
end

for i=1:numL 
	axs[i, 1].set_ylabel(L"\Omega \equiv \langle \dot{\theta} \rangle")
end

for j=1:numC
        # axs[i, end].text(1.35, 0.5, "Shuffle No = $(shuffleids[i])", transform=axs[i, end].transAxes, rotation=-90, verticalalignment="center", fontsize=label_size-3)
	s  = "\\epsilon = $(epsis[j])"; axs[1,j].set_title(latexstring(s))
	axs[end, j].set_xlabel("Unit No.")
	# axs[end, j].set_xlabel("ω")
end

for i =1:numL
    if(shuffle) axs[i,end].set_title("Shuffle $(shuffleids[i])", x=1.05, y = 0.2, fontsize=label_size-3, rotation=-90, pad=5)
    else
	axs[i,end].set_title("Unit ids $(unitids[i])", x=1.05, y = 0.2, fontsize=label_size-3, rotation=-90, pad=5)
    end
end

column = 3.54 ##1 column = 2.3 inches
width= 3.5 *column;
height=1.2*column;
fig.set_size_inches(width, height)
fig.tight_layout()
fig.subplots_adjust(wspace=0.10, hspace=0.1)
# filename = "$(plotsdir())/meanfreqs/meanfreqs-versus-naturalfreqs-$(mode)-$(dictname).png" 
filename = "$(plotsdir())/meanfreqs/meanfreqs-versus-indices-$(mode)-$(dictname).png" 
mkpath(dirname(filename))
savefig(filename, dpi=300)


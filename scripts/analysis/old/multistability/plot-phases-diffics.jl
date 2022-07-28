#Plot mean R, max R, min R against topology (either p or alpha)

DIR = pwd()[1:findfirst("Malleability", pwd())[1]-1] * "Malleability"
include("$(DIR)/Analysis/Plotters/generic-plotters.jl")
include("$(DIR)/src/Kuramoto/current-parameters.jl")
using Statistics, PyPlot
using PyPlot, PyCall
pyimport("mpl_toolkits.mplot3d") #import Axes3D
# label_size -= 1.0

function collect_data(v_files, v_parameters; hasheader=true)
    m_data = []
    for (idx, par) in enumerate(v_parameters)
            fileName = v_files[idx]
            if(!isfile(fileName)) println("No such file: $(fileName)"); continue end
            if(hasheader) data = readdlm(fileName, header=true)[1]
            else data = readdlm(fileName) end
            if(idx == 1) m_data = zeros(Float64, (length(v_parameters), size(data)[1], size(data)[2])) end
            m_data[idx, :, :] = data
    end
    return m_data
end




k = 2 #default
# v_p_rewiring = [1e-3, 4e-3, 8e-3, 1e-2, 2e-2, 4e-2, 5e-2, 6e-2, 7e-2, 8e-2, 9e-2, 1e-1, 2e-1, 3e-1, 4e-1, 4.5e-1, 4.8e-1, 4.9e-1, 5e-1, 7e-1, 9e-1, 1] #original, old, 22 values
# v_p_rewiring = [0, 1e-3, 4e-3, 8e-3, 1e-2, 1.5e-2, 2e-2, 4e-2, 5e-2, 6e-2, 7e-2, 8e-2, 9e-2, 1e-1,1.05e-1, 1.1e-1, 1.2e-1, 1.5e-1,1.8e-1, 2e-1, 3e-1, 4e-1, 4.5e-1, 4.8e-1, 4.9e-1, 5e-1, 7e-1, 9e-1, 1] #added vlaues to
# v_p_rewiring = [0, 1e-4, 5e-4, 1e-3, 2e-3, 3e-3, 4e-3, 5e-3, 8e-3, 1e-2, 1.25e-2, 1.5e-2, 1.7e-2, 2e-2, 4e-2, 5e-2, 7e-2, 9e-2, 1e-1, 1.2e-1, 1.5e-1, 2e-1, 3e-1, 4e-1, 6e-1, 8e-1, 1] #more detail for N = 1002
seed_CI = 0
# v_idx_N = 1:N;
local_range = 2

color2= "red"
#----------------- gaussian 
N = 1001
k =4
idx_data = 2 # idx = 2 chooses mean(R(t)); idx = 3 chooses std(R(t)); 4 chooses max, 5 min
seednet = 1
v_seeds = [1]
shuffleid = 0
v_ω_new = [10.0]
ω_new = v_ω_new[1]
t_end = 2500.
t_trans = 1500.
μ = 0.
σ = 1.0
seed_CI = 0
p_rewiring = 1.7e-2
epsi=2.0
v_idx_N = [0];
v_ω_new = [10.0]
v_idx_N = [0]; idx_N = v_idx_N[1]
v_idx_N_ic = [1,2, 500]#all
v_idx_N_ic = [1,2]#firstplot
# v_u0_new = range(0, 2pi, length=50)
# v_u0_new = collect(v_u0_new)[1:3]
v_u0_new = [0.0, 0.1282282715750936, 0.2564565431501872, 0.38468481472528077, 0.5129130863003744, 0.641141357875468, 0.7693696294505615, 0.8975979010256552, 1.0258261726007487, 1.1540544441758425, 1.282282715750936, 1.4105109873260295, 1.538739258901123, 1.6669675304762168, 1.7951958020513104, 1.9234240736264039, 2.0516523452014974, 2.179880616776591, 2.308108888351685, 2.4363371599267785, 2.564565431501872, 2.6927937030769655, 2.821021974652059, 2.9492502462271526, 3.077478517802246, 3.20570678937734, 3.3339350609524336, 3.462163332527527, 3.5903916041026207, 3.7186198756777142, 3.8468481472528078, 3.9750764188279013, 4.103304690402995, 4.231532961978089, 4.359761233553182, 4.487989505128276, 4.61621777670337, 4.744446048278463, 4.872674319853557, 5.00090259142865, 5.129130863003744, 5.257359134578837, 5.385587406153931, 5.513815677729025, 5.642043949304118, 5.770272220879212, 5.898500492454305, 6.026728764029399, 6.154957035604492, 6.283185307179586]

# idx_N_ic2 = 100
# idx_N_ic2 = 100
# v_u0_new = collect(v_u0_new)[1:3] #100
# idx_N_ic2 = 250
idx_N_ic2 = 2
v_u0_new = collect(v_u0_new)[31:33] #250
# idx_N_ic2 = 500
# v_u0_new = collect(v_u0_new)[27:29] #500

idx_N_ic1 = 1
# idx_N_ic2 = 2
# for idx_N_ic2 in [2,250,500, 100, 750, 900]
numL, numC = length(v_u0_new), length(v_u0_new)
for idx_N_ic2 in [idx_N_ic2]
fig, axs = subplots(numL,numC,constrained_layout=true)
for i=1:numL 
	u0_new1 = v_u0_new[i]
	for j=1:numC
		u0_new2 = v_u0_new[j]

		file = "$(DIR)/data/Results/System-Variables/change-ics/phases-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-cauchy-x0_$(x0)-gamma_$(γ)-seed_$(seedfreq)-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new)-icseed_$(seed_CI)-idxnic_$(idx_N_ic1)-$(u0_new1)-$(idx_N_ic2)_$(u0_new2).dat"
		data = readdlm(file)
		v_t = data[:,1]
		m_θ = data[:, 2:end]
		m_θ = mod.( m_θ, 2pi)
		m_θ_t = transpose(m_θ)

		file = "$(DIR)/data/Results/System-Variables/change-ics/Rxt-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-cauchy-x0_$(x0)-gamma_$(γ)-seed_$(seedfreq)-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new)-icseed_$(seed_CI)-idxnic_$(idx_N_ic1)-$(u0_new1)-$(idx_N_ic2)_$(u0_new2).dat"
		data = readdlm(file)
		plot_step = 1;
		v_t2 = data[2:end, 1]
		v_R = data[2:end, 2]

		# c = pcolormesh(x, y, m_θ_t, cmap=newcmp, vmin=-pi, vmax=pi)
		y = collect(1:N+1)
		x = [v_t; t_end+1]

		ax1 = axs[i,j]
		c = ax1.pcolormesh(x, y, m_θ_t, cmap="twilight", vmin=-pi, vmax=pi)
		# fig = gcf()


		ax2 = ax1.twinx()
		ax2.plot(v_t2, v_R, "-", color=color2, linewidth=5);
		ax2.set_ylim(0,1)
		ax2.tick_params(axis="y", colors=color2)
		ax1.set_xticks([1500, 2500])
		ax1.set_xlim(1500, 2500)

		# ax1.set_yticks([1, 250, 501])

		if(i == 3)
		cbar=fig.colorbar(c, location="bottom")
		# cbar = fig.colorbar(c, ax=axs[end, :], shrink=0.6, location="bottom")
		cbar.set_label(L"\theta", fontsize=label_size)
		cbar.solids.set_edgecolor("face")
		cbar.set_ticks(-pi:pi:pi)
		cbar.set_ticklabels([L"-\pi", L"0",  L"\pi"])
		ax1.set_xlabel(L"t", fontsize=label_size)
		end
		if(j==1)
		ax1.set_ylabel(L"\text{Unit No.}", fontsize=label_size)
		end 
		if(j ==3)
		ax2.set_ylabel(L"$\langle R \rangle$", fontsize=label_size, color=color2)
		end


		column = 3.54 ##1 column = 2.3 inches
		width= 1.0 *column;
		height=(5.0/6)*width;
		fig.set_size_inches(width, height)
		#   fig.tight_layout(pad=0.8, rect=[0.0, 0.1, 1., 1.])
		s  = "\\theta_1(0) = $(round(u0_new1, digits=4)), \\theta_{$(idx_N_ic2)}(0) = $(round(u0_new2, digits=4))"
		ax1.set_title(latexstring(s))
		# if(length(uniqueR) == 1) ax.set_zlim(uniqueR[1] -0.1, uniqueR[1]+0.1)  end


	end
end

width = 3*column_width; height=(3.0/4)*width;
fig.set_size_inches(width, height)
# # fig.tight_layout()
file = "$(DIR)/data/Results/System-Variables/change-ics/phases-eps_$(epsi)-kuramoto-tend_$(t_end)-ttrans_$(t_trans)-wattsstrogatz-N_$(N)-p_$(p_rewiring)-k_$(k)-seed_$(seednet)-cauchy-x0_$(x0)-gamma_$(γ)-seed_$(seedfreq)-shuffled-id_$(shuffleid)-changefreqs-idxN_$(idx_N)-newfreq_$(ω_new)-icseed_$(seed_CI)-idxnic_$(idx_N_ic1)-$(idx_N_ic2).png"
savefig(file, dpi=300)
close("all")
GC.gc()
end




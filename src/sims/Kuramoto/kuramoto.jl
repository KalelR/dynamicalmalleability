#This file contains all the relevant functions to simulate the Kuramoto oscillator networks. These are mainly the functions defining the networks. I have one for each type of topology: binary adjacency matrix (for Watts-Strogatz); global (more optimzied than usnig a matrix); powerlaw distance-dependent. This functions are to be used with Julia OrdinaryDiffEqs module. 
mutable struct params
    v_w0 :: Array{Float64, 1}
    eps :: Float64
    v_adjl :: Array{Array{Int64,1}, 1}
end

mutable struct params_binary
    v_w0 :: Array{Float64, 1}
    eps :: Float64
    v_adjl :: Array{Array{Int64,1}, 1}
end
    
mutable struct params_powerlaw
    v_w0 :: Array{Float64, 1}
    eps :: Float64
    N_p :: Int64
    eta :: Float64
    alpha :: Float64
end

mutable struct params_global
    v_w0 :: Array{Float64, 1}
    eps :: Float64
end 
   
function kuramotonetwork!(du, u, p,t)
    #----parameters
    v_w0, eps, v_adjl = p.v_w0, p.eps, p.v_adjl #or getfield(p, 1)
    
    N = length(v_w0)
    
    #----EDO
    du .= v_w0
    for i = 1:N
        @inbounds v_inedges = v_adjl[i] #get neighborhood of i
        sum_u = 0.
        for j in v_inedges
            @inbounds sum_u += sin(u[j] - u[i])
        end
        @inbounds du[i] += (eps) * sum_u;
    end
end 
    
function kuramotonetwork_jacobian!(J, u, p,t)
    #----parameters
    v_w0, eps, v_adjl = p.v_w0, p.eps, p.v_adjl #or getfield(p, 1)
    
    N = length(v_w0)
    
    #----EDO
    fill!(J, 0.0)
    for i = 1:N
        @inbounds v_inedges = v_adjl[i] #get neighborhood of i
        sum_u = 0.
        for j in v_inedges
            @inbounds sum_u += cos(u[j] - u[i])
        end
        @inbounds J[i,i] = (-eps) * sum_u;

        for j in v_inedges 
            J[i,j] = eps * cos(u[j] - u[i])
        end
    end
end 
    
function kuramotonetwork_global!(du, u, p, t)
    v_w0 = p.v_w0; eps = p.eps
    N = length(v_w0)
    z = mean(exp.(im .* u))
    r = abs(z)
    θ = angle(z)
    @inbounds for i in 1:N
        du[i] = v_w0[i] + eps*r*sin(θ - u[i])
    end
    return
end 
    
function kuramotonetwork_powerlaw!(du, u, p,t)
    @inbounds begin
        #----parameters
        v_w0, eps, N_p, eta, alpha = p.v_w0, p.eps, p.N_p, p.eta, p.alpha #or getfield(p, 1)
        N = length(v_w0)
        
        #----EDO
        du .= v_w0
        for i = 1:N
            sum_u = 0.
            for j=1:N_p
                i_1 = i - j;
                i_2 = i + j;
                if (i_1 <= 0) i_1 += (N) end #boundary conditions
                if (i_2 > N) i_2 -= N end #boundary conditions
                sum_u += (1/j^alpha)*( sin(u[i_1]-u[i]) + sin(u[i_2]-u[i]) );
            end
            sum_u /= eta;
        
            du[i] += (eps) * sum_u;
        end
    end
end

"""
util function for powerlaw coupling, retursn the normalization η
"""
function norm_powerlaw(α, N_p)
    η = 0.0
    for j = 1:N_p
        η += 1/j^α;
    end
    η *= 2;
end
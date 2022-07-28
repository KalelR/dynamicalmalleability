# Repository for relevant code studying dynamical malleability, especially in Kuramoto oscillators

Contains the basic code to run simulations of Kuramoto oscillator networks, with one script for plotting the spatiotemporal patterns of the phases.

The code is divided into several different files, so I'd suggest using a code editor to open all of them. To run the basic simulation, execute the code in `allruns.jl` file, found in `data/inputs`, by simply copying and pasting the code there in a terminal. 

This will execute the main script, entitle `kuramoto-run.jl`, which uses the basic simulation code in `kuramoto-makesims.jl`. The right hand side definition of the system is contained in `kuramoto.jl`. 


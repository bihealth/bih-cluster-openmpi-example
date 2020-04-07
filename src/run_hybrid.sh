#!/bin/bash

# Example job script for multi-threaded MPI programs, sometimes
# called "hybrid" MPI computing.

# Generic arguments

# Job name
#SBATCH --job-name openmpi_example
# Maximal running time of 10 min
#SBATCH --time 00:10:00
# Allocate 1GB of memory per node
#SBATCH --mem 1G
# Write logs to directory "slurm_log"
#SBATCH -o slurm_log/slurm-%x-%J.log

# MPI-specific parameters

# Run 8 tasks (threads/on virtual cores)
#SBATCH --ntasks 8
# Allocate 4 CPUs per task (cores/threads)
#SBATCH --cpus-per-task 4

# Make sure to source the profile.d file (not available on head nodes).
source /etc/profile.d/modules.sh

# Load the OpenMPI environment module to get the runtime environment.
module load openmpi/4.0.3-0

# Launch the program.
mpirun -n 8 ./openmpi_example

#!/bin/bash

# Example job script for multi-threaded MPI programs, sometimes
# called "hybrid" MPI computing.

# Generic arguments

# Job name
#$ -N openmpi_example
# Stay in the current directory
#$ -cwd
# Merge stderr and stdout
#$ -j y
# Maximal running time of 10 min
#$ -l h_rt=00:10:00
# Allocate 1GB of memory **per slot/process**
#$ -l h_vmem=1G
# Write logs to directory "sge_log"
#$ -o sge_log
# Use bash as the shell (instead of the default "/bin/sh")
#$ -S /bin/bash

# MPI-specific parameters

# Use "mpi" project for getting access to the parallel environment
# for running MPI programs.
#$ -P mpi

# Run in "mpi.8" parallel environment that allocates 8 threads on
# each node.  We allocate 64 slots, such that we will get 8 slots
# on 8 nodes each (8 * 8 = 64 threads in total).
#
# Note that the "-npernode" argument is very important in the
# "mpirun" call below.
#$ -pe mpi.8 64

# Load the OpenMPI environment module to get the runtime environment.
module load openmpi/3.1.0-0

# Fix TMPDIR to TMP temporary directory assigned by SGE. This is
# important so local communication does not go through the GPFS
# file system /fast.
export TMPDIR=$TMP

# Launch the program.
mpirun -npernode 1 -np 8 ./openmpi_example

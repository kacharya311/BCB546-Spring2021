#!/bin/bash

# Copy/paste this job script into a text file and submit with the command:
#    sbatch thefilename

#SBATCH --time=196:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=36   # 36 processor core(s) per node 
#SBATCH --job-name="raxml-ng_BCB546"
#SBATCH --mail-user=mudith@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output="output" # job standard output file (%j replaced by job id)
#SBATCH --error="error" # job standard error file (%j replaced by job id)

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

cd $SLURM_SUBMIT_DIR

module load miniconda3
source activate raxml-ng

raxml-ng --all --msa SupplementaryFile6phy.phy --model LG+I+G --prefix BCB546 --seed 2 --threads 2 --bs-metric fbp,tbe

#!/usr/bin/env bash

# load module
module load anaconda/anaconda3

# initialize shell and source modified shell config
conda init --user bash
source ~/.bashrc

# prepend the directory that contains the shared conda environment
conda config --prepend envs_dirs '/groups/course.workshop/shared-conda-envs/'

# activate the environment and create a jupyter password
conda run -n dask-tutorial jupyter notebook password

# make a directory for SLURM logs
mkdir -p logs

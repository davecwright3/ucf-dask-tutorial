#!/usr/bin/env bash

# load module
module load anaconda/anaconda3

# initialize shell and source modified shell config
conda init bash
source ~/.bashrc

# prepend the directory that contains the shared conda environment
conda config --prepend envs_dirs '/groups.course.workshop/shared-conda-envs/'

# activate the environment and create a jupyter password
conda activate dask-tutorial
jupyter notebook password

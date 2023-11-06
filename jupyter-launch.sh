#!/usr/bin/env bash
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 2G
#SBATCH --time 3:00:00
#SBATCH --job-name jupyter-lab
#SBATCH --output ./logs/jupyter-lab-%J.log
#SBATCH --error ./logs/jupyter-lab-%J-errors.log

mkdir -p ./logs

# get tunneling info
XDG_RUNTIME_DIR=""
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster="stokes"

# load modules
module purge
module load anaconda/anaconda3
source ~/.bashrc
conda activate dask-tutorial

# set proxied dashboard link
export DASK_DISTRIBUTED__DASHBOARD__LINK="proxy/{port}/status"

# print tunneling instructions jupyter-log
echo -e "
For MacOS, Linux, or native Windows SSH create your ssh tunnel with the following command
ssh -N -L ${port}:${node}:${port} ${user}@${cluster}.ist.ucf.edu

Windows MobaXterm info
Forwarded port:same as remote port
Remote server: ${node}
Remote port: ${port}
SSH server: ${cluster}.ist.ucf.edu
SSH login: $user
SSH port: 22

Use a Browser on your local machine to go to:
localhost:${port}  (prefix w/ https:// if using password)
"

# load modules or conda environments here

jupyter lab --no-browser --port=${port} --ip=${node}

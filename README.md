# UCF Dask Tutorial
Jupyter notebooks and accompanying materials for the Fall 2023 Dask workshop at UCF.
These materials were modified from the publicly available [Dask tutorials](https://tutorial.dask.org/).


The full, original tutorial was last given at SciPy 2022 in Austin, Texas.
[A video of the SciPy 2022 tutorial is available online](https://youtu.be/J0NcbvkYPoE).

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dask/dask-tutorial/main?urlpath=lab)
[![Build Status](https://github.com/dask/dask-tutorial/workflows/CI/badge.svg)](https://github.com/dask/dask-tutorial/actions?query=workflow%3ACI)

Dask is a parallel and distributed computing library that scales the existing Python and PyData ecosystem. Dask can scale up to your full laptop capacity and out to a cloud or HPC cluster.

## Prepare

### 1. You should clone this repository

    git clone https://github.com/davecwright3/ucf-dask-tutorial.git

and then install necessary packages.
There are many different ways to achieve this, but for this tutorial we will use conda.


### 2) Setup software environment
#### 2a) If working on ARCC
Run the included script `setup-arcc-env.sh`.

``` sh
# First, request some resources
srun -n 1 --mem=4G --time=00:10:00 --pty bash

# Resources will be allocated, and you will switch to a compute node
./setup-arcc-env.sh
```
After this, `exit` and the job will end.

This script will
1. Load the conda module
2. Initialize your shell with relevant conda functions and variables
3. Make the pre-configured workshop conda environment available to you
4. Ask you to create a Jupyter password

#### 2b) If following along on another machine

In the main repo directory

    conda env create -f environment.yml
    conda activate dask-tutorial

#### You should follow only one of the options above!

### 3) Launch Jupyter
#### 3a) If following along on ARCC
I have provided a SLURM job script that will launch Jupyter for you. From the cloned repo, run

``` sh
sbatch jupyter-launch.sh
```

After you run this, you should see a job number printed to your screen. Run the following to see the commands you need to run from your personal machine to connect to the running Jupyter instance:

``` sh
cat ./logs/jupyter-lab-<your-job-number>.log
```

There will be connection instructions printed to your screen.


#### 3b) If on a personal machine
Activate the `dask-tutorial` conda environment and, from the repo directory, run

    jupyter lab


## Links

*  Reference
    *  [Docs](https://dask.org/)
    *  [Examples](https://examples.dask.org/)
    *  [Code](https://github.com/dask/dask/)
    *  [Blog](https://blog.dask.org/)
*  Ask for help
    *   [`dask`](http://stackoverflow.com/questions/tagged/dask) tag on Stack Overflow, for usage questions
    *   [github issues](https://github.com/dask/dask/issues/new) for bug reports and feature requests
    *   [discourse forum](https://dask.discourse.group/) for general, non-bug, questions and discussion
    *   Attend a live tutorial

## Outline

0. Overview - dask's place in the universe.

1. Dataframe - parallelized operations on many pandas dataframes spread across your cluster.

2. Array - blocked numpy-like functionality with a collection of numpy arrays spread across your cluster.

3. Delayed - the single-function way to parallelize general python code.

4. Deployment/Distributed - Dask's scheduler for clusters, with details of how to view the UI.

5. Distributed Futures - non-blocking results that compute asynchronously.

6. Conclusion

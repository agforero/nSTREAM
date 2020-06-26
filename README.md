A fork of [STREAM](https://github.com/jeffhammond/STREAM) meant to benchmark supercomputers. Utilizes [OpenMP](https://www.openmp.org/) to get the most out of your HPC system.

Commands include:
* `./generate.sh (-n) (optional-threads)`: run the benchmark. Assumes number of threads to use from return of `$(nproc)`; otherwise, you can specify a custom amount of threads. You can use the `-n` flag to disable graphing.
* `./reset.sh`: removes everything in the `/runs/` directory.

Some things to know:
* It's best to use as many threads as possible. Use something like `$(htop)`, `$(lscpu)` or `$(lstopo)` to gauge how many threads you can use.
* `./generate.sh` will save the results in a folder named from the PID; you can find these results in `/runs/`.
* The construction of the graph utilizes `matplotlib`, which must therefore be loaded onto your environment. This can be done with tools like [Miniconda](https://docs.conda.io/en/latest/miniconda.html). Alternatively, you can forgo graphing entirely with the `-n` flag.

Originally written for Argonne National Laboratory.

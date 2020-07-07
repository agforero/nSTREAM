A fork of [STREAM](https://github.com/jeffhammond/STREAM) meant to benchmark and graph the memory bandwidth of a supercomputer. Utilizes [OpenMP](https://www.openmp.org/) to get the most out of your HPC system.

Commands include:
* `./generate.sh (-n) (optional-threads)`: run the benchmark. Assumes number of threads to use from return of `$(nproc)`; otherwise, you can specify a custom amount of threads. You can use the `-n` flag to disable graphing.
* `./reset.sh`: removes everything in the `/runs/` directory.

Some things to know:
* It's best to use as many threads as possible. Use something like `$(htop)`, `$(lscpu)` or `$(lstopo)` to gauge how many threads you can use.
* `nstream.F90` will use increasingly large memory footprints to benchmark. By default, it runs 125 times, starting at n = 100000 and ending at n = 12500000, where 100000n ≈ 2.272MB. Ideally, this is used to come into contact with all available caches before deferring to RAM. 
* If needed, you can edit the `begin`, `step` and `fin` values for the benchmark at the top of `generate.sh`.
* It's difficult for `stream`, either the version contained herein or from the original repo, to gauge L1 cache performance.
* `./generate.sh` will save the results in a folder named from the PID; you can find these results in `/runs/`.
* The construction of the graph utilizes `matplotlib`, which must therefore be installed onto your environment. This can be done with tools like [Miniconda](https://docs.conda.io/en/latest/miniconda.html). Alternatively, you can forgo graphing entirely with the `-n` flag.
* This repo could, hypothetically, be used to test a normal machine.

Sample output of `./generate.sh`:
![Sample Image](https://raw.githubusercontent.com/agforero/nSTREAM/master/sample.png)

Originally written for Argonne National Laboratory.

export OMP_PLACES=cores
export OMP_PROC_BIND=close

# for loop parameters.
# every 100000 translates roughly into about 2.272MB of memory footprint. use this to target as many caches as possible before RAM.
# to start, the values are assigned 100000, 100000 and 12500000 respectively. alter them as appropriate.
begin=100000 
step=100000
fin=12500000

make
mkdir -p runs
cd runs
mkdir $$
cd $$

# if no argument is provided (everything default)
if [ $# -eq 0 ]; then
	threads=$(nproc)
	echo "running benchmark..."
	for i in $(seq $begin $step $fin)
	do
		../../nstream.exe $i $threads >> output.txt
	done
	echo "benchmark complete."
	echo "drawing graph..."
	../../ograph.py 
	echo "done; results saved in /$$/"

# if an argument is used
elif [ $# -eq 1 ]; then
	
	# no graphing but default threads
	if [ $1 == "-n" ]; then
		threads=$(nproc)
		echo "running benchmark..."
		for i in $(seq $begin $step $fin)
		do
			../../nstream.exe $i $threads  >> output.txt
		done
		echo "benchmark complete. results saved in /$$/"
	
	# graphing with custom threads
	else
		echo "running benchmark..."
		for i in $(seq $begin $step $fin)
		do
			../../nstream.exe $i $1 >> output.txt
		done
		echo "benchmark complete."
		echo "drawing graph..."
		../../ograph.py
		echo "done; results saved in /$$/"
	fi

# -n and custom threads
elif [ $# -eq 2 ]; then
	if [ $2 == "-n" ]; then
		echo "Invalid arguments."
		exit 2
	fi
	echo "running benchmark..."
	for i in $(seq $begin $step $fin)
	do
		../../nstream.exe $i $2 >> output.txt
	done
	echo "benchmark complete. results saved in /$$/"	

# otherwise,
else
	echo "Usage: ./generate.sh (-n) (optional-threads)"
	exit 1
fi

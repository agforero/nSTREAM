export OMP_PLACES=cores
export OMP_PROC_BIND=close

make
mkdir -p runs
cd runs
mkdir $$
cd $$

# if no argument is provided (everything default)
if [ $# -eq 0 ]; then
	threads=$(nproc)
	echo "running benchmark..."
	for i in $(seq 100000 100000 12500000)
	do
		../../nstream.exe $i $threads >> output.txt
	done
	echo "benchmark complete."

	echo "drawing graph..."
	cp ../../ograph.py .
	./ograph.py 
	rm ograph.py

	echo "done; results saved in /$$/"

# if an argument is used
elif [ $# -eq 1 ]; then
	
	# no graphing but default threads
	if [ $1 == "-n" ]; then
		threads=$(nproc)
		echo "running benchmark..."
		for i in $(seq 100000 100000 12500000)
		do
			../../nstream.exe $i $threads  >> output.txt
		done
		echo "benchmark complete. results saved in /$$/"
	
	# graphing with custom threads
	else
		echo "running benchmark..."
		for i in $(seq 100000 100000 12500000)
		do
			../../nstream.exe $i $1 >> output.txt
		done
		echo "benchmark complete."

		echo "drawing graph..."
		cp ../../ograph.py .
		./ograph.py 
		rm ograph.py
		echo "done; results saved in /$$/"

	fi

# -n and custom threads
elif [ $# -eq 2 ]; then
	if [ $2 == "-n" ]; then
		echo "Invalid arguments."
		exit 2
	fi

	echo "running benchmark..."
	for i in $(seq 100000 100000 12500000) 
	do
		../../nstream.exe $i $2 >> output.txt
	done
	echo "benchmark complete. results saved in /$$/"	

# otherwise,
else
	echo "Usage: ./generate.sh <optional-threads>"
	exit 1
fi

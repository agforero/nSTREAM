CC = gcc
CFLAGS = -O2 -fopenmp

FC = gfortran
FFLAGS = -O2 -fopenmp

.PHONY: all

all: nstream.exe
	@: # silences "nothing to be done"...which sounds like a pretty ominous comment, no?

nstream.exe: nstream.F90 mysecond.o
	$(CC) $(CFLAGS) -c mysecond.c
	$(FC) $(FFLAGS) -c nstream.F90
	$(FC) $(FFLAGS) nstream.o mysecond.o -o nstream.exe

clean:
	rm -f nstream.exe *.o *.mod

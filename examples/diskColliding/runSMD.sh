#! /bin/bash

set -e
set -u

lmp=/home/raihan/Desktop/lammps-master/src/lmp_g++_openmpi
np=4

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
mpirun -np ${np} ${lmp} -in rubber_rings_3d.lmp 

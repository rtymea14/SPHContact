#! /bin/bash

set -e
set -u

lmp=/home/raihan/Desktop/SPH/examples/ballHitGround_LowVelocity/src3/lmp_mpi
np=4

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
mpirun -np ${np} ${lmp} -in packingCircleFinalLead2.lmp 

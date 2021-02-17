#! /bin/bash

set -e
set -u

lmp=/home/raihan/Desktop/SPH/examples/ballHitGround_LowVelocity/src3/lmp_mpi
np=1

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
mpirun -np ${np} ${lmp} -in packingCircle.lmp
#mpirun -np ${np} ${lmp} -in packingCircleworked.lmp
#mpirun -np ${np} ${lmp} -in packingCircle3.lmp
#mpirun -np ${np} ${lmp} -in packingCircle4.lmp

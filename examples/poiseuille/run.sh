#! /bin/bash

set -e
set -u

lmp=/home/raihan/Desktop/SPH/examples/ballHitGround_LowVelocity/src3/lmp_mpi
np=4

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
mpirun -np ${np} ${lmp} -in pois3.lmp

#NOTE: Before you run this case please change the file 
#atom_vec_meso_multiphase.cpp in the src/USER-SPH folder.
#You need to change mass_type = 0 to 1 then go back to 
#src/ and recompile (make yes-user-sph followed by make mpi).
#For other cases you need to revert mass_type back to 0 and
#recompile before you run them.

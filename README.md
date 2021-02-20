# SPHContact
Smoothed Particle Hydrodynamics (SPH) code with a model for contact detection and accurate force calculation.

Lead developer: Raihan Tayeb, Doctoral Candidate, University of Missouri-Columbia

## Overview
A software for mesoscopic simulation developed using open-sourced softwares, [OpenFOAM](https://openfoam.org), [OpenSMOKE++](https://www.opensmokepp.polimi.it), [LIGGGHTS](https://www.cfdem.com/liggghtsr-open-source-discrete-element-method-particle-simulation-code) and [CFDEM](https://www.cfdem.com/cfdemrcoupling-open-source-cfd-dem-framework)

It is employed to investigate the evaporation induced self-assembly of charged polymeric nanoparticles in microdroplet solution

The software includes
* A boundary particle detection model
* A contact force model based on the boundary particles
* A elasto-plastic model based on Johnson-Cook model
* Several different equation of state models exist for the pressure calculation
* Multi-component liquids (and gases) model following the work of [Hu and Adams](https://www.sciencedirect.com/science/article/pii/S0021999105004195) is available
* Fluid-particle interaction
* Parallel processing

If you use this solver in a project or scholarly work, please include the following citation, [Tayeb et. al. (2019)](#References). 

## Installation
The current version of the code uses the [LAMMPS 2015](https://lammps.sandia.gov/). The main part of the code resides in the USER-SPH package. The USER-SPH package is modified to incorporate the new contact force model. The atom style is also changed from meso to meso/multiphase for handling multiple phases. The default integrator is also changed from meso to meso/PEC/solidMech.

**To Install:**
Navigate to a working folder in a shell terminal, clone the git code repository, and build.
```
$ git clone https://github.com/rtyme14/SPHContact.git SPHContact
$ cd SPHContact/SPHContact/src
$ make clean-all
$ make yes-user-sph
$ make mpi
```

Several example cases are provided in the [`examples`](examples). The gif animation files for additional cases are provided in the [`allGifs`](examples/allGifs).

## Cyclic granular jamming ([`jamming`](examples/jamming))

This is the case used for studying cycling isotropic jamming of 2d granular material in the [paper](#References). There are 2400 granular disk each with 61 SPH particles arranged in an [optimum packing configuration](https://link.springer.com/article/10.1007/PL00009314). The initial particle configuration are read from the leadCircleOnly.dat file. A sample animated gif of the simulation is also included. 

<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/jamming/jamming.gif" width="416" height="366" />

To run the case do the following

```
$ change line 6 in the run.sh file. The path should be where you compiled the LAMMPS
$ change the number of processor if needed
$ chmod +x run.sh
$ ./run.sh
$ alternatively you can run the following command from terminal
$ mpirun -np ${no. of processors} lmp_mpi -in packingCircleFinalLead2.lmp 
```

## 2d elastic disk colliding ([`diskColliding`](examples/diskColliding))
Two elastic 2d disk of diameter 50 mm colliding at 10 m/s from opposite direction. The force and the velocity during impact are presented. The model demonstrates the capabilities of the developed SPHContact code by accurately identifying the boundary particles and calculate the contact force from a kinematic contact algorithm. As a comparison the same case is run using the default USER-SMD package using the same material parameters. The contact stiffness is one-tenth of the Elastic Modulus as recommended by the user guide. In comparison the SPHContact code does not require explicit mention of contact stiffness. The initial contact radius is half of the lattice constant. The disks in the USER-SMD case explodes in an unnatural way. The disks in the SPHContact case collides and move away in opposite direction in approximately equal initial velocities (see the [figure](examples/diskColliding/velocity.png) below). 

[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/diskColliding/force.png" width="360" height="252" />](examples/diskColliding/force.png)
[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/diskColliding/SMDplot.jpg" width="360" height="252" />](examples/diskColliding/SMDplot.jpg)
  
## Contribute
Open to collaboration with other investigators studying SPH and granular materials. Please [contact us](mailto:rthvc@umsystem.edu) if you are interested in expanding the solver or find bugs to correct. Limited support (on a case-by-case basis) or consulting servies can also be provided.

## Acknowledgements
This research was generously supported by the U.S. National Science Foundation.

## References
* [Tayeb, R., Mao, Y., & Zhang, Y. (2019). Smoothed particle hydrodynamics simulation of granular system under cyclic compressions. Powder Technology, 353, 84-97.](https://www.sciencedirect.com/science/article/pii/S0032591019303274#s0065)

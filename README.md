# SPHContact
Smoothed Particle Hydrodynamics (SPH) code with a model for contact detection and accurate force calculation.

Lead developer: Raihan Tayeb, Doctoral Candidate, University of Missouri-Columbia

## Overview
A software package for low and high velocity impact simulation developed using the open-sourced program [LAMMPS 2015](https://lammps.sandia.gov/).

It is employed to investigate the cyclic isotropic jamming of 2d granular material.

The software includes
* A boundary particle detection model
* A contact force model based on the boundary particles
* A elasto-plastic model based on Johnson-Cook model
* Several different equation of state models exist for the pressure calculation
* Multi-component liquids (and gases) model following the work of [Hu and Adams](https://www.sciencedirect.com/science/article/pii/S0021999105004195) is available
* Fluid-particle interaction
* Heat conduction and phase change
* Parallel processing

If you use this solver in a project or scholarly work, please include the following citation, [Tayeb et. al. (2019)](#References). 

## Installation
The current version of the code uses the [LAMMPS 2015](https://lammps.sandia.gov/). The USER-SPH package also requires the [GNU Scientific Library (GSL)](https://www.gnu.org/software/gsl/). After downloading and installing GSL from the link given please change the GSL_INC and GSL_PATH in the Makefile.mpi file in the MAKE folder as required. The main part of the code resides in the USER-SPH package. The USER-SPH package is modified to incorporate the new contact force model. The atom style is also changed from meso to meso/multiphase for handling multiple phases. The default integrator is also changed from meso to meso/PEC/solidMech.

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

## Plastic loading test ([`plasticityJKR`](examples/plasticityJKR))

A point load is applied to a sphere to demonstrate the elasto-plastic model based on Johnson-Cook. The gif illustrates the stress propagating through the sphere. The local stress and strain at a point in the sphere is saved in the se.lammpstrj file during runtime. By running the plotSE.sh bash script a data file se.dat is created and a plot of stress against strain is made and saved as sigmaVsStrain.jpg image file. The plot clearly demonstrates both the elastic and plastic loading condition of the sphere.

[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/plasticityJKR/disk.gif" width="360" height="252" />](examples/plasticityJKR/disk.gif)

[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/plasticityJKR/sigmaVsStrain2.jpg" width="360" height="252" />](examples/plasticityJKR/sigmaVsStrain2.jpg)

## Cyclic granular jamming ([`jamming`](examples/jamming))

This is the case used for studying cyclic isotropic jamming of 2d granular material in the [paper](#References). There are 2400 granular disk each with 61 SPH particles arranged in an [optimum packing configuration](https://link.springer.com/article/10.1007/PL00009314). The initial particle configuration are read from the leadCircleOnly.dat file. A sample animated gif of the simulation is also included. 

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

## Poiseuille flow ([`poiseuille`](examples/poiseuille))
Poiseuille flow through a horizontal pipe is simulated in this case. Periodic boundary conditions are used. The velocity profile is stored at runtime in the vy.profile file. To plot the data the data for the last timestep need to be used. The result for two flow profile at Re = 0.06 ([left](examples/poiseuille/Re0_06.png)) and Re = 6 ([right](examples/poiseuille/Re6.png)) are shown. Please follow the instructions of the [Readme](poiseuille/README.md) file before proceeding to run the case.

[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/poiseuille/Re0_06.png" width="360" height="252" />](examples/poiseuille/Re0_06.png)
[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/poiseuille/Re6.png" width="360" height="252" />](examples/poiseuille/Re6.png)

## Other cases
Four other case results are shown below: two rubber rings colliding, a rubber bullet penetrating a soft membrane, flow through a porous material and some elliptic particles colliding.

[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/allGifs/rubberRings.gif" width="360" height="252" />](examples/allGifs/rubberRings.gif)
[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/allGifs/penetration.gif" width="360" height="252" />](examples/allGifs/penetration.gif)

[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/allGifs/porous.gif" width="360" height="252" />](examples/allGifs/porous.gif)
[<img src="https://github.com/rtymea14/SPHContact/blob/main/examples/allGifs/sphpacking.gif" width="360" height="252" />](examples/allGifs/sphpacking.gif)

## Contribute
Open to collaboration with other investigators studying SPH and granular materials. Please [contact us](mailto:rthvc@umsystem.edu) if you are interested in expanding the solver or find bugs to correct. Limited support (on a case-by-case basis) or consulting servies can also be provided.

## Acknowledgements
This research was generously supported by the U.S. National Science Foundation.

## References
* [Tayeb, R., Mao, Y., & Zhang, Y. (2019). Smoothed particle hydrodynamics simulation of granular system under cyclic compressions. Powder Technology, 353, 84-97.](https://www.sciencedirect.com/science/article/pii/S0032591019303274#s0065)

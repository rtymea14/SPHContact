/* ----------------------------------------------------------------------
   LAMMPS - Large-scale Atomic/Molecular Massively Parallel Simulator
   http://lammps.sandia.gov, Sandia National Laboratories
   Steve Plimpton, sjplimp@sandia.gov

   Copyright (2003) Sandia Corporation.  Under the terms of Contract
   DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
   certain rights in this software.  This software is distributed under
   the GNU General Public License.

   See the README file in the top-level LAMMPS directory.
------------------------------------------------------------------------- */

#ifdef ATOM_CLASS

AtomStyle(meso/multiphase,AtomVecMesoMultiPhase)

#else

#ifndef LMP_ATOM_VEC_MESO_MULTIPHASE_H
#define LMP_ATOM_VEC_MESO_MULTIPHASE_H

#include "atom_vec.h"

namespace LAMMPS_NS {

class AtomVecMesoMultiPhase : public AtomVec {
 public:
  AtomVecMesoMultiPhase(class LAMMPS *);
  ~AtomVecMesoMultiPhase() {}
  void grow(int);
  void grow_reset();
  void copy(int, int, int);
  void force_clear(int, size_t);
  int pack_comm(int, int *, double *, int, int *);
  int pack_comm_vel(int, int *, double *, int, int *);
  void unpack_comm(int, int, double *);
  void unpack_comm_vel(int, int, double *);
  int pack_reverse(int, int, double *);
  void unpack_reverse(int, int *, double *);

  int pack_comm_hybrid(int, int *, double *, int, int *);
  int unpack_comm_hybrid(int, int, double *);

  int pack_border_hybrid(int, int *, double *, int, int *);
  int unpack_border_hybrid(int, int, double *);
  int pack_reverse_hybrid(int, int, double *);
  int unpack_reverse_hybrid(int, int *, double *);
  int pack_border(int, int *, double *, int, int *);
  int pack_border_vel(int, int *, double *, int, int *);
  void unpack_border(int, int, double *);
  void unpack_border_vel(int, int, double *);
  int pack_exchange(int, double *);
  int unpack_exchange(double *);
  int size_restart();
  int pack_restart(int, double *);
  int unpack_restart(double *);
  void create_atom(int, double *);
  void data_atom(double *, imageint, char **);
  int data_atom_hybrid(int, char **);
  void pack_data(double **);
  int pack_data_hybrid(int, double *);
  void write_data(FILE *, int, double **);
  int write_data_hybrid(FILE *, double *);
  int property_atom(char *);
  void pack_property_atom(int, double *, int, int);
  bigint memory_usage();

 private:
  tagint *tag;
  int *type,*mask;
  imageint *image;
  double **x,**v,**f;
  double *rmass, *rho, *drho, *dphi, *e, *de, *cv;
  double *phi, *radius, *csound;
  double **colorgradient;
  double **vest; // estimated velocity during force computation

  double ***epsilon_; // 
  double ***sigma_; //
  double ***dSigma_; //
  double ***artStress_; //
  double ***epsilonBar_; //
  double ***R_; // 
  double ***tau_; // devoritic stress
  double ***dTau_; // devoritic stress rate
  double *p_; // pressure
  double *viscosity_; // physical viscosity
  double **vXSPH_;

  double **xOld_;
  double **vOld_;
  double *rhoOld_;
  double *phiOld_;
  double *eOld_;
  double ***tauOld_;
};

}

#endif
#endif

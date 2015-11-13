#!/bin/bash

#PBS -j oe
#PBS -l nodes=1:ppn=1
#PBS -l walltime=72:00:00
#PBS -t 1-78

t1=${PBS_JOBID%.*}
t2=${t1#*-}

source .bashrc

cd /home/zhaol/scratch/NRs/10NRs


cat PDBs_PPARgamma | sed -n ''$t2'p'  | while read x; do cd $x; pwd;  cd dock_prot_mol2; cp /home/zhaol/scratch/NRs/10NRs/docking-script-tox21-PPAR_gamma.sh . ; ./docking-script-tox21-PPAR_gamma.sh ; done


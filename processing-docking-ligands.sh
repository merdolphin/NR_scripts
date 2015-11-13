#!/bin/bash

#PBS -j oe
#PBS -l nodes=1:ppn=1
#PBS -l walltime=72:00:00
#PBS -t 1-427

t1=${PBS_JOBID%.*}
t2=${t1#*-}

source .bashrc

cd /home/zhaol/scratch/NRs/10NRs

#cat PDBs | sed -n ''$t2'p'  | while read x; do cd $x; rm -rf dock; mkdir dock; cd dock; cp ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]_prot.mol2 rec.mol2; obabel -imol2 rec.mol2 -opdb -O tmp.pdb; rec.sh tmp.pdb; /home/zhaol/bin/dockingTools/filter-nonStandardRes.sh ; cp ../*_ligand_prot.mol2 xtal-lig.mol2; startdockblaster5 ; done


cat PDBs | sed -n ''$t2'p'  | while read x; do cd $x; pwd; cd dock_originalPDB; cp /home/zhaol/scratch/NRs/10NRs/docking-script-ligands.sh . ; ./docking-script-ligands.sh ; done


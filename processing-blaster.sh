#!/bin/bash

#PBS -j oe
#PBS -l nodes=1:ppn=1
#PBS -l walltime=36:00:00
#PBS -t 1-427

t1=${PBS_JOBID%.*}
t2=${t1#*-}

source .bashrc

cd /home/zhaol/scratch/NRs/10NRs

#cat PDBs | sed -n ''$t2'p'  | while read x; do cd $x; rm -rf dock; mkdir dock; cd dock; cp ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]_prot.mol2 rec.mol2; obabel -imol2 rec.mol2 -opdb -O tmp.pdb; rec.sh tmp.pdb; /home/zhaol/bin/dockingTools/filter-nonStandardRes.sh ; cp ../*_ligand_prot.mol2 xtal-lig.mol2; startdockblaster5 ; done


cat PDBs | sed -n ''$t2'p'  | while read x; do cd $x; pwd; rm -rf dock_originalPDB; mkdir dock_originalPDB; cd dock_originalPDB; more ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z].pdb > rec.0.pdb; cp /home/zhaol/scratch/NRs/commonFiles/recPLOP . ; plop recPLOP; for chain in B C D E F X; do [ -s rec.1.pdb ] || sed -i 's/chain A/chain '${chain}'/g' recPLOP; plop recPLOP; done; rec.sh rec.1.pdb; /home/zhaol/bin/dockingTools/filter-nonStandardRes.sh ; more ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z].pdb | grep ^HETATM | grep -v HOH | egrep " A[1-9]?" > ligtmp.pdb; for chain in B C D E F X; do [ -s ligtmp.pdb ] || more ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z].pdb | grep ^HETATM | egrep " ${chain}[1-9]?" > ligtmp.pdb; done;  xtal-lig.sh ligtmp.pdb; startdockblaster5 ; done


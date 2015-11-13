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


#cat PDBs | sed -n ''$t2'p'  | while read x; do cd $x; pwd; mkdir dock_prot_mol2_2; cd dock_prot_mol2_2; more ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z].pdb > rec.0.pdb; cp /home/zhaol/scratch/NRs/commonFiles/recPLOP . ; plop recPLOP; for chain in B C D E F X; do [ -s rec.1.pdb ] || sed -i 's/chain A/chain '${chain}'/g' recPLOP; plop recPLOP; done; rec.sh rec.1.pdb; /home/zhaol/bin/dockingTools/filter-nonStandardRes.sh ; more ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z].pdb | grep ^HETATM | grep -v HOH | grep " A " > ligtmp.pdb; for chain in B C D E F X; do [ -s ligtmp.pdb ] || more ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z].pdb | grep ^HETATM | grep " ${chain} " > ligtmp.pdb; done;  xtal-lig.sh ligtmp.pdb; startdockblaster5 ; done

cat PDBs | sed -n ''$t2'p'  | while read x; do cd $x; pwd; mkdir dock_prot_mol2_2; cd dock_prot_mol2_2; obabel -imol2 ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]_prot.mol2 -opdb -O rec.0.pdb; rec.sh rec.0.pdb;  obabel -imol2 ../[0-9A-Z][0-9A-Z][0-9A-Z][0-9A-Z]_ligand_prot.mol2 -opdb -O xtal-lig.0.pdb; more xtal-lig.0.pdb | grep ^ATOM | grep -v "           H" | sed 's/ A /   /g' | cut -c1-54 > xtal-lig.pdb ; startdockblaster5 ; done


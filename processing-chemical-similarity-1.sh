#!/bin/bash


more tmpb | grep "_antagonist" | while read x; do a=`echo $x | awk '{print $1}'` ; b=`echo $x | awk '{print $2}'`; c=`echo $a | awk -F"/" '{print $1}'` ; d=`echo $a | awk -F"/" '{print $2}'`;

cd $a

python ~/bin/dockingTools/tanimoto_cal_axon.py -two $b\_ligand_prot.smi ../../ligands/${d}s.smi output_antagonist

python ~/bin/dockingTools/tanimoto_cal_axon.py -two $b\_ligand_prot.smi ../../decoys/$d\_decoys.smi output_decoys

python ~/bin/dockingTools/tanimoto_cal_axon.py -two $b\_ligand_prot.smi ../../../${c}_agonist/ligands/$c\_agonists.smi output_agonist

pwd

cd /home/zhaol/scratch/NRs/10NRs

done 

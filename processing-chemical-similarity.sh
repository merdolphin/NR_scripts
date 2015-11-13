#!/bin/bash


more tmpb | grep "_agonist" | while read x; do a=`echo $x | awk '{print $1}'` ; b=`echo $x | awk '{print $2}'`; c=`echo $a | awk -F"/" '{print $1}'` ; d=`echo $a | awk -F"/" '{print $2}'`;

cd $a

mkdir tmp0
cd tmp0
python ~/bin/dockingTools/tanimoto_cal_axon.py -two ../$b\_ligand_prot.smi ../../../ligands/${d}s.smi output_agonist 

cd ../
mkdir tmp1
cd tmp1
python ~/bin/dockingTools/tanimoto_cal_axon.py -two ../$b\_ligand_prot.smi ../../../decoys/$d\_decoys.smi output_decoys  

cd ../
mkdir tmp2
cd tmp2
python ~/bin/dockingTools/tanimoto_cal_axon.py -two ../$b\_ligand_prot.smi ../../../../${c}_antagonist/ligands/$c\_antagonists.smi output_antagonist 

pwd

cd /home/zhaol/scratch/NRs/10NRs

done 

#!/bin/bash

for y in ER_alpha/ER_alpha_agonist/targets/1X7R ER_alpha/ER_alpha_antagonist/targets/1XP1 ER_beta/ER_beta_agonist/targets/3OLL ER_beta/ER_beta_antagonist/targets/1L2J GR/GR_agonist/targets/3K22 GR/GR_antagonist/targets/1NHZ MR/MR_agonist/targets/2A3I MR/MR_antagonist/targets/3VHV PPAR_alpha/PPAR_alpha_agonist/targets/2P54 PPAR_alpha/PPAR_alpha_antagonist/targets/1KKQ PPAR_gamma/PPAR_gamma_agonist/targets/3BC5 PPAR_gamma/PPAR_gamma_antagonist/targets/3E00 PR/PR_agonist/targets/1SQN PR/PR_antagonist/targets/2OVH RAR_alpha/RAR_alpha_agonist/targets/3KMR RAR_alpha/RAR_alpha_antagonist/targets/1DKF ROR_gamma/ROR_gamma_agonist/targets/3L0L ROR_gamma/ROR_gamma_antagonist/targets/3B0W RXR_alpha/RXR_alpha_agonist/targets/1MV9 RXR_alpha/RXR_alpha_antagonist/targets/3NSQ 

	do
	 
	cd $y/dock_originalPDB/run.NRs/ligands; 
	pwd
	nr=`pwd | awk -F"/" '{print $7}'`
	#gzip -d test.eel1.gz ; 
	#eel2pdb.csh test.eel1 ; 
	#grep energy test.eel1.pdb | awk '{print $2,$5}'  > energy; 
	grep ${nr} ~/scratch/NRs/dict/dict > ${nr}_dict
	more energy | while read x; do a=`echo $x | awk '{print $1}'`; echo -n "$x "; grep $a ${nr}_dict ; done > energy-2; 
	cd /home/zhaol/scratch/NRs/10NRs/; 
	done


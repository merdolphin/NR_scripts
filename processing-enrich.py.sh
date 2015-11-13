#!/bin/bash

	# find . -iname decoys-2 > decoys2
	# sed -i 's/decoys-2//g' decoys2 
	#more decoys2_orig | while read x; do cp dirlist $x; cd $x ; rm combin*; `combine.py --done` ; cd /home/zhaol/scratch/NRs/10NRs; done
	
	more decoys2_orig | while read x; do cd $x ; pwd; pwd | awk -F"/" '{print $8}' | while read y; do cp /home/zhaol/scratch/NRs/dict/dict . ;  grep $y  dict > dict_1; done ; pwd; awk '{print $2}' ../../../../decoys/*smi > dict.decoy ; awk '{print $2}' dict_1 > dict.ligand; enrich.py -l dict.ligand -d dict.decoy -r ; cd /home/zhaol/scratch/NRs/10NRs; done

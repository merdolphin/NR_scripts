#!/bin/bash

	# find . -iname decoys-2 > decoys2
	# sed -i 's/decoys-2//g' decoys2 
	more decoys2_orig | while read x; do cp dirlist $x; cd $x ; rm combin*; `combine.py --done` ; cd /home/zhaol/scratch/NRs/10NRs; done

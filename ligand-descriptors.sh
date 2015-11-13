#!/bin/bash

for nr in ER_alpha ER_beta GR MR PPAR_alpha PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha

do
    
   for prop in agonist antagonist
	
    do
	cd /home/zhaol/scratch/NRs/10NRs/$nr/$nr\_$prop/ligands
	generatemd c ${nr}\_${prop}s.smi -k HDon -o HDon.sdf -S 
	generatemd c ${nr}\_${prop}s.smi -k HAcc -o HAcc.sdf -S  
	generatemd c ${nr}\_${prop}s.smi -k LogP -o LogP.sdf -S  
	generatemd c ${nr}\_${prop}s.smi -k LogD -o LogD.sdf -S  
	generatemd c ${nr}\_${prop}s.smi -k Mass -o Mass.sdf -S  
	generatemd c ${nr}\_${prop}s.smi -k TPSA -o TPSA.sdf -S  
	generatemd c ${nr}\_${prop}s.smi -k Heavy -o Heavy.sdf -S 	

	more HDon.sdf  | grep -A 1 "HDon" | grep -v HDon | grep -v "\--" > HDon
	more HAcc.sdf  | grep -A 1 HAcc | grep -v HAcc | grep -v "\-" > HAcc
	more LogP.sdf  | grep -A 1 "LogP" | grep -v LogP | grep -v "\--" > LogP
	more Mass.sdf  | grep -A 1 "Mass" | grep -v Mass | grep -v "\--" > Mass
	more TPSA.sdf  | grep -A 1 "TPSA" | grep -v TPSA | grep -v "\--" > TPSA
	for L in LogD Heavy
		do 
		more $L.sdf | grep -A 1 $L | grep -v $L | grep -v "\--" > $L
		done	


	rm des_result
	for des in Mass Heavy HDon HAcc LogP LogD TPSA
		do
		#echo -n "${des} " >> des_result
		more ${des} | awk 'BEGIN{sum=0;}{sum+=$1}END{printf("%.2f\n",sum/NR)}' >> des_result		
		done
     done
done

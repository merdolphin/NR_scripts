#!/bin/bash


for nr in ER_alpha ER_beta GR MR PPAR_alpha PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha # PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha

do
    
   for prop in agonist antagonist
	
    do
        cd $nr/$nr\_$prop/targets

        for prot in *
            do
                cd $prot/dock_originalPDB
		pwd
		prepwizard -NOJOBID -LOCAL -WAIT -captermini -noepik -noprotassign -noimpref rec.pdb rec.mae > captermin.log
		rm rec.mae
                cd ../../
            done
    done

	cd /home/zhaol/scratch/NRs/10NRs
done

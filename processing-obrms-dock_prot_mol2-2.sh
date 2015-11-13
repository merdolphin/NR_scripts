#!/bin/bash


for nr in ER_alpha ER_beta GR MR PPAR_alpha PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha # PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha

do
    
   for prop in agonist antagonist
	
    do
        cd $nr/$nr\_$prop/targets

        for prot in *
            do
                cd /home/zhaol/scratch/NRs/10NRs/$nr/$nr\_$prop/targets/$prot/
		
		cd dock_prot_mol2
		
		cd run.NRs/cognative
		pwd
		
		#gzip -d test.eel1.gz 
		#eel2pdb.csh test.eel1 
		#rm -rf ligand_*.pdb obrms*
		#java7 -jar ~/jarbin/splitEELpdb.jar test.eel1.pdb
		#for dockLig in ligand_*.pdb 
		#	do 
		#	/cluster/fanlab/software/openbabel/bin/obrms ${dockLig} ../../xtal-lig.mol2 > obrms-${dockLig%%.pdb}
		#	done

		for g in obrms-*; do echo -n "$g "; cat $g; done   | sort -n -k4 | awk '{print $0}' > obrmsResult

            done
    done

	cd /home/zhaol/scratch/NRs/10NRs
done

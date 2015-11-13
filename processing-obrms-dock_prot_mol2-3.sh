#!/bin/bash


	more 169_obrms_result-2-2 | while read x; do 
		
		cd $x
		pwd
		
		gzip -d test.eel1.gz 
		eel2pdb.csh test.eel1 
		rm -rf ligand_*.pdb obrms*
		java7 -jar ~/jarbin/splitEELpdb.jar test.eel1.pdb
		for dockLig in ligand_*.pdb 
			do 
			/cluster/fanlab/software/openbabel/bin/obrms ${dockLig} ../../xtal-lig.mol2 > obrms-${dockLig%%.pdb}
			done

		for g in obrms-*; do echo -n "$g "; cat $g; done   | sort -n -k4 | awk '{print $0}' > obrmsResult

            done
    

#!/bin/bash


for nr in ER_alpha ER_beta GR MR PPAR_alpha PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha

#for nr in nuclearReceptor

#for nr in PPAR_gamma PR RAR_alpha ROR_gamma RXR_alpha

do
    
   for prop in agonist antagonist
	
    do
        cd /home/zhaol/scratch/NRs/10NRs/$nr/$nr\_$prop/targets

        for prot in *
            do
                cd $prot
                for nativelig in *_ligand_prot.mol2
                     do
                        obabel -imol2 ${nativelig} -opdb -O ${nativelig%%.*}.pdb -d
			molconvert smiles ${nativelig%%.*}.pdb -o v1-${nativelig%%.*}.smi -Y
                    
                    done
                cd ..
            done
    done

	cd /home/zhaol/scratch/NRs/10NRs
done

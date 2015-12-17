#!/bin/bash

rm -rf *_energy-5-500

for nr in ER_alpha_agonist ER_alpha_antagonist ER_beta_agonist ER_beta_antagonist GR_agonist GR_antagonist MR_agonist MR_antagonist PPAR_alpha_agonist PPAR_alpha_antagonist PPAR_gamma_agonist PPAR_gamma_antagonist PR_agonist PR_antagonist RAR_alpha_agonist RAR_alpha_antagonist ROR_gamma_agonist ROR_gamma_antagonist RXR_alpha_agonist RXR_alpha_antagonist 
    do
        b=`echo ${nr} | sed 's/_agonist//g;s/_antagonist//g'`
        
        grep ${nr} $b*energy-4  | awk '{print $2,$1}' | sed 's/_energy.*//g' > ${nr}_energy-5-500

    done
        

a=1;for i in ER_alpha_agonist_energy-5-500 ER_alpha_antagonist_energy-5-500 ER_beta_agonist_energy-5-500 ER_beta_antagonist_energy-5-500 GR_agonist_energy-5-500 GR_antagonist_energy-5-500 MR_agonist_energy-5-500 MR_antagonist_energy-5-500 PPAR_alpha_agonist_energy-5-500 PPAR_alpha_antagonist_energy-5-500 PPAR_gamma_agonist_energy-5-500 PPAR_gamma_antagonist_energy-5-500 PR_agonist_energy-5-500 PR_antagonist_energy-5-500 RAR_alpha_agonist_energy-5-500 RAR_alpha_antagonist_energy-5-500 ROR_gamma_agonist_energy-5-500 ROR_gamma_antagonist_energy-5-500 RXR_alpha_agonist_energy-5-500 RXR_alpha_antagonist_energy-5-500; do echo "d<-read.table(\"$i\");
ligands <- data.frame(scores = d\$V1)
ligands\$structure <- d\$V2
g$a<-ggplot(ligands, aes(scores, fill=structure)) + 
geom_density(alpha=.4, size=0.8, colour=\"darkgreen\") + 
ggtitle(\"`echo $i | sed 's/_energy-5-500//g'`\") " + xlim\(-65,20\) + scale\_fill\_manual\( values = c\(\"red\",\"blue\"\)\) ; echo g$a; a=$(($a+1)); echo ; done    >>  Agonist-1.R 

#!/bin/bash

rm -rf *_energy-5-X

for nr in ER_alpha_agonist ER_alpha_antagonist ER_beta_agonist ER_beta_antagonist GR_agonist GR_antagonist MR_agonist MR_antagonist PPAR_alpha_agonist PPAR_alpha_antagonist PPAR_gamma_agonist PPAR_gamma_antagonist PR_agonist PR_antagonist RAR_alpha_agonist RAR_alpha_antagonist ROR_gamma_agonist ROR_gamma_antagonist RXR_alpha_agonist RXR_alpha_antagonist 
    do
        b=`echo ${nr} | sed 's/_agonist//g;s/_antagonist//g'`
        echo $b
        more ${nr}_energy-4 | awk '{print $2,$3}'  | sed 's/'$b'/00000/g;;s/antagonist/11111/;s/agonist/22222/g;s/[A-Za-z]/X/g;s/00000/'$b'/g;s/11111/antagonist/g;s/22222/agonist/g;s/XX/X/g;s/XX/X/g;s/XX/X/g;s/X_X/X/g;s/ X_/ NR_/g' > ${nr}_energy-5-X
        
    done
   
a=1;for i in ER_alpha_agonist_energy-5-X ER_alpha_antagonist_energy-5-X ER_beta_agonist_energy-5-X ER_beta_antagonist_energy-5-X GR_agonist_energy-5-X GR_antagonist_energy-5-X MR_agonist_energy-5-X MR_antagonist_energy-5-X PPAR_alpha_agonist_energy-5-X PPAR_alpha_antagonist_energy-5-X PPAR_gamma_agonist_energy-5-X PPAR_gamma_antagonist_energy-5-X PR_agonist_energy-5-X PR_antagonist_energy-5-X RAR_alpha_agonist_energy-5-X RAR_alpha_antagonist_energy-5-X ROR_gamma_agonist_energy-5-X ROR_gamma_antagonist_energy-5-X RXR_alpha_agonist_energy-5-X RXR_alpha_antagonist_energy-5-X; do echo "d<-read.table(\"$i\");
ligands <- data.frame(scores = d\$V1)
ligands\$propertity <- d\$V2
g$a<-ggplot(ligands, aes(scores, fill=propertity)) + 
geom_density(alpha=1, size=1, colour=\"black\", position=\"stack\") + 
ggtitle(\"`echo $i | sed 's/_energy-5-X//g'`\") " + xlim\(-50,0\) + scale\_fill\_manual\( values = c\(\"red\",\"blue3\",\"magenta4\",\"green4\"\)\) ; echo g$a; a=$(($a+1)); echo ; done    >>  Agonist-X.R 

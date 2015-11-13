#!/bin/bash

more ../analysis_result/agonistVSantagonist/00-structure  | awk '{print $1,$1"/targets/"$2}' | sed 's#_agonist #/#g;s#_antagonist #/#g' | while read x; do echo -n "$x " ; head -n 1 $x/dock_prot_mol2/run.NRs/cognative/obrmsResult | while read y; do if [[ $y =~ "SERIE"  ]]; then echo -n "$y" | awk '{printf(" %.3f ", $4)}'; grep -v "SERIE" $x/dock_prot_mol2/run.NRs/cognative/obrmsResult | awk '{printf("%.3f",$4)}'; else echo -n "$y" | awk '{printf("%.3f",$4)}'; fi; done; echo;  done   | awk  -F"/" '{print $2,$4}' | awk '{if(!a[$1]++){print $0}else{print $2,$3,$4,$5}}'

#!/bin/bash

more ../analysis_result/agonistVSantagonist/00-structure  | awk '{print $1,$1"/targets/"$2}' | sed 's#_agonist #/#g;s#_antagonist #/#g' | while read x; do ls $x/dock_prot_mol2/run.NRs/cognative/obrmsResult ; cat $x/dock_prot_mol2/run.NRs/cognative/obrmsResult; done

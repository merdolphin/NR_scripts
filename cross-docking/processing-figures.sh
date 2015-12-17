#!/bin/bash

for f in ER_alpha_agonist ER_alpha_antagonist ER_beta_agonist ER_beta_antagonist GR_agonist GR_antagonist MR_agonist MR_antagonist PPAR_alpha_agonist PPAR_alpha_antagonist PPAR_gamma_agonist PPAR_gamma_antagonist PR_agonist PR_antagonist RAR_alpha_agonist RAR_alpha_antagonist ROR_gamma_agonist ROR_gamma_antagonist RXR_alpha_agonist RXR_alpha_antagonist; do cp $f.png ~/Documents/writing/draft_bii/NRs/images/NRs/cross-docking-20-percentage-$f.png; done 

for f in ER_alpha_agonist ER_alpha_antagonist ER_beta_agonist ER_beta_antagonist GR_agonist GR_antagonist MR_agonist MR_antagonist PPAR_alpha_agonist PPAR_alpha_antagonist PPAR_gamma_agonist PPAR_gamma_antagonist PR_agonist PR_antagonist RAR_alpha_agonist RAR_alpha_antagonist ROR_gamma_agonist ROR_gamma_antagonist RXR_alpha_agonist RXR_alpha_antagonist; do echo "\subfigure{\includegraphics[width=0.24\textwidth]{NRs/cross-docking-20-percentage-$f.png}\label{fig:$f}}"; done

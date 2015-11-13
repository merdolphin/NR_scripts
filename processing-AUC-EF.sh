#./processing-combine.py.sh

#./processing-enrich.py.sh

more 425PDBs-2-419 | while read x; do  a=`echo $x | awk -F"/" '{print $3}'`; b=`echo $x | awk -F"/" '{print $5}'`; echo "cd ligands-enrich; mkdir $a; cd $a; mkdir $b; cd /home/zhaol/scratch/NRs/10NRs; cp  $x/dock_originalPDB/run.NRs/enrich.txt ligands-enrich/$a/$b"; done  > tmp.sh

#more 425PDBs-2-419 | while read x; do  a=`echo $x | awk -F"/" '{print $2"_"$4}'`; echo "cp  $x/dock_originalPDB/run.NRs/enrich_own.txt ligand_enrich/$a"; done  >> tmp.sh 

./tmp.sh

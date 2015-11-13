./processing-combine.py.sh

./processing-enrich.py.sh

more 20PDBs-3 | while read x; do  a=`echo $x | awk -F"/" '{print $2"_"$4}'`; echo "cp  $x/dock_originalPDB/run.NRs/enrich.txt ligand_enrich/$a"; done  > tmp.sh

more 20PDBs-3 | while read x; do  a=`echo $x | awk -F"/" '{print $2"_"$4}'`; echo "cp  $x/dock_originalPDB/run.NRs/enrich_own.txt ligand_enrich/$a"; done  >> tmp.sh 

./tmp.sh

#!/bin/bash
    
    if [ ! -d run.NRs ]; then
    	mkdir run.NRs;
    fi
    cd run.NRs
    
    subd=ligands1to1
    rm -rf ${subd}
    mkdir ${subd}
    cd ${subd}

    a=`pwd | awk -F"/" '{print $8}'`
	
    cp /home/zhaol/scratch/bii/commonFiles/dock3Files/INDOCK .
    cat /home/zhaol/scratch/bii/commonFiles/dock3Files/split_database_index_NRs_ligands | grep $a  > split_database_index 
    /home/zhaol/src/dock3.6/dockenv/bin/Linux/dock.csh

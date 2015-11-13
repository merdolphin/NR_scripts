#!/bin/bash
    
    if [ ! -d run.NRs ]; then
    	mkdir run.NRs;
    fi
    cd run.NRs
    
    subd=ligands
    rm -rf ${subd}
    mkdir ${subd}
    cd ${subd}

	
    cp /home/zhaol/scratch/bii/commonFiles/dock3Files/INDOCK .
    cat /home/zhaol/scratch/bii/commonFiles/dock3Files/split_database_index_NRs_ligands  > split_database_index 
    /home/zhaol/src/dock3.6/dockenv/bin/Linux/dock.csh

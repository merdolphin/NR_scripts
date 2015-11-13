#!/bin/bash
    
    if [ ! -d run.tox21 ]; then
    	mkdir run.tox21;
    fi
    cd run.tox21
    
    subd=active
    rm -rf ${subd}
    mkdir ${subd}
    cd ${subd}

	
    cp /home/zhaol/scratch/bii/commonFiles/dock3Files/INDOCK .
    cat /home/zhaol/scratch/bii/commonFiles/dock3Files/split_database_index_tox21_ER_active  > split_database_index 
    /home/zhaol/src/dock3.6/dockenv/bin/Linux/dock.csh

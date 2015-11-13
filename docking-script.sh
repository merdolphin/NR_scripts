#!/bin/bash
    
    if[ ! -e run.NRs ];then
    	mkdir run.NRs;
    fi
    cd run.NRs
    
    subd=crystalLigands
    rm -rf ${subd}
    mkdir ${subd}
    cd ${subd}

    cp /home/zhaol/scratch/bii/commonFiles/dock3Files/INDOCK .
    cat /home/zhaol/scratch/bii/commonFiles/dock3Files/split_database_index_NRs_crystalLigands > split_database_index 
    /home/zhaol/src/dock3.6/dockenv/bin/Linux/dock.csh

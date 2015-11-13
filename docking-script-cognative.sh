#!/bin/bash
    
    if [ ! -d run.NRs ]; then
    	mkdir run.NRs;
    fi
    cd run.NRs
    
    subd=cognative
    rm -rf ${subd}
    mkdir ${subd}
    cd ${subd}

    y=`pwd | sed 's#/home/zhaol/scratch/NRs/10NRs/##g;s#/targets/#_#g;s#/dock_originalPDB/run.NRs/cognative##g'`; z=`echo ${y##*/}.db.gz`;
	
    cp /home/zhaol/scratch/bii/commonFiles/dock3Files/INDOCK .
    cat /home/zhaol/scratch/bii/commonFiles/dock3Files/split_database_index_NRs_cognative | sed 's/aaa/'$z'/g' > split_database_index 
    /home/zhaol/src/dock3.6/dockenv/bin/Linux/dock.csh

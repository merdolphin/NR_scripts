##!/bin/bash

a=1

while [ $a -lt 20 ]
do

mv 00-processing-docking*.o79* 00-pbs-job-log/

sleep 5m

a=$(($a+1))

done

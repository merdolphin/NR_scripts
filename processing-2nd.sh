#!/bin/bash

startdockblaster5


nohup ./docking-script-cognative.sh &
nohup ./docking-script-crystalLigands.sh &
nohup ./docking-script-decoys-2.sh &
nohup ./docking-script-decoys.sh &
nohup ./docking-script-ligands1to1.sh &
nohup ./docking-script-ligands.sh &



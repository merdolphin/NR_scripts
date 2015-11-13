#!/bin/bash

find . -iname dock_originalPDB  -exec du -sh '{}' \; > size

more size  | grep -v 6[0-9]M | awk '{print $2}' | sed 's#\./##g;s#/dock_originalPDB##g' | while read x; do grep $x processing-BWV.sh.o790787-* ; done > size-1

more size-1  | awk -F":" '{print $1}' > size-2

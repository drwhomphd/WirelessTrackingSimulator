#!/bin/bash

for time in 100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300
do

time2=$(($time+30))

python DataImporter.py chicago-$time.db ../UdelModelsData/Chicago-9Blk-9056Peds16490Cars-$time-$time2-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed 0 1

done

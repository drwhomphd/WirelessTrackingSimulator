#!/bin/bash

pop=9056

# Cell Phones
for percent in 10; do
        for rad in 15 30 45; do
                python TriangulationSimulatorTest3D.py ../../Wireless-Tracking/Results/conglom/3D/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-${percent}Perc-${rad}MRad/udel-analysis.out Chicago-Udel-9Blk-${pop}Peds-0Cars-${percent}Perc-${rad}MRad.cells.triangulation ../Databases/Udel-9Blk-${pop}Peds-0Cars-700to730.db 1 $rad
        done
done

mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730
mv *.triangulation ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730/

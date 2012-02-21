#!/bin/bash 
for pop in 9056; do
# Both
for percent in 5 10 25; do
	for rad in 15 30 45; do
		python TriangulationSimulatorTest3D.py ../../Wireless-Tracking/Results/conglom/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-${percent}Perc-${rad}MRad/udel-analysis.out Chicago-Udel-9Blk-${pop}Peds-0Cars-${percent}Perc-${rad}MRad.both.triangulation ../Databases/Udel-9Blk-${pop}Peds-0Cars-700to730.db 2 $rad
	done
done

mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730
mv *.triangulation ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730/

# Cell Phones
for percent in 5 10 25; do
	for rad in 15 30 45; do
		python TriangulationSimulatorTest3D.py ../../Wireless-Tracking/Results/congolm/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-${percent}Perc-${rad}MRad/udel-analysis.out Chicago-Udel-9Blk-${pop}Peds-0Cars-${percent}Perc-${rad}MRad.cells.triangulation ../Databases/Udel-9Blk-${pop}Peds-0Cars-700to730.db 1 $rad
	done
done

mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730
mv *.triangulation ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730/

# Routers
for percent in 5 10 25; do
	for rad in 15 30 45; do
		python TriangulationSimulatorTest3D.py ../../Wireless-Tracking/Results/conglom/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-${percent}Perc-${rad}MRad/udel-analysis.out Chicago-Udel-9Blk-${pop}Peds-0Cars-${percent}Perc-${rad}MRad.routers.triangulation ../Databases/Udel-9Blk-${pop}Peds-0Cars-700to730.db 0 $rad
	done
done

mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730
mv *.triangulation ../Results/Chicago-Udel-9Blk-${pop}Peds-700to730/
done

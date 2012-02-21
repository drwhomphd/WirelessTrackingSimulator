#!/bin/bash

for i in 1 2 3 4 
do

for radius in 15 30 45
do

for perc in 1 5 10 25 50 75 100 
do

for pop in 2000 6000
do

# Non 4000 pop runs

rm Experiment2-udel.db
python DataImporter.py Experiment2-udel.db ../UdelModelsData/9Blk-${pop}Peds325Cars-700-730-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed $perc 1
python DataAnalyzer-RTREE.py Experiment2-udel.db udel2-analysis.out $radius
python AnalysisDataSummarizer.py udel2-analysis.out udel2-statdata.out

# Move 1
mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-325Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad
mv *udel2*.out* ../Results/Chicago-Udel-9Blk-${pop}Peds-325Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad/

done
done
done
done

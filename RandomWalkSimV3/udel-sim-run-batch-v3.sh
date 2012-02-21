#!/bin/bash

for i in 2 3 4 
do

for radius in 15 
do

for perc in 1 2 3 4 5
do

for pop in 9056
do
# Non 4000 pop runs

rm Experiment1-udel.db
python DataImporter.py Experiment1-udel.db ../UdelModelsData/9Blk-${pop}Peds0Cars-700-730-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed $perc 1
python DataAnalyzer-RTREE.py Experiment1-udel.db udel1-analysis.out $radius
python AnalysisDataSummarizer.py udel1-analysis.out udel1-statdata.out

# Move 1
mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad
mv *udel1*.out* ../Results/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad/

done
done
done
done

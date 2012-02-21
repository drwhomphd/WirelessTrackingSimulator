#!/bin/bash

# RUN 1perc
rm Experiment1-udel.db
python DataImporter.py Experiment1-udel.db ../UdelModelsData/Chicago-9Blk-9056Peds0Cars-700-730-Trial1/default.mobility udelsim '' 5 1
python DataAnalyzer-KDTREE.py Experiment1-udel.db udel-analysis.out 15
python AnalysisDataSummarizer-SELFDETECT.py udel-analysis.out udel-statdata.out

# Move 1
#mkdir ../Results/Chicago-Udel-9Blk-9056Peds-16490Cars-700to730-Trial1-1Perc-15MRad
#mv *.out* ../Results/Chicago-Udel-9Blk-9056Peds-16490Cars-700to730-Trial1-1Perc-15MRad/

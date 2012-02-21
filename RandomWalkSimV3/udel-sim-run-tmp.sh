#!/bin/bash

# RUN 1perc
rm Experiment1-udel.db
python DataImporter.py Experiment1-udel.db ../UdelModelsData/9Blk-4000Peds0Cars-100-130-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed 1.0 1
python DataAnalyzer-RTREE.py Experiment1-udel.db udel-analysis.out 15
python AnalysisDataSummarizer.py udel-analysis.out udel-statdata.out

# Move 1
mkdir ../Results/Chicago-Udel-9Blk-4000Peds-0Cars-100to130-Trial1-1Perc-15MRad
mv *.out* ../Results/Chicago-Udel-9Blk-4000Peds-0Cars-100to130-Trial1-1Perc-15MRad/

# RUN 1perc
rm Experiment1-udel.db
python DataImporter.py Experiment1-udel.db ../UdelModelsData/9Blk-4000Peds0Cars-300-330-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed 1.0 1
python DataAnalyzer-RTREE.py Experiment1-udel.db udel-analysis.out 15
python AnalysisDataSummarizer.py udel-analysis.out udel-statdata.out

# Move 1
mkdir ../Results/Chicago-Udel-9Blk-4000Peds-0Cars-300to330-Trial1-1Perc-15MRad
mv *.out* ../Results/Chicago-Udel-9Blk-4000Peds-0Cars-300to330-Trial1-1Perc-15MRad/

# RUN 1perc
rm Experiment1-udel.db
python DataImporter.py Experiment1-udel.db ../UdelModelsData/9Blk-4000Peds0Cars-900-930-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed 1.0 1
python DataAnalyzer-RTREE.py Experiment1-udel.db udel-analysis.out 15
python AnalysisDataSummarizer.py udel-analysis.out udel-statdata.out

# Move 1
mkdir ../Results/Chicago-Udel-9Blk-4000Peds-0Cars-900to930-Trial1-1Perc-15MRad
mv *.out* ../Results/Chicago-Udel-9Blk-4000Peds-0Cars-900to930-Trial1-1Perc-15MRad/

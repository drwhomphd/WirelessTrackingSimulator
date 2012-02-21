#!/bin/bash

# RUN 1
python RandomWalkSimV2.py ../inputData/Chicago-Parsed ../ArchivePolygons/Chicago-9blkSquare-Udel-Polygon Experiment1.out 1.15 2750
rm Experiment1.db
python DataImporter.py Experiment1.db Experiment1.out randwalksim 10.0
python DataAnalyzer-RTREE.py Experiment1.db Experiment1-analysis.out
python AnalysisDataSummarizer.py Experiment1-analysis.out Experiment1-statdata.out

# Move 1

mkdir ../Results/Chicago-9blkSquare-2750Person-10Perc
mv *.out* ../Results/Chicago-9blkSquare-2750Person-10Perc/ 

# RUN 2
python RandomWalkSimV2.py ../inputData/Chicago-Parsed ../ArchivePolygons/Chicago-9blkSquare-Udel-Polygon Experiment1.out 1.15 2750
rm Experiment1.db
python DataImporter.py Experiment1.db Experiment1.out randwalksim 5.0
python DataAnalyzer-RTREE.py Experiment1.db Experiment1-analysis.out
python AnalysisDataSummarizer.py Experiment1-analysis.out Experiment1-statdata.out

# Move 2
mkdir ../Results/Chicago-9blkSquare-2750Person-5Perc
mv *.out* ../Results/Chicago-9blkSquare-2750Person-5Perc/ 

# RUN 3
python RandomWalkSimV2.py ../inputData/Chicago-Parsed ../ArchivePolygons/Chicago-9blkSquare-Udel-Polygon Experiment1.out 1.15 2750
rm Experiment1.db
python DataImporter.py Experiment1.db Experiment1.out randwalksim 1.0
python DataAnalyzer-RTREE.py Experiment1.db Experiment1-analysis.out
python AnalysisDataSummarizer.py Experiment1-analysis.out Experiment1-statdata.out

# Move 3
mkdir ../Results/Chicago-9blkSquare-2750Person-1Perc
mv *.out* ../Results/Chicago-9blkSquare-2750Person-1Perc/ 

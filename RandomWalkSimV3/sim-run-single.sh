# RUN 1
rm Experiment1.db
python RandomWalkSimV2.py ../inputData/Chicago-Parsed ../ArchivePolygons/Chicago-9blkSquare-Udel-Polygon Experiment1.out 1.00 2
python DataImporter.py Experiment1.db Experiment1.out randwalksim 100.0
python DataAnalyzer-RTREE.py Experiment1.db Experiment1-analysis.out
python AnalysisDataSummarizer.py Experiment1-analysis.out Experiment1-statdata.out

# RUN 1
rm Experiment2.db
python RandomWalkSimV2.py ../inputData/Chicago-Parsed ../ArchivePolygons/Chicago-9blkSquare-Udel-Polygon Experiment2.out 1.00 2
python DataImporter.py Experiment2.db Experiment2.out randwalksim 50.0
python DataAnalyzer-RTREE.py Experiment2.db Experiment2-analysis.out
python AnalysisDataSummarizer.py Experiment2-analysis.out Experiment2-statdata.out

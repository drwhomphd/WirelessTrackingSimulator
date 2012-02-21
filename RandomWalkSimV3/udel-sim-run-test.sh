#!/bin/bash

# RUN 10perc
rm Experiment2-udel.db
python DataImporter.py Experiment2-udel.db ../2119-test.mob udelsim ../inputData/Chicago-Parsed 10.0 1
python DataAnalyzer-RTREE.py Experiment2-udel.db udel2-analysis-45m.out
python DataAnalyzer-RTREE.py Experiment2-udel.db udel2-analysis-30m.out 30
python AnalysisDataSummarizer.py udel2-analysis-45m.out udel2-statdata-45m.out
python AnalysisDataSummarizer.py udel2-analysis-30m.out udel2-statdata-30m.out

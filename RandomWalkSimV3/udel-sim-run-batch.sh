#!/bin/bash

#city='Chicago-'
city='Dallas-'

for i in 1 #2 3 4 5 #6 7 8 9 10
do
echo -e "*** Currently on Trial  $i ***\n"
for radius in 45 #15 #15 30 45
do

#for perc in 5 10 1 2 3 4 25 50 75 100 
for perc in 1
do

#for pop in 2000 4000 6000
for pop in 2988
do

#if [[ "$pop" == "2988" ]];
#if [[ "$pop" == "9056" ]];
#then
    #for time in 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300
    for time in 100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300
	#for time in 100 300 500 900 1100 1300 1500 1700 1900 2100 2300
    #for time in 700
    do
	cars=0
	# 4000 pop runs
        time2=$(($time+30))
	#time2=$(($time+100))

rm Experiment1-udel.db
python DataImporter.py Experiment1-udel.db ../../UdelModelsData/${city}9Blk-${pop}Peds${cars}Cars-${time}-${time2}-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed $perc 1
python DataAnalyzer-KDTREE.py Experiment1-udel.db udel-analysis.out $radius
python AnalysisDataSummarizer.py udel-analysis.out udel-statdata.out
python AnalysisDataSummarizer-SELFDETECT.py udel-analysis.out udel-statdata-SELFDETECT.out

# Move 1
#mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad
#mv *.out* ../Results/Chicago-Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/
mkdir ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad
mv *.out* ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/
    done
#else
 # Non 4000 pop runs
#echo "
#rm Experiment1-udel.db
#python DataImporter.py Experiment1-udel.db ../UdelModelsData/${city}9Blk-${pop}Peds${cars}Cars-700-730-Trial1/default.mobility udelsim ../inputData/Chicago-Parsed $perc 1
#python DataAnalyzer-KDTREE.py Experiment1-udel.db udel-analysis.out $radius
#python AnalysisDataSummarizer.py udel-analysis.out udel-statdata.out

# Move 1
#mkdir ../Results/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad
#mv *.out* ../Results/Chicago-Udel-9Blk-${pop}Peds-0Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad/
#mkdir ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad
#mv *.out* ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-700to730-Trial${i}-${perc}Perc-${radius}MRad/
#"
#fi
done
done
done
done

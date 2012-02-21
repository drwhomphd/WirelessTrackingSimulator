#!/bin/bash


# Outpt headers to the file
#echo "average.detected.walk.length,average.undetected.walk.length,city,pop,time,perc,radius" > average_walk_length_stats.csv
#echo "number.walks.detected.>=1.nodes,percent.number.walks.>=1,number.walks.detected.>=2.nodes,percent.number.walks.>=2,number.walks.detected.>=3.nodes,percent.number.walks.>=3,number.walks.detected.>=4.nodes,percent.number.walks.>=4,total.walks,city,pop,time,perc,radius" > walk.node.detection.outer.counts.csv
#echo "number.walks.detected.>=1.nodes,percent.number.walks.>=1,number.walks.detected.>=2.nodes,percent.number.walks.>=2,number.walks.detected.>=3.nodes,percent.number.walks.>=3,number.walks.detected.>=4.nodes,percent.number.walks.>=4,total.walks,city,pop,time,perc,radius" > walk.node.detection.inner.counts.csv

city="Chicago-"
for pop in 9056
do

for time in 100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300
#for time in 700
do
	time2=$(($time + 30))

	if [[ $time -eq "700" ]];
	then
		perc=( 1 2 3 4 5 10 25 50 75 100 )
		rads=( 15 30 45 )
		#rads=( 15 )
	else
		perc=( 10 )
		rads=( 15 )
	fi

	for perc in "${perc[@]}"
	do
		for radius in "${rads[@]}"
		do
			fileDir="../Results/conglom/3D/${city}Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-${perc}Perc-${radius}MRad"
			python AnalysisDataSummarizer.py ${fileDir}"/udel-analysis.out" udel-statdata.out
			mv udel-statdata.out* ${fileDir}"/"
#city,pop,time,perc,radius
			#awk '{s += $6; x+= $7} END { print s/NR","x/NR",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-statdata.out-cell >> average_walk_length_stats.csv
			#awk -F, '{if ($12 >= 1) x += 1; if ($12 >= 2) s += 1; if ($12 >= 3) y += 1; if($12 >= 4) z += 1} END { print x","x/(NR-1)","s","s/(NR-1)","y","y/(NR-1)","z","z/(NR-1)","NR-1",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-analysis.out >> walk.node.detection.outer.counts.csv
			#awk -F, '{if ($11 >= 1) x += 1; if ($11 >= 2) s += 1; if ($11 >= 3) y += 1; if($11 >= 4) z += 1} END { print x","x/(NR-1)","s","s/(NR-1)","y","y/(NR-1)","z","z/(NR-1)","NR-1",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-analysis.out >> walk.node.detection.inner.counts.csv
		done
	done

done
done

city="Dallas-"
for pop in 2988 9056 4000
do

for time in 100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300
do

time2=$(($time + 30))
	
	if [[ $time -eq "700" ]];
	then
		perc=( 1 2 3 4 5 10 25 50 75 100 )
		rads=( 15 30 45 )
	else
		perc=( 5 10 )
		rads=( 15 )
	fi

	for perc in "${perc[@]}"
	do
		for radius in "${radius[@]}"
		do
			fileDir="../Results/conglom/${city}Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-${perc}Perc-${radius}MRad"
			python AnalysisDataSummarizer.py ${fileDir}"/udel-analysis.out" udel-statdata.out
			mv udel-statdata.out* ${fileDir}"/"
			#awk '{s += $6; x+= $7} END { print s/NR","x/NR",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-statdata.out-cell >> average_walk_length_stats.csv
			#awk -F, '{if ($12 >= 1) x += 1; if ($12 >= 2) s += 1; if ($12 >= 3) y += 1; if($12 >= 4) z += 1} END { print x","x/(NR-1)","s","s/(NR-1)","y","y/(NR-1)","z","z/(NR-1)","NR-1",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-analysis.out >> walk.node.detection.outer.counts.csv
			#awk -F, '{if ($11 >= 1) x += 1; if ($11 >= 2) s += 1; if ($11 >= 3) y += 1; if($11 >= 4) z += 1} END { print x","x/(NR-1)","s","s/(NR-1)","y","y/(NR-1)","z","z/(NR-1)","NR-1",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-analysis.out >> walk.node.detection.inner.counts.csv
		done
	done

done
done

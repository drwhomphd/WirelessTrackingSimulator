#!/bin/bash

# This script will claculate the average walk length for individuals
# detected greater then X percentage of the time



for det in "0.10" "0.20" "0.50" "0.90"
do

echo "average.detected.walk.length,average.undetected.walk.length,std.dev.detected,std.dev.undetected,city,pop,time,perc,radius" > average_walk_length_stats-PercentDetected${det}-Outer.csv
echo "average.detected.walk.length,average.undetected.walk.length,std.dev.detected,std.dev.undetected,city,pop,time,perc,radius" > average_walk_length_stats-PercentDetected${det}-Inner.csv
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
			#python AnalysisDataSummarizer.py ${fileDir}"/udel-analysis.out" udel-statdata.out
			#mv udel-statdata.out* ${fileDir}"/"
#city,pop,time,perc,radius
			# Perform initial means calculations
            #awk -v pDet="${det}" '{if($4 >= pDet){ s += $6; x += $7; num += 1;}} END { print s/num","x/num",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-statdata.out-cell >> average_walk_length_stats-PercentDetected${det}-Outer.csv
			#awk -v pDet="${det}" '{if($5 >= pDet){ s += $6; x += $7; num += 1;}} END { print s/num","x/num",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-statdata.out-cell >> average_walk_length_stats-PercentDetected${det}-Inner.csv
            # inFile, probDet, inner(0)outer(1), city, pop, time, perc, radius
            ./AvgDetectedWalkLengthForPercDetects.py ${fileDir}/udel-statdata.out-cell  $det 0 $city $pop $time $perc $radius >> average_walk_length_stats-PercentDetected${det}-Inner.csv
            ./AvgDetectedWalkLengthForPercDetects.py ${fileDir}/udel-statdata.out-cell $det 1 $city $pop $time $perc $radius >> average_walk_length_stats-PercentDetected${det}-Outer.csv
          
            
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
radius=( 15 )
perc=( 10 )

	for perc in "${perc[@]}"
	do
		for radius in "${radius[@]}"
		do
        
            if [[ $pop -eq "9056" ]]; 
            then
                fileDir="../Results/conglom/3D/BadCoords/${city}Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-${perc}Perc-${radius}MRad"
            else
                fileDir="../Results/conglom/${city}Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-${perc}Perc-${radius}MRad"
            fi
			#python AnalysisDataSummarizer.py ${fileDir}"/udel-analysis.out" udel-statdata.out
			#mv udel-statdata.out* ${fileDir}"/"
			#awk -v pDet="${det}" '{if($4 >= pDet){ s += $6; ssq += $6 * $6; x += $7; xsq += $7 * $7; num += 1;}} END { print s/num","x/num","sqrt(ssq/num - (s/num)**2)","sqrt(xsq/num - (x/num)**2)",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-statdata.out-cell >> average_walk_length_stats-PercentDetected${det}-Outer.csv
			#awk -v pDet="${det}" '{if($5 >= pDet){ s += $6; ssq += $6 * $6; x += $7; xsq += $7 * $7; num += 1;}} END { print s/num","x/num","sqrt(ssq/num - (s/num)**2)","sqrt(xsq/num - (x/num)**2)",""'"${city}"'"",""'"${pop}"'"",""'"${time}"'"",""'"${perc}"'"",""'"${radius}"'"}' ${fileDir}/udel-statdata.out-cell >> average_walk_length_stats-PercentDetected${det}-Inner.csv
            ./AvgDetectedWalkLengthForPercDetects.py ${fileDir}/udel-statdata.out-cell  $det 0 $city $pop $time $perc $radius >> average_walk_length_stats-PercentDetected${det}-Inner.csv
            ./AvgDetectedWalkLengthForPercDetects.py ${fileDir}/udel-statdata.out-cell $det 1 $city $pop $time $perc $radius >> average_walk_length_stats-PercentDetected${det}-Outer.csv
        done
	done

done
done
done

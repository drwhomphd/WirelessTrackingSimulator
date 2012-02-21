#!/bin/bash

#mkdir ../Results/conglom

cars=16490
city='Chicago-'

for i in 1 #2 #3 4 #5 6 7 8 9 10
do

for radius in 15 # 15 30 45
do

#if [[ "$radius" != "15" ]];
#then
#    percs=(1)
#else
    #percs=(1 2 3 4 5)
#    percs=(1)
#fi


for perc in 1 2 3 4 5 10 #5 25 #50 75 100 #$percs
do

#for pop in 2000 4000 6000 9056 9139
for pop in 9056
do

#if [[ "$pop" == "2988" ]];
if [[ "$pop" == "9056" ]];
then
    for time in 100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300
    #for time in 700
    do
	# 4000 pop runs
        time2=$(($time+30))

mkdir ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad

touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-analysis.out
touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-router
touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-cell
touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-both

cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-analysis.out >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-analysis.out
cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-statdata.out-router >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-router
cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-statdata.out-cell >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-cell
cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-statdata.out-both >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-both

    done
else
 # Non 4000 pop runs
time=700
time2=730

if [[ "$pop" == "9139" ]]
then
    cars=325
else
    cars=0
fi

mkdir ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad

touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-analysis.out
touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-router
touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-cell
touch ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-both

cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-analysis.out >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-analysis.out
cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-statdata.out-router >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-router
cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-statdata.out-cell >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-cell
cat ../Results/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-Trial${i}-${perc}Perc-${radius}MRad/udel-statdata.out-both >> ../Results/conglom/${city}Udel-9Blk-${pop}Peds-${cars}Cars-${time}to${time2}-${perc}Perc-${radius}MRad/udel-statdata.out-both

fi
done
done
done
done

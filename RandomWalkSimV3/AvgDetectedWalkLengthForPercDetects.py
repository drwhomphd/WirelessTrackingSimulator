#!/usr/bin/python

import sys;
import os;
import math;

# ${city}Udel-9Blk-${pop}Peds-0Cars-${time}to${time2}-${perc}Perc-${radius}MRad
# Get input file, will always be the first and only argument
inFile = sys.argv[1]
probDetect = float(sys.argv[2])
boolInnerOuter = sys.argv[3] # inner or outer?

city = sys.argv[4]
pop = sys.argv[5]
time = sys.argv[6]
perc = sys.argv[7]
radius = sys.argv[8]


input = file(inFile,  'r')


# average inner walk length
avgDetectedWalkLen = []

# average outer walk length
avgUndetectedWalkLen = []

#throw out header line
input.next();

lines = input.readlines()

for line in lines[1:len(lines)]:

    # strip and split
    line.strip()
    
    tmp = line.split("\t")
    

    if boolInnerOuter == 1:
        # outer
        if float(tmp[3]) >= probDetect:
            avgDetectedWalkLen.append(float(tmp[5]))
            avgUndetectedWalkLen.append(float(tmp[6]))
        # End if
    else:
        #inner
        if float(tmp[4]) >= probDetect:
            avgDetectedWalkLen.append(float(tmp[5]))
            avgUndetectedWalkLen.append(float(tmp[6]))
        # End If
    # End if
# End for

# Mean and Std. Dev. calculation
stdDet = 0.0
stdUnd = 0.0
meanDet = 0.0
meanUnd = 0.0


if  len(avgDetectedWalkLen) > 0:
    meanDet = float(sum(avgDetectedWalkLen)) / len(avgDetectedWalkLen)
    for val in avgDetectedWalkLen:
        stdDet += math.pow((val - meanDet),  2)
    # end for
    stdDet = math.sqrt(stdDet /  len(avgDetectedWalkLen))
# End if
    
if len(avgUndetectedWalkLen) > 0:
    meanUnd = float(sum(avgUndetectedWalkLen)) / len(avgUndetectedWalkLen)
    for val in avgUndetectedWalkLen:
        stdUnd += math.pow((val - meanUnd),  2)
    # end for
    stdUnd = math.sqrt(stdUnd / len(avgUndetectedWalkLen))
# End if







inFile = sys.argv[1]
probDetect = float(sys.argv[2])
boolInnerOuter = sys.argv[3] # inner or outer?

print("%f,%f,%f,%f,%s,%s,%s,%s,%s" % (meanDet, meanUnd,  stdDet,  stdUnd,  city,  pop,  time,  perc,  radius))
    

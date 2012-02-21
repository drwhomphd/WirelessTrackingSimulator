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
DetectedWalkLen = []
DetectedWalkCnt = []

# average outer walk length
UndetectedWalkLen = []
UndetectedWalkCnt = []

lines = input.readlines()

#sys.stderr.write('------------------\n')
#sys.stderr.write("%s\n" % lines[0])
#sys.stderr.write("%s\n" % lines[1])
#sys.stderr.write('-------------------\n')

for line in lines[1:len(lines)]:

    # strip and split
    line.strip()
    
    tmp = line.split("\t")
    

    if boolInnerOuter == 1:
        # outer
        if float(tmp[3]) >= probDetect:
            DetectedWalkLen.append(float(tmp[10]))
            UndetectedWalkLen.append(float(tmp[11]))
            DetectedWalkCnt.append(float(tmp[12]))
            UndetectedWalkCnt.append(float(tmp[13]))
        # End if
    else:
        #inner
        if float(tmp[4]) >= probDetect:
            DetectedWalkLen.append(float(tmp[10]))
            UndetectedWalkLen.append(float(tmp[11]))
            DetectedWalkCnt.append(float(tmp[12]))
            UndetectedWalkCnt.append(float(tmp[13]))
        # End If
    # End if
# End for

# Mean and Std. Dev. calculation
stdDet = 0.0
stdUnd = 0.0
meanDet = 0.0
meanUnd = 0.0


if  float(sum(DetectedWalkCnt)) > 0:
    meanDet = float(sum(DetectedWalkLen)) / float(sum(DetectedWalkCnt))
    for val in DetectedWalkLen:
        stdDet += math.pow((val - meanDet),  2)
    # end for
    stdDet = math.sqrt(stdDet /  float(sum(DetectedWalkCnt)))
# End if
    
if float(sum(UndetectedWalkCnt)) > 0:
    meanUnd = float(sum(UndetectedWalkLen)) /  float(sum(UndetectedWalkCnt))
    for val in UndetectedWalkLen:
        stdUnd += math.pow((val - meanUnd),  2)
    # end for
    stdUnd = math.sqrt(stdUnd / float(sum(UndetectedWalkCnt)))
# End if




inFile = sys.argv[1]
probDetect = float(sys.argv[2])
boolInnerOuter = sys.argv[3] # inner or outer?

print("%f,%f,%f,%f,%s,%s,%s,%s,%s" % (meanDet, meanUnd,  stdDet,  stdUnd,  city,  pop,  time,  perc,  radius))
    

# This program iterates through all the data files for a simulation and
# creates a summary data statics file for each experiment to be processed by R.

import sys
import progressbar
import math

# FUNCTIONS
def write_std_devs(fileObject, dataDictionary):
    # Local variables
    # These arrays contain all steps for greater then or equal to
    # 0 percentage detected, 10 percent detected, ..., 90 percent detected
    gr0PercSteps = {'det':[],'und':[]}
    gr10PercSteps = {'det':[],'und':[]}
    gr20PercSteps = {'det':[],'und':[]}
    gr30PercSteps = {'det':[],'und':[]}
    gr40PercSteps = {'det':[],'und':[]}
    gr50PercSteps = {'det':[],'und':[]}
    gr60PercSteps = {'det':[],'und':[]}
    gr70PercSteps = {'det':[],'und':[]}
    gr80PercSteps = {'det':[],'und':[]}
    gr90PercSteps = {'det':[],'und':[]}
    
    for key in dataDictionary.iterkeys():
        # Data Dictionary subkeys:
        # outerPerc, detSteps, undSteps
        
        # Now we add the steps to the appropate dictionary
        # containing detected/undetected steps
        if dataDictionary[key]['outerPerc'] >= 0:
            gr0PercSteps['det'] += dataDictionary[key]['detSteps']
            gr0PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.1:
            gr10PercSteps['det'] += dataDictionary[key]['detSteps']
            gr10PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.2:
            gr20PercSteps['det'] += dataDictionary[key]['detSteps']
            gr20PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.3:
            gr30PercSteps['det'] += dataDictionary[key]['detSteps']
            gr30PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.4:
            gr40PercSteps['det'] += dataDictionary[key]['detSteps']
            gr40PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.5:
            gr50PercSteps['det'] += dataDictionary[key]['detSteps']
            gr50PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.6:
            gr60PercSteps['det'] += dataDictionary[key]['detSteps']
            gr60PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.7:
            gr70PercSteps['det'] += dataDictionary[key]['detSteps']
            gr70PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.8:
            gr80PercSteps['det'] += dataDictionary[key]['detSteps']
            gr80PercSteps['und'] += dataDictionary[key]['undSteps']
        if dataDictionary[key]['outerPerc'] >= 0.9:
            gr90PercSteps['det'] += dataDictionary[key]['detSteps']
            gr90PercSteps['und'] += dataDictionary[key]['undSteps']
        # End if
    # End for
    
    # Now write out the results to the file
    fileObject.write(">=.Perc\tMean.Det\tStd.Dev.det\tMean.Undet\tStd.Dev.Undet\n");
    fileObject.write("0\t%f\t%f\t%f\t%f\n" % \
        (mean(gr0PercSteps['det']), std(gr0PercSteps['det']), 
        mean(gr0PercSteps['und']),std(gr0PercSteps['und'])))
    fileObject.write("10\t%f\t%f\t%f\t%f\n" % \
        (mean(gr10PercSteps['det']), std(gr10PercSteps['det']), 
        mean(gr10PercSteps['und']),std(gr10PercSteps['und'])))
    fileObject.write("20\t%f\t%f\t%f\t%f\n" % \
        (mean(gr20PercSteps['det']), std(gr20PercSteps['det']), 
        mean(gr20PercSteps['und']),std(gr20PercSteps['und'])))
    fileObject.write("30\t%f\t%f\t%f\t%f\n" % \
        (mean(gr30PercSteps['det']), std(gr30PercSteps['det']), 
        mean(gr30PercSteps['und']),std(gr30PercSteps['und'])))
    fileObject.write("40\t%f\t%f\t%f\t%f\n" % \
        (mean(gr40PercSteps['det']), std(gr40PercSteps['det']), 
        mean(gr40PercSteps['und']),std(gr40PercSteps['und'])))
    fileObject.write("50\t%f\t%f\t%f\t%f\n" % \
        (mean(gr50PercSteps['det']), std(gr50PercSteps['det']), 
        mean(gr50PercSteps['und']),std(gr50PercSteps['und'])))
    fileObject.write("60\t%f\t%f\t%f\t%f\n" % \
        (mean(gr60PercSteps['det']), std(gr60PercSteps['det']), 
        mean(gr60PercSteps['und']),std(gr60PercSteps['und'])))
    fileObject.write("70\t%f\t%f\t%f\t%f\n" % \
        (mean(gr70PercSteps['det']), std(gr70PercSteps['det']), 
        mean(gr70PercSteps['und']),std(gr70PercSteps['und'])))
    fileObject.write("80\t%f\t%f\t%f\t%f\n" % \
        (mean(gr80PercSteps['det']), std(gr80PercSteps['det']), 
        mean(gr80PercSteps['und']),std(gr80PercSteps['und'])))
    fileObject.write("90\t%f\t%f\t%f\t%f\n" % \
        (mean(gr90PercSteps['det']), std(gr90PercSteps['det']), 
        mean(gr90PercSteps['und']),std(gr90PercSteps['und'])))
        
        # and we're done
# End write_std_devs


def write_stat_data(outputFile, outputDataDictionary):
    # The all walks array is to help calculate the standard deviation and mean
    # of all walks during the time period
    allDetectedWalks = []
    allUndetectedWalks = []
    
    # Key = objID
    # Contains outer percent detected
    # Also contains the arrays for detected walks and undetected walks
    # 2-D Dictionary
    # Inner Keys: outerPerc, detSteps, undSteps
    statDictionary = {}
    
    
    # Loop through each key in outputDataDictionary
    for key in outputDataDictionary.iterkeys():
        # Local Variables
        numberConnectedWalks = 0.0
        percentStepsDetectedOuter = 0.0
        percentStepsDetectedInner = 0.0
        expectedLengthDetectedWalk = 0.0
        expectedLengthUndetectedWalk = 0.0
        averageDiffBetweenInnerOuter = 0.0
        expectedInnerDetect = 0.0
        expectedOuterDetect = 0.0
        stddevLengthDetectedWalk = 0.0
        stddevLengthUndetectedWalk = 0.0
        
        # Get the detected and undetected all walk list updated
        allDetectedWalks += outputDataDictionary[key][15]
        allUndetectedWalks += outputDataDictionary[key][16]
        
        # Watch out for divide by 0 errors
        #numberConnectedWalks = numberDetectedWalk + numberUndetectedWalk
        numberConnectedWalks = outputDataDictionary[key][6] + outputDataDictionary[key][7]
        
        # IS averageLengthDetectedwalk > 0
        if outputDataDictionary[key][4] > 0:
            #percentStepsDetectedOuter = numberOuterDetectedSteps / float(lineCount)
            percentStepsDetectedOuter = outputDataDictionary[key][0] / float(outputDataDictionary[key][12])
            #percentStepsDetectedinner = numberInnerDetectedSteps / float(lineCount)
            percentStepsDetectedInner = outputDataDictionary[key][2] / float(outputDataDictionary[key][12])
            #expectedLengthDetectedWalk = averageLengthDetectedWalk / float(numberDetectedWalk)
            #expectedLengthDetectedWalk = outputDataDictionary[key][4] / float(outputDataDictionary[key][6])
            expectedLengthDetectedWalk = mean(outputDataDictionary[key][15])
            stddevLengthDetectedWalk = std(outputDataDictionary[key][15])
            
        # Is averageLengthUndetectedWalk > 0
        if outputDataDictionary[key][5] > 0:
            #expectedLengthUndetectedWalk = averageLengthUnetectedWalk / float(numberUndetectedWalk)
            #expectedLengthUndetectedWalk = outputDataDictionary[key][5] / float(outputDataDictionary[key][7])
            expectedLengthUndetectedWalk = mean(outputDataDictionary[key][16])
            stddevLengthUndetectedWalk = std(outputDataDictionary[key][16])

        # Is averageDiffBetweenInnerOuter > 0
        if outputDataDictionary[key][8] > 0:
            averageDiffBetweenInnerOuter = float(outputDataDictionary[key][8]) / outputDataDictionary[key][11]
        
        # numberInnerRouters > 0
        if outputDataDictionary[key][10] > 0:
            # numberInerRouters / numberInnerDetectedSteps
            expectedInnerDetect = float(outputDataDictionary[key][10]) / outputDataDictionary[key][2]
        
        # numberOuterRouters > 0
        if outputDataDictionary[key][11] > 0:
            # numberOuterRouters / numberOuterDetectedSteps
            expectedOuterDetect = float(outputDataDictionary[key][11]) / outputDataDictionary[key][0]
        
      # object.id\tnumber.detected.steps\tnumber.undetected.steps\tpercent.steps.detected.outer\tpercent.steps.detected.inner\texpected.detected.walk.length\texpected.inner.detection.count\texpected.outer.detection.count\texpected.innerouter.difference\t\n        
        outputLine = "%s\t%d\t" % (key, outputDataDictionary[key][0])
        outputLine += "%d\t%f\t" % (outputDataDictionary[key][1], percentStepsDetectedOuter)
        outputLine += "%f\t%f\t" % (percentStepsDetectedInner, expectedLengthDetectedWalk)
        outputLine += "%f\t%f\t" % (stddevLengthDetectedWalk, stddevLengthUndetectedWalk)
        outputLine += "%f\t%f\t" % (expectedLengthUndetectedWalk,  expectedInnerDetect)
        outputLine += "%f\t%f\n" % (expectedOuterDetect, averageDiffBetweenInnerOuter)
        outputFile.write(outputLine)
    
    
        # Now lets add the information to our statDictionary
        statDictionary[key] = {} #Initiate a blank dictionary at this key
        statDictionary[key]["outerPerc"] = percentStepsDetectedOuter
        statDictionary[key]["detSteps"] = outputDataDictionary[key][15]
        statDictionary[key]["undSteps"] = outputDataDictionary[key][16]
    # end For
    
    # Print out the mean and standard deviation for the all walks
    allDetectedStd = std(allDetectedWalks)
    allDetectedMean = mean(allDetectedWalks)
    allUndetectedStd = std(allUndetectedWalks)
    allUndetectedMean = mean(allUndetectedWalks)
 
    outputFile.write("Detected.Mean=%f\n" % (allDetectedMean))
    outputFile.write("Detected.Std=%f\n" % (allDetectedStd))
    outputFile.write("Undetected.Mean=%f\n" % (allUndetectedMean))
    outputFile.write("Undetected.Std=%f\n" % (allUndetectedStd))
    
    return statDictionary
# End write_stat_data

def perform_router_analysis(inputFileName, outputFileName):
    outputFile = open(outputFileName + "-router", 'w')
    stdDevFile = open(outputFileName + "-router-stddev", 'w')
    inputFile = open(inputFileName, 'r')
    
# Write Header
    fileHeader = "object.id\tnumber.detected.steps\t"
    fileHeader += "number.undetected.steps\tpercent.steps.detected.outer\t"
    fileHeader += "percent.steps.detected.inner\texpected.detected.walk.length\t"
    fileHeader += "std.dev.detected.walk.length\tstd.dev.undetected.walk.length\t"
    fileHeader += "expected.undetected.walk.length\texpected.inner.detection\t"
    fileHeader += "expected.outer.detection\texpected.inner.outer.difference\n"
    outputFile.write(fileHeader)
    
    # Default Array to add to dictionary if an object is not yet added
    # [0] = numberOuterDetectedSteps = 0
    # [1] = numberOuterUndetectedSteps = 0
    # [2] = numberInnerDetectedSteps = 0
    # [3] = numberInnerUndetectedSteps = 0
    # [4] = averageLengthDetectedWalk = 0
    # [5] = Blank
    # [6] = numberDetectedWalk = 0
    # [7] = numberUndetectedWalk = 0
    # Average router diff
    # [8] = averageDiffBetweenInnerOuter = 0
    # [9] = numberDiffInnerOuter = 0
    # Average inner routers
    # [10] = numberInnerRouters
    # [11] = numberOuterRouters = 0
    # Average connected walk
    # Keep track of steps
    # [12] = lineCount = 0
    # Keep track of walk type. 0 = undetected, 1 = detected
    # [13] = walkType = 0
    # Boolean value to determine if this is the initial walk.
    # If its the initial walk, set the number of detected and
    # undetect walks properly
    # [14] = initialWalk = 1
    # [15] = [Array of Detected Walk Lengths]
    # [16] = [Array of undetected walk lengths
    # = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1, [], []]
    outputDataDictionary = {}
    
    fileLines = inputFile.readlines()

    # Set Up A Progress Bar using the progressbar.py class
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = len(fileLines)
    pbar = progressbar.ProgressBar(widgets = widgets, maxval = maxval).start()
    pbarStatus = 0

    
    # Iterate through each line, keeping count
    for line in fileLines:
        
        line = line.strip()
   
        tmpArray = None 
        tmpArray = line.split(",")
        
        # Get object ID
        objID = ""
        objID = tmpArray[0]
        
        # Is the person already in the dictionary, if not, add default array first
        if objID not in outputDataDictionary:
            outputDataDictionary[objID] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1, [], []]
        #End if 
    
        # Do inner routers detect the walk?
        if int(tmpArray[6]) == 0:
            # numberInnerUndetectedSteps += 1
            outputDataDictionary[objID][3] += 1
        else:
            # numberInnerDetectedSteps += 1
            outputDataDictionary[objID][2] += 1
            # numberInnerRouters += int(tmpArray[5])
            outputDataDictionary[objID][10] += int(tmpArray[6])
        # END if
    
        # Do outer routers detect the walk?
        # This will be the key for detected/undetected walk lengths and counts
        # As well as detected walk
        if int(tmpArray[7]) == 0:
            # numberOuterUndetectedSteps += 1
            outputDataDictionary[objID][1] += 1
            if outputDataDictionary[objID][13] == 1:
                # walkType = 0
                outputDataDictionary[objID][13] = 0
                # numberUndetectedWalk += 1
                outputDataDictionary[objID][7] += 1                
                # averageLengthUndetectedWalk += 1
                outputDataDictionary[objID][5] += 1
                
                # Now we just started an undetected walk, so we add
                # a 1 in the last place of our undetected walk array
                outputDataDictionary[objID][16].append(1)
                
            else:
                if outputDataDictionary[objID][14] == 1:
                    # numberUndetectedWalk += 1
                    outputDataDictionary[objID][7] += 1
                    # initialWalk  = 0
                    outputDataDictionary[objID][14] = 0
                    outputDataDictionary[objID][16].append(0)
                    
                # END if
                
                # averageLengthUndetectedWalk += 1
                outputDataDictionary[objID][5] += 1
                
                # Now we're continuing an undtected walk, so
                # we'll increment the last part of the 
                # undetected walk array by 1
                spot = len(outputDataDictionary[objID][16]) - 1
                outputDataDictionary[objID][16][spot] += 1
                
            # END if
        else:
            # numberOuterDetectedSteps += 1
            outputDataDictionary[objID][0] += 1
            if outputDataDictionary[objID][13] == 0:
                # walkType = 1
                outputDataDictionary[objID][13] = 1
                # numberDetectedWalk += 1
                outputDataDictionary[objID][6] += 1
                # averageLengthDetectedWalk += 1
                outputDataDictionary[objID][4] += 1
                
                # Now we just started an detected walk, so we add
                # a 1 in the last place of our detected walk array
                outputDataDictionary[objID][15].append(1)
            else:
                # averageLengthDetectedWalk += 1
                outputDataDictionary[objID][4] += 1
                
                # Now we're continuing an detected walk, so
                # we'll increment the last part of the 
                # detected walk array by 1
                spot = len(outputDataDictionary[objID][15]) - 1
                outputDataDictionary[objID][15][spot] += 1
            # END if
            #numberOuterRouters += int(tmpArray[5])
            outputDataDictionary[objID][11] += int(tmpArray[6])
        # END if
        
        if int(tmpArray[6]) > 0 and int(tmpArray[7]) > 0:
            #numberDiffInnerOuter += 1
            outputDataDictionary[objID][9] += 1
            #averageDiffBetweenInnerOuter += int(tmpArray[5]) - int(tmpArray[4])
            outputDataDictionary[objID][8] += int(tmpArray[7]) - int(tmpArray[6])
        # END if
        outputDataDictionary[objID][12] += 1
        
        pbarStatus += 1
        try:
             pbar.update(pbarStatus)
        except AssertionError:
            None
    # END for
    # Close target file
    inputFile.close()
    
    print "\t\tWriting Data Out to File %s" % (outputFileName)
    statDictionary = write_stat_data(outputFile, outputDataDictionary)
    
    write_std_devs(stdDevFile, statDictionary)
    
    outputFile.close()
    stdDevFile.close()
    
    
# End perform_router_analysis
    
def perform_cell_analysis(inputFileName, outputFileName):
    outputFile = open(outputFileName + "-cell", 'w')
    stdDevFile = open(outputFileName + "-cell-stddev", 'w')
    inputFile = open(inputFileName, 'r')
    
    # Write Header
    fileHeader = "object.id\tnumber.detected.steps\t"
    fileHeader += "number.undetected.steps\tpercent.steps.detected.outer\t"
    fileHeader += "percent.steps.detected.inner\texpected.detected.walk.length\t"
    fileHeader += "std.dev.detected.walk.length\tstd.dev.undetected.walk.length\t"
    fileHeader += "expected.undetected.walk.length\texpected.inner.detection\t"
    fileHeader += "expected.outer.detection\texpected.inner.outer.difference\n"
    outputFile.write(fileHeader)
    
    # Default Array to add to dictionary if an object is not yet added
    # [0] = numberOuterDetectedSteps = 0
    # [1] = numberOuterUndetectedSteps = 0
    # [2] = numberInnerDetectedSteps = 0
    # [3] = numberInnerUndetectedSteps = 0
    # [4] = averageLengthDetectedWalk = 0
    # [5] = averageLengthUndetectedWalk = 0
    # [6] = numberDetectedWalk = 0
    # [7] = numberUndetectedWalk = 0
    # Average router diff
    # [8] = averageDiffBetweenInnerOuter = 0
    # [9] = numberDiffInnerOuter = 0
    # Average inner routers
    # [10] = numberInnerRouters
    # [11] = numberOuterRouters = 0
    # Average connected walk
    # Keep track of steps
    # [12] = lineCount = 0
    # Keep track of walk type. 0 = undetected, 1 = detected
    # [13] = walkType = 0
    # Boolean value to determine if this is the initial walk.
    # If its the initial walk, set the number of detected and
    # undetect walks properly
    # [14] = initialWalk = 1
    # = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
    outputDataDictionary = {}
    
    
    fileLines = inputFile.readlines()
    
    # Set Up A Progress Bar using the progressbar.py class
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = len(fileLines)
    pbar = progressbar.ProgressBar(widgets = widgets, maxval = maxval).start()
    pbarStatus = 0
    
    # Iterate through each line, keeping count
    for line in fileLines:
        
        line = line.strip()
   
        tmpArray = None 
        tmpArray = line.split(",")
    
    
        # Get object ID
        objID = ""
        objID = tmpArray[0]
        
        # Is the person already in the dictionary, if not, add default array first
        if objID not in outputDataDictionary:
            outputDataDictionary[objID] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1, [], []]
        #End if 
    
        # Do inner routers detect the walk?
        if int(tmpArray[10]) == 0 and int(tmpArray[14]) == 0:
            # numberInnerUndetectedSteps += 1
            outputDataDictionary[objID][3] += 1
        else:
            # numberInnerDetectedSteps += 1
            outputDataDictionary[objID][2] += 1
            # numberInnerRouters += int(tmpArray[10]) + self
            outputDataDictionary[objID][10] += int(tmpArray[10]) + 1
        # END if
    
        # Do outer routers detect the walk?
        # This will be the key for detected/undetected walk lengths and counts
        # As well as detected walk
        if int(tmpArray[11]) == 0 and int(tmpArray[14]) == 0:
            # numberOuterUndetectedSteps += 1
            outputDataDictionary[objID][1] += 1
            if outputDataDictionary[objID][13] == 1:
                # walkType = 0
                outputDataDictionary[objID][13] = 0
                # numberUndetectedWalk += 1
                outputDataDictionary[objID][7] += 1                
                # averageLengthUndetectedWalk += 1
                outputDataDictionary[objID][5] += 1
                
                
                # Now we just started an undetected walk, so we add
                # a 1 in the last place of our undetected walk array
                outputDataDictionary[objID][16].append(1)
                
            else:
                if outputDataDictionary[objID][14] == 1:
                    # numberUndetectedWalk += 1
                    outputDataDictionary[objID][7] += 1
                    # initialWalk  = 0
                    outputDataDictionary[objID][14] = 0
                    outputDataDictionary[objID][16].append(0)
                # END if
                # averageLengthUndetectedWalk += 1
                outputDataDictionary[objID][5] += 1
                
                # Now we're continuing an undtected walk, so
                # we'll increment the last part of the 
                # undetected walk array by 1
                spot = len(outputDataDictionary[objID][16]) - 1
                outputDataDictionary[objID][16][spot] += 1
            # END if
        else:
            # numberOuterDetectedSteps += 1
            outputDataDictionary[objID][0] += 1
            if outputDataDictionary[objID][13] == 0:
                # walkType = 1
                outputDataDictionary[objID][13] = 1
                # numberDetectedWalk += 1
                outputDataDictionary[objID][6] += 1
                # averageLengthDetectedWalk += 1
                outputDataDictionary[objID][4] += 1
                
                # Now we just started an detected walk, so we add
                # a 1 in the last place of our detected walk array
                outputDataDictionary[objID][15].append(1)
            else:
                # averageLengthDetectedWalk += 1
                outputDataDictionary[objID][4] += 1
                
                # Now we're continuing an detected walk, so
                # we'll increment the last part of the 
                # detected walk array by 1
                spot = len(outputDataDictionary[objID][15]) - 1
                outputDataDictionary[objID][15][spot] += 1
            # END if
            #numberOuterRouters += int(tmpArray[11]) + self
            outputDataDictionary[objID][11] += int(tmpArray[11]) + 1
        # END if
        
        if int(tmpArray[10]) > 0 and int(tmpArray[11]) > 0:
            #numberDiffInnerOuter += 1
            outputDataDictionary[objID][9] += 1
            #averageDiffBetweenInnerOuter += int(tmpArray[10]) - int(tmpArray[9])
            outputDataDictionary[objID][8] += int(tmpArray[11]) - int(tmpArray[10])
        # END if
        outputDataDictionary[objID][12] += 1
        
        pbarStatus += 1
        try:
             pbar.update(pbarStatus)
        except AssertionError:
            None
    # END for
    # Close target file
    inputFile.close()
    
    print "\t\tWriting Data Out to File %s" % (outputFileName)
    statDictionary = write_stat_data(outputFile, outputDataDictionary)
    
    write_std_devs(stdDevFile, statDictionary)
    
    outputFile.close()
    stdDevFile.close()

#end perform_cell_analysis
    
def perform_both_analysis(inputFile, outputFileName):
    outputFile = open(outputFileName + "-both", 'w')
    stdDevFile = open(outputFileName + "-both-stddev", 'w')
    inputFile = open(inputFileName, 'r')
    
    # Write Header
    fileHeader = "object.id\tnumber.detected.steps\t"
    fileHeader += "number.undetected.steps\tpercent.steps.detected.outer\t"
    fileHeader += "percent.steps.detected.inner\texpected.detected.walk.length\t"
    fileHeader += "std.dev.detected.walk.length\tstd.dev.undetected.walk.length\t"
    fileHeader += "expected.undetected.walk.length\texpected.inner.detection\t"
    fileHeader += "expected.outer.detection\texpected.inner.outer.difference\n"
    outputFile.write(fileHeader)
    
    # Default Array to add to dictionary if an object is not yet added
    # [0] = numberOuterDetectedSteps = 0
    # [1] = numberOuterUndetectedSteps = 0
    # [2] = numberInnerDetectedSteps = 0
    # [3] = numberInnerUndetectedSteps = 0
    # [4] = averageLengthDetectedWalk = 0
    # [5] = Blank
    # [6] = numberDetectedWalk = 0
    # [7] = numberUndetectedWalk = 0
    # Average router diff
    # [8] = averageDiffBetweenInnerOuter = 0
    # [9] = numberDiffInnerOuter = 0
    # Average inner routers
    # [10] = numberInnerRouters
    # [11] = numberOuterRouters = 0
    # Average connected walk
    # Keep track of steps
    # [12] = lineCount = 0
    # Keep track of walk type. 0 = undetected, 1 = detected
    # [13] = walkType = 0
    # Boolean value to determine if this is the initial walk.
    # If its the initial walk, set the number of detected and
    # undetect walks properly
    # [14] = initialWalk = 1
    # = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
    outputDataDictionary = {}
    
    
    fileLines = inputFile.readlines()
    
    # Set Up A Progress Bar using the progressbar.py class
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = len(fileLines)
    pbar = progressbar.ProgressBar(widgets = widgets, maxval = maxval).start()
    pbarStatus = 0
    
    # Iterate through each line, keeping count
    for line in fileLines:
        
        line = line.strip()
   
        tmpArray = None 
        tmpArray = line.split(",")
    
    
        # Get object ID
        objID = ""
        objID = tmpArray[0]
        
        # Is the person already in the dictionary, if not, add default array first
        if objID not in outputDataDictionary:
            outputDataDictionary[objID] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1, [], []]
        #End if 
    
        # Do inner routers or cells detect the walk?
        if int(tmpArray[6]) == 0 and int(tmpArray[10]) == 0 and int(tmpArray[14]) == 0:
            # numberInnerUndetectedSteps += 1
            outputDataDictionary[objID][3] += 1
        else:
            # numberInnerDetectedSteps += 1
            outputDataDictionary[objID][2] += 1
            # numberInnerRouters += int(tmpArray[5]) + self
            outputDataDictionary[objID][10] += int(tmpArray[6])
            outputDataDictionary[objID][10] += int(tmpArray[10]) + 1
        # END if
    
        # Do outer routers detect the walk?
        # This will be the key for detected/undetected walk lengths and counts
        # As well as detected walk
        if int(tmpArray[7]) == 0 and int(tmpArray[11]) == 0 and int(tmpArray[14]) == 0:
            # numberOuterUndetectedSteps += 1
            outputDataDictionary[objID][1] += 1
            if outputDataDictionary[objID][13] == 1:
                # walkType = 0
                outputDataDictionary[objID][13] = 0
                # numberUndetectedWalk += 1
                outputDataDictionary[objID][7] += 1                
                # averageLengthUndetectedWalk += 1
                outputDataDictionary[objID][5] += 1
                
                # Now we just started an undetected walk, so we add
                # a 1 in the last place of our undetected walk array
                outputDataDictionary[objID][16].append(1)
                
            else:
                if outputDataDictionary[objID][14] == 1:
                    # numberUndetectedWalk += 1
                    outputDataDictionary[objID][7] += 1
                    # initialWalk  = 0
                    outputDataDictionary[objID][14] = 0
                    outputDataDictionary[objID][16].append(0)
                # END if
                # averageLengthUndetectedWalk += 1
                outputDataDictionary[objID][5] += 1
                
                # Now we're continuing an undtected walk, so
                # we'll increment the last part of the 
                # undetected walk array by 1
                spot = len(outputDataDictionary[objID][16]) - 1
                outputDataDictionary[objID][16][spot] += 1
            # END if
        else:
            # numberOuterDetectedSteps += 1
            outputDataDictionary[objID][0] += 1
            if outputDataDictionary[objID][13] == 0:
                # walkType = 1
                outputDataDictionary[objID][13] = 1
                # numberDetectedWalk += 1
                outputDataDictionary[objID][6] += 1
                # averageLengthDetectedWalk += 1
                outputDataDictionary[objID][4] += 1
                
                # Now we just started an detected walk, so we add
                # a 1 in the last place of our detected walk array
                outputDataDictionary[objID][15].append(1)
            else:
                # averageLengthDetectedWalk += 1
                outputDataDictionary[objID][4] += 1
                
                # Now we're continuing an detected walk, so
                # we'll increment the last part of the 
                # detected walk array by 1
                spot = len(outputDataDictionary[objID][15]) - 1
                outputDataDictionary[objID][15][spot] += 1
            # END if
            #numberOuterRouters += int(tmpArray[5]) + self
            outputDataDictionary[objID][11] += int(tmpArray[7])
            outputDataDictionary[objID][11] += int(tmpArray[11]) + 1
        # END if
        
        if (int(tmpArray[6]) > 0 and int(tmpArray[7]) > 0) or (int(tmpArray[10]) > 0 and int(tmpArray[11]) > 0):
            if (int(tmpArray[6]) > 0 and int(tmpArray[7]) > 0):
                #numberDiffInnerOuter += 1
                outputDataDictionary[objID][9] += 1
                #averageDiffBetweenInnerOuter += int(tmpArray[5]) - int(tmpArray[4])
                outputDataDictionary[objID][8] += int(tmpArray[7]) - int(tmpArray[6])
            if (int(tmpArray[10]) > 0 and int(tmpArray[11]) > 0):
                #numberDiffInnerOuter += 1
                outputDataDictionary[objID][9] += 1
                #averageDiffBetweenInnerOuter += int(tmpArray[5]) - int(tmpArray[4])
                outputDataDictionary[objID][8] += int(tmpArray[11]) - int(tmpArray[10])
        # END if
        outputDataDictionary[objID][12] += 1

        pbarStatus += 1
        try:
             pbar.update(pbarStatus)
        except AssertionError:
            None
    # END for
    # Close target file
    inputFile.close()
    
    # The all walks array is to help calculate the standard deviation and mean
    # of all walks during the time period
    allDetectedWalks = []
    allUndetectedWalks = []
    
    print "\t\tWriting Data Out to File %s" % (outputFileName)
    statDictionary = write_stat_data(outputFile, outputDataDictionary)
    
    write_std_devs(stdDevFile, statDictionary)
    
    outputFile.close()
    stdDevFile.close()
# End perform_both_analysis


# Calculate the standard deviation
def std(vals):
    
    # Get Mean
    avg = mean(vals)
    
    # Sanity checking
    if len(vals) == 0:
        return 0
    # End if
    
    dev = 0.0
    
    # Loop through each value
    for i in range(0, len(vals)):
        dev += pow((float(vals[i]) - avg),2.0)
    # End for
    
    dev = math.sqrt(dev / len(vals))
    
    return dev
    
# End std


# Calculate the mean
def mean(vals):
    
    if len(vals) == 0:
        return 0
    else:    
        return (sum(vals) / float(len(vals)))
    
# End mean

# Script constants


if __name__ == '__main__':
    # Local Variables
    inputFileName = ""
    outputFileName = ""
    
    # Process command line arguments
    if len(sys.argv) < 3:
        print "AnalysisDataSummarizer.py [Input File] [Output File]"
        sys.exit(1)
    else:
        inputFileName = sys.argv[1]
        outputFileName = sys.argv[2]
    # End if
    
    print "Analysis Data Summarizer:"
    print "\tGenerating Statitics for Router Analysis"
    perform_router_analysis(inputFileName, outputFileName)
    print "\tGenerating Statitics for Cellphone Analysis"
    perform_cell_analysis(inputFileName, outputFileName)
    print "\tGenerating Statitics for Both Analysis"
    perform_both_analysis(inputFileName, outputFileName)
# END MAIN
    
    

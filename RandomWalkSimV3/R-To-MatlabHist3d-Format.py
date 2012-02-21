#!/usr/bin/env python

# PARAMETERS
#RADIUS = ['45', '30', '15']
RADIUS = ['30']
#PERCENTS = ['100', '60', '50','30', '20', '10', '5', '1']
PERCENTS = ['100','75','50','25','10','5','4','3','2','1']
#PERCENTS = ['10']
#PERCENTS = ['1']

FEATURES = ['percent.steps.detected.inner', 'percent.steps.detected.outer']
FOLDER_PREFIX = '/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-9056Peds-0Cars-700to730-Trial1'
INPUT_FILE = 'udel-statdata.out-cell'
INPUT_FILE = 'udel-statdata-SELFDETECT.out-router'

# MAIN
if __name__ == '__main__':
    # Loop through each feature
    for feature in FEATURES:
        # Loop through each radius
        for rad in RADIUS:
            # Create a data file for matlab
            print("Opening 3d-histo-%s-%sMRad.dat for writing" % (feature,rad))
            output = open('3d-histo-%s-%sMRad.dat' % (feature,rad), 'w')
            
            # Loop through each detect perent
            for percent in PERCENTS:
                # Open an input file
                input = open('%s-%sPerc-%sMRad/%s' % (FOLDER_PREFIX, percent, rad, INPUT_FILE), 'r')
                
                # Determine what field is our target field by parsing the head
                targetField = 0
                headerLine = input.readline()
                
                # Split the header line
                headerSplit = headerLine.split('\t')
                
                for i in range(0,len(headerSplit)):
                    if headerSplit[i] == feature:
                        targetField = i
                    # End if
                # End for
                
                # Now parse out the rest of the file that we know our target header

                # file format will be:
                # [datavalue]\t[percent detected]
                for line in input.readlines():
                    # Split out the line
                    lineSplit = line.split('\t')
                   
                    if len(lineSplit) < 2:
                        continue

 
                    if lineSplit[targetField] == feature:
                        continue
                    # End if

                    # output our target field plus the percent
                    output.writelines("%s\t%s\n" % (lineSplit[targetField], percent))
                # End for
                
            # End for
            
            output.close()
        # End for
    # End for

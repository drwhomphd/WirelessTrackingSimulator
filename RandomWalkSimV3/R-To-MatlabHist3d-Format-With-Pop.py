#!/usr/bin/env python

# PARAMETERS
#RADIUS = ['45', '30', '15']
RADIUS = ['30']
#PERCENTS = ['100', '60', '50','30', '20', '10', '5', '1']
#PERCENTS = ['5','4','3','2','1']
PERCENTS = ['10']

#POPULATIONS = ['2000', '4000', '6000', '9056', '9139']
POPULATIONS = ['2000', '4000', '6000', '9056']
FEATURES = ['percent.steps.detected.inner', 'percent.steps.detected.outer']

INPUT_FILE = 'udel-statdata-SELFDETECT.out-cell'


# MAIN
if __name__ == '__main__':
    # Loop through each feature
    for feature in FEATURES:
        # Loop through each radius
        for rad in RADIUS:
            for population in POPULATIONS:
                if population == '9139':
                    cars = 325
                else:
                    cars = 0
                # End if
                FOLDER_PREFIX = '/home/nhusted/research/samyers/Wireless-Tracking/Results/Chicago-Udel-9Blk-%sPeds-%dCars-700to730-Trial1' % (population,cars)
                # Create a data file for matlab
                print("Opening 3d-histo-%s-%sMRad.dat for writing" % (feature,rad))
                output = open('3d-histo-%s-%sMRad-%s.dat' % (feature,rad, population), 'w')
                
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
                        output.writelines("%s\t%s\t%s\n" % (lineSplit[targetField], percent, population))
                    # End for
                
                # End for
            # End for
            output.close()
        # End for
    # End for

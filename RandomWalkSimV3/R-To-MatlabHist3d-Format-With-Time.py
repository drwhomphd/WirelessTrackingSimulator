#!/usr/bin/env python

# PARAMETERS
#RADIUS = ['45', '30', '15']
RADIUS = ['45']
#PERCENTS = ['100', '60', '50','30', '20', '10', '5', '1']
#PERCENTS = ['5','4','3','2','1']
PERCENTS = ['1']
CITY = "Chicago-"
TIMES = ['1100', '1300', '1500', '1700', '1900', '2100', '2300', '500', '700', '100', '300', '900']
FEATURES = ['percent.steps.detected.inner', 'percent.steps.detected.outer']
#INPUT_FILE = ['udel-statdata.out-both', 'udel-statdata.out-cell', 'udel-statdata.out-router']
INPUT_FILE = 'udel-statdata-SELFDETECT.out-cell'
# MAIN
if __name__ == '__main__':
    for time in TIMES:
        FOLDER_PREFIX = '/home/nhusted/research/samyers/Wireless-Tracking/Results/%sUdel-9Blk-9056Peds-0Cars-%sto%d-Trial1' % (CITY, time, int(time) + 30)
        # Loop through each feature
        for feature in FEATURES:
            # Loop through each radius
            for rad in RADIUS:
                # Create a data file for matlab
                print("Opening 3d-histo-%s-%sMRad-%s.dat for writing" % (feature,rad,time))
                output = open('3d-histo-%s-%sMRad-%s.dat' % (feature,rad,time), 'w')
                
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
                        output.writelines("%s\t%s\t%s\n" % (lineSplit[targetField], percent, time))
                    # End for
                    
                # End for
                
                output.close()
            # End for
        # End for
    # End for

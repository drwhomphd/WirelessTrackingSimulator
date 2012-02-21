#!/usr/bin/env python

# PARAMETERS
#RADIUS = ['45', '30', '15']
RADIUS = ['15']
#PERCENTS = ['100', '60', '50','30', '20', '10', '5', '1']
PERCENTS = ['5','4','3','2','1']
#PERCENTS = ['1']

POPULATION = ['2000', '4000', '6000', '9056']
FEATURES = ['both_detect_height(m)', 'both_detect_width(m)']
TYPE = 'both'



# MAIN
if __name__ == '__main__':
    for  popl in POPULATION:
        FOLDER_PREFIX = '/home/nhusted/research/samyers/TriangulationSystem/Results/Chicago-Udel-9Blk-%sPeds-700to730' % (popl)
        # Loop through each feature
        for feature in FEATURES:
            # Loop through each radius
            for rad in RADIUS:
                # Create a data file for matlab
                print("Opening 3d-histo-%s-%sMRad-%sPop.dat for writing" % (feature,rad, popl))
                output = open('3d-histo-%s-%sMRad-%sPop.dat' % (feature,rad,popl), 'w')

                # Loop through each detect perent
                for percent in PERCENTS:
                    INPUT_FILE = 'Chicago-Udel-9Blk-%sPeds-0Cars-%sPerc-%sMRad.%s.triangulation' % (popl, percent, rad, TYPE)
                    # Open an input file
                    input = open('%s/%s' % (FOLDER_PREFIX, INPUT_FILE), 'r')

                    # Determine what field is our target field by parsing the head
                    targetField = 0
                    headerLine = input.readline()
                    headerLine = headerLine.strip()

                    # Split the header line
                    headerSplit = headerLine.split(',')

                    for i in range(0,len(headerSplit)):
                        if headerSplit[i] == feature:
                            targetField = i
                        # End if
                    # End for

                    # Now parse out the rest of the file that we know our target header
                    # file format will be:
                    # [datavalue]\t[percent detected]
                    for line in input.readlines():
                        line = line.strip()
                        # Split out the line
                        lineSplit = line.split(',')
                        # output our target field plus the percent
                        output.writelines("%s\t%s\t%s\n" % (lineSplit[targetField], percent, popl))
                    # End for

                # End for
        # End for

        output.close()
    # End for
# End if

#!/usr/bin/env python

# PARAMETERS
RADIUS = ['45', '30', '15']
#RADIUS = ['15']
#PERCENTS = ['100', '60', '50','30', '20', '10', '5', '1']
#PERCENTS = ['5','4','3','2','1']
PERCENTS = ['10']
POPULATION = 9056
FEATURES = ['inner_detect_area(m^2)', 'outer_detect_area(m^2)']
FILE_PREFIX = 'Chicago-Udel-9Blk-9056Peds-0Cars'
TYPE='cells'


# MAIN
if __name__ == '__main__':
    # Loop through each feature
    for feature in FEATURES:
        # Loop through each radius
        for rad in RADIUS:
            # Create a data file for matlab
            print("Opening 3d-histo-%s-%sMRad-%s.dat for writing" % (feature,rad,POPULATION))
            output = open('3d-histo-%s-%sMRad.dat' % (feature,rad), 'w')
            
            # Loop through each detect perent
            for percent in PERCENTS:
                # Open an input file
                input = open('%s-%sPerc-%sMRad.%s.triangulation' % (FILE_PREFIX, percent, rad, TYPE), 'r')
                
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
                    # Split out the line
                    line = line.strip()
                    lineSplit = line.split(',')

                    if float(lineSplit[targetField]) == 0:
                        continue
                    # End if
 
                    # output our target field plus the percent
		    innerSplit = lineSplit[len(lineSplit) - 1]
		    outerSplit = lineSplit[len(lineSplit) - 2]
		    # inner and outer hit will always be the last two fields
                    output.writelines("%s\t%s\t%s\t%s\n" % (lineSplit[targetField], innerSplit, outerSplit, percent))
                # End for
                
            # End for
            
            output.close()
        # End for
    # End for

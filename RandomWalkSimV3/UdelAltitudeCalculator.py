# Imports
import sys
import math

# Rounds in this case equal one second
def load_udel_sim_data(importFile):
    # Local Variables
    dataTable = {}
    
    # Open the file
    input = open(importFile, 'r')
    
    #lines = input.readlines()
    # Format
    # NodeID Time (XCoordinate,YCoordinate,ZCoordinate) NotUsed NotUsed HostType # NodeType FloorNum TaskNum
    # Run through each line in file
    for line in input:
        
        # Local Variables
        agentID = ""
        typeID = ""
        x_coord = ""
        y_coord = ""
        encrypted = "0"
        round = ""
        
        # Strip line
        line.strip()
        
        # Split the line
        lineElements = line.split(' ')
        
        # If the element is a base station, skip the line. We don't want theirs
        if lineElements[7] is not '1' and lineElements[7] is not '0':
            continue
        # End if
        
        if int(lineElements[8]) >= 10000:
            continue
        # End If
        
        typeID = "1"
            
        round = lineElements[1]
        
        # Process X,Y,Z coordinates
        
        # Set tmpTuple to the 3-tupe of x,y,z coordinates.
        # Don't grab the first and last characters. They're parenthesis
        # We'd be splitting them out anyway.
        tmpTuple = lineElements[2][1:len(lineElements[2])-1]
        # Split out the commas
        tmpSplitTuple = tmpTuple.split(',')
        
        # Set X,Y coordinates
        #x_coord = (float(tmpSplitTuple[0]) * (1.0 / M_PER_LON)) + UDEL_INDEX_LON
        #y_coord = UDEL_INDEX_LAT - (float(tmpSplitTuple[1]) * (1.0 / M_PER_LAT))
        
        # This adjusts for the discovery that the origin really isn't at 0,0
        x_coord = float(tmpSplitTuple[0])
        y_coord = float(tmpSplitTuple[1])
        z_coord = float(tmpSplitTuple[2])
        
        print("%f\t%s\t%s\t%s" % (z_coord, round, lineElements[8], lineElements[0]))
        # end if
        
    # End for


    # close file
    input.close()
# end load_udel_sim_data

# MAIN
if __name__ == '__main__':
    
    # Get arguments
    if len(sys.argv) < 2:
        print("UdelAltitudeDistanceCalculatory.py [Input File]")
        sys.exit(1)
    else:
        inputFile = sys.argv[1]
    # End if

    load_udel_sim_data(inputFile)
# End if

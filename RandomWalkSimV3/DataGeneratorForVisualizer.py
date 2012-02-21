#!/usr/bin/env python

# This script generates an analysis file for use with the DataVisualizer.
# The difference between the file this script outputs and the actual
# DataAnalyzer-RTREE outputs is that this file contains empty data for nearby
# routers and individuals. The datavisualizer doesn't care about this so there's
# no reason to worry.

# Import statements
import os
import sys
import math
import time

# Parameters
PERCENT_SHOW = 100
M_PER_LON = 111000.132
M_PER_LAT = 111000.0

# Data offset for Chicago 9Blk Data
UDEL_Y_ADJUST = -200.8
UDEL_X_ADJUST = -248.3

# Chicago 2KMx2KM
#UDEL_INDEX_LON = -87.644359
#UDEL_INDEX_LAT = 41.889792
# Chicago 9BLK SQUARE
UDEL_INDEX_LON = -87.635454
UDEL_INDEX_LAT = 41.886739

# FUNCTIONS
def load_udel_mobility_data(inputFileName):
    
    dataTable = {}
    
    # Open input file
    input = open(inputFileName, 'r')
    
    # Udel File Format
    # NodeID Time (XCoordinate,YCoordinate,ZCoordinate) NotUsed NotUsed HostType # NodeType FloorNum TaskNum
    # Run through each line in file
    for line in input:
        
        # Local Variables
        agentID = ""
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

        # Otherwise, get things ready to add to the array
        # Colums:
        # agent_id, type_id, x_coord, y_coord, encrypted?, round
        if lineElements[7] == '1':
            agentID = 'p' + lineElements[0]
        if lineElements[7] == '0':
            agentID = 'p' + lineElements[0]
            
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
        x_coord = ((float(tmpSplitTuple[0]) + UDEL_X_ADJUST) * (1.0 / M_PER_LON)) + UDEL_INDEX_LON
        y_coord = UDEL_INDEX_LAT - ((float(tmpSplitTuple[1]) + UDEL_Y_ADJUST) * (1.0 / M_PER_LAT))
        z_coord = float(tmpSplitTuple[2])

        # Now that we have all our info, append it to the data table
        if dataTable.get(agentID) == None:
            dataTable[agentID] = {round: [x_coord,y_coord,z_coord]}
        else:
            dataTable[agentID][round] = [x_coord,y_coord,z_coord]
        # End if
    # End for
    
    # Return completed datatable
    return dataTable

    # close file
    input.close()
# End load_mobility_data

def write_analysis_file(outputFileName, agentDatabase):
    # Open output file
    output = open(outputFileName, 'w')
    
    # Loop through each key of the agentDatabase
    for agent in agentDatabase.keys():
        # Loop through each round
        for round in agentDatabase[agent].keys():
            # Print out line in the form of:
            #  entity_id, device_type, x_coord, y_coord, round, inner router hits, outer router hits,
            #  inner router hit entity_ids, outer router hit entity_ids, inner cell hits,
            #  outer cell hits, inner cell hit ids, outer cell hit ids
            # The only fields that need to have data are entity_id, x_coord, y_coord, and round
            
            # each round array is in the form of:
            # x_coord, y_coord, z_coord
            output.writelines("%s,1,%.12f,%.12f,%s,,,,,,,,\n" % (agent, agentDatabase[agent][round][0], agentDatabase[agent][round][1], round))
        # End for
    # End for
    
    # Close output file
    output.close()
# End write_analysis_file

def display_help():
    print("DataGeneratorForVisualizer.py [Input File Name] [Output File Name] [File Type] [Udel Sim Type*]")
    print("\tFile Type Options:")
    print("\trandwalksim -- Random Walk Simulator V2")
    print("\tudelsim -- UDel Models Simulator")
    print("****")
    print("\t Udel Sim Type:")
    print("\t0 -- 2KM by 2KM Chicago")
    print("\t1 -- 9 Block Square Chicago")
    print("\t2 -- 9 Block Square Dallas")
    print("\t3 -- 2KM by 2KM Dallas")
    sys.exit(1)
# End display_help

# Main
if __name__ == '__main__':
    # Local Variables
    inputFile = ""
    outputFileName = ""
    fileType = ""
    udelSimType = ""
    agentDatabase = {}
    
    # Process command line arguments
    if (len(sys.argv) < 4):
        display_help()
    else:
        inputFile = sys.argv[1]
        outputFileName = sys.argv[2]
        fileType = sys.argv[3]
        if fileType == "udelsim":
            if (len(sys.argv) < 5):
                display_help()
            else:
                udelSimType = sys.argv[4]
                if udelSimType == '0':
                    UDEL_INDEX_LON = -87.644359
                    UDEL_INDEX_LAT = 41.889792
                    # Data offset for Chicago 2kmX2km
                    UDEL_Y_ADJUST = -634.41
                    UDEL_X_ADJUST = -149.24
                elif udelSimType == '2':
                     UDEL_INDEX_LON = -96.801526
                     UDEL_INDEX_LAT =  32.781577
                     UDEL_Y_ADJUST = -460
                     UDEL_X_ADJUST = -213
                else:
                    # Data offset for Chicago 9Blk Data
                    UDEL_INDEX_LON = -87.635454
                    UDEL_INDEX_LAT = 41.886739
                    UDEL_Y_ADJUST = -200.8
                    UDEL_X_ADJUST = -248.3
                # End if
                PERCENT_SHOW = 100
            # End if
        else:
            PERCENT_SHOW = 100
        # End If
    # End If
    
    print("Loading Mobility Data...")
    # Load in a mobility data file to a dictionary. We only need X, Y coordinates
    if fileType == "udelsim":
        agentDatabase = load_udel_mobility_data(inputFile)
    # End if
   
    print("Writing empty analysis file...")
    # Write mobility data out to an empty analysis file that the map generator
    # is able to read
    write_analysis_file(outputFileName, agentDatabase)
    
    # Exit the program.
    sys.exit(0)
# End Main

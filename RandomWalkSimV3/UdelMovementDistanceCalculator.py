# Imports
import sys
import math

# Rounds in this case equal one second
def load_udel_sim_data(importFile):
    # Local Variables
    dataTable = {}

    numberOfPeople = 0
    numberOfPeopleCount2 = 0
    numberOfPeopleAboveGround = 0
    numberAbove15M = 0
    numberAbove30M = 0
    numberAbove45M = 0
    numberOfPeopleAboveGround2 = 0
    numberAbove15M2 = 0
    numberAbove30M2 = 0
    numberAbove45M2 = 0
    
    # Open the file
    input = open(importFile, 'r')
    
    #lines = input.readlines()
    
    print("\tLoading Mobility Data...")
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
            
        if lineElements[1] == '0':
            numberOfPeople += 1
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
        x_coord = float(tmpSplitTuple[0])
        y_coord = float(tmpSplitTuple[1])
        z_coord = float(tmpSplitTuple[2])
        
        # Record if people of above ground.
        if(z_coord > 0 and lineElements[1] == '0'):
            numberOfPeopleAboveGround += 1
            if z_coord < 15:
                numberAbove15M += 1
            if z_coord < 30:
                numberAbove30M += 1
            if z_coord < 45:
                numberAbove45M += 1
        # end if
        
        
        # Now that we have all our info, append it to the data table
        if dataTable.get(agentID) == None:
            numberOfPeopleCount2 += 1
            dataTable[agentID] = {round: [x_coord,y_coord,z_coord]}
        else:
            dataTable[agentID][round] = [x_coord,y_coord,z_coord]
        # End if
    # End for


    # close file
    input.close()
    
    # Print out Z coordinates over 0
    print("Number of people above ground: %d\nNumber of people: %d\nNumber of People Second Count: %d" % (numberOfPeopleAboveGround, numberOfPeople, numberOfPeopleCount2))
    print("Number of people below 15M: %d\nNumber of people below 30M: %d\nNumber of people below 45M: %d" % (numberAbove15M, numberAbove30M, numberAbove45M))

    return dataTable
# end load_udel_sim_data

def calculate_mean_distance(agentTable):
    
    # Local Variables
    numberOfMovements = 0
    totalDistance = 0.0
    
    # Iterate through each agent
    for agentID in agentTable.iterkeys():
        # Old values for distance calculation
        oldRound = ''        
        
        # Loop through each round
        for round in agentTable[agentID].iterkeys():
            
            
            # We don't have a second point to compare the distance to
            if oldRound == '':
                oldRound = round
                continue
            # End if
            
            # Get oldX and oldY
            oldX = agentTable[agentID][oldRound][0]
            oldY = agentTable[agentID][oldRound][1]
            
            # Get newX and newY
            newX = agentTable[agentID][round][0]
            newY = agentTable[agentID][round][1]
            
            # calculate distance
            distance = math.sqrt(math.pow((newX-oldX),2) + math.pow((newY-oldY),2))
            
            numberOfMovements += 1
            totalDistance += distance
            
            
            # Keep track of old round
            oldRound = round
            
            
    # end for
    print("Total Distance: %f" % (totalDistance))
    print("Number of movements: %d" % (numberOfMovements))
    print("Mean Euclidian Distance: %f" % (totalDistance / numberOfMovements))
    
# end calculate_mean_distance

# MAIN
if __name__ == '__main__':
    
    # Get arguments
    if len(sys.argv) < 2:
        print("UdelMvementDistanceCalculatory.py [Input File]")
        sys.exit(1)
    else:
        inputFile = sys.argv[1]
    # End if
    
    agentDataTable = {}
    
    agentDataTable = load_udel_sim_data(inputFile)
    
    calculate_mean_distance(agentDataTable)
# End if

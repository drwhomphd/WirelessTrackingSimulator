#!/usr/bin/env python
#
#    Random Walk Simulator V2
#    This second version of the random walk simulator includes support for:
#        * Multiple Processes
#        * More then one walker
#    This program uses a completely different file format then the previous
#    walk program. The file format is as follows:
#
#    PEOPLE:XXXX -- Meta data listing number of people
#    ROUND:XXXX -- Meta data listing number of rounds
#
#    entity_id, device_type, x_loc, y_loc, encryption, round
#    
#    entity_id = Unique identifier of the enetity. If it starts with a 'p' it's
#    a mobile agent. If it starts with a 'b' It's a base station.
#    
#    device_type = This will be used if different devices are chosen
#    
#    x_loc = The x_location of the device.
#    
#    y_loc = the y_location of the device.
#
#    encryption = Does the device use an encrypted key to connect? This is
#               currently only being considered for wireless base stations.
#    
#    round = The round number for the current position. If the round number is X,
#    then the device never moves.
#
#    Due to limitations of the Python interpretor, forked processes were used to
#    allow access to multi-core systems. If threads were used, only one thread
#    can be executed at a time, thus disallowing threads to be executed
#    concurrently on multiple processors.
# IMPORTS
import random
import os
import math
import sys
import time
import progressbar


# PARAMETERS
NUMBER_OF_PEOPLE = 100
NUMBER_OF_THREADS = 2
ROTATION_DEGREE = 0
M_PER_LON = 111000.132
M_PER_LAT = 111000.0
ROUNDS = 1000
WALK_STD_DEV = 11.729431
WALK_MEAN = 0

# This is the buffer range for a second polygon that allows us to only write out
# possibly visible routers to a file. It's listed as a multiplication factor
# where 1.15 is expanding the polygon by 15%.
POLYGON_BUFFER_RANGE = 1.15

# ARGUMENTS
fileRouterList = ""
filePolygon = ""
outputFileName = ""

# FUNCTIONS
def is_in_bounding_polygon(currentLon, currentLat, polygonSides, polygonDataPoints):
    # Local Variables
    numberSides = polygonSides
    count2 = numberSides - 1
    
    returnValue = False
    
    count = 0
    while (count < numberSides):
        
        
        # Set up initial points
        tFirstY = polygonDataPoints[count][1]
        tSecondY = polygonDataPoints[count2][1]
        tFirstX = polygonDataPoints[count][0]
        tSecondX = polygonDataPoints[count2][0]
        
        # Make sure the current latitude is in between the first y-value of the
        # polygon and the last y-value of the polygon.
        # -OR-
        # Make sure the current latitude is between the last y-value and the
        # first y-value.
        if (( tFirstY < currentLat and tSecondY >= currentLat) or \
            (tSecondY < currentLat and tFirstY >= currentLat)):
            if ((tFirstX + (currentLat - tFirstY) \
                 / (tSecondY - tFirstY) \
                * (tSecondX - tFirstX)) < currentLon):
                returnValue = not returnValue
            # End if
        # End if
        
        count2 = count
        
        count += 1
    # End while
    
    
    
    return returnValue
#End is_in_bounding_polygon

# This function rotates the origin of the current set of coordinates
# counter-clockwise using the ROTATION_DEGREE constant
def rotate_origin(currentX, currentY):
    # Local Variables
    rotatedX = 0.0
    rotatedY = 0.0
    
    rotatedX = (currentX * math.cos(ROTATION_DEGREE)) \
        + (currentY * math.sin(ROTATION_DEGREE))
    
    rotatedY = (currentX * math.sin(ROTATION_DEGREE)) \
        + (currentY * math.cos(ROTATION_DEGREE))
    
    return (rotatedX, rotatedY)
#End rotate_origin

def brownian_random_walk_move(currentX, currentY):
    # Local Variables
    xDelta = 0.0
    yDelta = 0.0
    newX = 0.0
    newY = 0.0
    
    # Generate random delta values using normal curve
    xDelta = random.gauss(WALK_MEAN, (WALK_STD_DEV * (1.0 / M_PER_LON)))
    yDelta = random.gauss(WALK_MEAN, (WALK_STD_DEV * (1.0 / M_PER_LAT)))
    
    (xDelta, yDelta) = rotate_origin(xDelta, yDelta)
    
    newX = currentX + xDelta
    newY = currentY + yDelta
    
    return(newX, newY)
#End brownian_random_walk_move

def load_router_data(routerDataFile):
    input = open(routerDataFile, 'r')
    
    routerPoints = []

    for line in input.readlines():
        
        # Strip off any white space
        line = line.rstrip()
        line = line.lstrip()
        
        # Split on the comma
        splitLine = line.split(",")
        
        # File format:
        # RouterID, Y Coordinate, X Coordinate, Encryption?
        routerPoints.append( [ splitLine[0],float(splitLine[2]), float(splitLine[1]), splitLine[3] ] )
        
    # End for
    
    input.close()
    
    return routerPoints
#End load_router_data

# This function loads the polygon config file and stores the number of sides
# and each point in a database.
def load_polygon_config(polygonFile):
    # Local Variables
    polygonDataPoints = []
    polygonSides = ""
    
    input = open(polygonFile, 'r')
    
    # Read the first line. It will be the number of sides.
    polygonSides = int(input.readline())
    
    for line in input.readlines():
        
        # Strip off any white space.
        line = line.rstrip()
        line = line.lstrip()
        
        # Split on the comma        
        splitLine = line.split(",")
        
        # Add to the array
        polygonDataPoints.append( [ float(splitLine[0]), float(splitLine[1]) ] )
    # End FOR
    
    input.close()
    
    return (polygonSides, polygonDataPoints)
# End is_in_bounding_polygon

def create_buffered_polygon(polygonDataPoints):
    # Local Variables
    bufferedPolygonDataPoints = polygonDataPoints
    centerDataPoint = []
    returnValue = 0
    
    # Locate a rough center of our polygon
    # MUST BE CONVEX POLYGON THAT IS NEAR RECTANGULAR
    # To do this we'll find the maximum and minimum y coordinates, as well as
    # the maximum and minimum X coordinates, and find the coordinate that
    # is the midpoint between the two
    minStartX = polygonDataPoints[0][0]
    minStartY = polygonDataPoints[0][1]
    maxStartX = polygonDataPoints[0][0]
    maxStartY = polygonDataPoints[0][1]
    
    for point in polygonDataPoints:
        if minStartX > point[0]: minStartX = point[0]
        if minStartY > point[1]: minStartY = point[1]
        if maxStartX < point[0]: maxStartX = point[0]
        if maxStartY < point[1]: maxStartY = point[1]
    # End for
    
    centerX = ((maxStartX - minStartX) / 2.0 ) + minStartX
    centerY = ((maxStartY - minStartY) / 2.0 ) + minStartY
    
    for count in range (0, len(bufferedPolygonDataPoints)):
        point = polygonDataPoints[count]
        
        # Calculate X Coordinate -- Bring Point to Center, multiply, put point back
        if point[0] > centerX:
            point[0] = ((point[0] - centerX) * POLYGON_BUFFER_RANGE) + centerX
        elif point[0] < centerX:
            point[0] = ((point[0] + centerX) * POLYGON_BUFFER_RANGE) - centerX
            
        # Calculate Y Coordinate -- Bring Point to Center, multiply, put point back
        if point[1] > centerY:
            point[1] = ((point[1] - centerY) * POLYGON_BUFFER_RANGE) + centerX
        elif point[1] < centerY:
            point[1] = ((point[1] + centerY) * POLYGON_BUFFER_RANGE) - centerX
        
        
        bufferedPolygonDataPoints[count] = point
    # End for
    
    return bufferedPolygonDataPoints
# End create_buffered_polygon

# This function includes instructions to be run for each child_process
# discussed in the main section.
def child_process(outputPipe, startPerson, endPerson, minStartX, maxStartX, minStartY, maxStartY):
    
    # Local Variables
    walkerPositions = []
    
    random.seed()
    
    # Set up position array to keep track of each walker:
    count = startPerson
    for count in range(startPerson, endPerson + 1):
        startX = 0.0000000000
        startY = 0.0000000000     
        
        # Get Initial Points
        startX = random.uniform(minStartX, maxStartX)
        startY = random.uniform(minStartY, maxStartY)
        
        # Make sure initial point is within the polygon
        while is_in_bounding_polygon(startX, startY, noPolySides, polyConfig) == 0:
            startX = random.uniform(minStartX, maxStartX)
            startY = random.uniform(minStartY, maxStartY)
        
        # Each walkers location in the array should be countValue - startPerson
        walkerPositions.append( [startX, startY] )
    #End For
    
    # Loop for each round
    for count in range(startPerson, endPerson + 1):
        # Loop through each walker
        for count2 in range(0, ROUNDS):
            newX = 0.0000000000
            newY = 0.0000000000
            
            # Choose a new spot, if it isn't in the polygon, choose another spot
            newX, newY = brownian_random_walk_move(walkerPositions[int(count-startPerson)][0], walkerPositions[int(count-startPerson)][1])
            
            while is_in_bounding_polygon(newX, newY, noPolySides, polyConfig) == 0:
                newX, newY = brownian_random_walk_move(walkerPositions[int(count-startPerson)][0], walkerPositions[int(count-startPerson)][1])
            # End while
                
            # Finalize new walk positions and write old positions to pipe
            os.write(outputPipe, "p%d,1,%f,%f,0,%d\n" % (count,  walkerPositions[int(count-startPerson)][0], walkerPositions[int(count-startPerson)][1], count2))
            walkerPositions[int(count-startPerson)][0] = newX
            walkerPositions[int(count-startPerson)][1] = newY
            
        # End while
    # End for

    os.write(outputPipe, "DONE\n")
    os._exit(0)
    return 0
# End child_process

# MAIN
if __name__ == '__main__':
    # Process Command Line
    if len(sys.argv) < 4:
        print("RandomWalkSimV2.py [router list] [polygon file] [output file name] [polygon buffer range] [population_size]\n")
        sys.exit(1)
    else:
        fileRouterList = sys.argv[1]
        filePolygon = sys.argv[2]
        outputFileName = sys.argv[3]
        if len(sys.argv) == 5:
            POLYGON_BUFFER_RANGE = float(sys.argv[4])
        if len(sys.argv) == 6:
            POLYGON_BUFFER_RANGE = float(sys.argv[4])
            NUMBER_OF_PEOPLE = int(sys.argv[5])
    # End if
    
    # Local Variables
    routerPoints = []
    polyConfig = []
    noPolySides = 0
    
    # Ranges for each process to split into. 2-D array:
    # [process][0] = start agent for process
    # [process][1] = end agent for process
    splitRanges = []
    
    # Start actual simulation:
    
    # Open output file for writing
    output = open(outputFileName, 'w')
    
    # Load Router File
    routerPoints = load_router_data(fileRouterList)
    
    # Load Polygon Config File
    (noPolySides, polyConfig) = load_polygon_config(filePolygon)
    
    
    # Determine Minimum and Maximum X and Y values for random starting points
    minStartX = polyConfig[0][0]
    minStartY = polyConfig[0][1]
    maxStartX = polyConfig[0][0]
    maxStartY = polyConfig[0][1]
    
    for point in polyConfig:
        if minStartX > point[0]: minStartX = point[0]
        if minStartY > point[1]: minStartY = point[1]
        if maxStartX < point[0]: maxStartX = point[0]
        if maxStartY < point[1]: maxStartY = point[1]
    # End for
    
    # Write two lines of metadata
    output.write("POPLUATION_SIZE:%d\n" % (NUMBER_OF_PEOPLE))
    output.write("ROUNDS:%d\n" % (ROUNDS))
    
    # Create a buffered bounding polygon. Used when writing routers out to file
    # to limit the number of routers written out. No point in writing out routers
    # that will never be seen.
    bufferedPolygon = polyConfig #create_buffered_polygon(polyConfig)
    
    # Write out router information to output file. These positions won't move
    # so they don't need to have their own child process.
    for router in routerPoints:
        # First make sure that the router is within the polygon plus its buffer range:
        if is_in_bounding_polygon(router[1], router[2], noPolySides, bufferedPolygon) == 1:
            output.write("b%s,-1,%f,%f,%s,-1\n" % (router[0],router[1],router[2],router[3]))
            
    # End for
    
    # Open PIPE for Parent/Child communication
    pipein, pipeout = os.pipe()
    
    # Create the ranges for each child process
    count = 0
    while count <= NUMBER_OF_PEOPLE - 1:
        
        # Get chunk size for start/end values
        chunkSize = math.ceil(NUMBER_OF_PEOPLE / float(NUMBER_OF_THREADS))
        start = int(count)
        end = int(count + chunkSize - 1)
        
        # Make sure the end value won't be over the number of people
        if end > NUMBER_OF_PEOPLE: end = NUMBER_OF_PEOPLE

        # Add ranges
        splitRanges.append([int(count), int(end)])
        
        # Increment count
        count += chunkSize
    # End while
    
    # Spawn off child process
    count = 0
    while count < len(splitRanges):
        if os.fork() == 0:
            os.close(pipein)
            child_process(pipeout, splitRanges[count][0], splitRanges[count][1], minStartX, maxStartX, minStartY, maxStartY)
        count += 1
    # End while
    
    # Close the output pipe, we don't need it.
    os.close(pipeout)
    # Switch the input pipe to a proper handle so we can readline it.
    pipein = os.fdopen(pipein)
    
    
    # Set Up A Progress Bar using the progressbar.py class
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = NUMBER_OF_PEOPLE * ROUNDS
    pbar = progressbar.ProgressBar(widgets=widgets, maxval=maxval).start()
    pbarStatus = 0
    
    # Used to keep track of finished threads
    # If a thread sends DONE, increment
    count = 0
    while count < len(splitRanges):
        line = pipein.readline()[:-1]
        
        line.strip()
        
        if line == "DONE":
            count += 1
        else:
            pbarStatus += 1
            try:
                pbar.update(pbarStatus)
            except AssertionError:
                None
            output.write("%s\n" % (line))
        # End if
        
    # End while

    pbar.finish()
    
    # Close up any hanging file descriptors
    output.close()
    pipein.close()

# END MAIN
    


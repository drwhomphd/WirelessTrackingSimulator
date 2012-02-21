#!/usr/bin/env python
# This script is to test how accurate our algorithm for triangulation is. The
# test is done on simulated data generated from our Wireless Tracking experiments.
# If accuracy is shown to be reletively good with this test, we will then implement
# some form of this algorithm in a C program and use data from actual routers.

# NOTE: For testing purposes, instead of using different M_PER_LON and M_PER_LAT
# I have set each to be 111000.0. due to the minor difference between the two numbers
# this should not be an issue. 

# NOTE: This file modified fields to work properly with the 3D Analysis files. This needs to be
# Used for all 3D data. Under no circumstances overwrite this with the 2D file.

# The UNIQUE function was copied from this URL:
# http://code.activestate.com/recipes/52560/
# Thanks Tim Peters and ActiveState


# Import
import getopt
import progressbar
import sys
import apsw as sqlite
import math
import pdb

# Global Variables
#OUTER_SQUARE = 45.00    # Square encompassing circle
#INNER_SQUARE = math.sqrt(math.pow(OUTER_SQUARE, 2.0) / 2.0) # Square contained in circle
M_PER_LON = 111000.132
M_PER_LAT = 111000.0
#M_PER_LAT = 111132.0
#M_PER_LON = 111650.0
Y_OFFSET = (1.0 / M_PER_LAT)
X_OFFSET = (1.0 / M_PER_LON)
NODE_TYPE = 0
ROUTER_ROUND = -1
ROUTER_SIGNIFIER = 'b'

# Functions
def display_help():
    print("TriangulationSimulationTest [Analysis Input File] [Output file] [Router Database File] [Node Type] [Router Radius]")
    print("Node Type:")
    print("\t0 -- Routers")
    print("\t1 -- Cellphones")
    print("\t2 -- Both")
    sys.exit(1)
#End display_help

def load_analysis_input(inputFile):
    
    # Local variables
    nodeDictionary = {}
    
    # Open input file
    input = open(inputFile, 'r')
    
    # Iterate through and parse each line
    # We need node ID, the current round, the list of inner routers, and the list of outer routers
    # that detect this node
    for line in input.readlines():
        # Local variables
        innerHitArray = []
        outerHitArray = []
        
        # Cut off return characters
        line = line.strip()
        
        # Split line by commas
        elements = line.split(',')
        
        
        # Get Node ID
        nodeID = elements[0]
        
        # Get Round
        round = elements[5]
        
        # Parse out inner router hits
        if NODE_TYPE == 0:
            innerHits = elements[8]
            outerHits = elements[9]
        elif NODE_TYPE == 1:
            innerHits = elements[12]
            outerHits = elements[13]
        else:
            innerHits = elements[8] + elements[12]
            outerHits = elements[9] + elements[13]
        # End if
        
        innerHitsElements = innerHits.split('~')
        innerHitsElements.pop(0)
        for hit in innerHitsElements:
            if hit != '':
                innerHitArray.append(hit)
        # End for
        
        # Parse out outer router hits
        
        outerHitsElements = outerHits.split('~')
        outerHitsElements.pop(0)
        for hit in outerHitsElements:
            if hit != '':
                outerHitArray.append(hit)
        # End for
        
        # Add to node dictionary
        nodeDictionary[nodeID] = {round: [innerHitArray, outerHitArray]}
    #End for
    
    # Close input file
    input.close()
    
    return nodeDictionary
    
# End load_analysis_input

def calculate_agent_positions(agentRouterDetections, routerDatabase, outerSquare, innerSquare):
    
    # Local Variables
    # Format:
    # key = nodeID
    # [key][round] = innerDetectSquare, outerDetectSquare, number of inner hits, number of outer hits
    locationDatabase = {}
    
    # Set up the progressbar to keep track of how we're doing.
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = len(agentRouterDetections)
    pbar = progressbar.ProgressBar(widgets=widgets, maxval=maxval).start()
    pbarStatus = 0
    
    
    # Open router database
    dbConnection = sqlite.Connection(routerDatabase)
    curs = dbConnection.cursor()
    
    # Loop through each agent in list
    for node in agentRouterDetections:
        # Loop through each round
        for round in agentRouterDetections[node]:
            # First we'll calculate the inner detection area
            # This is where we end up triangulating where the person is based on
            # inner router hits
            innerHitList = agentRouterDetections[node][round][0]
            
            innerDetectSquare = calculate_triangulation_area(curs, innerHitList,innerSquare, int(round))
            
            # Next we calculate the outer detection area
            # This is where we end up triangulation where the person is based o
            # their outer router hits
            outerHitList = agentRouterDetections[node][round][1]
            outerDetectSquare = calculate_triangulation_area(curs, outerHitList,outerSquare, int(round))
        
            # Add the two hit boxes to the list
            locationDatabase[node] = {round: [innerDetectSquare, outerDetectSquare,  len(innerHitList),  len(outerHitList)]}
        # End for
        
        pbarStatus += 1
        pbar.update(pbarStatus)
    # End for
    
    # Close db Connection
    dbConnection.close()

    return locationDatabase
    
# End calculate_agent_positions

def calculate_triangulation_area(curs, routerList, radius, round):
    
    # This is if there are no hits at this point.
    if len(routerList) == 0:
        return [[0,0],[0,0],[0,0],[0,0]]
    # End if
    
    # We have three situations, the first is when the router list has only 1
    # router. In this case we return the square around that router
    if len(routerList) == 1:
        
        # Round value placeholder
        tRound = ROUTER_ROUND
        
        if routerList[0][0] != ROUTER_SIGNIFIER:
            tRound = round
        # End if
        
        #router = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = '%s' and round = %d" % (routerList[0], tRound)))
        router = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = ? and round = ?",(routerList[0], tRound)))
        
        # LowerRight
        xLR = router[0][0] + radius * X_OFFSET
        yLR = router[0][1] - radius * Y_OFFSET
        
        # Lower left
        xLL = router[0][0] - radius * X_OFFSET
        yLL = router[0][1] - radius * Y_OFFSET
        
        # Upper right
        xUR = router[0][0] + radius * X_OFFSET
        yUR = router[0][1] + radius * Y_OFFSET
        
        # UpperLeft
        xUL = router[0][0] - radius * X_OFFSET
        yUL = router[0][1] + radius * Y_OFFSET
        
        return [[xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL]]
    # End if
    
    # The second case is when there are two routers. In this case, we find the
    # square intersection of the two routers
    if len(routerList) == 2:
        
        tRound1 = ROUTER_ROUND
        tRound2 = ROUTER_ROUND
        
        if routerList[0][0] != ROUTER_SIGNIFIER:
            tRound1 = round
        # End if
        
        if routerList[1][0] != ROUTER_SIGNIFIER:
            tRound2 = round
        # End if        
        
        
        # Local variables
        # Each of these is an array of 4 arrays. Each subarray is an x,y pair.
        router1Square = []
        router2Square = []
        locationSquare = []
        
        router1 = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = ? and round = ?",(routerList[0], tRound1)))
        router2 = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = ? and round = ?",(routerList[1], tRound2)))        
        
        # Router1 Square
        # UpperLeft
        xUL = router1[0][0] - radius * X_OFFSET
        yUL = router1[0][1] + radius * Y_OFFSET
        # UpperRight
        xUR = router1[0][0] + radius * X_OFFSET
        yUR = router1[0][1] + radius * Y_OFFSET
        # LowerRight
        xLR = router1[0][0] + radius * X_OFFSET
        yLR = router1[0][1] - radius * Y_OFFSET
        # LowerLeft
        xLL = router1[0][0] - radius * X_OFFSET
        yLL = router1[0][1] - radius * Y_OFFSET
        router1Square = [ [xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL] ]
        
        # Router2 Square
        # UpperLeft
        xUL = router2[0][0] - radius * X_OFFSET
        yUL = router2[0][1] + radius * Y_OFFSET
        # UpperRight
        xUR = router2[0][0] + radius * X_OFFSET
        yUR = router2[0][1] + radius * Y_OFFSET
        # LowerRight
        xLR = router2[0][0] + radius * X_OFFSET
        yLR = router2[0][1] - radius * Y_OFFSET
        # LowerLeft
        xLL = router2[0][0] - radius * X_OFFSET
        yLL = router2[0][1] - radius * Y_OFFSET
        router2Square = [ [xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL] ]
        
        locationSquare = calculate_square_corner_intersection(router1Square, router2Square)
        
        locationSquare = unique(locationSquare)
        
        # If we have 4 points already, that means the squares are right on top of each other.
        # Then we don't have to worry about finding any more points.
        if len(locationSquare) < 4:
            locationSquare = locationSquare + calculate_square_corner_intersection(router2Square, router1Square)
        # End if

        #if len(locationSquare) == 0:
        #    return [[0,0], [0,0], [0,0], [0,0]]

        # Parse the square
        locationSquare = format_location_square(unique(locationSquare), radius)

        return locationSquare
    # End if
    
    # The third case is when there are more then two routers. In this case we
    # iterate through each router to determine the intersection between all the
    # point. We start with the case of two routers, and go from there
    if len(routerList) > 2:
        
        tRound1 = ROUTER_ROUND
        tRound2 = ROUTER_ROUND
        
        if routerList[0][0] != ROUTER_SIGNIFIER:
            tRound1 = round
        # End if
        
        if routerList[1][0] != ROUTER_SIGNIFIER:
            tRound2 = round
        # End if
        
        # Local variables
        # Each of these is an array of 4 arrays. Each subarray is an x,y pair.
        router1Square = []
        router2Square = []
        workingSquare = []
        locationSquare = []
        
        #router1 = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = '%s' and round = %d" % (routerList[0], tRound1)))
        #router2 = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = '%s' and round = %d" % (routerList[0], tRound2)))
        router1 = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = ? and round = ?",(routerList[0], tRound1)))
        router2 = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = ? and round = ?",(routerList[1], tRound2))) 
      
        
        # Router1 Square
        # UpperLeft
        xUL = router1[0][0] - radius * X_OFFSET
        yUL = router1[0][1] + radius * Y_OFFSET
        # UpperRight
        xUR = router1[0][0] + radius * X_OFFSET
        yUR = router1[0][1] + radius * Y_OFFSET
        # LowerRight
        xLR = router1[0][0] + radius * X_OFFSET
        yLR = router1[0][1] - radius * Y_OFFSET
        # LowerLeft
        xLL = router1[0][0] - radius * X_OFFSET
        yLL = router1[0][1] - radius * Y_OFFSET
        router1Square = [ [xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL] ]
        
        # Router2 Square
        # UpperLeft
        xUL = router2[0][0] - radius * X_OFFSET
        yUL = router2[0][1] + radius * Y_OFFSET
        # UpperRight
        xUR = router2[0][0] + radius * X_OFFSET
        yUR = router2[0][1] + radius * Y_OFFSET
        # LowerRight
        xLR = router2[0][0] + radius * X_OFFSET
        yLR = router2[0][1] - radius * Y_OFFSET
        # LowerLeft
        xLL = router2[0][0] - radius * X_OFFSET
        yLL = router2[0][1] - radius * Y_OFFSET
        router2Square = [ [xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL] ]
        
        locationSquare = calculate_square_corner_intersection(router1Square, router2Square)
        
        locationSquare = unique(locationSquare)
        
        # If we have 4 points already, that means the squares are right on top of each other.
        # That or Square 1 is sitting inside Square 2....
        # Then we don't have to worry about finding any more points.
        if len(locationSquare) < 4:
            locationSquare = locationSquare + calculate_square_corner_intersection(router2Square, router1Square)
        # End if
        
        locationSquare = format_location_square(unique(locationSquare), radius)
        
        # Set our workingSquare array
        workingSquare = locationSquare
        
        # Now we have to iterate through all the other routers and match them
        # against our current location square, narrowing it down as we go.
        for count in range(2, len(routerList)):
            
            tRound = ROUTER_ROUND        
            
            locationSquare = []
            
            if routerList[count][0] != ROUTER_SIGNIFIER:
                tRound = round
            # End if
            
            # Temp router value
            #routerT = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = '%s' and round = %d" % (routerList[count], tRound)))
            routerT = list(curs.execute("SELECT x_coord, y_coord FROM tree_data WHERE obj_id = ? and round = ?",(routerList[count], tRound)))
            
            # RouterT Square
            # UpperLeft
            xUL = routerT[0][0] - radius * X_OFFSET
            yUL = routerT[0][1] + radius * Y_OFFSET
            # UpperRight
            xUR = routerT[0][0] + radius * X_OFFSET
            yUR = routerT[0][1] + radius * Y_OFFSET
            # LowerRight
            xLR = routerT[0][0] + radius * X_OFFSET
            yLR = routerT[0][1] - radius * Y_OFFSET
            # LowerLeft
            xLL = routerT[0][0] - radius * X_OFFSET
            yLL = routerT[0][1] - radius * Y_OFFSET
            routerTSquare = [ [xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL] ]


            # If we have 4 points already, that means the squares are right on top of each other.
            # Then we don't have to worry about finding any more points.
            
            locationSquare = calculate_square_corner_intersection(workingSquare, routerTSquare)
            
            locationSquare = unique(locationSquare)
            
            # Loop through each point in square 2 and see if it is in square 1
            if len(locationSquare) < 4:
                locationSquare = locationSquare + calculate_square_corner_intersection(routerTSquare, workingSquare)
            # End if
            

            # It is possible to get to this point and have an empty locationSquare
            # This is due to floating point calculation errors inherant in CPUs.
            # Due to the addition, subtraction, and multiplication we do to
            # convert meters into Lat/Lon coordinates when fine-tuning our squares.
            # If that's the case we just skip to the next round and hope that gives
            # us a better position.
            if len(locationSquare) == 0:
                continue
            # End if
            
            locationSquare = format_location_square(unique(locationSquare), radius)
            
            
            # If all 4 points are the same we were able to triangulate it down to one point
            if locationSquare[0] == locationSquare[1] == locationSquare[2] == locationSquare[3]:
                return locationSquare
            # End if
            
            # If both points in the location square now have the same X or same Y
            # value, we know that it's one side that lies within routerTSquare.
            # We need to find out what side of routerTSquare interesects with the
            # detection area so that we can close the square.
            
            # IF the UL(x) == UR(x) or LL(x) == UL(x)
            if (locationSquare[0][0] == locationSquare[1][0]) or (locationSquare[2][0] == locationSquare[3][0]):
                # We know either the left or the right side of our location square is in routerTSquare
                if locationSquare[0][0] == workingSquare[0][0]:
                    # We know that the left side of the working square is in routerTSquare
                    locationSquare = [ workingSquare[0], [routerTSquare[1][0],workingSquare[1][1]], [routerTSquare[2][0],workingSquare[2][1]], workingSquare[3]]
                else:
                    # We know that the right side of the working square is in the routerTSquare
                    locationSquare = [ [routerTSquare[0][0], workingSquare[0][1]], workingSquare[1], workingSquare[2], [routerTSquare[3][0], workingSquare[3][1]]]
                # End if
            # End if
            # IF UR(y) == LR(y) or UL(y) == LL(y)
            if (locationSquare[1][1] == locationSquare[2][1]) or (locationSquare[0][1] == locationSquare[3][1]):
                # We know either the top or the bottom side of our location square is in routerTSquare
                if locationSquare[1][1] == workingSquare[0][1]:
                    # The top side of the working square is in routerTSquare
                    locationSquare = [ workingSquare[0], workingSquare[1], [workingSquare[2][0], routerTSquare[2][1]], [workingSquare[3][0], routerTSquare[3][1]]]
                else:
                    # The bottom side of the working square is in routerTSquare
                    locationSquare = [ [workingSquare[0][0], routerTSquare[0][1]], [workingSquare[1][0], routerTSquare[1][1]], workingSquare[2], workingSquare[3]]
                # End if
            # End if
            
            # Set our workingSquare array
            workingSquare = locationSquare          
        # End for
    # End if
    
    # Return our final square
    return workingSquare
# End calculate_triangulation_area

# This function determines what corner values from square1 lie inside square2
def calculate_square_corner_intersection(square1, square2):
    
    # Local variables
    locationSquare = []
    
    # Loop through each point in square 1 and see if it is in square 2
    for point in square1:
        # Is the point in between the lower left x and upper right x
        if point[0] <= square2[1][0] and point[0] >= square2[0][0]:
            # Is the point in between the lower left y and upper right y
            if point[1] <= square2[1][1] and point[1] >= square2[3][1]:
                locationSquare.append(point)
            # End if
        # End if
    # End for
    
    return locationSquare
# End calculate_square_corner_intersection

# This function formats the location Square. If the square is only two points
# it will expand it to four points. If it is four points, it re-arranges the
# points in the square to represent [UL, UR, LR, LL].
def format_location_square(locationSquare, radius):
    
    # Local variables
    tempSquare = []
    # We'll have two situations, the location square will have two points, or
    # it will have 4 points. We'll have an error case if there are different
    # values because that means there's an oddity somewhere.
    if len(locationSquare) == 2:
        # In this case, we have two points. We need to figure out what
        # two corners of the square they are on, and then expand the square
        # from there. Also, based on our triangulation algorithm, we know that
        # the two points provided will not be on the same side. If they are,
        # something has gone horribly wrong... dogs and cats living together...
        # that sort of thing.
        point1 = locationSquare[0]
        point2 = locationSquare[1]
               
        # if x1 < x2
        if point1[0] < point2[0]:
            # Now we're on the left side for point1
            if point1[1] < point2[1]:
                # Point1 = LL
                # Point2 = UR
                # [UL, UR, LR, LL]
                UL = [point1[0], point2[1]]
                LR = [point2[0], point1[1]]
                tempSquare = [ UL, point2, LR, point1 ]
            else:
                # Point1 = UL
                # Point2 = LR
                # [UL, UR, LR, LL]
                UR = [point2[0], point1[1]]
                LL = [point1[0], point2[1]]
                tempSquare = [ point1, UR, point2, LL ]
            # End if
        else:
            # Now we're on the right side for point1
            if point1[1] < point2[1]:
                # Point1 = LR
                # Point2 = UL
                # [UL, UR, LR, LL]
                UR = [point1[0],point2[1]]
                LL = [point2[0],point2[1]]
                tempSquare = [ point2, UR, point1, LL ]
            else:
                # Point1 = UR
                # Point2 = LL
                # [UL, UR, LR, LL]
                UL = [point2[0],point1[1]]
                LR = [point1[0], point2[1]]
                tempSquare = [ UL, point1, LR, point2 ]
            # End if
        # End if
        
        return tempSquare
    elif len(locationSquare) == 4:
        # Now, we have four points in our location square, we can sort it to
        # represent a standard order.
        # [UL, UR, LR, LL]
        
        point1 = locationSquare[0]
        
        # [UZ, LZ]
        # Z = L/R
        sidePlaceHolder = [[],[]]
        spot = 0;
        # value to save spot where we find a side match for point1
        # We know there are 4 elements already...
        for i in range(1, 4):
            if point1[0] == locationSquare[i][0]:
                # We know they're both on the right, or both on the left
                if point1[1] > locationSquare[i][1]:
                    # point1 is above the current spot
                    sidePlaceHolder = [point1, locationSquare[i]]
                else:
                    # point1 is below the current spot
                    sidePlaceHolder = [locationSquare[i], point1]
                # End if
                
                # we know that the other two coordinates out of 4 coordinates
                # are on the same side, so now we have to figure out what side
                # they're on, and then combine everything together.
                spot = i
                break
            # End if
        # end for
        
        if i == 1:
            # the other two points are 2 and 3
            if locationSquare[2][0] < sidePlaceHolder[0][1]:
                # sidePlaceHolder is on the right
                if locationSquare[2][1] < locationSquare[3][1]:
                    # third point is below the fourth point
                    # [UL, UR, LR, LL]
                    # UL locationSquare[3]
                    # UR sidePlaceHolder[0]
                    # LR sidePlaceHolder[1]
                    # LL locationSquare[2]
                    
                    locationSquare = [sidePlaceHolder[0], locationSquare[3], locationSquare[2], sidePlaceHolder[1]]
                else:
                    # third point is above the fourth point
                    # [UL, UR, LR, LL]
                    # UL locationSquare[2]
                    # UR sidePlaceHolder[0]
                    # LR sidePlaceHolder[1]
                    # LL locationSquare[3]
                    
                    locationSquare = [sidePlaceHolder[0], locationSquare[2], locationSquare[3], sidePlaceHolder[1]]
                # End if
            else:
                # sidePlaceHolder is on the left
                if locationSquare[2][1] > locationSquare[3][1]:
                    # third point is below the fourth point
                    # [UL, UR, LR, LL]
                    # UL sidePlaceHolder[0]
                    # UR locationSquare[3]
                    # LR locationSquare[2]
                    # LL sidePlaceHolder[1]
                    
                    locationSquare = [locationSquare[3], sidePlaceHolder[0], sidePlaceHolder[1], locationSquare[2]]
                else:
                    # third point is above the fourth point
                    # [UL, UR, LR, LL]
                    # UL sidePlaceHolder[0]
                    # UR locationSquare[2]
                    # LR locationSquare[3]
                    # LL sidePlaceHolder[1]
                    
                    locationSquare = [locationSquare[2], sidePlaceHolder[0], sidePlaceHolder[1], locationSquare[3]]
            # End if
        elif i == 2:
            # the other two points are 1 and 3
            if locationSquare[1][0] < sidePlaceHolder[0][1]:
                # sidePlaceHolder is on the right
                if locationSquare[1][1] < locationSquare[3][1]:
                    #locationSquare = [locationSquare[3],sidePlaceHolder[0],sidePlaceHolder[1],locationSquare[1]]
                    locationSquare = [sidePlaceHolder[0], locationSquare[3], locationSquare[1], sidePlaceHolder[1]]
                else:
                    #locationSquare = [locationSquare[1],sidePlaceHolder[0],sidePlaceHolder[1],locationSquare[3]]
                    locationSquare = [sidePlaceHolder[0], locationSquare[1], locationSquare[3], sidePlaceHolder[1]]
                # End if
            else:
                # sidePlaceHolder is on the left
                if locationSquare[1][1] < locationSquare[3][1]:
                    #locationSquare = [sidePlaceHolder[0],locationSquare[3],locationSquare[1],sidePlaceHolder[1]]
                    locationSquare = [locationSquare[3], sidePlaceHolder[0], sidePlaceHolder[1], locationSquare[1]]
                else:
                    #locationSquare = [sidePlaceHolder[0],locationSquare[1],locationSquare[3],sidePlaceHolder[1]]
                    locationSquare = [locationSquare[1], sidePlaceHolder[0], sidePlaceHolder[1], locationSquare[3]]
            # End if
        else:
            # the other two points are 1 and 2
            if locationSquare[1][0] < sidePlaceHolder[0][1]:
                # sidePlaceHolder is on the right
                if locationSquare[2][1] < locationSquare[1][1]:
                    #locationSquare = [locationSquare[1],sidePlaceHolder[0],sidePlaceHolder[1],locationSquare[2]]
                    locationSquare = [sidePlaceHolder[0], locationSquare[1], locationSquare[2], sidePlaceHolder[1]]
                else:
                    #locationSquare = [locationSquare[2],sidePlaceHolder[0],sidePlaceHolder[1],locationSquare[1]]
                    locationSquare = [sidePlaceHolder[0], locationSquare[2], locationSquare[1], sidePlaceHolder[1]]
                # End if
            else:
                # sidePlaceHolder is on the left
                if locationSquare[2][1] < locationSquare[1][1]:
                    #locationSquare = [sidePlaceHolder[0],locationSquare[1],locationSquare[2],sidePlaceHolder[1]]
                    locationSquare = [locationSquare[1], sidePlaceHolder[0], sidePlaceHolder[1], locationSquare[2]]
                else:
                    #locationSquare = [sidePlaceHolder[0],locationSquare[2],locationSquare[1],sidePlaceHolder[1]]
                    locationSquare = [locationSquare[2], sidePlaceHolder[0], sidePlaceHolder[1], locationSquare[1]]
            # End if
        # End if
        return locationSquare
    # We have only 1 distinct point
    elif len(locationSquare) == 1:
        # LowerRight
        xLR = locationSquare[0][0] + radius * X_OFFSET
        yLR = locationSquare[0][1] - radius * Y_OFFSET
        
        # Lower left
        xLL = locationSquare[0][0] - radius * X_OFFSET
        yLL = locationSquare[0][1] - radius * Y_OFFSET
        
        # Upper right
        xUR = locationSquare[0][0] + radius * X_OFFSET
        yUR = locationSquare[0][1] + radius * Y_OFFSET
        
        # UpperLeft
        xUL = locationSquare[0][0] - radius * X_OFFSET
        yUL = locationSquare[0][1] + radius * Y_OFFSET
        
        return [[xUL, yUL], [xUR, yUR], [xLR, yLR], [xLL, yLL]]
    # We have 3 points, we just need to figure out what the missing point is
    # and fill it in.
    elif len(locationSquare) == 3:
        # Now, we have four points in our location square, we can sort it to
        # represent a standard order.
        # [UL, UR, LR, LL]
        
        point1 = locationSquare[0]
        
        # [UZ, LZ]
        # Z = L/R
        sidePlaceHolder = [[],[]]
        spot = 0;
        
        # value to save spot where we find a side match for point1
        # We know there are 3 elements already...
        # To do this, we iterate through and make sure point0 is the point that
        # has a matching point to form the left or right side. It makes the
        # if statements below a lot easier to deal with.
        while 1 == 1:
            for i in range(1, 3):
                if point1[0] == locationSquare[i][0]:
                    # We know they're both on the right, or both on the left
                    if point1[1] > locationSquare[i][1]:
                        # point1 is above the current spot
                        sidePlaceHolder = [point1, locationSquare[i]]
                    else:
                        # point1 is below the current spot
                        sidePlaceHolder = [locationSquare[i], point1]
                    # End if
                    
                    # We now know the left or right side of the square
                    
                    # There is now one coordinate by itself, we need to figure out
                    # which one it is so we can fill in the other coordinate to
                    # connect it's side
                    spot = i
                    break
                # End if
            # end for
            
            # Here's where we have our conditionals to make sure the while loop ends
            if sidePlaceHolder == [[],[]]:
                
                # move point1 to the end of the array, and shift all elements up.
                locationSquare.append(point1)
                locationSquare.pop(0)
            else:
                break
            # End if
        # End while
            
        if i == 1:
            # the other point is 2
            if locationSquare[2][0] < sidePlaceHolder[0][0]:
                # sidePlaceHolder is on the right
                if sidePlaceHolder[0][1] != locationSquare[2][1]:
                    # The missing point is the UL
                    # [UL, UR, LR, LL]
                    # UL locationSquare[2][0], sidePlaceHolder[0][1]
                    # UR sidePlaceHolder[0]
                    # LR sidePlaceHolder[1]
                    # LL locationSquare[2]
                    locationSquare = [ [ locationSquare[2][0], sidePlaceHolder[0][1] ],sidePlaceHolder[0],sidePlaceHolder[1],locationSquare[2]]
                else:
                    # The missing point is the LL
                    # [UL, UR, LR, LL]
                    # UL locationSquare[2]
                    # UR sidePlaceHolder[0]
                    # LR sidePlaceHolder[1]
                    # LL locationSquare[2][0], sidePlaceHolder[1][1]
                    locationSquare = [locationSquare[2],sidePlaceHolder[0],sidePlaceHolder[1],[ locationSquare[2][0], sidePlaceHolder[1][1] ]]
                # End if
            else:
                # sidePlaceHolder is on the left
                if locationSquare[2][1] != sidePlaceHolder[0][1]:
                    # The missing point is the UR
                    # [UL, UR, LR, LL]
                    # UL sidePlaceHolder[0]
                    # UR locationSquare[2][0],sidePlaceHolder[0][1]
                    # LR locationSquare[2]
                    # LL sidePlaceHolder[1]
                    locationSquare = [sidePlaceHolder[0], [ locationSquare[2][0],sidePlaceHolder[0][1] ],locationSquare[2],sidePlaceHolder[1]]
                else:
                    # The missing point is the LR
                    # [UL, UR, LR, LL]
                    # UL sidePlaceHolder[0]
                    # UR locationSquare[2]
                    # LR locationSquare[2][0],sidePlaceHolder[1][1]
                    # LL sidePlaceHolder[1]
                    locationSquare = [sidePlaceHolder[0],locationSquare[2], [ locationSquare[2][0],sidePlaceHolder[1][1] ],sidePlaceHolder[1]]
            # End if
        elif i == 2:
            # the other point is 1
            if locationSquare[1][0] < sidePlaceHolder[0][0]:
                # sidePlaceHolder is on the right
                if locationSquare[1][1] != sidePlaceHolder[0][1]:
                    locationSquare = [[ locationSquare[1][0], sidePlaceHolder[0][1] ],sidePlaceHolder[0],sidePlaceHolder[1],locationSquare[1]]
                else:
                    locationSquare = [locationSquare[1],sidePlaceHolder[0],sidePlaceHolder[1],[ locationSquare[1][0], sidePlaceHolder[1][1] ]]
                # End if
            else:
                # sidePlaceHolder is on the left
                if locationSquare[1][1] != sidePlaceHolder[0][1]:
                    locationSquare = [sidePlaceHolder[0],[ locationSquare[1][0],sidePlaceHolder[0][1] ],locationSquare[1],sidePlaceHolder[1]]
                else:
                    locationSquare = [sidePlaceHolder[0],locationSquare[1],[ locationSquare[1][0],sidePlaceHolder[1][1] ],sidePlaceHolder[1]]
            # End if
        # End if        
        return locationSquare
    else:
        print("Error with Location Square: %s" % (locationSquare))
        sys.exit(100)
    # End if
    
    
    return tempSquare
    
# End format_location_square

def write_agent_positions(outputFile, agentPositionDatabase):
    
    # Open output file
    output = open(outputFile, 'w')
    
    # Write file header
    output.writelines("node_id,round,inner_detect_square,outer_detect_square,overlap_square,inner_detect_area(m^2),inner_detect_width(m),inner_detect_height(m),outer_detect_area(m^2),outer_detect_width(m),outer_detect_height(m),both_detect_area(m^2),both_detect_width(m),both_detect_height(m),inner_hit_count, outer_hit_count\n")
    
    # Loop through agent positions and write them out to file
    for node in agentPositionDatabase:
        # Loop through each round
        for round in agentPositionDatabase[node]:
            
            offset = Y_OFFSET * X_OFFSET
            
            iUL = agentPositionDatabase[node][round][0][0]
            iUR = agentPositionDatabase[node][round][0][1]
            iLR = agentPositionDatabase[node][round][0][2]
            iLL = agentPositionDatabase[node][round][0][3]
            
            innerArea = ((iUR[0] - iUL[0]) * (iUR[1] - iLR[1])) / offset
            innerWidth = (iUR[0] - iUL[0]) / X_OFFSET
            innerHeight = (iUR[1] - iLR[1]) / Y_OFFSET
            
            oUL = agentPositionDatabase[node][round][1][0]
            oUR = agentPositionDatabase[node][round][1][1]
            oLR = agentPositionDatabase[node][round][1][2]
            oLL = agentPositionDatabase[node][round][1][3]
            
            outerArea = ((oUR[0] - oUL[0]) * (oUR[1] - oLR[1])) / offset
            outerWidth = (oUR[0] - oUL[0]) / X_OFFSET
            outerHeight = (oUR[1] - oLR[1]) / Y_OFFSET
            
            [bUL, bUR, bLR, bLL] = calculate_inner_outer_overlap(agentPositionDatabase[node][round][0], agentPositionDatabase[node][round][1])
            
            innerHitCount = agentPositionDatabase[node][round][2]
            outerHitCount = agentPositionDatabase[node][round][3]
            
            bothArea = ((bUR[0] - bUL[0]) * (bUR[1] - bLR[1])) / offset
            bothWidth = (bUR[0] - bUL[0]) / X_OFFSET
            bothHeight = (bUR[1] - bLR[1]) / Y_OFFSET
            
            output.writelines("%s,%s,%f~%f|%f~%f|%f~%f|%f~%f,%f~%f|%f~%f|%f~%f|%f~%f,%f~%f|%f~%f|%f~%f|%f~%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%d,%d\n" % (node, round, iUL[0], iUL[1], iUR[0], iUR[1], iLR[0], iLR[1], iLL[0], iLL[1], oUL[0], oUL[1], oUR[0], oUR[1], oLR[0], oLR[1], oLL[0], oLL[1], bUL[0], bUL[1], bUR[0], bUR[1], bLR[0], bLR[1], bLL[0], bLL[1], innerArea, innerWidth, innerHeight, outerArea, outerWidth, outerHeight, bothArea, bothWidth, bothHeight,  innerHitCount,  outerHitCount))
        # End for
    # End for
    
    # Close output file
    output.close()
# End write_agent_positions

def calculate_inner_outer_overlap(innerSquare, outerSquare):
        # Local Variables
        locationSquare = []
        blank = [[0,0], [0,0], [0,0], [0,0]]
        
        if innerSquare == blank:
            return outerSquare
    
        locationSquare = calculate_square_corner_intersection(innerSquare, outerSquare)
        
        locationSquare = unique(locationSquare)

        # If we have 4 points already, that means the squares are right on top of each other.
        # Then we don't have to worry about finding any more points.
        if len(locationSquare) < 4:
            locationSquare = locationSquare + calculate_square_corner_intersection(outerSquare, innerSquare)
        # End if
      
        # No points from either square lie in one another, but there must be overlapping
        # points.
        if len(locationSquare) == 0:
            if innerSquare[0][0] > outerSquare[0][0] and \
                innerSquare[0][0] < outerSquare[1][0] and \
                innerSquare[1][0] > outerSquare[0][0] and \
                innerSquare[1][0] < outerSquare[1][0]:
                # The top and bottom sides of the inner square lie within the outer square
                UL = [ innerSquare[0][0],outerSquare[0][1] ]
                UR = [ innerSquare[1][0],outerSquare[1][1] ]
                LR = [ innerSquare[2][0],outerSquare[2][1] ]
                LL = [ innerSquare[3][0],outerSquare[3][1] ]
                
                return [UL, UR, LR, LL]
            else:
                # the top and bottom sides of the outer square lie within the inner square
                UL = [ outerSquare[0][0],innerSquare[0][1] ]
                UR = [ outerSquare[1][0],innerSquare[1][1] ]
                LR = [ outerSquare[2][0],innerSquare[2][1] ]
                LL = [ outerSquare[3][0],innerSquare[3][1] ]

                return [UL, UR, LR, LL]
            # End if            
        # End if
        
        #The inner and outer squares do not overlap
        #if len(locationSquare) == 0:
        #    return blank
        
        # Parse the square
        locationSquare = format_location_square(unique(locationSquare), radius)
        
        # If both points in the location square now have the same X or same Y
        # value, we know that it's one side that lies within outerSquare.
        # We need to find out what side of outerSquare interesects with the
        # detection area so that we can close the square.
        if locationSquare[0][0] == locationSquare[1][0]:
            # We know either the left or the right side of our location square is in outerSquare
            if locationSquare[0][0] == innerSquare[0][0]:
                # We know that the left side of the working square is in outerSquare
                locationSquare = [ innerSquare[0], [outerSquare[1][0],innerSquare[1][1]], [outerSquare[2][0],innerSquare[2][1]], innerSquare[3]]
            else:
                # We know that the right side of the working square is in the outerSquare
                locationSquare = [ [outerSquare[0][0], innerSquare[0][1]], innerSquare[1], innerSquare[2], [outerSquare[3][0], innerSquare[3][1]]]
            # End if
        # End if
        if locationSquare[1][1] == locationSquare[2][1]:
            # We know either the top or the bottom side of our location square is in outerSquare
            if locationSquare[1][1] == innerSquare[0][1]:
                # The top side of the working square is in outerSquare
                locationSquare = [ innerSquare[0], innerSquare[1], [innerSquare[2][0], outerSquare[2][1]], [innerSquare[3][0], outerSquare[3][1]]]
            else:
                # The bottom side of the working square is in outerSquare
                locationSquare = [ [innerSquare[0][0], outerSquare[0][1]], [innerSquare[1][0], outerSquare[1][1]], innerSquare[2], innerSquare[3]]
            # End if
        # End if
        
        return locationSquare    
# End inner_outer_overlap

def unique(s):
    """Return a list of the elements in s, but without duplicates.

    For example, unique([1,2,3,1,2,3]) is some permutation of [1,2,3],
    unique("abcabc") some permutation of ["a", "b", "c"], and
    unique(([1, 2], [2, 3], [1, 2])) some permutation of
    [[2, 3], [1, 2]].

    For best speed, all sequence elements should be hashable.  Then
    unique() will usually work in linear time.

    If not possible, the sequence elements should enjoy a total
    ordering, and if list(s).sort() doesn't raise TypeError it's
    assumed that they do enjoy a total ordering.  Then unique() will
    usually work in O(N*log2(N)) time.

    If that's not possible either, the sequence elements must support
    equality-testing.  Then unique() will usually work in quadratic
    time.
    """

    n = len(s)
    if n == 0:
        return []

    # Try using a dict first, as that's the fastest and will usually
    # work.  If it doesn't work, it will usually fail quickly, so it
    # usually doesn't cost much to *try* it.  It requires that all the
    # sequence elements be hashable, and support equality comparison.
    u = {}
    try:
        for x in s:
            u[x] = 1
    except TypeError:
        del u  # move on to the next method
    else:
        return u.keys()

    # We can't hash all the elements.  Second fastest is to sort,
    # which brings the equal elements together; then duplicates are
    # easy to weed out in a single pass.
    # NOTE:  Python's list.sort() was designed to be efficient in the
    # presence of many duplicate elements.  This isn't true of all
    # sort functions in all languages or libraries, so this approach
    # is more effective in Python than it may be elsewhere.
    try:
        t = list(s)
        t.sort()
    except TypeError:
        del t  # move on to the next method
    else:
        assert n > 0
        last = t[0]
        lasti = i = 1
        while i < n:
            if t[i] != last:
                t[lasti] = last = t[i]
                lasti += 1
            i += 1
        return t[:lasti]

    # Brute force is all that's left.
    u = []
    for x in s:
        if x not in u:
            u.append(x)
    return u
# End unique

# Main
if __name__ == '__main__':
    # Local Variables
    inputFile = ""
    outputFile = ""
    routerDatabase = ""
    radius = 0
    
    # Format:
    # key = nodeID
    # [key][round][0] = array of inner router hits
    # [key][round[1] = array of outer router hits
    agentPositionDatabase = {}
    agentRouterDetections = {}
    
    
    # Process Command Line Arguments
    if len(sys.argv) < 4:
        display_help()
    else:
        inputFile = sys.argv[1]
        outputFile = sys.argv[2]
        routerDatabase = sys.argv[3]
        NODE_TYPE = int(sys.argv[4])
        outerSquare = int(sys.argv[5])
        innerSquare = (math.sqrt(math.pow(outerSquare, 2.0) / 2.0)) # Square contained in circle
        outerSquare = int(sys.argv[5]) # Calculate inner circle in lat/lon
    # End if
    
    print('Loading the input analysis file...')
    # Load input file
    agentRouterDetections = load_analysis_input(inputFile)
    
    print('Calculating Agent Positions...')
    # Calculate agent positions
    agentPositionDatabase = calculate_agent_positions(agentRouterDetections, routerDatabase, outerSquare, innerSquare)
    
    
    print('')
    print('Outputing Agent Location File')
    # Write output file
    write_agent_positions(outputFile, agentPositionDatabase)
# END main

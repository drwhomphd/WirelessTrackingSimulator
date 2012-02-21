#!/usr/bin/env python

#
#  DataAnalyzer
#  This application interacts with the SQL database created by the Data
#  Importer. It analyzes every agent from the simulation and determines
#  what other agents were within range at a specific point in time.
#  This is information is then output in the following format:
#
#  entity_id, device_type, x_coord, y_coord, round, inner router hits, outer router hits,
#       inner router hit entity_ids, outer router hit entity_ids, inner cell hits,
#       outer cell hits, inner cell hit ids, outer cell hit ids
#
#  inner hits are those that happen within an inner bounding square. Outer hits
#  are those that occure in an outer bounding square. Two squares are used
#  because they can easily represent the area covered by a circle. The inner
#  bounding square is a conservative estimate, the outer bounding square is
#  a more liberal estimate.
#
#

# IMPORTS
import os
import sys
import apsw as sqlite
import math
import progressbar
import time
from gamera.kdtree import *
from cStringIO import StringIO

# CONSTANTS
NO_OF_PROCESSES = 12 #Number of processes to split into
M_PER_LON = 111000.132
M_PER_LAT = 111000.0
OUTER_SQUARE = 45.00    # Square encompassing circle
INNER_SQUARE = math.sqrt(math.pow(OUTER_SQUARE, 2.0) / 2.0) # Square contained in circle

# FUNCTIONS
def child_process(pipeout, startOfRange, endOfRange, databaseFile):
    # Local Variables
    innerSquareHits = []
    outerSquareHits = []
    lookupDictionary = {} # Lookup dictionary containing the information for each router
    nodeList = []
    kdtree = None # Placeholder for our kdtree
    
    # Data types for a round based data structure to minimize search space
    # Each dictionaries key is the round
    nodeListDict = {} # Contains an array of KdNode's for that round
    kdtreeDict = {} # Contains the KdTree for that round
    
    # Outer and Inner distances converted from meters to latitude and longitude
    outerLonDistance = (1.0 / M_PER_LON) * OUTER_SQUARE
    outerLatDistance = (1.0 / M_PER_LAT) * OUTER_SQUARE
    innerLonDistance = (1.0 / M_PER_LON) * INNER_SQUARE
    innerLatDistance = (1.0 / M_PER_LAT) * INNER_SQUARE
    
    # Create Database Connection
    dbConnection = sqlite.Connection(databaseFile)
    
    # Create Cursor
    curs = dbConnection.cursor()
    
    rowsToProcess = list(curs.execute("SELECT id, obj_id, obj_type, x_coord, y_coord, z_coord, round, can_detect FROM tree_data WHERE (round >= ? AND round <= ?) OR round < 0", (startOfRange, endOfRange)))
    
    # BENCHMARK
    #start = time.clock()
    # Add each object to the Rtree and lookup dictionaries
    for row in rowsToProcess:
        id = row[0]
        objID = row[1]
        round = row[6]
        x_coord = row[3]
        y_coord = row[4]
        z_coord = 0 
        type = row[2]
        canDetect = row[7]
        
        
        # add item to lookup dictionary
        lookupDictionary.update({id : [x_coord, y_coord, z_coord, round, type, objID, canDetect]})

        # Append current coordiantes to the nodelist for the KdTree
        if round not in nodeListDict:
            # Initialize the dict for this round
            nodeListDict[round] = []
            nodeListDict[round].append(KdNode([x_coord, y_coord, z_coord], id))
        else:
            # Append the node to this round
            nodeListDict[round].append(KdNode([x_coord, y_coord, z_coord], id))
        # End if
        
        #nodeList.append(KdNode([x_coord, y_coord, z_coord], id))
    # End for
        # BENCHMARK
        #start = time.clock()   
    # Loop through each round
    for r in range(startOfRange, endOfRange+1):
        # In our kdtree dictionary, create a tree with a nodelist for the current
        # round
        kdtreeDict[r] = KdTree(nodeListDict[r] + nodeListDict[-1])

    # End
    
    # Create the KdTree
    # kdtree = KdTree(nodeList)
    
    # BENCHMARK
    #end = time.clock()
    #sys.stderr.write("BLOCK TOOK %f Seconds\n" % (end-start))
    #end = time.clock()
    #sys.stderr.write("BLOCK TOOK %f Seconds\n" % (end-start))
    #sys.stderr.write("%f\n" % (end - start))
    
    # We don't need rowsToProcess anymore, delete it, at least hope python
    # cleans up some of the memory...
    dbConnection.close()
    del rowsToProcess
    
    # Loop through each row in the lookup dictionary
    for key in lookupDictionary.iterkeys():
        # Get the data needed for Rtree lookups
        # lookupDictionary[id] = [x_coord, y_coord, round, type, objID, canDetect]
        objID = lookupDictionary[key][5]
        
        # Before anything else, make sure it's a person and not a router.
        # If it's a router, skip this loop iteration
        if objID[0] == "b":
            continue
        # end if
        
        round = lookupDictionary[key][3]
        x_coord = lookupDictionary[key][0]
        y_coord = lookupDictionary[key][1]
        z_coord = lookupDictionary[key][2]
        type = lookupDictionary[key][4]
                    
        point = (x_coord, y_coord, z_coord)
        
        outerValues = ()
        innerValues = ()

        # BENCHMARK
        #start = time.clock()    
        # see who is near by then in the r-tree
        
        # Leftover from non-rtree. Tuples contain all the data we need for lookups.
        # x,y coordinates are (left, bottom, right, top)
        outerValues = (x_coord - outerLonDistance, x_coord + outerLonDistance, \
                       y_coord - outerLatDistance, y_coord + outerLatDistance, \
                       z_coord - OUTER_SQUARE, z_coord + OUTER_SQUARE)
        innerValues = (x_coord - innerLonDistance, x_coord + innerLonDistance,  \
                       y_coord - innerLatDistance, y_coord + innerLatDistance, \
                       z_coord - INNER_SQUARE, z_coord + INNER_SQUARE)
        
        
        # Some intermediate data storage for the returns of our k-nearest-neighbor
        # algorithm. This array contains all hits that haven't been checked to
        # make sure they are in the current round
        uncheckedHits = []
        
        # These contain a final list of ObjID that are actually within range
        outerRouterSquareHits = []
        innerRouterSquareHits = []
        outerCellSquareHits = []
        innerCellSquareHits = []
        
        # Determine all the the hits for our bounding area
        # Set our initial k
        k = 1 # K = 1 returns the current point itself
        while 1 == 1:
            # Get the k nearest neighbors
            knnlist = kdtreeDict[round].k_nearest_neighbors(point, k)
            #knnlist = kdtree.k_nearest_neighbors(point,k)
            
            # Get the new point from our returned list. The list is actual of
            # KdNode objects and not x,y,z tuples, so we'll convert that for
            # our check.
            newPoint = knnlist[len(knnlist)-1]
            newPoint = (newPoint.point[0], newPoint.point[1], newPoint.point[2])
            
            # Make sure our new point is still within our bounding rectangle,
            if is_in_cube(newPoint, outerValues) == False:
                # We're no longer in the rectangle
                # Save all our unchecked hits that are still in the rectangle
                # (Meaning we skip the latest neighbor thus the length-2) and
                # break out of the loop
                uncheckedHits = knnlist[1:len(knnlist)-1]
                
                #uncheckedHits = knnlist[0:len(knnlist)-1]
                break
            else:
                # We're still in the bounding rectangle so ge the next point
                k += 1
            # End
            
        # END
        
        # Alternative hit finding mechanism
        #k = 50
        #uncheckedHits = kdtree.k_nearest_neighbors(point, k)

        # [x_coord, y_coord, z_coord, round, type, objI D, canDetect]
        
        # Now loop through our unchecked hits. We know all of them are in the
        # outer square, but we don't know if they're in the inner square
        for hit in uncheckedHits:
            
            # Expand the KdNode object out to get its data
            hitID = hit.data
            hitPoint = (hit.point[0], hit.point[1], hit.point[2])
            
            # Make sure the hit is not the object we're looking for
            if lookupDictionary[hitID][5] is not objID:
                # Make sure the the hit is able to detect 
                if lookupDictionary[hitID][6] == 1:
                    
                    # Make sure the hit is on the same round as us
                    #if lookupDictionary[hitID][3] == round or lookupDictionary[hitID][3] == -1:
                    # Now we know we're in the outer square already and that
                    # everything matches up so we'll add it to the outerhits
                    if lookupDictionary[hitID][5][0] == 'b':
                        outerRouterSquareHits.append(lookupDictionary[hitID][5])
                    else:
                        outerCellSquareHits.append(lookupDictionary[hitID][5])
                    # Now we check if we need to add it to the inner hits
                    if is_in_cube(hitPoint, innerValues) == True:
                        if lookupDictionary[hitID][5][0] == 'b':
                            innerRouterSquareHits.append(lookupDictionary[hitID][5])
                        else:
                            innerCellSquareHits.append(lookupDictionary[hitID][5]) 
                        # End if
                    # End if
                    # End If
                # End if
            # End if
        # End for
        
        
        #for hit in rtreeIndex.intersection(innerValues, objects=False):
        #    if lookupDictionary[hit][5] is not objID:
        #        if lookupDictionary[hit][6] == 1:
        #            if lookupDictionary[hit][3] == round or lookupDictionary[hit][3] == -1:   
        #                #if 1 == 1:
        #                if lookupDictionary[hit][0] >= innerValues[0] and lookupDictionary[hit][0] <= innerValues[1] \
        #                and lookupDictionary[hit][1] >= innerValues[2] and lookupDictionary[hit][1] <= innerValues[3] \
        #                and lookupDictionary[hit][2] >= innerValues[4] and lookupDictionary[hit][2] <= innerValues[5]:
        #                    if lookupDictionary[hit][5][0] == 'b':
        #                        innerRouterSquareHits.append(lookupDictionary[hit][5]) 
        #                    else:
        #                        innerCellSquareHits.append(lookupDictionary[hit][5])
        #                    # End if
        #                # End if
        #            # End if
        #        # End if
        #    # End if   
        ## End for
        
        # BENCHMARK
        #end = time.clock()
        #sys.stderr.write("BLOCK TOOK %f Seconds\n" % (end-start))
        #sys.stderr.write("%f\n" % (end - start))
        
        # For reference
        # lookupDictionary[objID] = [x_coord, y_coord, round, type]
        # Generate string to send back
        outString = StringIO()
        #  entity_id, device_type, x_coord, y_coord, z_coord, round, inner router hits,
        #       outer router hits, inner router hit entity_ids, outer router hit entity_ids,
        #       inner cell hits, outer cell hits, inner cell hit ids, outer cell hit ids
        outString.write("%s,%d,%f,%f,%f,%d,%d,%d," % (objID, type, x_coord, y_coord, z_coord, round, len(innerRouterSquareHits), len(outerRouterSquareHits)))

        for objID in innerRouterSquareHits:
            outString.write("~%s" % (objID))
        # End for

        outString.write(",")
        for objID in outerRouterSquareHits:
            outString.write("~%s" % (objID))
        # End for
        
        outString.write(",%d,%d," % (len(innerCellSquareHits), len(outerCellSquareHits)))
        
        for objID in innerCellSquareHits:
            outString.write("~%s" % (objID))
        # End for

        outString.write(",")
        for objID in outerCellSquareHits:
            outString.write("~%s" % (objID))
        # End for
        
        outString.write("\n")      
          
        # Write string out to pipe
        # NOTE: File Descriptors don't work for this sort of thing, you have
        # To use os.write
        os.write(pipeout, outString.getvalue())               
    # end For
    # Send done signal
    os.write(pipeout, "DONE\n")
    
    # Exit child process
    os._exit(0)
# End child_process

# Function to determine if an object is in a bounding cube or not
# If the object is in a bounding square, it returns tree, otherwise false
# The coordinates are not interleaved so the cube should be passed as
# a tuple of points in the following format:
# (xmin, xmax, ymin, ymax, zmin, zmax)
def is_in_cube(point, cube):
    if point[0] >= cube[0] and point[0] <= cube[1] \
        and point[1] >= cube[2] and point[1] <= cube[3] \
        and point[2] >= cube[4] and point[2] <= cube[5]:
        
        return True
    else:
        return False
# End is_in_cube

# MAIN
if __name__ == '__main__':
    # Local Variables
    databaseFile = ""
    outputFile = ""
    numberOfRounds = 0
    chunkSize = 0
    
    # Ranges for each process to split into. 2-D array:
    # [process][0] = start agent for process
    # [process][1] = end agent for process
    splitRanges = []   
   
    # Print status
    print("KDTREE Analyzer 2D")
 
    # Process Command Line
    if len(sys.argv) < 3:
        print("DataAnalyzer.py [database file] [output file] [router/cell radius]\n")
        sys.exit(1)
    else:
        databaseFile = sys.argv[1]
        outputFile = sys.argv[2]
        if len(sys.argv) > 3:
            if sys.argv[3] is not None:
                OUTER_SQUARE = float(sys.argv[3])    # Square encompassing circle
                INNER_SQUARE = float(math.sqrt(math.pow(OUTER_SQUARE, 2.0) / 2.0)) # Square contained in circle
        
    # End if
    
    # Open output file for writing
    output = open(outputFile, 'w')
    
    # Create Database Connection
    conn = sqlite.Connection(databaseFile)
    
    # Open PIPE for Parent/Child communication
    pipein, pipeout = os.pipe()
    
    # Get number of rounds
    curs = conn.cursor()
    curs.execute("PRAGMA temp_store = MEMORY")
    rows = list(curs.execute("SELECT MAX(round), COUNT(obj_id) FROM tree_data WHERE obj_type = 1"))
    numberOfRounds = int(rows[0][0])
    # Number of actual searches that will eventually be done. Used with the progress bar as a maxval
    numberOfAnalysis = rows[0][1]
    curs.close()
    
     # Create the ranges for each child process
    count = 0
    while count <= numberOfRounds:
        # Get chunk size for start/end values
        chunkSize = math.ceil(numberOfRounds / (NO_OF_PROCESSES))
        start = count
        end = count + chunkSize - 1
        
        # Make sure the end value won't be over the number of people
        if end > numberOfRounds: end = numberOfRounds
            
        # Add ranges
        splitRanges.append([int(count), int(end)])
        
        # Increment count
        count += chunkSize
    # End while
    
    # Close connection before forking
    conn.close()
    
    # Spawn off child process
    for count in range(len(splitRanges)):
        if os.fork() == 0:
            os.close(pipein)
            child_process(pipeout, splitRanges[count][0], splitRanges[count][1], databaseFile)
    # End for
    
    # Close the output pipe, we don't need it.
    os.close(pipeout)
    # Switch the input pipe to a proper handle so we can readline it.
    pipein = os.fdopen(pipein)
    
    # Set Up A Progress Bar using the progressbar.py class
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = numberOfAnalysis
    pbar = progressbar.ProgressBar(widgets = widgets, maxval = maxval).start()
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
    
    os._exit(0)

# END MAIN

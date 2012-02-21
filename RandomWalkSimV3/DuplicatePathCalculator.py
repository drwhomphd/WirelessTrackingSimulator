#!/usr/bin/env python

# IMPORTS
import sys
import os

# Duplicate Path Calculator
# This script finds the duplicate paths between two walks.

def load_analysis_file(inFile):
    # Local Variables
    personTable = {}

    
    # Load Input File
    input = open(inFile, 'r')
    
    # Iterate through lines
    for line in input.readlines():
        
        # Parse out line
        line = line.strip()
        splitLine = line.split(",")

        # Save PersonID, Lon, Lat
        # Lon,Lat should be in string "Lon,Lat"
        # God this is so fricken' messy but I can't think of a better way
        # Dictionary: key=Person ID, value is an dict of all the movements
        if personTable.get(splitLine[0]) == None:
            personTable[splitLine[0]] = { splitLine[4] : splitLine[2] + "," + splitLine[3] }
        else:
            personTable[splitLine[0]][splitLine[4]] = splitLine[2] + "," + splitLine[3]
    # End
    
    # Close file
    input.close()
    
    # Return personArray
    return personTable
# End loadAnalysisFile


# Compares the path of each agent and calculates how many agents have the exact
# same path
def compare_paths(personLocationDictionary):

    # Local variables
    samePathCount = 0
    
    # Loop through each person in location dictionary
    keyList = personLocationDictionary.keys()
    
    for i in range(0,len(keyList)):
        
        # Set the current person
        currentPerson = personLocationDictionary[keyList[i]]
        
        # Loop through rest of array comparing paths
        for j in range(i+1, len(keyList)): 
            # Compare the two dictionaries of each 
            if i == j:
                samePathCount += 1
        # End for
    #End for
    
    # Return same path count
    return samePathCount
# End compare_paths

# Main
if __name__ == '__main__':
    
    # Local Variables
    #personLocationArray[personID][Lon,Lat]
    personLocationArray = {}
    inputFileName  = ""
    fileName = ""
    
    # Process command line arguments
    if (len(sys.argv) < 2):
        print("DataVisualizer.py [Input Analysis File Name]")
        sys.exit(1)
    else:
        inputFileName = sys.argv[1]
    # End If
    
    print("Loading Analysis File...")
    personLocationArray = load_analysis_file(inputFileName)
    
    print("Comparing Paths...")
    print("Number of agents with same path: %d" % (compare_paths(personLocationArray)))

# End If


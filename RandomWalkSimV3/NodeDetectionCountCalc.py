#!/usr/bin/python

#IMPORTS
import sys
import os
import progressbar
import getopt

# Returns the file length in lines
def get_file_length(file):
    
    # Local variables
    count = 0
    filePos = file.tell()
    
    # Set file position
    file.seek(0)
    
    # Count lines
    for line in file:
        count += 1
    # End for

    # Reset file position
    file.seek(filePos)

    return count
# End get_file_length


def load_analysis_file(inputFile, nodeDictionary):
    
    # Open input file
    input = open(inputFile, 'r')
    
    # Get all lines
    filelines = get_file_length(input)
    
    # Set Up A Progress Bar using the progressbar.py class
    widgets = ['Progress: ', progressbar.Percentage(), ' ', progressbar.Bar(),' ', progressbar.ETA()]
    maxval = filelines
    pbar = progressbar.ProgressBar(widgets = widgets, maxval = maxval).start()
    pbarStatus = 0
    
    
    # Parse through each line in the input
    for line in input:
        
        # Strip line
        line = line.strip()
        
        # Split line
        splitLine = line.split(',')
        
        node = splitLine[0]
        
        # Get the inner and outer detects
        # We skip the first character because it's
        # and extra '~' and it's easier to take care
        # of it now
        innerDetects = splitLine[12][1:]
        outerDetects = splitLine[13][1:]
        
        # See if the current node is part of the dictionary
        # If it's not, add it and increase the steps
        # If it is, just increase the steps
        if node not in nodeDictionary:
            nodeDictionary[node] = { 'steps':1,
                                     'outerDetects':0,
                                     'innerDetects':0}
        else:
            nodeDictionary[node]['steps'] += 1
        # End if
        
        # Parse inner Detects
        innerSplit = innerDetects.split('~')
        
        if innerSplit[0] != '':
            for inner in innerSplit:
                if inner not in nodeDictionary:
                    nodeDictionary[inner] = { 'steps':0,
                                                'outerDetects':0,
                                                'innerDetects':1}
                else:
                    nodeDictionary[inner]['innerDetects'] += 1
                # End if
            # End for
        # End if
        
        # Parse outer Detects
        outerSplit = outerDetects.split('~')
        
        if outerSplit[0] != '':
            for outer in outerSplit:
                if outer not in nodeDictionary:
                    nodeDictionary[outer] = { 'steps': 0,
                                                'outerDetects':1,
                                                'innerDetects':0}
                else:
                    nodeDictionary[outer]['outerDetects'] += 1
            # End for
        # End if
        
        # Update status bar
        pbarStatus += 1
        try:
            pbar.update(pbarStatus)
        except AssertionError:
            None
    # End for    
    
    
    # Close input file
    input.close()
# End load_analysis_file

def write_detections_file(outputFile, nodeDictionary):
    
    # Open output file
    output = open(outputFile, 'w')
    
    # Write out the header
    # nodeID, total.inner.detects, total.outer.detects, 
    #   inner.per.round, outer.per.round
    # header = 'nodeID\ttotal.inner.detects\ttotal.outer.detects\t'
    # header += 'inner.per.round\touter.per.round\n'
    # output.write(header)
    
    for node in nodeDictionary:
        steps = nodeDictionary[node]['steps']
        inner = nodeDictionary[node]['innerDetects']
        outer = nodeDictionary[node]['outerDetects']

        innerPerRound = inner / float(steps)
        outerPerRound = outer / float(steps)
        
        
        
        # Write output line
        output.write("%s\t%f\t%f\t%f\t%f\n" % (node, inner, outer, \
                                                innerPerRound, outerPerRound))
    # End for
    
    # close output file
    output.close()
# End write_detections_file

def help():
    print("NodeDetectionCountCalc.py")
    print("\t-i\t--\t3D Analysis file for input (Required)")
    print("\t-o\t--\tOutput file name for results (Required)")
    print("NOTE: This currently only operates on cellular detections.")
    print("\t It does not take into consider router detections.")
    sys.exit(0)
# End help

def main():
    
    # Local variables
    inputFileName = ""
    outputFileName = ""
    # 2DDictionary of nodes and their various counts
    # Outer key:
    #   'node' = node in question
    # Inner Key:
    #   'steps' = number of steps they've made in our area
    #   'outerDetects' = Total times they've detected someone with their outer range
    #   'innerDetects' = Total times they've detected someone with their inner range
    nodes = {} 
    
    # Args parsed: -o -i
    args = "i:o:"
    
    # We need an input and output file
    if len(sys.argv) < 3:
        help()
    # End if
    
    # Parse Args
    opts, args = getopt.getopt(sys.argv[1:], args)
    
    for o, a in opts:
        if o == "-i":
            inputFileName = a
        elif o == "-o":
            outputFileName = a
        else:
            help()
        # End if
    # End for
    
    # Now perform the main processing
    load_analysis_file(inputFileName, nodes)
    
    write_detections_file(outputFileName, nodes)
    
    sys.exit(0)
# End main

# MAIN
if __name__ == '__main__':
    main()
# END IF

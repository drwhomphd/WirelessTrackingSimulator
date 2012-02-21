#!/usr/bin/python

# This script's only functionality is to concatenate
# the mobility files output by the UDelMobility Sim.
# This is slightly non-trivial as the first colum is
# the nodeID. The nodeID's between different simulations
# will be similar, thus we need to incremement the
# nodeIDs properly

# Imports
import sys

def calculate_offsets(fileHandles):
    offsets = []
    
    # First offset will be 0
    offsets.append(0)
    
    # We don't care about the line count from the 
    # final file.
    for i in range(0, len(fileHandles) - 1):
        # Calculate the number of individuals in the file
        
        # Memory light version
        lineCount = 0
        for line in fileHandles[i]:
            parts = line.split()
            
            # last line will always have the highest ID
            lineCount = int(parts[0])
        # End for
        
        # Add to our array including the offset 
        # from the previous end of the offsets
        # array
        offsets.append(lineCount + offsets[len(offsets)-1])
        
        # Reset file position to the beginning
        fileHandles[i].seek(0)
    # End for

    return offsets
# End calculate_offsets

def help():
    print("UDelSimMobilityConcat.py [Files]")
    print("\t-h\t--\t Display this message.")
    sys.exit(1)
# End help
def combine_files(files,offsets, output):
    
    # Loop through each file, this parallels the
    # files array.
    for i in range(0, len(files)):

        

        # Loop through each line in the current file
        for line in files[i]:
            # Strip the line
            line.strip()
            
            # Split the line
            parts = line.split(' ')
            
            # Add the offset to the first element
            first = int(parts[0]) + offsets[i]
            
            # Print the line out in our output
            # file
            output.write("%d %s %s %s %s %s %s %s %s %s" % (first, parts[1], \
                parts[2], parts[3], parts[4], parts[5], parts[6], \
                parts[7], parts[8], parts[9]))
            
        # End for
    # End for
# End combine_files

if __name__ == "__main__":
    
    # Local variables
    files = []
    
    # Get all the input files
    if len(sys.argv) <= 2:
        help()
    else:
        # We'll loop through all the input files and open them here
        for i in range(1,len(sys.argv)):
            files.append(open(sys.argv[i], 'r'))
        # End for
    # End if
    
    # To be lazy we'll have a standard output file name
    output = open('output.mobility', 'w')
    
    # Now calculate the offsets for our nodeIDs
    print("Calculation offsets...")
    offsets = calculate_offsets(files)
    
    # Now we printout the concatenated file with the offsets
    # for proper IDs
    print("Combining the files...")
    combine_files(files,offsets, output)
    
    print("Closing input files...")
    # Close the files
    for file in files:
        file.close()
    # End
    
    print("Closing output files...")
    # Close the output file
    output.close()
# End if
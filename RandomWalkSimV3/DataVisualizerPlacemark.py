# Imports
import sys
import random

# GLOBAL PARAMETERS
PERCENT_SHOW = 25

# Functions
def writeKMLFile(outFile, personTable):
    
    # Open output file
    output = open(outFile, 'w')
    
    
    # Using heredocs because I'm lazy. Sadly, it always destroys nice formatting
    # But saves me from having to write 50,000 different print statements
    # Write KML Header
    output.write("""\
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Wirless Tracking Mobility Visualization -- %s</name>
    <description> Brownian random walk path for one agent with router placemarks
      </description>
    <Style id="yellowLineGreenPoly">
      <LineStyle>
        <color>7f00ffff</color>
        <width>4</width>
      </LineStyle>
      <PolyStyle>
        <color>7f00ff00</color>
      </PolyStyle>
    </Style>
    <Style id="innerRouterPlacemark">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/shapes/donut.png</href>
        </Icon>
	<color>ffff0000</color>
      </IconStyle>
      <LineStyle>
        <width>2</width>
      </LineStyle>
    </Style>
    <Style id="outerRouterPlacemark">
	<IconStyle>
	   <Icon>
	      <href>http://maps.google.com/mapfiles/kml/shapes/donut.png</href>
	   </Icon>
	   <color>ff0000ff</color>
	</IconStyle>
    	<LineStyle>
	   <width>2</width>
        </LineStyle>
    </Style>
    """ % (outFile))
    
    # Seed the randomizer
    random.seed()
    
    # Iterate through each person
    for person in personTable.iterkeys():
        # Local Variables
        randValue = 100 # Default to the value not chosen just in case
        
        
        # Due to the sheer number of people in the simulations, each person has
        # a PERCENT_SHOW chance of being included. Lower if files get too big.
        if len(personTable) > 100:
            randValue = random.randrange(0,100)
        else:
            randValue = 1
        # End if
        
        if randValue < PERCENT_SHOW:
	    # Iterate through each round
	    rounds = personTable[person].keys()
	    rounds.sort()
	    for round in rounds:
		# Create Placemark
		output.write(""" \
		<Placemark>
		  <styleUrl>#outerRouterPlacemark</styleUrl>
		  <name>%s - %s</name>
		  <description>Placemark</description>
		    <Point>
		    <coordinates>   
		    """ % (person, round))

		# Print coordinates
		output.write("%s,%s\n" % (personTable[person][round], "200"))
		    
		# close placemark
		output.write(""" \
			    
		    </coordinates>
		  </Point>
		</Placemark>             
		    """)
	    # End for
    # End
    
    # Print KML Footer
    output.write(""" \
      </Document>
</kml>
    """)
    
    output.close()
    
# End writeKML File

def loadAnalysisFile(inFile):
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

# Main
if __name__ == '__main__':
    
    # Local Variables
    #personLocationArray[personID][Lon,Lat]
    personLocationArray = {}
    inputFileName  = ""
    fileName = ""
    
    # Process command line arguments
    if (len(sys.argv) < 3):
        print("DataVisualizer.py [Input File Name] [Output File Name] [Percent Show*]")
        sys.exit(1)
    else:
        inputFileName = sys.argv[1]
        outputFileName = sys.argv[2]
        if (len(sys.argv) == 4):
            PERCENT_SHOW = int(sys.argv[3])
        # End If
    # End If
    
    print("Loading Analysis File...")
    personLocationArray = loadAnalysisFile(inputFileName)
   
    print("Writing KML File...")
    writeKMLFile(outputFileName, personLocationArray)
    
# End If
        


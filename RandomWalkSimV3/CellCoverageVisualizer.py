# Imports
import sys
import random

M_PER_LON = 111000.132
M_PER_LAT = 111000.0
CHANCE_TO_DETECT = 100.0
DETECT_RADIUS = 45.0

# Functions
def write_kml_file(outFile, personTable):

    # Open output file
    output = open(outFile, 'w')

    # Using heredocs because I'm lazy. Sadly, it always destroys nice formatting
    # But saves me from having to write 50,000 different print statements
    # Write KML Header
    output.write("""\
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Router Area Coverage -- %s</name>
    <description> Brownian random walk path for one agent with router placemarks
      </description>
    """ % (outFile))


        # 45M Folder
    output.write("<Folder>\n\t<open>1</open>\n\t<name>45M Radius</name>\n")
    for personID in personTable.keys():
        # Decide if the router can detect a person
        # If it can, write the ground overlay for each radius value
        # Current radius values are: 45, 30, 15

        # Check to see if this person is a detecting agent. If not, skip.
        randNum = 0
        randNum = random.randrange(0,100)
        if randNum >= CHANCE_TO_DETECT:
            continue
        # End If

        # Loop through each round position for the peson
        for position in personTable[personID].keys():
            # Persons information
            xVal = personTable[personID][position][0]
            yVal = personTable[personID][position][1]

            # Calculate 45M Radius
            lonRadius = (1.0 / M_PER_LON) * DETECT_RADIUS
            latRadius = (1.0 / M_PER_LAT) * DETECT_RADIUS

            output.write("""\
    <GroundOverlay>
       <name>%s -- %f</name>
       <color>ff00ff00</color>
       <drawOrder>1</drawOrder>
       <TimeSpan>
            <begin>%s</begin>
            <end>%s</end>
       </TimeSpan>
       <LatLonBox>
          <north>%f</north>
          <south>%f</south>
          <east>%f</east>
          <west>%f</west>
          <rotation>0</rotation>
       </LatLonBox>
    </GroundOverlay>
            """ % (personID, DETECT_RADIUS, position, position, yVal+latRadius, yVal-latRadius, xVal+lonRadius, xVal-lonRadius))
        #End For
    # End For
    output.write("</Folder>\n")

    # Print KML Footer
    output.write(""" \
      </Document>
</kml>
    """)

    output.close()
# End writeKML File

def load_person_data(personDataFileName):
    input = open(personDataFileName, 'r')

    personPoints = {}

    for line in input.readlines():

        # Strip off any white space
        line = line.rstrip()
        line = line.lstrip()

        # Split on the comma
        splitLine = line.split(",")

        # File format of interest: entity_id, device_type, x_coord, y_coord, round
        if personPoints.get(splitLine[0]) == None:
            personPoints[splitLine[0]] = { splitLine[4] : [float(splitLine[2]), float(splitLine[3])] }
        else:
            personPoints[splitLine[0]][splitLine[4]] = [float(splitLine[2]), float(splitLine[3])]


        # end if
    # End for

    input.close()

    return personPoints
# end load_person_data




# Main
if __name__ == '__main__':

    # Local Variables
    personFile  = ""
    outFile = ""
    personTable = {}

    # Process command line arguments
    if (len(sys.argv) < 4):
        print("DataVisualizer.py [Input Router File Name] [Output File Name] [Chance to Detect*] [Cell detect radius*]")
        sys.exit(1)
    else:
        personFile = sys.argv[1]
        outFile = sys.argv[2]
        if len(sys.argv) == 4:
            CHANCE_TO_DETECT = float(sys.argv[3])

        if len(sys.argv) == 5:
            CHANCE_TO_DETECT = float(sys.argv[3])
            DETECT_RADIUS = float(sys.argv[4])
    # End If

    print("Cell Detection Percent: %f" % (CHANCE_TO_DETECT))
    print("CellDetection RadiusL %f Meters" % (DETECT_RADIUS))

    print("Loading Person File...")
    personTable = load_person_data(personFile)

    print("Writing KML File...")
    write_kml_file(outFile, personTable)

# End If


""""""

""""""

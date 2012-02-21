# Imports
import sys
import random

M_PER_LON = 111000.132
M_PER_LAT = 111000.0
CHANCE_TO_DETECT = 100.0
POLYGON_BUFFER_RANGE = 1

# Functions
def write_kml_file(outFile, routerTable):

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
    for router in routerTable:
        # Decide if the router can detect a person
        # If it can, write the ground overlay for each radius value
        # Current radius values are: 45, 30, 15

        # Router information
        xVal = router[2]
        yVal = router[3]
        name = router[0]

        # Calculate 45M Radius
        lonRadius45 = (1.0 / M_PER_LON) * 45
        latRadius45 = (1.0 / M_PER_LAT) * 45
        output.write("""\
<GroundOverlay>
   <name>%s -- 45M</name>
   <color>ff00ff00</color>
   <drawOrder>1</drawOrder>
   <LatLonBox>
      <north>%f</north>
      <south>%f</south>
      <east>%f</east>
      <west>%f</west>
      <rotation>0</rotation>
   </LatLonBox>
</GroundOverlay>
        """ % (name, yVal+latRadius45, yVal-latRadius45, xVal+lonRadius45, xVal-lonRadius45))
    # End For
    output.write("</Folder>\n")

    # 30M Folder
    output.write("<Folder>\n\t<open>1</open>\n\t<name>30M Radius</name>\n")
    for router in routerTable:
    # Decide if the router can detect a person
    # If it can, write the ground overlay for each radius value
    # Current radius values are: 45, 30, 15


        # Router information
        xVal = router[2]
        yVal = router[3]
        name = router[0]

        # Calculate 30M Radius
        lonRadius30 = (1.0 / M_PER_LON) * 30
        latRadius30 = (1.0 / M_PER_LAT) * 30


        output.write("""\
<GroundOverlay>
   <name>%s -- 30M</name>
   <color>ffff0000</color>
   <drawOrder>1</drawOrder>
   <LatLonBox>
      <north>%f</north>
      <south>%f</south>
      <east>%f</east>
      <west>%f</west>
      <rotation>0</rotation>
   </LatLonBox>
</GroundOverlay>
        """ % (name, yVal+latRadius30, yVal-latRadius30, xVal+lonRadius30, xVal-lonRadius30))
    # End For
    output.write("</Folder>\n")

    # 15M Folder
    output.write("<Folder>\n\t<open>1</open>\n\t<name>15M Radius</name>\n")
    for router in routerTable:
        # Decide if the router can detect a person
        # If it can, write the ground overlay for each radius value
        # Current radius values are: 45, 30, 15


        # Router information
        xVal = router[2]
        yVal = router[3]
        name = router[0]

        # Calculate 15M Radius
        lonRadius15 = (1.0 / M_PER_LON) * 15
        latRadius15 = (1.0 / M_PER_LAT) * 15

        output.write(""" \
<GroundOverlay>
   <name>%s -- 15M</name>
   <color>ff0000ff</color>
   <drawOrder>1</drawOrder>
   <LatLonBox>
      <north>%f</north>
      <south>%f</south>
      <east>%f</east>
      <west>%f</west>
      <rotation>0</rotation>
   </LatLonBox>
</GroundOverlay>
        """ % (name, yVal+latRadius15, yVal-latRadius15, xVal+lonRadius15, xVal-lonRadius15))
    # End For
    output.write("</Folder>\n")


    # Print KML Footer
    output.write(""" \
      </Document>
</kml>
    """)

    output.close()
# End writeKML File

def load_router_data(routerDataFileName, noPolySides, polygonPoints):
    input = open(routerDataFileName, 'r')

    routerPoints = []

    for line in input.readlines():

        # Strip off any white space
        line = line.rstrip()
        line = line.lstrip()

        # Split on the comma
        splitLine = line.split(",")

        # File format:
        # RouterID, Y Coordinate, X Coordinate, Encryption?
        # DataTable format:
        # agent_id, type_id, x_coord, y_coord, encrypted?, can_detect
        xVal = float(splitLine[2])
        yVal = float(splitLine[1])
        if is_in_bounding_polygon(xVal, yVal, noPolySides, polygonPoints) == 1:
            randNum = 0
            randNum = random.randrange(0,100)
            if randNum < CHANCE_TO_DETECT:
                routerPoints.append( [ 'b' + splitLine[0], 0, float(splitLine[2]),float(splitLine[1]),splitLine[3], '-1' ] )
        # end if
    # End for

    input.close()

    return routerPoints
# end load_router_data

# 0 Means it isn't in the polgyon
# 1 Means it is in the polygon
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

# This function loads the polygon config file and stores the number of sides
# and each point in a database.
def load_polygon_config(polygonFile):
    # Local Variables
    polygonDataPoints = []
    polygonSides = 0

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


# Main
if __name__ == '__main__':

    # Local Variables
    routerFile  = ""
    outFile = ""
    polygonFile = ""
    polySides = 0

    # Process command line arguments
    if (len(sys.argv) < 4):
        print("DataVisualizer.py [Input Router File Name] [Polygon File] [Output File Name] [Chance to Detect*]")
        sys.exit(1)
    else:
        routerFile = sys.argv[1]
        outFile = sys.argv[3]
        polygonFile = sys.argv[2]
        if(len(sys.argv) == 5):
            CHANCE_TO_DETECT = float(sys.argv[4])
    # End If

    print("Loading Polygon File...")
    (polySides, polygonPoints) = load_polygon_config(polygonFile)

    print("Router Detection Percent: %f" % (CHANCE_TO_DETECT))
    print("Loading Router File...")
    routerTable = load_router_data(routerFile, polySides, polygonPoints)

    print("Writing KML File...")
    write_kml_file(outFile, routerTable)

# End If


""""""

""""""

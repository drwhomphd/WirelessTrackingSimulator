#!/usr/bin/python

import simplegeo
import sys


key = 'VGE7WSW7nssF9qGQFTFpZHJJ6t2mPbUK'
secret = 'GJGURA9pm8VRTUbQvxDfPQjMU5BakPd7'

client = simplegeo.Client(key, secret)

days = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
times = range(1,24)

print("#day\ttime\ttrending.rank\tlocal.rank\tcity.rank\tworldwide.rank")

for day in days:
    for time in times:
        x = client.get_density(41.884163, -87.632264, day, time)
        
        for i in range(0, len(x[u'geometry'][u'coordinates'])):
            sys.stderr.write("%s,%s,100" % (x[u'geometry'][u'coordinates'][i][1], x[u'geometry'][u'coordinates'][i][0]))
            sys.stderr.write("\n")
        # End for
        
        try:
            properties = x[u'properties']
            trending = properties[u'trending_rank']
            local = properties[u'local_rank']
            city = properties[u'city_rank']
            worldwide = properties[u'worldwide_rank']
        except KeyError:
            continue
        # End try
        
        print("%s\t%d\t%d\t%d\t%d\t%d" % (day, time, trending, local, city, worldwide))
    
    # End for
# End for

 


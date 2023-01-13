# Setup ----
library(tigris)
library(sf)
library(tidyverse)

# Get state county and single county sf/data frames
# county boundaries
va <- counties(state = "51")

alb <- va %>% 
  filter(COUNTYFP == "003")

# Definitions ----
# Primary roads are generally divided, limited-access highways 
# within the Federal interstate highway system or under state 
# management. These highways are distinguished by the presence 
# of interchanges and are accessible by ramps and may include 
# some toll highways."

# Secondary roads are main arteries, usually in the U.S. highway, 
# state highway, or county highway system. These roads have one 
# or more lanes of traffic in each direction, may or may not be 
# divided, and usually have at-grade intersections with many 
# other roads and driveways.

# Get Roads ----
# primary and secondary roads: 
# can filter by state only
va_primsec_roads <- primary_secondary_roads(state = "51")

ggplot(va) + geom_sf() + 
  geom_sf(data = va_primsec_roads) 
# don't see an obvious way to limit it to particular regions
# other than using an st_intersection with the region of interest
# for example:
alb_primsec_roads <- st_intersection(va_primsec_roads, alb)

ggplot(alb) + geom_sf() + 
  geom_sf(data = alb_primsec_roads)

# All roads 
# can filter by state and county
alb_roads <- roads(state = "51", county = "003")
# the resulting data frame can be then filtered by road type

alb_roads_primary <- alb_roads %>% 
  filter(MTFCC == "S1100") # primary roads

ggplot(alb) +
  geom_sf() +
  geom_sf(data = alb_roads_primary)

alb_roads_primary_secondary <- alb_roads %>% 
  filter(MTFCC %in% c("S1100", "S1200")) # primary and secondary roads

ggplot(alb) +
  geom_sf() +
  geom_sf(data = alb_roads_primary_secondary, 
          color = "red") # make this layer a different color

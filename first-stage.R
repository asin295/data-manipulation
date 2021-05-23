library(tidyverse)
library(ggplot2)
nycbikes18_raw <- (read_csv("data/2018-citibike-tripdata.csv"))

p1 <- ggplot(data = nycbikes18_raw, aes(x = birth_year, fill = usertype)) + geom_bar(colour="white")

nycbikes18 <- nycbikes18_raw %>% filter(birth_year>1900)

ttl_tripd <- sum(nycbikes18["tripduration"])  # $tripduration

n_bikes <- length(unique(nycbikes18$bikeid))

p2 <- ggplot(data = nycbikes18, aes(x = usertype )) + geom_bar() 

p3 <- ggplot(data = nycbikes18, aes(x = gender, fill = usertype)) + geom_bar(position="dodge")

p4 <- ggplot(data = nycbikes18,aes(x = birth_year, y = tripduration)) + geom_point(size = 0.5) +  facet_grid(rows = vars(usertype), cols = vars(gender)) 
 
p5 <- ggplot(data = nycbikes18,aes(x = start_station_longitude, y = start_station_latitude)) + geom_point(aes(end_station_longitude,end_station_latitude))

p6 <- ggplot(data = nycbikes18,aes(x = start_station_longitude, 
                                   y = start_station_latitude,
                                   xend=end_station_longitude)) + 
  geom_segment(aes(x=start_station_longitude,y=start_station_latitude,xend=end_station_longitude,yend=end_station_latitude),arrow = arrow(length = unit(0.01, "npc")),alpha=0.3)
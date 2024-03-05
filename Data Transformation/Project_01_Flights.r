library(nycflights13)
library(tidyverse)

data("flights")
data("airlines")
data("planes")

view(flights)

# most flights
flights %>%
  group_by(carrier) %>%
  summarise(flight = n()) %>%
  arrange(desc(flight)) %>%
  head(5) %>%
  left_join(airlines)
  

# most fly time plane
flights %>%
  drop_na(tailnum)%>%
  group_by(tailnum) %>%
  summarise(fly_distance = sum(distance)) %>%
  arrange(desc(fly_distance))

# flight that use plane that year below 2000
flights %>%
  select(flight, carrier, tailnum) %>%
  left_join(airlines, by="carrier") %>%
  select(flight, name, tailnum) %>%
  left_join(planes, by="tailnum") %>%
  filter(year <= 2000) %>%
  arrange(year)

# count plane with each engine
flights %>%
  left_join(planes, by="tailnum") %>%
  group_by(engine) %>%
  summarise(n = n())

# most late departure delay airline
flights %>%
  left_join(airlines, by="carrier") %>%
  group_by(name) %>%
  filter(dep_delay >= 0) %>%
  summarise(late_departure_mins = sum(dep_delay)) %>%
  arrange(desc(late_departure_mins))

# Filter & Count flights
flights %>%
  filter(month == 9 , year == 2013) %>%
  count(carrier)%>%
  arrange(desc(n))%>%
  head(10)



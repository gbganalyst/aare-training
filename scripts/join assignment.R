# Class work: Relational Analysis with the NYC Flights 2013 Dataset

# install the nycflights13 package
# install.packages("nycflights13")

# call libraries
library(tidyverse)
library(nycflights13)

# insppecting the datasets

# flights dataset
flights
head(flights)
str(flights)
glimpse(flights)
names(flights)
summary(flights)
nrow(flights)

# planes datase
data(planes)
head(planes)
str(planes)
glimpse(planes)
names(planes)
summary(planes)
nrow(planes)

# running lines 17 & 26, the he common key is "tailnum". 

# inner_join
inner_info <- flights |>
  inner_join(planes, by = "tailnum")

nrow(inner_info)

## the number of row in inner_info return is 284170 and its less than flights because not all tail numbers in flights have a corresponding entry in planes.

# left_join
left_info <-
  left_join(flights, planes, by = "tailnum")

nrow(left_info)

## the number of row in left_info return is 336776 and its equal to flights because all rows from flights are included, even if there is no matching tail number in planes.

# right_join
right_info <- flights |>
  right_join(planes, by = "tailnum")

nrow(right_info)

## the number of row in right_info return is 284170 and its less than flights because not all tail numbers in flights have a corresponding entry in flights.

# full_join
full_info <- flights |>
  full_join(planes, by = "tailnum")

nrow(full_info)
## A full join combines everything, no missing value at all.


# summary table showing the number of flights per aircraft manufacturer

air_manufacturer <- left_info |>
  group_by(manufacturer) |>
  summarise(Number_of_Flights = n()) |>
  arrange(desc(Number_of_Flights)) |>
  mutate(
    manufacturer = if_else(is.na(manufacturer),
                          "Unknown", 
                          manufacturer)
    )

air_manufacturer

# top 5 manufacturers with the most flights

top_5 <-head(air_manufacturer, 5)

top_5


# bar plot showing the distribution of flights across the top five aircraft manufacturers based on your summary table
top_5 |> barplot()
barplot(top_5)








  
  
    

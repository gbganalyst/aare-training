 library(tidyverse)

mtcars 
mtcars |>
  ggplot(aes(x = disp, y = mpg)) +
  geom_point() +
  facet_wrap(~gear) +
  labs(title = "Engine Displacement vs. MPG Faceted by Gear count", x = "Displacement (cu.in)", y = "Miles per Gallon") +
  theme_bw()


diamonds |> 
  ggplot(aes(x = cut, y = carat, fill = cut)) +
  geom_col(show.legend = FALSE) +
  labs(title = "Average Carat Weight by Diamond Cut", 
       x = "Quality of cut", 
       y = "Average carat weight")
  
  
  

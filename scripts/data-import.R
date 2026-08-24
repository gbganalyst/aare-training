# Data Import

library(tidyverse)
library(readxl)
library(haven)
library(writexl)

# Flat file import

socio_data <- read_csv("data/africa_socioeconomic_indicators_2026.csv")

socio_data

View(socio_data)
class(socio_data)

write_csv(socio_data, "output/clean_socioeconomic_indicators_2026.csv")


# Spreadsheet import

diamond_vg <- read_xlsx("data/diamonds.xlsx", sheet = 3)

diamond_vg

write_xlsx(diamond_vg, "output/diamond-very-good.xlsx")



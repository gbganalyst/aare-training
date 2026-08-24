library(tidyverse)
library(bulkreadr)
library(inspectdf)


# import dataset
tv_data <- read_csv("Data/data-tv-company.csv")

# inspecting the dataset
anyNA(tv_data)
is.na(tv_data)


tv_data |> inspect_na() |> show_plot()


# Strategies to handle missing values
# use of na.omit
tv_data_omit <- na.omit(tv_data) |> inspect_cat()


# using fill_missing
tv_data_fill <- tv_data |> fill_missing_values() |> inspect_na()


# use of replace_na
tv_data |> replace_na(list(library = 99, regard = 23, views = 43 )) |>inspect_na()

# using fill_missing &select
tv_data_fill_select <- tv_data |> fill_missing_values(selected_variables = c("library", "regard", "views"), method = "median")

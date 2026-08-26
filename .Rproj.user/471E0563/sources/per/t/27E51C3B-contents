# loading ibrary

install.load::load_package(c("tidyverse", "writexl"))

# load dataset

religion_income <- read_csv("data/religion-income.csv")


# inspecting the dataset
head(religion_income)
names(religion_income)
str(religion_income)
glimpse(religion_income)
summary(religion_income)

# tidying the dataset
religion_tidy <-
  religion_income |>
  pivot_longer(
    cols = 2:11, # -religion
    names_to = "income_range",
    values_to = "count"
  )

names(religion_tidy)
head(religion_tidy)

# renaming properly
religion_clean <- religion_tidy |> 
  rename(
    Religion = religion,
    Income_Range = income_range,
    no_of_respondents = count
  )

# create summary of the dataset
religion_summary <- 
  religion_clean |>
  group_by(Income_Range) |>
  summarise(total_respondents = sum(no_of_respondents)) |>
  arrange(total_respondents) # arrange(desc(total_respondents))

religion_summary

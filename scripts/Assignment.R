
# Import the dataset

install.load::install_load()

install.load::install_load(c("dplyr", "ggplot2", "bulkreadr", "tidyr", "readr", "lubridate", "janitor", "readxl"))



med_ins <- read_xlsx("data/medical-insurance.xlsx")

# med_insav <- read_sav("data/medical-insurance.sav") ....using haven
# med_insav <- read_spss_data("data/medical-insurance.sav") ....using bulkreadr


clean_med_ins <- clean_names(med_ins)

# displaying 1st 3 rows

head(med_ins, 3)


# number of rows and columns

nrow(med_ins)
ncol(med_ins)


# columns names

names <- colnames(med_ins)


inspect_na(med_ins)


# average age of individuals in the dataset
average_age <- mean(med_ins$Age)

# range of estimated Salary in the dataset

range_salary <- range(med_ins$EstimatedSalary)

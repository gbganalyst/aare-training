
# Assignment
## Dataset: telco-customer-churn.csv

## 1) Data Import & Initial Exploration
##  •	Load the dataset
### •	Use functions such as read.csv, glimpse and summary

## call library

if (!require(pacman)) {
  install.packages("pacman")
}

pacman::p_load(tidyverse, bulkreadr, janitor, readxl, writexl)



# importing dataset and labelled as telco_data
telco_data <- read_csv("data/telco-customer-churn.csv")
head(telco_data)

## use functions such as glimse and summary
glimpse(telco_data)
summary(telco_data)

inspect_na(telco_data)

## 2) Data Transformation
## •	Recode the churn column into a binary variable where "Yes" = 1, and "No" = 0
## •	Recode the SeniorCitizen variable into a more descriptive format (e.g. "Yes" → "Senior", "No" → "non-Senior")
## •	Create a new column ServiceCount that sums the indicators (1/0) for multiple services (e.g. PhoneService, OnlineSecurity, etc.)

# these are the multiple services; PhoneService, MultipleLines, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies

# recode churn ("Yes" = 1, and "No" = 0) & recode SeniorCitizen (1 = "Senior", 0 = "non-senior")
# telco_data |> mutate(Churn= if_else(Churn=="Yes", 1, 0))


# telco_data |> mutate(SeniorCitizen = if_else(SeniorCitizen == 1, "Senior", "non-senior")) |> View()


telco_data_1 <- telco_data |>
  mutate(
    Churn = if_else(Churn == "Yes", 1, 0),
    SeniorCitizen = if_else(SeniorCitizen == 1, "Senior", "non-senior")
  )



names(telco_data_1)

# converting Yes/No to 1/0 for the multiple services
telco_data_2 <- telco_data_1 |> 
  mutate(
    PhoneService = if_else(PhoneService=="Yes", 1, 0), 
    OnlineSecurity = if_else(OnlineSecurity=="Yes", 1, 0), 
    OnlineBackup = if_else(OnlineBackup == "Yes", 1, 0), 
    DeviceProtection = if_else(DeviceProtection== "Yes", 1, 0), 
    TechSupport = if_else(TechSupport== "Yes", 1, 0), 
    StreamingTV = if_else(StreamingTV== "Yes", 1, 0), 
    StreamingMovies = if_else(StreamingMovies== "Yes", 1, 0)
  )


# create a new column ServiceCount
telco_data_clean <- telco_data_2 |> 
  mutate(ServiceCount = PhoneService + OnlineSecurity +  OnlineBackup + DeviceProtection + TechSupport + StreamingTV + StreamingMovies) 

glimpse(telco_data_clean)

summary(telco_data_clean)

# GBG Version

telco_data_2. <- 
  telco_data_1 |> 
   mutate(
     ServiceCount = 
       (PhoneService == "Yes") +
       (OnlineSecurity == "Yes") +
       (OnlineBackup == "Yes") +
       (DeviceProtection == "Yes") +
       (TechSupport == "Yes") +
       (StreamingTV == "Yes") +
       (StreamingMovies == "Yes"
        )
   )



## 3) Grouping & Summarisation
## •	Use group_by() and summarise() to calculate the churn rate for key segments (e.g. by Contract, InternetService)

# churn rate by contract
telco_by_contract <- telco_data_clean |>
  group_by(Contract) |>
  summarise(
    churn = sum(Churn, na.rm = TRUE),
    churn_rate = mean(Churn) * 100
  )


# churn rate by Internet Service
telco_by_inter <- telco_data_clean |>
  group_by(InternetService) |>
  summarise(
    churn = sum(Churn),
    churn_rate = mean(Churn) * 100
  )



# churn rate by both contract and Internet Service

telco_by_contract_internet <- telco_data_clean |> group_by(Contract, InternetService) |> summarise(churn = sum(Churn, na.rm = TRUE), churn_rate = mean(Churn)*100)


# Calculate the overall churn rate 
overall_churn <- telco_data_clean |> 
  summarise(total_churn = sum(Churn), churn_rate = mean(Churn)*100)

# churn rate for each Contract type
contract_churn <- telco_data_clean |> 
  group_by(Contract) |> 
  summarise(count = n(), churn = sum(Churn), churn_rate = mean(Churn)*100)


# Summary statistics for internetservices (count, Average monthly charges, Average tenure)

summary_internet <- telco_data_clean |> group_by(InternetService) |> summarise( ave_monthly_charges = mean(MonthlyCharges, na.rm = TRUE), ave_tenure = mean(tenure, na.rm = TRUE))


# Use across() to summarise monthly charges for both genders in one concise step

gender_summary <- telco_data_clean |>
  summarise(
    across(
      MonthlyCharges,
      list(
        Mean = ~ mean(.x, na.rm = TRUE),
        Median = ~ median(.x, na.rm = TRUE),
        Minimum = ~ min(.x, na.rm = TRUE),
        Maximum = ~ max(.x, na.rm = TRUE)
      )
    ),
    .by = gender
  )

telco_data_clean |>
  group_by(gender) |>
  summarise(
    mean_charges = mean(MonthlyCharges, na.rm = TRUE),
    median_charges = median(MonthlyCharges, na.rm = TRUE),
    min_charges = min(MonthlyCharges, na.rm = TRUE),
    max_charges = max(MonthlyCharges, na.rm = TRUE)
  )

## group_by() and summarise() combo

## summarise(.by) 



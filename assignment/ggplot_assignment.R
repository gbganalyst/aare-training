# ggplot assignment

library(tidyverse)
library(bulkreadr)
library(readxl)

# Read the heart dataset
# heart <- read_excel_workbook("data/heart.xlsx")
heart <- read_xlsx("data/heart.xlsx", sheet = "heart")

# exploring the dataset
glimpse(heart)
str(heart)
nrow(heart)
ncol(heart)
names(heart)

# Set smoking_status as a factor to reflect the 5 categories
heart <- heart %>%
  mutate(
    Smoking_Status = factor(
      Smoking_Status,
      levels = c(
        "Non-smoker",
        "Light (1-5)",
        "Moderate (6-15)",
        "Heavy (16-25)",
        "Very Heavy (> 25)"
      )
    )
  )


# Remove missing value in smoking_status
# and calculate mean_age at death by smoking status and sex
heart_after_filtering <- heart |> 
  drop_na(Smoking_Status)  |> 
  #group_by(Smoking_Status, Sex)  |> 
  summarise(
    mean_age_at_death = mean(AgeAtDeath, na.rm = TRUE),
    .by = c("Smoking_Status", "Sex")#,.groups = "drop"
  ) #|> ungroup()  



# 4. Create the requested horizontal bar chart
heart_after_filtering |> 
  ggplot(
  aes(
    x = mean_age_at_death,
    y = Smoking_Status,
    fill = Smoking_Status
  )
) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ Sex) +
  labs(
    title = "Average Age at Death by Smoking Status and Sex",
    x = "Average Age at Death (Years)",
    y = "Smoking Status",
    fill = "Smoking Status"
  ) +
  theme_bw() 



# Display chart
print(plot_of_heart_data)

# Save chart as PNG
ggsave(
  filename = "heart_smoking_age_at_death.png",
  plot = plot_of_heart_data,
  width = 12,
  height = 6,
  dpi = 300,
  path = "output"
)

# Save chart as PDF
ggsave(
  filename = "heart_smoking_age_at_death.pdf",
  plot = plot_of_heart_data,
  width = 12,
  height = 6,
  path = "output"
)

# Save chart as jpg
ggsave(
  filename = "heart_smoking_age_at_death.jpg",
  plot = plot_of_heart_data,
  width = 12,
  height = 6,
  path = "output"
)

# Save chart as jpeg
ggsave(path = "output",
  filename = "heart_smoking_age_at_death.jpeg",
  plot = plot_of_heart_data,
  width = 12,
  height = 6
)


# Short Explanation

# The analysis examined the relationship between smoking status, sex, and mean age at death. Records with missing smoking status were removed, and participants were grouped by smoking category and sex. The mean age at death was then calculated for each group. A horizontal bar chart was used, with smoking categories on the y-axis and mean age at death on the x-axis, while separate panels compared females and males.

# Summary

# The results show that heavier smoking is generally associated with a lower average age at death. Non-smokers had the highest averages for both females (73.95 years) and males (73.48 years). Among females, the average declined to around 67 years for moderate to very heavy smokers. Among males, the decline was more pronounced, reaching 65.15 years for very heavy smokers—about 8.33 years below male non-smokers. Overall, the findings suggest a stronger negative relationship between heavy smoking and age at death among males.


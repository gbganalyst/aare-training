# Aare Programming Training with GBG Analytics

We discussed R programming training with GBG Analytics. The training will use a lab-based approach, focusing on practical learning and hands-on exercises.

The topics to cover include the following:

- *Introduction to R programming*

- R - Interface/several way to install package

- *Data manipulation and cleaning*

  - Using dplyR
  - using tidyR
  - *Data Merging and joining datasets*

- *Data visualization*

  - *using ggplot2*
  - *using plotly*
  - *using base R*
  - tidyplot

- Reproducible

  - *Markdown*
  - *Git and GitHub*
  - Quarto
    - Understanding Quarto
    - output - PDF, powerpoint, HTML
    - How to build website

- Statistics

- Shinyapp - Introductory

## 1. Introduction to R programming

R is a programming language used mainly for statistical computing, data analysis, and visualisation. It is widely used by statisticians, researchers, and data scientists to analyse different types of data. R provides tools for data cleaning, manipulation, statistical modelling, and graphical presentation. Packages such as dplyr and ggplot2 extend R's capabilities for data manipulation and visualisation. R is a powerful, flexible, and open-source tool for transforming raw data into meaningful insights. These I learn with GBGanalytics

## 2. R - Interface/several ways to install packages

R can be used through interfaces such as the **R Console, RStudio, and other IDEs**. There are 4 panes in RStudio namely

1.  **Source Pane** used to write, edit, and save R scripts and other code.

2.  **Console Pane** used to execute R commands and display results.

3.  **Environment/History Pane** shows stored objects, datasets, variables, and previously executed commands.

4.  **Files/Plots/Packages/Help/Viewer Pane** used to manage files, view graphs, manage packages, access documentation, and display outputs.

R packages can be installed through `install.packages("package_name")`, after installation, a package is loaded using `library(package_name)`.\

## 3. Data manipulation and cleaning

Data manipulation and cleaning involves *preparing raw data for accurate analysis.* This includes identifying and handling missing values, duplicates, errors in data. dplyr provides functions for filtering, sorting, selecting, renaming, and transforming variables.\
The **`dplyr`** package offers functions such as `filter()`, `select()`, `mutate()`, and `summarise()`, while `tidyr` package offers functions such as `pivot_longer()`, `pivot_wider()`, `replace_na()`, and `drop_na()`. Missing values can be detected with functions such as `is.na()` and treated before analysis. Data cleaning improves **d**ata quality, and the accuracy of statistical results.

#### *Data Merging and joining datasets*

Data merging and joining is combining two or more datasets using common variables, ID, or keys, such as an ID or name. Base R provides the **`merge()`** function for combining datasets. The **`dplyr`** package provide robust functions such as `inner_join()`, `left_join()`, `right_join()`, and `full_join()`. An inner join keeps matching records, while a left or right join retains all records from the selected dataset. A full join retains all observations from both datasets, including unmatched records. These help integrate information from different sources for more complete and meaningful analysis.

## 4. Data visualisation

Data visualization in R is the graphical presentation of data to make patterns, trends, relationships, and differences easier to understand. In the training, there four ways to be discussed, only two has been discussed so far. The Base Graphics and **`ggplot2`** for creating effective visualisations.

In base `R` approach, there is no dependency, it's quick and simple and full control , chart can also be customised in using base `R` graphic. In the `ggplot 2` package. Grammar of graphic language is compulsory using `ggplot 2` package in `R`. This grammar makes life very easy and sweet. There are about 9 components of this grammar namely

- Data

- aesthetics

- geometric object

- statistical transformations

- scales

- coordinate system

- facets

- themes

- labels

Charts can be expressed through

1.  Univariate analysis
2.  Bivariate analysis
3.  Multivariate analysis

few of the types:

- **Bar chart** – compares categories.

- **Histogram** – displays the distribution of continuous data.

- **Boxplot** – shows distribution, spread, and possible outliers.

- **Scatter plot** – for relationships between two numerical variables.

- **Line chart** – displays trends or changes over time, displaying progression changes.

- **Pie chart** – shows proportions or percentages of a whole.

------------------------------------------------------------------------

##### **Under this heading we are yet to discuss `plotly` and `tidyplot`**

------------------------------------------------------------------------

## 5. Reproducible

Reproducibe means ensuring that data analysis can be repeated by another person and produce the same results this involves keeping the data, code, packages, and analytical procedures clearly organised and documented. Reproducible analysis improves transparency, reliability, collaboration, and verification of research findings.

Under this topic, three concept will be teached or discussed.

- Markdown

- git and github

- quarto

#### Markdown

Markdown is an easy way for non coders to write in a format that could be easily converted into HTML, PDF and WORD.

it make use of `#` for headings

\*\*\_\*\* for bold text

\*\_\* italic text

\*\*\*\_ \*\*\* for bold and italic

\>for blockqoute

and several ones.

#### git and github

Git is a version-control system used to track changes made to files, code, and data-analysis projects over time. It allows users to save different versions of their work, correct mistakes, and collaborate effectively.

GitHub is an online platform for storing and sharing Git repositories. It enables collaboration, project management, code review, and backup of projects.

Key functions include:

- **init -** is a Git command used to initialize a new Git repository in an existing project or folder.

- **commit** – saves changes to a project.

- **Push** – sends local changes to GitHub.

- **Pull** – retrieves changes from GitHub.

- **Clone** – creates a local copy of a repository.

- **Branch** – allows development of changes without affecting the main project.

#### **Quarto**

1.  Understanding Quarto
2.  output - PDF, powerpoint, HTML
3.  How to build website

------------------------------------------------------------------------

##### **Not yet done**

------------------------------------------------------------------------

## 6. Statistics

------------------------------------------------------------------------

##### **Not done yet**

------------------------------------------------------------------------

## 7. Shinyapp - Introductory

------------------------------------------------------------------------

##### **yet to be done**

------------------------------------------------------------------------

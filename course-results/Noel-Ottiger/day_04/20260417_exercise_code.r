############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################
rm(list=ls())

# Load required libraries
library(tidyverse)

# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))
data(iris)

# ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
class(iris)

# Display the first 6 rows
# HINT: Use the `head()` function
head(iris) # data.frame

# Get a summary of the dataset (mean, min, max, etc.)
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)
str(iris)


# ---------------------------
# Question
# ---------------------------

# Q: What is different about the Species column compared to the others?
# A: Species is the only factor column, all the others are numeric

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species) # factor

# What are the levels (categories) of Species?
levels(iris$Species) #  "setosa", "versicolor", "virginica"

# What is a factor in R?

# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length

# Q: What type of data is stored in x?
# A: List of petal width values
ggplot(data.frame(x), aes(x = x)) +
  geom_histogram(bins = 30) +
  labs(title = "Distribution of Petal Widths",
       x = "Width [cm]",
       y = "Frequency") +
  theme_bw()

# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length
plot(x, y, xlab = "Petal Width", ylab = "Petal Length", main = "Petal Width vs Petal Length")
abline(lm(y ~ x), col = "blue", lwd = 2)

# Q: What relationship do you observe?
# A: Linear relationship between petal length and width, i.e with increasing petal length,
#   the petal width does also increase (and vice versa)

## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(Sepal.Length ~ Species, data = iris, xlab = "Species", ylab = "Sepal Length", main = "Sepal Length by Species")

# Get the row where max(iris$Sepal.Length) is
iris[which.max(iris$Sepal.Length),]

iris %>%
  group_by(Species) %>%
  summarise(mean_sepal_length = mean(Sepal.Length))

# Q: Which species has the largest values?
# A: virginica has the highest values for sepal length, with the max being 7.9 and the means being:
#
#    Species    mean_sepal_length
#    <fct>                  <dbl>
#  1 setosa                  5.01
#  2 versicolor              5.94
#  3 virginica               6.59

# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2
# ---------------------------

# first install package ggplot2 and then Load ggplot2
# install.packages("ggplot2")
library(ggplot2)

# Scatter plot with color by species
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point() +
  labs(title = "Petal Width vs Petal Length", x = "Petal Width", y = "Petal Length")

# Boxplot using ggplot2
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Length by Species", x = "Species", y = "Sepal Length")

# ---------------------------
# 7. Extra Practice
# ---------------------------

# Compute mean Petal Length for each species
iris %>%
  group_by(Species) %>%
  summarise(mean_sepal_length = mean(Petal.Length))

#   Species    mean_sepal_length
#   <fct>                  <dbl>
# 1 setosa                  1.46
# 2 versicolor              4.26
# 3 virginica               5.55

# Compute correlation between Petal Length and Width
cor(iris$Petal.Length, iris$Petal.Width) # 0.9628654

# How would you visualize this relationship? # Scatterplot with trendline
# What type of plot would you choose? # geom_point()
# Can you add a trend line? # geom_smooth()

ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(aes(color = Species)) +
  geom_smooth(method = "lm", se = TRUE, color = 'orange', fill = 'orange', alpha = 0.2) +
  labs(title = "Petal Width vs Petal Length with Trend Line", x = "Petal Width", y = "Petal Length")

############################################################
# End of Exercise
############################################################
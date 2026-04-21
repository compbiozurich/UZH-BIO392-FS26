############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))
# library(readr)
# library(dplyr)
# library(tidyverse)
library(ggplot2)
library(datasets)
  
  
  # ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
class(iris)
# a dataframe
  
# Display the first 6 rows
# HINT: Use the `head()` function
head(iris)

# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)
str(iris)


  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?
# It's a factor/string value instead of numeric

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species #factor
class(iris$Species)
  
# What are the levels (categories) of Species?
levels(iris$Species) # "setosa" "versicolor" "virginica" 
  
# What is a factor in R? Used to represent a categorical variable (eg. 1/2/3, or "setosa"/"versicolor"/"virginica" )
  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x? numeric data
    
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(alpha = 0.6, size = 2) +
  labs(x = "Petal Width", y = "Petal Length", title = "Petal Width vs Petal Length")

# What relationship do you observe?
lm(y ~ x)

# Linear with intercept 1.084, and slope 2.230
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot() +
  labs(x = "Species", y = "Sepal Length", title = "Boxplot of Sepal Length")
    
# Which species has the largest values? virginica
    
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
library(ggplot2)
    
# Scatter plot with color by species

ggplot(iris, aes(x = Petal.Width, y = Petal.Length, col = Species)) +
  geom_point(alpha = 0.6, size = 2) +
  scale_color_manual(values = c("seagreen", "slateblue", "skyblue")) +
  labs(x = "Petal Width", y = "Petal Length")
#  geom_smooth(method = "lm")


# Boxplot using ggplot2
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot()
    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
aggregate(Petal.Length ~ Species, data = iris, mean)


# Compute correlation between Petal Length and Width
cor(iris$Petal.Length, iris$Petal.Width)
  
# How would you visualize this relationship?
# What type of plot would you choose? With a scatterplot
# Can you add a trend line?
ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(data = iris, method = "lm")+
  labs(x = "Petal Width", y = "Petal Length")
  
  

  
############################################################
# End of Exercise
############################################################
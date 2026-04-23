############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))
???
  
  
  # ---------------------------
# 2. Explore the Data
# ---------------------------
library(datasets)
# Display the dataset
iris

# What is the data type of iris?
class(iris)
#data.frame

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
#species -> factor
#other columns -> numeric

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species)
#factor
  
# What are the levels (categories) of Species?
levels(iris$Species)
#"setosa"     "versicolor" "virginica" 


  
# What is a factor in R?
# a factor is a categorical variable.
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x?
class(x)
#numeric   
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(x, y)

# What relationship do you observe?
#positive correlation, when petal width increases petal length increases as well
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(iris$Sepal.Length ~ iris$Species)
    
# Which species has the largest values?
#virginica

# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
library(ggplot2)
    
# Scatter plot with color by species
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point()

# Boxplot using ggplot2
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot()
    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
library(dplyr)

iris %>%
  group_by(Species) %>%
  summarise(mean_petal_length = mean(Petal.Length))


# Compute correlation between Petal Length and Width
cor(iris$Petal.Length, iris$Petal.Width)
  
# How would you visualize this relationship?
plot(iris$Petal.Length, iris$Petal.Width)
# What type of plot would you choose?
#scatterplot
# Can you add a trend line?
abline(lm(iris$Petal.Width~iris$Petal.Length),
       col="blue", lwd=2)
  
############################################################
# End of Exercise
############################################################
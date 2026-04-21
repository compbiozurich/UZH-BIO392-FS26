############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))
library(datasets)

  
  # ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
class(iris)
  
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
## Species shows strings, whereas all other columns show numbers.  

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species)
  
# What are the levels (categories) of Species?
levels(iris$Species)
  
# What is a factor in R?
## A factor in R is a variable that has different levels, that can be used 
## to have categories to group your variables. 
  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x?
class(x)  
## numeric 
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(x,y, xlab = 'Pethal Width', ylab = 'Petal Length', 
     main = 'Relationship between petal width and length')

# What relationship do you observe?
## I observe a positive relationship, as the width of the petal increases, also the length does. 
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(Sepal.Length ~ Species, data = iris, 
        main = 'Sepal length by species', 
        col = c('lightpink', 'skyblue', 'lightgreen'))
    
# Which species has the largest values?
## virginica has the largest values.    
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
install.packages("ggplot2")
library(ggplot2)    

# Scatter plot with color by species
ggplot(data = iris, mapping = aes(x = Petal.Width, y = Petal.Length, col = Species)) +
  geom_point(size = 2) + 
  labs(title = 'Relationship between petal width and length', x = 'Pethal Width', y = 'Petal Length' ) +
  theme_bw()


# Boxplot using ggplot2
ggplot(data = iris, mapping = aes(Species, Sepal.Length, col = Species)) + 
  geom_boxplot() +
  labs(title = 'Sepal length by species', x = 'Species', y = 'Sepal Length') +
  theme_bw()
    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
library(dplyr)
iris %>% group_by(Species) %>% summarise(mean_petal_length_species = mean(Petal.Length))


# Compute correlation between Petal Length and Width
cor(iris$Petal.Length, iris$Petal.Width)
  
# How would you visualize this relationship?
# What type of plot would you choose?
# Can you add a trend line?
ggplot(data = iris, mapping = aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(size = 2, aes(color = Species)) + 
  labs(title = 'Relationship between petal width and length', x = 'Pethal Width', y = 'Petal Length' , 
       subtitle = paste('Correlation:', round(cor(iris$Petal.Length, iris$Petal.Width), 3))) +
  theme_bw() + 
  geom_smooth(position = 'identity', method = 'lm', linetype = "dashed", color = 'black')
  
############################################################
# End of Exercise
############################################################
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
data(iris)
View(iris)

# What is the data type of iris?
class(iris)
typeof(iris)
  
# Display the first 6 rows
# HINT: Use the `head()` function
head(iris, 6)

# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)  
str(iris)

  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?
class(iris$Species)
class(iris$Sepal.Length)
class(iris$Sepal.Width)
class(iris$Petal.Length)
class(iris$Petal.Width)
# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species)
  
# What are the levels (categories) of Species?
levels(iris$Species)
  
# What is a factor in R?
  #a factor in R is a category with defined values
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x?
class(x)
    
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(x,y)

# What relationship do you observe?
#a positive relationship
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(Sepal.Length ~ Species,
        data = iris,
        col = c("lightblue", "lightgreen", "lightpink"),
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length")
    
# Which species has the largest values?
#virginica
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
install.packages('ggplot2')
library(ggplot2)
    
# Scatter plot with color by species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2)


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
# What type of plot would you choose?
# Can you add a trend line?
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Petal Length vs Width by Species",
    x = "Petal Length",
    y = "Petal Width"
  )
  
############################################################
# End of Exercise
############################################################
############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################

# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))
data("iris")
  
  
  # ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
class(iris)
#it is a data frame
  
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
#It is a factor variable, while the other columns are numerical variables.

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species)
  
# What are the levels (categories) of Species?
levels(iris$Species)
#"setosa"     "versicolor" "virginica" 
  
# What is a factor in R?
  #It a type of categorical variable. Typically use for grouping when modelling or plotting graphs.

# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Length
y <- iris$Petal.Width
    
# What type of data is stored in x?
  class(x)
  #numeric
    
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

 
## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(x,y, xlab ="Petal Length", ylab = "Petal Width" ,pch = 20)

# What relationship do you observe?
#It looks like there are 2 groups (probably different species - knowing we have factor called species with 3 levels, there are 3 actually species involved). 
#Even though 
  
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(x ~ iris$Species, xlab= "Species", ylab="Petal Length")
    
# Which species has the largest values?
  #Virginica species has the largest values.
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
  library(ggplot2)
    
# Scatter plot with color by species
  ggplot(iris, aes(x=x,y=y, color = Species))+
  geom_point()+
  xlab("Petal Length")+
  ylab("Petal Width")


# Boxplot using ggplot2
  ggplot(iris,aes(x=Species,y=x))+
    geom_boxplot()+
    ylab("Petal Length")
    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
  tapply(iris$Petal.Length, iris$Species, mean)


# Compute correlation between Petal Length and Width
cor(iris$Petal.Length,iris$Petal.Width, method="pearson")
  
# How would you visualize this relationship?
# What type of plot would you choose?
# Can you add a trend line?
ggplot(iris, aes(x=x,y=y, color = Species))+
  geom_point()+
  xlab("Petal Width")+
  ylab("Petal Length")+
  geom_smooth(method = "lm", se = FALSE, color = "black", lwd = 1)
  
############################################################
# End of Exercise
############################################################
############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))
library(datasets)
library(ggplot2)
  
# ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
typeof(iris)
#The datatype is a list
  
# Display the first 6 rows
# HINT: Use the `head()` function
head(iris,6)

# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)  
str(iris)
  
# ---------------------------
# Question
# ---------------------------


# What is different about the Species column compared to the others?
"The species column are factors with 3 levels: setosa, versicolor, virginica while the other columsn are just numbers"
# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
typeof(iris$Species)
  
# What are the levels (categories) of Species?
levels(iris$Species)
  
# What is a factor in R?
# Answer: Factors in R are a specialized data structure used to handle categorical variables or nominal data. They store distinct values (levels) as a vector of integers with corresponding character labels.
  
  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x?
typeof(x)
# The type is integer
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(iris$Petal.Length ~ iris$Petal.Width,
     xlab = "Petal Width",
     ylab = "Petal Length",
     col = iris$Species)




# What relationship do you observe?
#Answer: There is a clear positive relationship between petal width and petal length: flowers with wider petals tend to also have longer petals.
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(Sepal.Length ~ Species, data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length")
    
# Which species has the largest values?
# Asnwer: The species with the largest value is Virginica
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
install.packages(ggplot2)
library(ggplot2)
    
# Scatter plot with color by species
ggplot(iris, aes(x, y, color = Species)) +
  geom_point() +
  labs(
    title = "Petal Width vs Petal Length",
    x = "Petal Width",
    y = "Petal Length",
    color = "Species"
  )


# Boxplot using ggplot2
ggplot(iris, aes(x, y, color = Species)) +
  geom_boxplot() +
  labs(
    title = "Petal Width vs Petal Length",
    x = "Petal Width",
    y = "Petal Length",
    color = "Species"
  )

    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
aggregate(Petal.Length ~ Species, data = iris, mean)


# Compute correlation between Petal Length and Width
cor(iris$Petal.Width, iris$Petal.Length)
  
# How would you visualize this relationship?
# What type of plot would you choose?
# Can you add a trend line?
ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(aes(color = Species))+
  geom_smooth(method = "lm", se = FALSE, color="black") +
  labs(
    title = "Petal Width vs Petal Length",
    x = "Petal Width",
    y = "Petal Length",
    color = "Species"
  )
  
############################################################
# End of Exercise
############################################################
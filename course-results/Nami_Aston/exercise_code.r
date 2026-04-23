############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


# ---------------------------
# 1. Load the Data

library(datasets)
data("iris")
iris

# ---------------------------

# Load the built-in datasets package ((it's built into R, so no need to install it))

  data(iris)
  
  # ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris? data frame 

class(iris)
  
# Display the first 6 rows
# HINT: Use the `head()` function
head(iris)

# Getiris# Get a summary of the dataset (mean, min, max, etc.)  

summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)  


str(iris)
dim(iris)
  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others? it is factor, not continuous numerical values. 

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species (factor)
class(iris$Species)
  
# What are the levels (categories) of Species? setosa, versicolor, and virginica
levels(iris$Species)
  
# What is a factor in R? is used to represent categorical data (labels, categories) 
  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables 
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x? numeric 
class(x)
class(y)
    
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  

plot(x,y)
#or (more detailed)
plot(x, y,
     main = "Petal Width vs Petal Length",
     xlab = "Petal Width",
     ylab = "Petal Length",
     pch = 19,
     col = "red")

# What relationship do you observe? y= 1.08 + 2.23x, a linear relationship 

fit <- lm(y~x, data=iris)
summary(fit)

    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species

boxplot(Sepal.Length~Species, data=iris,
        main="Sepal Length by Species")
    
# Which species has the largest values? virginica 
    
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
install.packages("ggplot2")
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
    

# Compute mean Petal Length for each species (setosa = 1.462, versicolor = 4.260, virginica = 5.552 )
aggregate(Petal.Length ~ Species, data = iris, mean)


# Compute correlation between Petal Length and Width (Pearson's Correlation Coefficient: ~0.9629)

cor(iris$Petal.Length, iris$Petal.Width)
  
# How would you visualize this relationship? highly positively correlated, meaning that the longer the petal, the wider it is too. (longer petals tend to also be wider) 
# What type of plot would you choose? scatter plot (continuous, can visualize a regression better if needed)

a<-iris$Petal.Length
b<-iris$Petal.Width

plot(a,b,
     main="Petal length vs Petal width",
     xlab= "Petal length",
     ylab= "Petal width",
     col="blue",
     )

# Can you add a trend line? linear regression given that Pearsons Coefficient is 0.96
fit1 <- lm(b~a, data=iris)
summary(fit1)
abline(fit1, col="pink",lwd=2)
  
############################################################
# End of Exercise
############################################################

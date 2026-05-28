############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################

# ---------------------------
# 1. Load the Data
# ---------------------------

df <- iris

# Load the built-in datasets package ((it's built into R, so no need to install it))
library(base)
library(ggplot2)
library(lattice)
  
  
# ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
class(df)
  
# Display the first 6 rows
# HINT: Use the `head()` function
head(df,6)

# Get a summary of the dataset (mean, min, max, etc.)  
summary(df)

# Show the structure of the dataset (data types, number of rows/columns)  
dim(df)
for (i in 1:length(df)) {
  print(class(df[1,i]))
}
str(df)
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?
# A: The species column is a qualitative factor type, containing strings that 
# categories the entries based on species name, rather than a numerical 
# quantitative data like the rest of the columns in the data set

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(df$Species)
  
# What are the levels (categories) of Species?
levels(df$Species)
  
# What is a factor in R?
  
# A: A factor is a variable that serves as a qualitative descriptor of data

# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- df$Petal.Width
y <- df$Petal.Length
    
# What type of data is stored in x?
   
class(x)
# A: numeric data, as it is a vector of values for petal width
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(x = x, y = y, main = "Relationship between petal width and petal length",
     xlab = "Petal width", ylab = "Petal length")

# What relationship do you observe?
# A: Petal length increases tends to increase with higher petal width
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
plot(x = df$Species, y = df$Sepal.Length, xlab = "Species", ylab = "Sepal length", main = "Sepal length by species")
    
# Which species has the largest values?

# A: Virginica
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
install.packages("ggplot2")
library(ggplot2)
    
# Scatter plot with color by species
colormap = c("setosa" = "coral", "versicolor" = "green", "virginica" = "purple")
plot(x = x, y = y, main = "Relationship between petal width and petal length", xlab = "Petal width", ylab = "Petal length", col = colormap[df$Species])


# Boxplot using ggplot2
boxplot(df)

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
tapply(df$Sepal.Length, INDEX=df$Species, FUN=mean)

# Compute correlation between Petal Length and Width
cor.test(df$Sepal.Length, df$Sepal.Width)
  
# How would you visualize this relationship?
# A: By plotting the two data - width and length - against each other
# What type of plot would you choose?
# A: Scatter plot
# Can you add a trend line?
# A: Yes, using the abline() function:
plot(df$Sepal.Length, df$Sepal.Width, pch=20, xlab = "Sepal length", ylab = "Sepal width", main = "Correlation between sepal width and legnth")
abline(lm(df$Sepal.Width ~ df$Sepal.Length), col="red", lwd = 2)

############################################################
# End of Exercise
############################################################
############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


# ---------------------------
# 1. Load the Data
# ---------------------------

library(ggplot2)
library(tidyverse)


# Load the built-in datasets package ((it's built into R, so no need to install it))
data(iris)
  
  
# ---------------------------
# 2. Explore the Data
# ---------------------------

# Display the dataset
iris

# What is the data type of iris?
class(iris)

## Iris is a dataframe

# Display the first 6 rows
# HINT: Use the `head()` function
head(iris,6)

# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)  
str(iris)

## Sepal and Petal width/length are numerical
## Species is a factor
## There are 150 rows (observations) and 5 columns (variables)
  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?

## The species column contains the name of the species: setosa, versicolor, virginica
## It has the datatype "factor" with 3 levels, and is not numerical like the others

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species)
  
## Class of Species is "factor"

# What are the levels (categories) of Species?
levels(iris$Species)

## setosa, versicolor, virginica
  
# What is a factor in R?

## A factor in R represents a categorical variable, whose possible values are the different levels
## It can only take the values of the different levels/categories and stores the values as integers
## This makes it different from the "character" datatype (plain text)
## If text is stored as a factor, it can be used in statistical analysis

  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
petal_width <- iris$Petal.Width
petal_length <- iris$Petal.Length
    
# What type of data is stored in x?
class(petal_width)
class(petal_length)

## Both x and y (petal width and length) are numeric
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  

plot(petal_width, petal_length, main ="Scatterplot of Petal Width and Length", xlab= "Petal Width", ylab="Petal Length")

# What relationship do you observe?

## There is a potentially linear relationship between petal length and petal width
## Petal length increases with Petal width
## But at high petal width, there is more of a curve => before doing linear regression,
## I would check if the assumptions for it are truly met
## There is a group of values that have both a smaller petal length and width than the others 
## and are separated from the other values => potentially a certain species


    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species

boxplot(iris$Sepal.Length~iris$Species, main="Boxplot of Sepal Length by Species",xlab="Species", ylab="Sepal Length")

    
# Which species has the largest values?

## Virginica, followed by versicolor and then setosa
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
    
# Scatter plot with color by species
ggplot(data=iris, aes(x=Petal.Width,y=Petal.Length,colour=Species))+
  geom_point()+
  ylab("Petal Length")+
  xlab("Petal Width")+
  ggtitle("Scatterplot of Petal Width and Length")+
  theme(plot.title = element_text(hjust = 0.5))

## Here we see a clear distinction of the Petal Size according to the species


# Boxplot using ggplot2
ggplot(data=iris, aes(y=Sepal.Length,x=Species))+
  geom_boxplot()+
  ylab("Sepal Length")+
  xlab("Species")+
  ggtitle("Boxplot of Sepal Length by Species")+
  theme(plot.title = element_text(hjust = 0.5))
    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
for (species in unique(iris$Species)){
  species.df <- filter(iris, Species==species)
  mean.pl <- mean(species.df$Petal.Length)
  print(paste("The mean petal length of", species, "is", mean.pl))
}


# Compute correlation between Petal Length and Width
m1 <- lm(Petal.Length~Petal.Width, data=iris)
summary(m1)
cor(iris$Petal.Length,iris$Petal.Width)
## There is a statistically significant linear relationship between petal length and 
## petal width (p < 2e-16, adj. R squared = 0.93)
## The correlation is 0.96.

# How would you visualize this relationship?
# What type of plot would you choose?
# Can you add a trend line?

## I would visualise this with a scatterplot of Petal Length against Petal Width with the regression line

# Trend line in ggplot
ggplot(data=iris, aes(x=Petal.Width,y=Petal.Length))+
  geom_point()+
  ylab("Petal Length")+
  xlab("Petal Width")+
  ggtitle("Scatterplot of Petal Length and Width")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_smooth(method="lm", aes(colour="Regression Line"))+
  scale_colour_manual(name="legend", values=c("steelblue"))+
  theme(legend.position="bottom")

# Alternative with the calculated trend line in base R
plot(petal_width,petal_length, main="Scatterplot of Petal Length and Width",xlab="Petal Width",ylab="Petal Length")
abline(m1)

############################################################
# End of Exercise
############################################################
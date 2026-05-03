############################################################
# R Basics Exercise
# Goal: Practice data exploration and visualization
############################################################


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
head(iris) 

# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)  
str(iris)


# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?
# the species column is categorical 
# while the other columns are numeric/ continuous

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(iris$Species)

# What are the levels (categories) of Species?
levels(iris$Species)

# What is a factor in R?
# it is a datatype for categorical data. It saves memory and enables grouping in plots and models. 

# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length

# What type of data is stored in x?
class(x) #numeric


# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
plot(x, y, 
     xlab= "Petal Width",
     ylab="Petal Length", 
     col= iris$Species,
     pch=19)
legend("topleft", legend=levels(iris$Species), 
       col=1:3, pch=19)

# What relationship do you observe?
# a strong positive correlation: the wider petals are also longer
# and the species cluster together

## 5b. Box plot

# Create a boxplot of Sepal Length by Species
boxplot(Sepal.Length ~ Species, data=iris,
        xlab="Species", 
        ylab="Sepal Length", 
        main="Sepal Length by Species",
        col=c("violet", "pink", "orange"))

# Which species has the largest values?
# virginica


# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------

# first install package ggplot2 and then Load ggplot2
install.packages("ggplot2")
library(ggplot2)
  
  # Scatter plot with color by species
ggplot(iris, aes(x=Petal.Width, y=Petal.Length, color=Species)) +
  geom_point(size=2) +
  scale_color_manual(values = c(
    "setosa"= "lightslateblue",
    "versicolor"="gold1",
    "virginica"= "orchid1"
  )) +
  labs(title="Petal Width vs Petal Length",
    x="Petal Width", y="Petal Length")
  
  
  # Boxplot using ggplot2
ggplot(iris, aes(x=Petal.Width, y=Petal.Length, color=Species)) +
  geom_boxplot() +
  scale_color_manual(values = c(
    "setosa"= "lightslateblue",
    "versicolor"="gold1",
    "virginica"= "orchid1"
  )) +
  labs(titel="Petal Width vs Petal Length",
       x="Petal Width", y="Petal Length")
  
  
  # ---------------------------
# 7. Extra Practice
# ---------------------------


# Compute mean Petal Length for each species
tapply(iris$Petal.Length, iris$Species, mean)

#setosa: 1.462, versicolor: 4.26, virfinica: 5.552
  
  
# Compute correlation between Petal Lenmean()# Compute correlation between Petal Length and Width
cor(iris$Petal.Length, iris$Petal.Width)
#result: 0.9628654
  
  # How would you visualize this relationship? create a plot
  # What type of plot would you choose? scatterplot
  # Can you add a trend line? yes
ggplot(iris, aes(x=Petal.Width, y=Petal.Length, color=Species)) +
  geom_point(size=2) +
  scale_color_manual(values = c(
    "setosa"= "lightslateblue",
    "versicolor"="gold1",
    "virginica"= "orchid1"
  )) +
  geom_smooth(method="lm", se=TRUE, color="black", linetype="solid")+
  labs(titel= "Petal Width vs Length with Trend Line",
    x="Petal Width", y="Petal Length")
  
  ############################################################
# End of Exercise
############################################################

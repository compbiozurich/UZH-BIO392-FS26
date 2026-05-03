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
dd <- iris
dd
dd[1:5,]
# What is the data type of iris?
type(dd)
  
# Display the first 6 rows
# HINT: Use the `head()` function
dd[1:6,]
head(dd)
# Get a summary of the dataset (mean, min, max, etc.)  
summary(dd)

# Show the structure of the dataset (data types, number of rows/columns)  
str(dd)

  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?

#it is a factor (nominal values) with 3 possible levels

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
class(dd$Species)
  
# What are the levels (categories) of Species?
levels(dd$Species)
  
# What is a factor in R?
#used for categories, i.e ordinal values

#for variables with a categorical/nominal or ordinal value range

# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- dd$Petal.Width
y <- dd$Petal.Length
    
# What type of data is stored in x?

#continuous, strictly positive numerical variable type, representing the witdh of a sample(flower) width in petals
class(x)
    
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  


plot(dd$Petal.Width ~ dd$Petal.Length)
# What relationship do you observe?

#they seem to be correlated positively and possibly linear, two distinct clusters are visible
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species


boxplot(dd$Sepal.Length ~ dd$Species)
    
# Which species has the largest values?

dd[dd$Sepal.Length == max(dd$Sepal.Length),]$Species
#virginica
    
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2

#isntall.packages("ggplot2")
library(ggplot2)
    
# Scatter plot with color by species
ggplot(dd, aes(x = Petal.Width, y = Petal.Length, colour = Species)) +
  geom_point(size = 2) +
  theme_light()

# Boxplot using ggplot2
ggplot(dd, aes(y = Sepal.Length, x = Species, fill = Species)) +
  geom_boxplot()  +
  theme_light()

# ---------------------------http://127.0.0.1:33356/graphics/c4cdd0fd-76a8-4aa3-8d19-a9845ae9a07f.png
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
mean_petals_lenghts = data.frame(Species = NA, mean_petal_len = NA)
for (sp in unique(dd$Species)) {
  sub = dd[dd$Species == sp,]
  mean_petals_lenghts <- rbind(mean_petals_lenghts, data.frame(Species = sp, mean_petal_len = mean(sub$Petal.Length)))
  
}
mean_petals_lenghts

# Compute correlation between Petal Length and Width
cor(dd$Petal.Length, dd$Petal.Width, method = "pearson")
#one could even go further and check if the correlation coefficient is different per species
library(dplyr)
dd %>% group_by(Species)  %>%
  cor(dd$Petal.Length, dd$Petal.Width, method = "pearson")
# How would you visualize this relationship?



# What type of plot would you choose?

#scatter plot with correlation/regression line

# Can you add a trend line?
ggplot(dd, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(size = 2, aes(colour = Species)) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_light()


#one could do the same per species to see if the correlation size is different among species
ggplot(dd, aes(x = Petal.Width, y = Petal.Length, colour = Species)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_light()
  
############################################################
# End of Exercise
############################################################
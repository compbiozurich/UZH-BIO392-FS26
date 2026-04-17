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

# Display the dataset
iris

# What is the data type of iris?
???
  
# Display the first 6 rows
# HINT: Use the `head()` function
???

# Get a summary of the dataset (mean, min, max, etc.)  
???

# Show the structure of the dataset (data types, number of rows/columns)  
???

  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
???
  
# What are the levels (categories) of Species?
???
  
# What is a factor in R?
  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- ???
y <- ???
    
# What type of data is stored in x?
   
    
    
# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
???

# What relationship do you observe?

    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
???
    
# Which species has the largest values?
    
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
???
    
# Scatter plot with color by species
???


# Boxplot using ggplot2
???
    

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
???


# Compute correlation between Petal Length and Width
???
  
# How would you visualize this relationship?
# What type of plot would you choose?
# Can you add a trend line?
???
  
############################################################
# End of Exercise
############################################################
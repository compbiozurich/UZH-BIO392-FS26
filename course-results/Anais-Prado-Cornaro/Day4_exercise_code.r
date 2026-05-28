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
typeof(iris)
  
# Display the first 6 rows
# HINT: Use the `head()` function
head(iris, 6)

# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Show the structure of the dataset (data types, number of rows/columns)  
nrow(iris)
ncol(iris)

for (col in colnames(iris)){
  print(paste(col, "has type:"), sep = " ")
  print(typeof(iris[1, col]))
  print(is.factor(iris[1, col]))
}


  
# ---------------------------
# Question
# ---------------------------

# What is different about the Species column compared to the others?

"The species column is the only column, which has entries of type factor, instead of a double. This is because species represents a 
categorical variable, where the entries show to which category the sample belongs to. WHne we use typeof it gives us interger, but the si.factor fucntion shows us
it is a factor."

# ---------------------------
# 3. Factors
# ---------------------------

# Check the class of Species
summary(iris$Species)
  
# What are the levels (categories) of Species?
levels(iris$Species)
typeof(levels(iris$Species)[0]) # this now returns charcter type instead of int!
  
# What is a factor in R?
"A factor in R is it's own class. Each level has it's own interger code (as we saw above, when we used the typeof() fnunction. But a factor also has a level attribute, 
e.g. sentosa, ..., which has type character. FActors in R are extremely useful, instead of just using characters or int to classify the data, when using the as.factor()
fucntion, R can automatically group the data. This is very useful for using fucntions such as summary() or when plotting, becuase R can group them automatically, 
without us having to do extra work.)"
  
# ---------------------------
# 4. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# What type of data is stored in x?

typeof(x)
class(x)
"x stores entries with type double, but x itself is a numeric (vector)."

# ---------------------------
# 5. Base R Visualization
# ---------------------------

## 5a. Scatter plot

# Create a scatter plot to display the relationship between petal width and petal length  
library(ggplot2)
ggplot(iris, aes(x = x, y = y)) +
  geom_point(col = "blue") +
  xlab("Petal.Width") +
  ylab("Petal.Length") +
  ggtitle("Scatterplot of Petal Width vs Length") +
  theme_bw()


# What relationship do you observe?
"I can see that there is a relationship! (points ar enot distributed randomly). The relationship is clearly positive 
(if Petal Width increases, so does Petal Length (& vice versa). The realtionship seems to be very linear, but one would have to do 
Linear Regression to make sure. There don't seem to be any major outliers. What is intersting though, is that between (0.5, 2) &
(1, 3), there are no values present! This seems weird. One Explanation could potentially be, that the group in the left lower
corner corresponds to one level (species), and the larger group is comprised of the other 2 species. This could explain why there are 
no individuals with mesaures inbetween."
    
## 5b. Box plot

# Create a boxplot of Sepal Length by Species
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot() +
  theme_bw() +
  ggtitle("Boxplot of Sepal Length by Species")
    
# Which species has the largest values?
"We can clearly see, that the species verginica has the largest Sepal Length Values. It's means being 
at about 6.5, whereas versicolor and setose are below 6 and at about 5, respectively. We can also see
that virginica and versicolor have larger value distributions (std deviations). Lastly what also 
sticks out, is that virginica seems to have an outlier within Seoal Length, but this would have to be tested further.
"
    
# ---------------------------
# 6. Extra Practice: Beautify your plots with ggplot2 
# ---------------------------
  
# first install package ggplot2 and then Load ggplot2
"already done above"
    
# Scatter plot with color by species
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point() +
  theme_bw()


# Boxplot using ggplot2
"already done above"
ggplot(iris, aes(x = Species, y = Petal.Length)) +
  geom_boxplot() +
  theme_bw() +
  ggtitle("Boxplot of Petal Length by Species")

# ---------------------------
# 7. Extra Practice
# ---------------------------
    

# Compute mean Petal Length for each species
library(dplyr)
group_by(iris, Species) %>% 
  summarise(mean_Petal.Length = mean(Petal.Length))


# Compute correlation between Petal Length and Width
cor(iris$Petal.Length, iris$Petal.Width)
  
# How would you visualize this relationship?
# What type of plot would you choose?
# Can you add a trend line?
"We can see the correaltion is positive, and very strong!!! I would visualize this using Linear
Regression (Scatterplot) and add a Regression line."

x <- iris$Petal.Length
y <- iris$Petal.Width
plot(x, y)
lm1 <- lm(y~x) 
abline(lm1, col = "red")
legend("topleft", legend = "Regression Line", col = "red", lwd = 3)
  
  
  
############################################################
# End of Exercise
############################################################
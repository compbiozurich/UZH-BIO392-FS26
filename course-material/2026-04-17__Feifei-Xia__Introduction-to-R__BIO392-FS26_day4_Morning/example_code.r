############################################################
# BIO392: Introduction to R
# Example code
############################################################

############################
# R variables
############################

course <- "BIO392"

course  # auto-print the value of the course variable

print(course)  # print the value of the course variable


############################
# R data types
############################

# integer
x <- 1000L
class(x)


############################
# Conditional execution & loops
############################

# if
a <- 33
b <- 200
if (b > a) {
  print("b is greater than a")
}

# else if
a <- 33
b <- 33
if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
}

# if else
a <- 200
b <- 33
if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}

# AND OR condition
a <- 200
b <- 33
c <- 500
if (a > b & c > a) {
  print("Both conditions are true")
}


############################
# While / For loop
############################

# While loop
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}

# break
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}

# next
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}

# For loop
for (x in 1:10) {
  print(x)
}


############################
# R functions
############################

my_function <- function(x) {  # create a function with the name my_function
  5 * x
}

my_function(3)  # call the function named my_function with x = 3

my_function <- function(x) {  # create a function with the name my_function
  return(5 * x)
}


############################
# R Data Structures - Vectors
############################

# Create a vector of strings
fruits <- c("banana", "apple", "orange")

# To find out how many items a vector has
length(fruits)

# To sort items in a vector alphabetically or numerically
numbers <- c(13, 3, 5, 7, 20, 2)
sort(numbers)  # 2 3 5 7 13 20

# Access vectors
# Access the first item (banana)
fruits[1]

# Access the first and third item (banana and orange)
fruits[c(1, 3)]

# Access the first two items (banana and apple)
fruits[1:2]

# Change an item
# Change "banana" to "pear"
fruits[1] <- "pear"

# Remove an item
# remove "orange"
newfruits <- fruits[-3]

# Add an item
append(fruits, "strawberry")

# Repeat vectors
repeat_each <- rep(c(1, 2, 3), each = 3)
repeat_times <- rep(c(1, 2, 3), times = 3)
repeat_indep <- rep(c(1, 2, 3), times = c(5, 2, 1))

# Check if item exists
"apple" %in% fruits

# Generating sequenced vectors
numbers <- c(10, 1, 3, 4, 5, 6, 7, 8, 9, 10)
numbers <- seq(from = 0, to = 100, by = 20)  # 0 20 40 60 80 100


############################
# R Data Structures - Lists
############################

# create a list
thislist <- list("apple", "banana", 2, TRUE)

# Access
# access a sublist
thislist[1]

# retrieve content in the sublist
thislist[[1]]


############################
# R Data Structures - Matrices
############################

# Create a matrix
thismatrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)

# Number of rows and columns
dim(thismatrix)      # 3 2
length(thismatrix)   # 6
nrow(thismatrix)     # 3
ncol(thismatrix)     # 2

# Access
# Access the element in the first row, the second column
thismatrix[1, 2]

# Access the second row
thismatrix[2, ]

# Access the second column
thismatrix[, 2]

# Access the first two rows
thismatrix[c(1, 2), ]

# Add rows and columns
# add column
newmatrix <- cbind(thismatrix, c(7, 8, 9))

# add row
newmatrix <- rbind(thismatrix, c(7, 8))

# Remove rows and columns
# Remove the first row and the first column
thismatrix <- thismatrix[-1, -c(1)]


############################
# R Data Structures - Arrays
############################

# create an array
multiarray <- array(1:24, dim = c(4, 3, 2))


############################
# R Data Structures - Data frames
############################

# create a data frame
Data_Frame <- data.frame(
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

# Summarize values in each column of the data frame
summary(Data_Frame)

# Access the first column
Data_Frame[1]

Data_Frame[["Training"]]

Data_Frame$Training

# length()
length(Data_Frame)  # 3


############################
# R plotting
############################

# Points
# two points in the diagram, one at position (1, 3) and one in position (8, 10)
plot(c(1, 8), c(3, 10))

# Lines
# a line that connects the two points in a diagram
plot(c(1, 8), c(3, 10), type = "l")

# Pie charts
# Create a vector of pies
x <- c(10, 20, 30, 40)
pie(x)

# Bar charts
# x-axis values
x <- c("A", "B", "C", "D")

# y-axis values
y <- c(2, 4, 6, 8)

barplot(y, names.arg = x)

# Histograms
# For reproducibility
set.seed(123)

# 100 random values from a normal distribution
data <- rnorm(100, mean = 5, sd = 1)

hist(data)

# Box plots
set.seed(123)
data <- data.frame(
  Group = rep(c("A", "B", "C"), each = 10),
  Value = c(rnorm(10, mean = 5, sd = 1),
            rnorm(10, mean = 7, sd = 1.5),
            rnorm(10, mean = 6, sd = 1))
)

boxplot(Value ~ Group, data = data)








# 1
x <- c(5, 17, 11, 3, 14)

# Using the print() function:
print(x)

# 2 
y <- 2:76
print(x)

# 3- Four data types in R are:

# Numeric: for representing numerical values (e.g. 3.14, -5, 100)

# Character: for representing text (e.g. "Hello", "world")

# Logical: for representing Boolean values (TRUE or FALSE)

# Factor: for representing categorical data (e.g. "male" or "female", "yes" or "no")

# Three data structures in R are:

# Vectors: A vector is a collection of elements of the same data type, arranged in a specific order. It can be created using the c() function.

# Data frames: A data frame is a two-dimensional data structure that is similar to a matrix, but with different types of data allowed in each column. It is commonly used to store data tables, and can be created using the data.frame() function.

# Lists: A list is a collection of elements of different data types, arranged in a specific order. It is a versatile data structure that can hold objects of different sizes and types. It can be created using the list() function.

students <- c("Jerry", "Julia", "Jason", "Estelle", "Micheal")
ages <- c(67, 60, 62, 93, 72)
heights <- c(1.8, 1.6, 1.64, 1.63, 1.9)
A <- data.frame(name=students, age=ages, height=heights, row.names=1)

# 
(a) Add an additional column "gender" with the corresponding abbreviations to each name (f=female, m=male) and recreate the dataframe "A". Write down the R commands.
gender <- c("m", "f", "m", "f", "m")
A <- data.frame(name=students, age=ages, height=heights, gender=gender, row.names=1)
# Calculate the average age of women and men separately (use the tidyverse package if you like).

library(tidyverse)
students <- c("Jerry", "Julia", "Jason", "Estelle", "Micheal")
ages <- c(67, 60, 62, 93, 72)
heights <- c(1.8, 1.6, 1.64, 1.63, 1.9)
gender <- c("m", "f", "m", "f", "m")
A <- data.frame(name=students, age=ages, height=heights, gender=gender, row.names=1)

A %>% 
  group_by(gender) %>% 
  summarise(mean_age = mean(age))

# Calculate the average height of all people older than 65 (use the tidyverse package if you like).

A %>% 
  filter(age > 65) %>% 
# Then, we use the %>% operator to pipe the A data frame into a series of operations.
# We filter the data frame to only include rows where the age column is greater than 65 using filter(age > 65).
# Finally, we use summarize() to calculate the mean height of the filtered data frame and give it the name avg_height using summarize(avg_height = mean(height)).


# Create a subset of the dataframe "A", only containing row one and three in one R command.
subset_A <- A[c(1, 3), ]

# 6. Create a vector with 40 random data points from the normal distribution with a standard deviation of 75. 
# Plot a histogram with the data and draw the mean and median as a vertical line in the graph (Use the ggplot2 package if you like). 
# Keep in mind: You get will get a new (i.e. di􏰀erent) data set every time you call the function to generate random data points.
library(ggplot2)

# Create a vector with 40 random data points from a normal distribution
set.seed(123) # set seed for reproducibility
data <- rnorm(40, mean = 0, sd = 75)

# Calculate mean and median
mean_val <- mean(data)
median_val <- median(data)

# Plot histogram with mean and median as vertical lines
ggplot(data.frame(x = data), aes(x = x)) +
  geom_histogram(binwidth = 10, fill = "blue", alpha = 0.5, color = "black") +
  geom_vline(aes(xintercept = mean_val), color = "red", linetype = "dashed") +
  geom_vline(aes(xintercept = median_val), color = "green", linetype = "dashed") +
  labs(title = "Histogram of Random Data", x = "Data", y = "Frequency") +
  theme_minimal()


# The 'OrchardSprays' dataset is a data frame containing information about an experiment conducted to investigate the effectiveness of different spray treatments on the growth of fruit trees. The experiment was conducted in a randomized complete block design, with six different spray treatments randomly assigned to four blocks (i.e. sections) of trees. The response variable was the increase in fruit growth after spraying, measured in units of length (inches).

# The data frame contains the following columns:

# "row" and "col" indicate the location of each tree within the experimental design
# "treatment" indicates the spray treatment applied to each tree (A-F)
# "increase" indicates the increase in fruit growth observed after spraying, measured in inches
# (b) Create a boxplot of the decrease for each treatment A-H.
# load the OrchardSprays dataset
data(OrchardSprays)

# create a boxplot of the decrease for each treatment A-H
boxplot(decrease ~ treatment, data = OrchardSprays, xlab = "Treatment", ylab = "Decrease")

# (c) Add a meaningful title and axis labels
# Create the boxplot
ggplot(data = OrchardSprays, aes(x = factor(treatment), y = decrease)) +
  geom_boxplot() +
  # Add title and axis labels
  ggtitle("Boxplot of Decrease for Each Treatment") +
  xlab("Treatment") +
  ylab("Decrease")
# (d) Create a histogram for treatment G
# Load the mtcars dataset
data(mtcars)

# Create a histogram of the mpg variable
hist(mtcars$mpg, main = "Distribution of Miles per Gallon", xlab = "Miles per Gallon", ylab = "Frequency")

(e) Create a boxplot for each row of the Latin Square design.
 Each row should contain data from all treatments. 
 What is the expectation based on the design: 
 Should there be di􏰀erences between the rows or not? What do you conclude from your plot?

# Load the OrchardSprays data
data(OrchardSprays)

# Group the data by row number
groups <- split(OrchardSprays$decrease, OrchardSprays$row)

# Create a boxplot for each group
boxplot(groups, main = "Decrease in OrchardSprays by Row", 
        xlab = "Row Number", ylab = "Decrease")
Based on the Latin Square design, there should not be any differences between the rows.
Each row is meant to represent a different application of the treatments, but they are all meant to be equivalent. 
However, the boxplot suggests that there may be some variability between the rows,
as some rows have larger interquartile ranges than others. This could be due to uncontrolled factors that varied between the rows, such as weather conditions or soil properties.


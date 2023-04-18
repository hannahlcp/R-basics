# BIO319 Workshop 1 Script
# Hannah Chaudhry-Phipps
# 23/01/2023


# 3 Data Classes -----------------------------------------------


# Create logical variable 
a <- TRUE
b <- FALSE

# Using the logical class through use of logical statements
1 < 2
2 < 1

# <=, >=, == (is equal to), != (is not equal to)
# & 'and'; | 'or'

1 < 2 & 1 > 0

# If at least one statement within the logical expression is FALSE, R will return FALSE
1 <2 & 1 < 0 


# 4 Question Time ---------------------------------------------------------


# 4.1 Questions without R

# Q1
7 >= 6

# Q2
x <- 12 / 3 > 3 & 5 ^ 2 < 25
x

# Q3 
y <- 12 / 3 > 3 | 5 ^ 2 < 25 | 1 == 2
y

# Q4
z <- FALSE
z == TRUE


# 4 Challenge Time ----------------------------------------------------------


# 4.2 Challenge Time

# Q 5
c <- 'The cake'
d <- 'A lie'
c == d

# Q 6
# n_char function reveals the number of characters in a string
h_nchar <- nchar ('Hannah')
h_nchar >= 6

# Q 7
h_nchar_2 <- h_nchar < 6 & h_nchar == 'James' & h_nchar == 'Janelle' & h_nchar == 'Jamil' & h_nchar == 'Jessica'
h_nchar_2

class(h_nchar_2) # logical
class (h_nchar) # integer
class (c) # character
class('Hannah')


# 5 Scalars, Vectors and Matrices -----------------------------------------


# 5.1 Creating Vectors with c()
# rep() function repeats a vector multiple times, or 
# repeats a scalar multiple times to create a vector
rep(x = c(1, 2, 3), times = 3)

v_100 <- rep (x = c('I', 'will', 'not', 'tell', 'lies'), rep = 20)
?rep()

v_5 <- rep(x = c('a', 'b', 'c'), each = 5)
v_5

# 5.2 Creating Vectors with seq()
# Use seq() function to create numeric sequences (vectors)
ruler <- seq(from = 0, to = 15, by = 0.1)

# 5.3 ':' and Subscripting
# : symbol can be used to create a sequence of integers, between values specified
# Subscript using []
e <- c('a', 'b', 'd', 'e', 'f', 'g', 'h')
e[3]
e[5:3]
e[seq(from = 1, to = 5, by = 2)]


f <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2, 1)
length(f) # length function describes the number of elements in an object
f > 5
f[f>5]
g <- f[f > 5]
print(g) # the new vector g only contains the values of f where the statement f > 5 was TRUE 
# (in the same order as the variables were inputted in f)

# Create a new vector containing the numbers 2 through to 15
i <- 2:15
# Subscript the vector i to make a new vector containing numbers less than or equal to 7
j <- i[i <= 7]
print(j)

# %% is a modulus operator (can specify the remainder) 
help('%%')
# The elements in j, divided by 3, give a remainder of 0
k <- j[j %% 3==0] 
k

# 5.4 Matrices
# Vector of data
mat1.data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# Make vector into matrix by specifying data input, 
# number of rows and columns, and order of data input
# byrow = TRUE means the data is inputted along the rows
mat1 <- matrix(mat1.data,
               nrow = 3,
               ncol = 3,
               byrow = TRUE)
mat1
length(mat1)

# Subsetting in the length function describes the number of 
# elements in a specific row and column (in that order, separated by a comma) of the object
# If the comma is not used to specify, R will default to column
length(mat1[1:3,])

# byrow = FALSE means the data is inputted along the columns
mat2.data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
mat2 <- matrix(mat2.data,
               nrow = 3,
               ncol = 3,
               byrow = FALSE)
mat2

mat3.data <- c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l')

# Can also use code letters[1:12] (or month.name[6]); called built in constants
mat3.data <- letters[1:12]
mat3.data
mat3 <- matrix(mat3.data,
               nrow = 3, 
               ncol = 4,
               byrow = FALSE)
mat3

# Subscripting matrices requires two numbers: the first number is the row
# and the second number is the column (comma separation)

mat3[1,3] # first row, third column

mat3[,3] # returns all the values in the third column, 
# regardless of the row

mat3[1,] # returns all the values in the first row

mat3[1:2,] # returns all the values in the first and second row,
# regardless of the column

mat3[3, 4]
mat3[2:3, 1]
mat3[2:3,]


# 6 The Dataframe ---------------------------------------------------------


# 6.1 The Basics
df <- read.csv('NYTBestsellers.csv')

dim(df) # Dimensions, by row and column

str(df) # Structure of data frame

summary(df) # Shows summary statistics on columns

colnames(df) # Shows the name of each column

head(df) # Shows the first six rows
head(df, n = 10) # n can specify the numbers of rows seen (same for tail() function)

tail(df) # Shows the last six rows

View(df) # View a spreadsheet-like display of the entire data framm

df[60:70, 2:4] # Subset data frame to see row 60 to 70, and column 2 to 4

View(df[-3,]) # View can also be subset

df[, 'debut_rank'] # Can use the subscript to access a title name of a column (using '')

# 6.2 The $
# Can use $ to subset
# You may be wondering why we even need the dollar operator if we can accomplish the same without it. 
# The answer is that more complex subsetting operations are often easier with the dollar notation. 

df$total_weeks # Subset using $ to specify column name
df$total_weeks[1:5] # Subset using $ to specify column name, and square brackets contain row number
# The above line is the same as the two following lines:
df[1:5, 'total_weeks'] # using column name
df[1:5, 5] # using column number

# Create a new column called personal_rating, filled with the term 'brilliant'
df[, 'personal_rating'] <- rep('brilliant', times = nrow(df))
View(df)

# Or use previous code below
df$personal_rating <- rep('brilliant', times = nrow(df))
View(df)

# Create a new column called number_of_pages, filled with 100 for the first 20 books, 
# 200 for the next 20 books, and so on until the last 20 books are 500 pages
df[,'number_of_pages'] <- rep(c(100,200,300,400,500), each = 20)
View(df)

# Or use previous code below
df$number_of_pages <- rep(c(100, 200, 300, 400, 500), each = 20)
View(df)

# Adapt answer to include seq() function
df[,'number_of_pages'] <- rep(
  seq(from = 100, to = 500, by = 100), 
  each = 20)
View(df)

# Or use previous code below
df$number_of_pages <- rep(
  seq(from = 100, to = 500, by = 100),
  each = 20)
View(df)


# 7 Question Time 2 -------------------------------------------------------


# Q 10 
# Create a vector of all the odd numbers between 1000 and 1500 that are divisible by 7
# subset using modulus operator
x <- 1000:1500
vector <- vector()
vector <- x[x %% 7 == 0 & x %% 2 != 0]

# Or use previous code below
vector_odd <- seq(from = 1001, to = 1500, by = 2)
vector_odd_seven <- vector_odd [vector_odd %% 7 ==0]

# Q 11 
# Using the NYT bestseller data, 
# create a vector of the names all the books that were in the top spot for at least 10 weeks
# Need to use the which() function which gives the true indices of a logical object

# First, we are subsetting the entire dataframe, to get the books which were in the top spot for at least 10 weeks
# The $ is subsetting the total_weeks column, as we are interested in the values of this column only being less than 10 weeks
# df$total_weeks >= 10 outputs TRUE FALSE, as it is printing whether the logical condition is met for each row in this column
# The which() function ensure the logical expression is not just printed
# The output (x) is giving us the id of each book
x <- which(df$total_weeks >= 10)
View(x)
?which

# Now we are subsetting the 'title' column of the dataframe, as this is what we are interested in to make a vector of the 
# book names, whilst subsetting x (which gives us the rows which fulfill the column subset)
df_top <- df$title[x]

df_top <- df$title[which(df$total_weeks >= 10)]

# If we wanted to make a new DATAFRAME, only including the books which were in the top spot for at least 10 weeks, we would subset
# the columns from the dataframe using df$total_weeks >= 10 and then 
# subset the ROWS where this logical expression is true in the total_weeks column
df_11 <- df[df$total_weeks >= 10,]
df_11

# Q 12 INCORRECT answer
# Using the NYT bestseller data, create a new dataframe where all the books were in the top spot for less than 
# 10 weeks and have titles that are less than 15 characters long.

# So, first we are subsetting the values in the 'total_weeks' columns which are less than, and subsetting
# the values in the 'title' column to titles which have less than 15 characters.
# NOW we are only interested in keeping the ROWS which fulfill these previous criteria
# so we subset the rows of the dataframe where the column values fulfill the criteria
# and assign this to a new object
df_merge <- df[df$total_weeks < 10 & nchar(df$title) < 15,]

# INCORRECT - the below answer was the first answer which was incorrect, and has produced a vector, not dataframe; check CORRECT (above and below)
# We want title column with dataframe df, where total weeks (within dataframe df) is at least 10 (so subset total weeks)

# Create dataframe with books in the top spot for less than 10 weeks
df_best_rank <- df$title[which(df$total_weeks < 10)]
df_best_rank

# Create dataframe with titles that are less than 15 characters long, using dataframe with books in the top spot for
# less than 10 weeks
df_combined <-  nchar(df_best_rank) < 15
df_combined_2 <-  df$title[which(df_combined)]
View(df_combined_2)

# Q 12 CORRECT answer
# Using [ operator; MUST use comma to specify the logical condition is subsetting rows of dataframe 
# This question wants to only keep some rows, whilst keeping ALL columns
# Thus we are subsetting rows of the dataframe 
df_merge <- df[df$total_weeks < 10 & nchar(df$title) < 15,]
# If we wanted to subset by column too, just put number of desired column after comma

# OR using subset () function
df_merge <- subset (df, df$total_weeks < 10 & nchar(df$title) < 15)
View(df_merge)

# Q 13 
# Add a new column to your dataframe called ‘long10’ that contains the word ‘yes’ if the book title is 
# 10 characters long, and ‘no’ if it is not

# Using if else loop
x <- capture.output(for(i in df$title){
  if(nchar(i) > 10){
     print('yes')
  } else {
    print('no')
  }
  })

df$long10 <- x

# Using the ifelse() function
# the first "" is what to print if TRUE, the second "" is what to print if FALSE
df_merge$long10 <- ifelse (test = (nchar(df_merge$title) == 10), yes = "yes", no = "no")
View(df_merge)

# Using subscripting, update your edited dataframe to only contain the ‘title’, ‘author’, ‘year’ 
# and ‘long10’ columns
df_merge_subset <- df[, c(-1, -5, -6, -7, -8)]

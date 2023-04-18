# Hannah Chaudhry-Phipps
# BIO319 Workshop 4
# 13/02/23


# 2 While Loops -----------------------------------------------------------


# 2.1 
# While Loops; loop over a section of code, taking a
# conditional statement
# While a statement is true, the loop will keep running
# When the condition is no longer true, the loop will stop
x <- 0
while(x < 5){ 
  x <- x + 1
  print(paste('The number is now ', x, sep = ''))
}

x <- 1
while(x %% 5 != 0 | x %% 6 != 0 | x %% 7 != 0 | x %% 8 != 0){
  x <- x + 1
}
print(paste('The lowest number that is a factor of 5, 6, 7 and 8 is ', x, sep = ''))

# Use the stop sign to abort running the code
x <- 1
while(x < 10){
  x <- x - 1
}

# Make your own loop that finds the first number over 1000 that is a factor of 9, 11 and 13.
# So we want the loop to stop when the number is divisible by 9, 11, and 13 with no remainder
# Need to the condition to be looking for the opposite of what we want! So we want a false conditional statement
x <- 1000

while (x %% 9 != 0 | x %% 11 != 0 | x %% 13 != 0){
  x <- x + 1 # when the conditional statement is false, we need to tell the function what to do next
}
print(paste('The lowest number that is a factor of 9, 11, and 13 is ', x, sep = ''))

x <- 1000
while (x %% 9 != 0 | x %% 11 != 0 | x %% 13 != 0){
  x <- x + 1
}
print(paste('The lowest number that is a factor of 9, 11 and 13 is', x, sep =' '))

# Running the code with & does not work, as the loop needs a condition which is false to keep running
x <- 1000
while (x %% 9 = 0 & x %% 11 = 0 & x %% 13 = 0){ # the input does not fulfill this conditional statement, so the loop will not run
  x <- x + 1
}
print(paste('The lowest number that is a factor of 9, 11 and 13 is', x, sep =' '))

# Make your own loop that takes a starting value of x <- 0.999 that squares x in each loop 
# until x is less than 0.5.
x <- 0.999
while (x > 0.5){
  x <- x^2
}
print(x)

# Or see previous code below, with counter
x <- 0.999
counter = 0
while (x > 0.5){
  x <- x^2
  counter = counter + 1 
}

print(paste('If you square 0.99', counter, 'times, you get a value of', x, sep=' '))


# 3 Functions -------------------------------------------------------------


# 3.1 Basic Functions

# Define a name for the function (in the below example, powers)
# Define the inputs of this function (in the below example, x)
# Place the code that the function is composed of in the curly brackets
# Define output using return () function 
x <- 0
powers <- function(x){
  y <- x ^ 2
  return(y)
}
powers(1) # where x = 1 in the powers function

# The above example is saving the square of x to the variable y

powers(30)
powers(5189)

# Next example, with increased complexity
powers <- function(x){ # name of the function is powers
  y <- x ^ 2 # takes the value of x and squares it, saving the answer to the variable y
  z <- x ^ 3 # takes the value of x and cubes it, saving the answer to the variable z
  return(c(y, z)) # returns the answer in the format: y,z
}
powers(1) # when x=1, inputted into the function powers
powers(5189)# when x=5189, inputted into the function powers

# Edit the function to also return the numeric value of x ^ 4
powers <- function(x){
  y <- x ^ 2
  z <- x ^ 3
  r <- x ^ 4
  return(c(y, z, r))
}
powers(1)
powers(120)

# Create a function that converts a character scalar of a month into the number of the 
# position of said month in the year 
month_names <- c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')

# Find a function which converts a character scalar of a month into the number of the position of said month
grep(x = month_names, pattern = 'January')

# Now put this function into a basic function
month_character_number <- function(x){
  y <- grep(x = month_names, pattern = x)
  return (y)
}

convert('May')

# Now do the opposite: create a function which converts a number into a character scalar
month_number <- 1:12
month_names <- c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')

month_number_character <- function(x){
  y <- month_names[x]
  return(y)
}
month_number_character(4)

# Or below is an alternative way, using gsub function
# Find a function which converts a number of month position into a character scalar
gsub(x = month_number[x], pattern = month_number[x], replacement = month_names[x])

month_number_character <- function(x){
  y <- gsub(x = month_number[x], pattern = month_number[x], replacement = month_names[x])
  return(y)
}
month_number_character(4)

# Or see previous code below
# input = x
x <- 0

month_2 <- function(x){
  y <- month.name[x]
  return(y)
}
month_2(11)

# Edit the above function to take a vector of months and return a vector of 
# number positions. E.g. 'May', 'June' returns 5,6
# the grep function looks for a pattern within a dataset
x <- month.name

month <- function(x){
  y <- grep(x, month.name)
  return(y)
}

month('April')

# 3.2 Default Inputs
powers <- function(x, y = 2){
  z <- x ^ y
  return(c(z))
}
powers(3, y) # where x = 3, and y = is not specified (so takes the given value of 2)

powers(3,3) # where x = 3, and y = 3, so the function is 3^3
# can be also written as:
powers(x = 3, y = 3)

# Write a function that takes a character scalar (e.g. 'Bird') and returns a 
# character scalar that appends is the word on the end of the word (e.g. 
# 'Bird is the word').

# We need to specify what the input x is, so it defaults to print a value
append <- function(x = 'Bird'){
  y <- paste(x, 'is the word', sep = ' ') 
  return(y)
}

# If we simply ask the function of x, we are returned 'Bird is the word'
append(x)

# However, we can override the default input of x
append(x = 'Home')

# Or see previous code below
bird <- 'Bird'
word <- function(b){
  print(paste(b, 'is the word', sep = ' '))
}
word(b)

# Edit the above function so that it appends a second input scalar (e.g. 'is 
# not the word'), with the function defaulting to append 'is the word' if no 
# second scalar is provided.

# Need to introduce two input scalars
append <- function(x = 'Bird', y = 'is the word'){
  y <- paste(x, y, sep = ' ') 
  return(y)
}

# The function defaults to 'is the word' when no second scalar is provided
append(x, y)

# However, when a second scalar is provided we can input whatever we want
append(x, y = 'is not the word')

# Or see previous code below 
b <- 'Bird'

word <- function(b, y = 'is the word'){
  return(c(b,y))
}

word(b) # the function defaults to append 'is the word' if no second scalar is provided
word(b, y = 'is not the word') # the function defaults to the second input scalar provided


# 4 Lists -----------------------------------------------------------------


# Each element within a list can be any object in R (unlike vectors)

# Making a list
quotes <- list()
# We could just assign one list within the quotes object
quotes <- c("We're", 'gonna', 'need', 'a', 'bigger', 'boat.')

# Or we could assign several lists within the quotes object by using [[]] subscripting
quotes[[1]] <- c("We're", 'gonna', 'need', 'a', 'bigger', 'boat.')
quotes[[2]] <- c('Never', 'taken', 'a', 'shortcut', 'before?')
quotes[[3]] <- c("We're", 'going', 'on', 'a', 'bear', 'hunt')
quotes[[4]] <- c("We're", 'going', 'to', 'catch', 'a', 'big', 'one')
# Any title/name for the list could be in the [[]] brackets

quotes

quotes[[c(1, 3)]] # extracts the first quote, third element
quotes[[2]][3] # this is the same as above; extracts second quote and third element

# Define a function that takes a starting number and generates the fibonacci sequence for the first 10 values, if 
# the starting number was the first two values
fib <- function(x){ # i)
  sequence <- c(x, x) # ii)
  for(i in 3:10){ # iii)
    sequence[i] <- sequence[i - 1] + sequence[i - 2] # iv)
  }
  return(sequence) # return the sequence
}

# i) Define a function called fib that takes an input of x
# ii) Create a sequence where the first two values are x
# iii) The for function iterates from 3 to 10
# iv) Saves the current i value (e.g 3) as the sum of the previous two values in the sequence variable, 
# adding on this new calculated i value to the sequence variable
# The point of putting this in a function is that x can take any value

fib(1) # this returns the standard fibonacci sequence

fib(3)

# Using a list, we can run the function on the numbers 1:10 saving each of the output vectors
# So for the value i, the WHOLE fib function runs, and each fib output is subsetted and saved to output_list
output_list <- list()
for(i in 1:10){
  output_list[[i]] <- fib(i)
}

output_list

# Try accessing different vectors in the list using the square brackets ([[]])
output_list[[5]]

# Update the function to calculate the sequence up to 20 places.
fib <- function(x){ 
  sequence <- c(x, x) 
  for(i in 3:20){ 
    sequence[i] <- sequence[i - 1] + sequence[i - 2] 
  }
  return(sequence) # return the sequence
}

output_list <- list()
for(i in 1:10){
  output_list[[i]] <- fib(i)
}

# Create a new function that works like the fibonacci function, but instead 
# takes 3 starting values, and calculates each element as the previous 3 
# combined (rather than 2). This should predict up to 20 places again. 
# I.e. 1,1,1 would return 1,1,1,3,5,9,17…
fib <- function(x){ 
  sequence <- c(x, x, x) 
  for(i in 4:20){ 
    sequence[i] <- sequence[i - 1] + sequence[i - 2] + sequence[i - 3] 
  }
  return(sequence) # return the sequence
}

# Or see previous code below 
x <- 1

fib_new <- function(x){ # define a function called fib that takes an input of x
  sequence <- c(x, x, x) # create a sequence where the first three values are x
  for(i in 4:20){ # loop over 4 to 20 
    sequence[i] <- sequence[i - 1] + sequence[i - 2] + sequence[i - 3] # save each position as the sum of the previous three (in positions 3 to 10)
  }
  return(sequence) # return the sequence
}

fib_new(1)


# 5 Question Time ---------------------------------------------------------


# Create a new function called powers2() that takes two input scalars (say x and y), 
# that you can assume are positive integers.
# The function should return a vector of the first scalar to the power of all 
# the positive integers from 1 to the second scalar.
powers2 <- function(x = 3, y = 5){
  z <- x^(1:y)
  return (z)
}

powers2()

powers2(10, 2)

# Or see previous code below
powers2 <- function (x,y){
  a <- x^(1:y)
  return (a)
}

powers2(3,4)

# Use the powers2 in a for loop, saving each of the output vectors in a list. 
# You can choose what input to give it, but this should vary with each iteration.
powers2_list <- list()

for(x in 1:10){ # i)
  powers2_list[[x]] <- powers2(x, y = 3) # ii)
}

# i) x takes on the value of the iterable from 1 to 10
# ii) y takes on the value of 3 for EACH x value
# So referring back to the function, x^1, x^2, x^3 for each iterable is saved as a new list in the output
for(x in 1:5){ # i)
  for (y in 1:2) { # ii)
  powers2_list[[x]] <- powers2(x, y) #iii) 
  }
}

# i) x takes on the value of the iterable from 1:10
# ii) Nested for loop, so y takes on the value of 1 to 100 for EACH x value
# iii) We need to specify the values of x and y are to be run in the powers2 function
# and we are using the value of x as the title of the list output (so however many times the loop iterates is the 
# number of times the list output will be saved, otherwise the output will kept being overwritten)

# Both the below and above for loop produce the same answer (as it does not matter which way x and y are stated?)
for(y in 1:2){
  for (x in 1:5) {
    powers2_list[[x]] <- powers2(x, y) 
  }
}

for(x in 1:5){ 
  for (y in 1:2) { 
    powers2_list[['One']] <- powers2(x, y) # the list output is only saved with the final values, and with the title 'One', as it kept getting overwritten
  }
}

# Or see previous code below
powers2_list <- list()
for(i in 1:4){
  powers2_list[[i]] <- powers2(i, 2) # need to provide the x and y
}

# Make a function that takes any positive integer as an argument and returns it with 
# its digits in descending order. Essentially, rearrange the digits to create the highest 
# possible number.

# Figure out the split function
split <- as.numeric(strsplit(x = as.character(197604), split = "") [[1]])

# Order function: note the order function initially lists the element number in order, need to subset
order <- split[order(split, decreasing = TRUE)]

descending_digits <- function(x = 9856278048){
  split <- as.numeric(strsplit(x = as.character(x), split = "") [[1]])
  order <- split[order(split, decreasing = TRUE)]
  return(order)
}

descending_digits()

descending_digits(543879734234378)

# Or see previous code below
descending <- function(x){
  d <- as.numeric(strsplit(as.character(x), "") [[1]])
  e <- d[order(d, decreasing = TRUE)]
  return(e)
}
descending (x)

# Create a function that returns the sum of the two lowest positive numbers when 
# given a vector of 4 or more positive integers. 
x <- c(15, 9, 6, 1905, 768)

?sort

sort <- sort(x, decreasing = FALSE)
sum <- sort[1] + sort[2]

sum_lowest <- function(x){
  sort <- sort(x = x, decreasing = FALSE)
  sum <- sort[1] + sort[2]
  return(sum)
}

sum_lowest(x)

sum_lowest(c(76, 453, 134, 767, 12, 4))

# Or see previous code below
x <- c(98, 75, 24, 1, 89)

x_lowest_function <- function(x){
  x_lowest <- (sort(x) [1]) + (sort(x) [2])
  return(x_lowest)
}

x_lowest_function(x)

x_lowest_function(c(4,3,2,7))


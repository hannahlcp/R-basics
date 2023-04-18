# Hannah Chaudhry-Phipps
# BIO319 Workshop 3: Loops and Functions I
# 06/02/23


# 2 Basic Looping ---------------------------------------------------------


# 2.1 
# What is a loop?
for(i in 1:5){  # create a for loop that runs 5 times (1 to 5)
  print(i)      # each time the for loop runs, print the value of i
}

# 2.2 
# How does it work?

# for() loop runs through a vector of values; in the above example the vector of values is 1:5
# therefore, the loop iterates five times
# each time the for() loop runs, it processes the code contained in {}; in the above example it is asked
# to print the object called i
# i is the ITERABLE, and its value is determined in each loop by the vector we specified
# thus, the first time the loop runs, i = 1; second time i = 2; third time i = 3, and so on
# the iterable can be called anything, but it is common to call it i
x <- 0          # make a new scalar called x with a value of 0

for(i in 1:10){ # create a for loop that runs 10 times (1 to 10)
  x <- x + i    # within our for loop we are adding the value of i to the value of x
}

print(x)        # print x

# x has the value of i added to it EACH TIME the loop runs

# 2.3 
# Basic loop questions

# Q 1
# Try copying the code into a new script and adding a print(x) command into the loop. 
# What do you see?
x <- 0        

for(i in 1:10){ 
  x <- x + i
  print(x)
}           # we see the value of x each time the for() loop runs

# Q 2
# Try changing the numbers in the for() function (1:10) to numbers of your choosing multiple times. 
# What do you see?
x <- 0        

for(i in 1:5){ 
  x <- x + i
  print(x)
}           # we see the for() loop iterate five times

# Q 3
# Try changing the the name of i in the for() function to a name of your choosing and 
# get the loop to run.
x <- 0        

for(random in 1:5){ 
  x <- x + random
  print(x)
}           # we see the same result as the previous for() loop

# Q 4
# Make a for loop that loops over the numbers 10 to 20, and print the square of each.
for (i in 10:20) {
  print(i^2)
}
# Q 5
# Make your own for loop that runs 5 times and each time it runs takes a starting number 
# of your choice and divides it by 13, before overwriting the original starting value. 
# It should print the new value each time.
x <- 13*270

for (i in 1:5) {
  x <- x/13   # overwriting the original starting value means that each time the loop runs, the NEW calculated value should be carried over for the next iteration
  print(x)
}

# Q 6
# Make your own for loop that takes two numeric scalars (your choice), adds them together, and prints 
# their summed value to the 
# power of your iterator (2 in the first loop, 3 in the second, etc. up to 6).
# BREAKDOWN: do the calculation, then add the print command, then write the for() loop
a <- 10
b <- 3

print((a + b)^i)

for(i in 1:6){
  print((a + b)^i)
}

# Or see previous code below
a <- 3
b <- 2

for (i in 1:16){
  x <- (a + b)^i
  print (x)
}


# 3 Advanced Looping ------------------------------------------------------


# 3.1 Looping over Non-Integer Vectors
# Can use vectors of any class; not just numeric/integer vectors
shrek_quote <- c('What', 'are', 'you', 'doing', 'in', 'my', 'swamp')

for(word in shrek_quote){
  print(toupper(word))  
}

# In the above, the iterable is named word, but it could be anything
# In below example, the iterable is the letter i, and returns the same answer
for(i in shrek_quote){
  print(toupper(i))  
}

# In below example, the iterable is donkey AND a numeric vector is used INSTEAD of character vector
for(donkey in 1:length(shrek_quote)){
  print(toupper(shrek_quote[donkey]))  
}

# In the above example:
# donkey is the iterable
# toupper() command changes the lower case elements of a character vector TO UPPER case
# 1:length() where the length() command gets the length of a vector (instead of having to specify the vector)
# and the colon operator specifies where to start in the vector
# shrek_quote is the character vector 
# shrek_quote[donkey] is subsetting the shrek_quote vector to the value of the iterable
# i.e., if donkey = 1 (corresponding to the first for() loop), shrek_quote[1] = what (the first word)

# Write your own for loop that takes a character vector of c('WHAT', 'ARE', 'YOU', 'DOING', 'IN', 'MY', 'SWAMP') and 
# prints it word by word in lower case using tolower() command.
# NUMERIC VECTOR:
shrek_quote_2 <- c('WHAT', 'ARE', 'YOU', 'DOING', 'IN', 'MY', 'SWAMP')

for (i in 1:length(shrek_quote_2)){
  print(tolower(shrek_quote[i]))
}

# Change the for loop you just created to use an integer vector to loop with, rather than the character vector. 
# If you used an integer vector to begin with, try looping over the character vector instead.
# CHARACTER VECTOR: 
for(i in shrek_quote_2) {
  print(tolower(i))
}

# 3.2 Saving Outputs
# One way is to use an output vector
output <- vector() # creates an empty vector that we can fill with values

input <- c('red', 'yellow', 'green', 'blue', 'purple')

for(i in 1:length(input)){
  output[i] <- nchar(input[i]) # nchar() command describes the number of characters, for example in the input vector
  print(output)
}
print(output)

# Create a for loop that takes a vector named words with the elements 'buzz' 'cross' 'broads' 'fore' and '', 
# adds the word 'word' to each of them, and saves them as a new vector called wordwords. 
# use the paste() function by concatenating two strings
input <- c('buzz', 'cross', 'broads', 'fore', '')

wordwords <- vector()

paste(input, 'word', sep = '')

for(i in 1:length(input)){
  wordwords[i] <- paste(input[i], 'word', sep = '') # the subset is like the word 'at'
}

# Or see previous code below
word <- 'word'

wordwords <- vector()

for (i in 1:length(input)){
  wordwords[i] <- paste(input[i], word, sep = '')
}

print(wordwords)

# Can also be done as below, with no need to create a word string
for (i in 1:length(input)){
  wordwords[i] <- paste(input[i], 'word', sep = '')
  print(wordwords[i])
}

print(wordwords)

# There actually is not a need to use the for() function in the above question
# The paste() function can process a whole vector (no need to do each element at a time)
paste(input, 'word', sep = '')

# Use the gsub() function to answer the above question, instead of a for loop
gsub(x = input, pattern = '$', replacement = 'word')

# Or see previous code below
wordwords_gsub <- gsub(pattern = '$', x = input, replacement = 'word')
print(wordwords_gsub)


# 4 Conditional Statements ------------------------------------------------


# 4.1 Using if() within the for() Loop
# The if() function by itself runs the conditional statement if it is TRUE
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)

for(i in numbers){
  if(i > 5){
    print(i)
  }
}

# When the conditional statement of i > 5 is TRUE (or rather i > 5 == TRUE!)
# the loop runs the print(i) line within the curly brackets following the if() statement.
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)

for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  }
}

# i %% 1 == 0 means the iterable is divisible by 1, with no remainder
# & means AND (both logical expressions must be met)
# paste() function concatenates the iterable (the according number in the vector 'numbers') with
# the phrase 'is less than five and an integer'
nums <- c(11, 22, 33, -0.01, 25, 100000, 7.2, 0.3, -2000, 20, 17, -11, 0)

for (i in nums){
  if(i < 0 | i %% 10 == 0 | i >= 50){
  print(toupper(paste(i, 'meets the criteria', sep = ' ')))
  }
}

# 4.2 Using else
# The else() function is used after the initial if() statement, and runs the code if the
# conditional is FALSE
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)

for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else {
    print(paste(i, ' is not less than five or is not an integer (or both!).', sep = ''))
  }
}

for (i in nums){
  if(i < 0 | i %% 10 == 0 | i >= 50){
    print(toupper(paste(i, 'meets the criteria :)', sep = ' ')))
  } else {
    print(paste(i, 'does not meet the criteria :(', sep = ' '))
  }
}

# 4.3 Using else if() Function
# We can use as many else if() functions as we like
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else if(i < 5 & i %% 1 != 0){
    print(paste(i, ' is not an integer.', sep = ''))
  } else if(i >= 5 & i %% 1 == 0){
    print(paste(i, ' is not less than five.', sep = ''))
  } else {
    print(paste(i, ' is not less than five and is not an integer.', sep = ''))
  }
}

for (i in nums){
  if(i < 0 | i %% 10 == 0 | i >= 50){
    print(paste(i, 'meets atleast one of the criteria :)', sep = ' '))
  } else if(i < 0 & i %% 10 == 0){
    print(paste(i, 'meets two out of three criteria', sep = ' '))
  } else if(i %% 10 == 0 & i >= 50){
    print(paste(i, 'meets a different two out of three criteria', sep = ' '))
  } else {
    print(toupper(paste(i, 'does not meet any of the criteria :(', sep = ' ')))
  }
}


# 5 Question Time ---------------------------------------------------------


# Q 7
# Make a for loop that iterates over the numeric vector c(1,1,3,5,8,13,21) and 
# prints the square root of each of the numbers.
vector_7 <- c(1,1,3,5,8,13,21)

for(i in 1:length(vector_7)){
  print(vector_7[i]^(1/2))
}

# Or use previous code below
for(i in vector_7){
  print(i^(1/2))
}

#  Q 8
# Make a for loop that calculates the next 10 values in the Fibonacci sequence 
# after the first two values of 1 and 1. Save the output as fib_vec.
fib_vec <- c(2,3)

for(i in 1:10){
  fib_vec <- c(fib_vec, fib_vec[i-1] + fib_vec[i])
  i <- i + 1
}
print(fib_vec)

# Q 9
# Create a vector of a quote from your favourite film (each word should be a 
# single element). Loop over the words and only print the words that are 4 or 5 characters long.
quote <- c('I', 'believe', 'I', 'can', 'fly', 'hello', 'dude')

for(i in 1:length(quote)){
  if (nchar(quote[i]) %% 4 == 0 | nchar(quote[i]) %% 5 == 0){
    print(quote[i])
  }
  else{
  }
}

# Or use previous code below
for (i in quote){
  if(nchar(i) == 4 | nchar(i) == 5){
  print(i)
  }
}

# Q 10
# Take your film quote and this time print all words 4, 5 or 6 characters long, print 
# 'no' instead when the words are < 4 characters long, and print 'harry potter' if they are 
# more than 6 characters long.
for(i in 1:length(quote)){
  if (nchar(quote[i]) %% 4 == 0 | nchar(quote[i]) %% 5 == 0 | nchar(quote[i]) %% 6 == 0){
    print(quote[i])
  }
  else if (nchar(quote[i]) < 4){
    print('no')
  }
  else if (nchar(quote[i]) > 6){
    print('harry potter')
  }
  else{
  }
}

# Or use previous code below
for (i in quote){
  if(nchar(i) == 4 | nchar(i) == 5 | nchar(i) == 6){
    print(i)
  } else if(nchar(i) < 4){
    print('no')
  } else if(nchar(i) > 6){
    print('harry potter')
  } else {
  }
}

# Q 11
# Update the above for loop to save all the printed outputs 
# into a new vector called garbled_film_quote
# using the paste function
garbled_film_quote <- vector()
for(i in 1:length(quote)){
  if (nchar(quote[i]) %% 4 == 0 | nchar(quote[i]) %% 5 == 0 | nchar(quote[i]) %% 6 == 0){
    print(quote[i])
    garbled_film_quote <- paste(garbled_film_quote, quote[i])
  }
  else if (nchar(quote[i]) < 4){
    print('no')
    garbled_film_quote <- paste(garbled_film_quote, 'no')
  }
  else if (nchar(quote[i]) > 6){
    print('harry potter')
    garbled_film_quote <- paste(garbled_film_quote, 'harry potter')
  }
  else{
  }
}

# Or use previous code below
# Using numeric vector for input
garbled_film_quote <- vector()

for (i in 1:length(quote)){
  if(nchar(quote[i]) == 4 | nchar(quote[i]) == 5 | nchar(quote[i]) == 6){
    print(quote[i])
    garbled_film_quote <- c(garbled_film_quote, quote[i])
  } else if(nchar(quote[i]) < 4){
    print('no')
    garbled_film_quote <- c(garbled_film_quote, 'no')
  } else if(nchar(quote[i]) > 6){
    print('harry potter')
    garbled_film_quote <- c(garbled_film_quote, 'harry potter')
  } else {
  }
}

print(garbled_film_quote)

# Using capture.output() function
garbled_film_quote <- capture.output(
  for (i in quote){
    if(nchar(i) == 4 | nchar(i) == 5 | nchar(i) == 6){
      print(i)
    } else if(nchar(i) < 4){
      print('no')
    } else if(nchar(i) > 6){
      print('harry potter')
    } else {
    }
  })

garbled_film_quote

# Q 12
# Make a for loop that takes 10 surnames and creates a vector of the first 
# letter of each of those names called initial_vec
surname <- c('Wang', 'Devi', 'Kim', 'Ali', 'Silva', 'Mohammed', 'Tesfaye', 'Nguyen', 'Ilunga', 'Rodriguez')

substr(x = surname[1], start = 1, stop = 1)

initial_vec <- vector()
for(i in 1:length(surname)){
  initial_vec[i] <- substr(x = surname[i], start = 1, stop = 1)
}

# Or use previous code below
surname_2 <- vector()

for (i in 1:length(surname)){
  surname_2[i] <- substr(surname[i], 1, 1)
}
print(surname_2)


# 6 The Challenge ---------------------------------------------------------


# Make a NESTED for loop (a for loop within a for loop) that takes the matrices 
# below and runs through the letters of the alphabet and prints 'A is the first letter 
# of the alphabet', 'B is the second letter of the alphabet', etc. You will need to 
# iterate over the columns with one loop, and the rows with the other

alphabet <- matrix(data = c('A','B','C','D','E','F','G','H',
                            'I','J','K','L','M','N','O','P',
                            'Q','R','T','S','U','V','W','X',
                            'Y','Z'),
                   nrow = 2)
position <- matrix(data = c('first','second','third',
                            'fourth','fifth','sixth',
                            'seventh','eighth','ninth',
                            'tenth','eleventh','twelfth',
                            'thirteenth','fourteenth','fifteenth',
                            'sixteenth','seventeenth','eighteenth',
                            'nineteenth','twentieth','twenty first',
                            'twenty second','twenty third','twenty fourth',
                            'twenty fifth','twenty sixth'),
                   nrow = 2)

for(i in 1:length(alphabet)){
  for (j in 1:length(position)){
    if(i == j){
      print(paste(alphabet[i], 'is the', position[j], 'letter in the alphabet', sep = ' '))
    }
    else{
    }
  }
}

# Or see previous code below
for (i in 1:length(alphabet)){
  for (j in 1: length(position)){
    if (j==i){
      print(paste(alphabet[i], ' is the ', position[j], ' letter in the alphabet'))
    }
  }
}


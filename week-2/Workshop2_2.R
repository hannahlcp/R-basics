# BIO319 Workshop 2 - Code Repositories and Regular Expressions
# Hannah Chaudhry-Phipps
# 30/01/23


# 2 Regular Expressions ---------------------------------------------------

# 2.1 An Introduction
# Regular expression - search through data to find certain information

sentence <- c('By','the','time','they', 'got', 'back,', 'the', 'lights', 'were', 'all', 'out', 'and', 'everybody', 'was', 'asleep.', 'Everybody,', 'that', 'is,', 'except', 'for', 'Guih', 'Kyom', 'the', 'dung', 'beetle.', 'He', 'was', 'wide', 'awake', 'and', 'on', 'duty,', 'lying', 'on', 'his', 'back', 'with', 'his', 'legs', 'in', 'the', 'air', 'to', 'save', 'the', 'world', 'in', 'case', 'the', 'heavens', 'fell.')

# grep() function is from a family of regular expression functions
# pattern = the pattern we want to look for in the text (always with ''?)
# x = data object
# So let's search for the word 'the'

grep_out <- grep(pattern = 'the', x = sentence)
grep_out

# We can subset the data to then get the value of the position grep() gave us
sentence[c(2,4)] 

# OR subset using the variable assigned to the grep() function
sentence[grep_out] # note grep() has returned the words 'the' AND 'they'

# Using anchors ^ and $, we can tell grep() where we want the match to start and end
grep_out_2 <- grep(pattern = '^the$', x = sentence)
sentence[grep_out_2] # now we only have 'the'

# Pattern can also be assigned a variable
# The special character '.' specifies any character which can match the search pattern
# '.' is used with other letter characters
pattern <- 't.m' 
example <- c('time', 'tiiimmmmmmeeee', 'timmmmmmmmmmmmmmmmmme', 'tiime', 'timme')
example[grep(pattern, x = example)] # in this example, . replaces i

# x does not need to be explicitly assigned
# but then the arguments need to be ordered as expected by function
# Overall, it is better to assign arguments to the function explicitly for clarity

# argument: value = TRUE provides the values from the function directly 
# i.e., no need to subset
grep(pattern, sentence, value = TRUE)

# grepl() gives logical answer 
# value = TRUE cannot be used be with grepl() function
grepl(pattern, sentence)

sentence[grepl(pattern, sentence)]

# 2.2 Regular Expression Tools
# Search for elements which contain a capital letter using the pattern '[A-Z]'
grep_out_3 <- grep(pattern = '[A-Z]', x = sentence)
sentence[grep_out_3]

# Search for elements which contain a lower case: '[a-z]'
# Search for elements which contain letters, regardless of case: '[A-z]'
# Search for elements containing numbers: '[0-9]'
grep_out_4 <- grep(pattern = '[0-9]', x = sentence)
grep_out_4

# 2.3 Quantifiers 
# Quantifiers allow the user to specify how many of a character (or set of characters)
# the function grep() is matching to
# Where a piece of text is represented as a sequence of characters 
# (whether that text be letters, numbers, and symbols)

# Three main symbols:
# a) '?' denotes 0 or 1 instances of whatever it is after
sentence[grep(pattern = 'e.?e', x = sentence)]
# The above example subsets the grep function
# This can also be written as:
grep(pattern = 'e.?e', x = sentence, value = TRUE)

# Thus, '?' denotes 0 or 1 instances of the . 
# where . replaces one character
grep(pattern = 'e.e?', x = sentence, value = TRUE) # in this instace, ? denotes 0 or more instances of e

# b) '*' denotes 0 or more instances of whatever it is after
sentence[grep(pattern = 'e.*e', x = sentence)]

# Thus, '*' denotes 0 <= instances of the .
# where . replaces one character
# c) '+' denotes 1 or more instances of whatever it is after
sentence[grep(pattern = 'e.+e', x = sentence)]
# Thus, '+' denotes 1 or more instances of the .

# 2.4 The gsub() Function

# The gsub() function can be used to search for text in the same way BUT
# instead of finding the instances of our search term, gsub() substitutes the 
# matched text with text of our choosing

gsub_out <- gsub(pattern = 'a.e', x = sentence, replacement = '!!!')
gsub_out
# gsub() has found matches to the pattern a.e, and replaced the patterns 
# within these matches to '!!!'
# Note it has replaced the pattern with !!! regardless of the length of the '.'

# Try writing your own line of code to replace all the letter 't's with question marks
gsub_out_2 <- gsub(pattern = 't', x = sentence, replacement = '?')
gsub_out_2

# 2.5 The Challenge

dung_beetles <- read.csv('dung_beetles.csv')
str(dung_beetles)
sum(dung_beetles)

View (dung_beetles)

# Type of dataset: dataframe

# Q 3 
# Make a new object that is a vector of all the species names 
# so we can play around with it
dung_beetles_vector <- colnames(dung_beetles)

dung_beetles_remove <- dung_beetles_vector[c(-1,-2, -69:-81)]

# Or use previous code below
dung_beetles_species <- dung_beetles[,3:50]
View(dung_beetles_species)

dung_beetles_species <- dung_beetles[dung_beetles, select = c(3:50)]

# The function colnames() extracts the column names from the data 
dung_beetles_col <- colnames(dung_beetles)

# To remove values (i.e., column names) in the vector, use subsetting and '-' symbol
dung_beetles_1 <- dung_beetles_col[-c(1,2, 69:81)]

# Q 4
# Use your new found grep() prowess to find the names of all the species that 
# have a genus name that starts with the letter ‘C’.
# Search for the pattern with a beginning of 'C' using the '^' anchor
grep(x = dung_beetles_remove, pattern = '^C', value = TRUE)

# Or use previous code below
dung_beetles_C <- grep(pattern = '^C', x = dung_beetles_1, value = TRUE)

# Q 5
# Find all the species where the specific epithet (the second word) starts with the letter ‘r’.
# Search for pattern _r
grep(x = dung_beetles_remove, pattern = '_r', value = TRUE)

# Or use previous code below
dung_beetles_r <- grep(pattern = '_r', x = dung_beetles_1, value = TRUE)

# Q6
# There is a typo in the species names! Replace all the ‘Copis’ genus names with 
# the correct ‘Copris’ spelling.
dung_beetles_correct <- gsub(pattern = 'Copis', x = dung_beetles_remove, replacement = 'Copris')

# Or use previous code below
dung_beetles_gsub <- gsub(pattern = 'Copis', x = dung_beetles_1, replacement = 'Copris')

# Q 7
# Another genus name has been misspelled - ‘Microcopis’ should be ‘Microcopris’. Fix this too.
dung_beetles_correct_2 <- gsub (pattern = 'Microcopis', replacement = 'Microcopris', x = dung_beetles_correct)

# Or use previous code below
dung_beetles_gsub_2 <- gsub(pattern = 'Microcopis', x = dung_beetles_gsub, replacement = 'Microcopris')
dung_beetles_gsub_2

# Q 8
# Now create a new gsub() command that replaces the one you used in question 5 and 6, 
# so that it is flexible enough to fix both genus names in one go!
# First, check for common pattern
grep(pattern = 'opis', x = dung_beetles_remove, value = TRUE)

# And now correct the spelling mistake
dung_beetles_correct_3 <- gsub(pattern = 'opis', x = dung_beetles_remove, replacement = 'opris')

# Or use previous code below
# Check for the (minimum) PATTERN which crosses over in both words
dung_beetles_gsub_3 <- grep(pattern = 'pis', x = dung_beetles_1, value = TRUE)

# Now replace this pattern with the correction
dung_beetles_gsub_3a <- gsub(pattern = 'pis', x = dung_beetles_1, replacement = 'pris')

# Ensure this correction has been completed 
grep(pattern = 'pris', x = dung_beetles_gsub_3a, value = TRUE)

# Q 9
# Replace the column names in your data set with your corrected column names 

colnames(dung_beetles)[6] <- "Copris_agnus"  
colnames(dung_beetles)[7] <- "Copris_ramosiceps"
colnames(dung_beetles)[8] <- "Copris_sinicus" 
colnames(dung_beetles)[9] <- "Microcopris_doriae" 
colnames(dung_beetles)[10] <- "Microcopris_hidakai"

# Trying to use a for loop (not successful)
dung_beetles_corrected <- matrix(ncol = 81, nrow = 20)

for (i in 1:length(dung_beetles[1:50])){
  if (grepl(x = colnames(dung_beetles[i]), pattern = 'opis') == TRUE){
    gsub(x = colnames(dung_beetles[i]), pattern = 'opis', replacement = 'opris')
    dung_beetles_corrected$i <- dung_beetles$i
  } else {
    dung_beetles_corrected$i <- dung_beetles$i
  }
}

# Or use previous code below
install.packages('data.table')
library("data.table")
dung_beetles_new <- setnames(dung_beetles, old = c("Copis_agnus", "Copis_ramosiceps", "Copis_sinicus", 
                               "Microcopis_doriae", "Microcopis_hidakai"),
                             new = c("Copris_agnus", "Copris_ramosiceps", "Copris_sinicus", 
                 "Microcopris_doriae", "Microcopris_hidakai"))
View (dung_beetles_new)

# 2.6 Optional Super Challenge 

# Q 10
# Find all the species where the genus starts with an ‘O’ and the 
# specific epithet ends in an ‘s’.
grep(x = colnames(dung_beetles), pattern = '^O.+s$', value = TRUE) # here, + is after . so denotes 1 or more instances of .

# Or use previous code below
dung_beetles_Os <- grep(pattern = '^O.+s$', x = dung_beetles_1, value = TRUE)

# Q 11
# Subset the dataframe using regular expressions so that it only contains data from months ending in a ‘y’ 
# and genera starting with a ‘C’

# First, use the grep() function to find months ending in a 'y'
grep(x = dung_beetles$Month, pattern = 'y$', value = TRUE)

# Second, subset the dataframe using the above function
# We want to keep the ROWS which ONLY fulfill the grep() function, (and keep ALL columns) so we are subsetting by rows only
dung_beetles[grep(x = dung_beetles$Month, pattern = 'y$'), ]

# Assign this to a new object
dung_beetles_y <- dung_beetles[grep(x = dung_beetles$Month, pattern = 'y$'), ]
View(dung_beetles_y)

# Now, use the grep() function to find genera beginning with 'C'
# Because we are interested in the column names we must specify this (as opposed to interested in the data within the column itself)
grep(x = colnames(dung_beetles_y[, 3:81]), pattern = '^C')

# We are subsetting the columns as we want to keep all the rows, and only the columns which fulfill the pattern search
dung_beetles[, grep(x = colnames(dung_beetles_y[, 3:81]), pattern = '^C')]

# Finally, assign this to a new object
dung_beetles_y_C <- dung_beetles[, grep(x = colnames(dung_beetles_y[, 3:81]), pattern = '^C')]

# Or use previous code below
# Subset genera starting with a 'C’

# Subset data according to column name: note 'x = names()' argument with grep() function
# NOTE position of the comma - we are interested in subsetting columns
# We only want to do this in column 3 to 68 (where the genera names are), so specify with [row, col]
subset_genera <- dung_beetles_new [ , grep(pattern = '^C', x = names(dung_beetles_new[ , 3:68]))]
View(subset_genera)

# Now subset the subset_genera data containing months ending in 'y' only
# NOTE the position of the comma - we are interested in subsetting rows
subset_total <- subset_genera[grep(pattern = 'y$', x = subset_genera$Month), ]
View(subset_total)


# Week 6 Reading ----------------------------------------------------------

# Q 1
# Write a regular expression that selects all species name columns

col_names <- grep(pattern = '^.+_', x = colnames(dung_beetles), value = TRUE)

# Q 2
# Write a regular expression that selects only microcopis species

col_names_Microcopis <- grep(pattern = 'Microcopis', x = colnames(dung_beetles), value = TRUE)

# Q 3
# Using your regular expressions to select columns, make a table containing only microcopis species

table_Microcopis <- dung_beetles[, col_names_Microcopis]

table_col_1_2 <- dung_beetles[, c(1,2)]

table_Microcopis_c <- cbind(table_col_1_2, table_Microcopis)

# OR without using cbind()

table_Microcopis_final <- dung_beetles[, c(1,2,9,10)]

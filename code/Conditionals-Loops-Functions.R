##### Software Carpentry R Workshop - James's Code

### Conditional Statements (If... else)
# Have the computer make decisions

number <- 37

# Make a choice: Only one of the print() statements runs, never both
# The first line is the test.  
# The else part is optional, but runs if the first test doesn't pass
if (number > 100) {
     print("greater than 100")
} else {
     print("less than or equal to 100")
}

### Comparison operators in R
# Less than <
# Greater than >
# Equal to ==
# Not equal to !=
# Less than or equal to <=
# Greater than or equal to >=

number <- -3

# In addition to an else statement, we can also have any number of 
# additional tests in the form of else if
# This code tests the sign of a number
if (number > 0) {
     print(1)
} else if (number < 0) {
     print(-1)
} else {
     print(0)
}

number1 <- -15
number2 <- 40

# We can do two (or more) tests at once using the logical operator & (and)
# Here, the second test is only evaluated if the first test passes
# Both tests need to pass to print "both numbers are positive"
if(number1 >= 0 & number2 >= 0) {
     print("both numbers are positive")
} else {
     print("at least one number was negative")
}

### Logical operators in R
# AND (both tests need to be true): &
# OR (only one test needs to be true): | 
     # Example: number1 >= 0 | number2 >= 0
# Not (true if this one statement is not true): !
     # Example: !(number1 >= 0)
     

### Loops: for loops
# Automate repetitive tasks


numbers <- 1:10
numbers

# This runs the contents inside the loop for each number in the numbers vector
# we made above
# Each time, it saves the next number to the number variable, and prints it
for (number in numbers) {
     print(number)
}

# Often, for loops use an increment variable (usually i or j)
# This lets us keep track of which iteration of the loop we are in
# Often, the increment variable can be used to refer to the row of a dataframe
# if you are trying to do something to each row.
for (i in 1:10) {
     print(i)
}

# After the loop is finished running, the increment variable is still set
# It contains the value of the last number given to it (10 in this case)
print(i)

letter <- "z"
print(letter)
for (letter in c("a", "b", "c")) {
     print(letter)
}
print(letter)


numbers <- c(1:10000)
running_sum <- 0
for(number in numbers) {
     running_sum <- running_sum + number
}
print(running_sum)


### Functions
# Save bits of code you use frequently for later

# Try running a function without ().  In R, you'll see the underlying code
read.table

# Let's make a function to convert fahrenheit to kelvin
# A function is a variable too, so we store it to a name
# Everything inside the curly braces {} is part of the function
# This fuction has an argument, temp.  
# When we run the function, we have to give it this argument to convert
fahr_to_kelvin <- function(temp) {
     
     # This does the actual conversion
     kelvin <- ((temp - 32) * (5 / 9)) + 273.15
     
     # This sends the answer back outside the fuction
     return(kelvin)
}

# It's a good idea to test your functions with some known cases
# Make sure you run the function code first before testing so that the function
# exists

# Freezing point
fahr_to_kelvin(32)

# Boiling poin
fahr_to_kelvin(212)


# Make another function to convert kelvin to celsius
kelvin_to_celsius <- function(temp) {
     celsius <- temp - 273.15
     return(celsius)
}

# Test with absolute zero
kelvin_to_celsius(0)


### Variable Scope: variables inside functions only exist inside functions


# Function to convert fahrenheit to kelvin
fahr_to_kelvin <- function(temp) {
     temp <- ((temp - 32) * (5 / 9)) + 273.15
     return(temp)
}

# Store the current temperature in F into a variable that's the same as the one
# inside fahr_to_kelvin()
temp <- 73

# Get the temperature in kelvin
kelvin_temp <- fahr_to_kelvin(temp)

# Print the temperature.  It's still 73. fahr_to_kelvin() left it alone
print(temp)


# Make a function to convert celsius to fahrenheit
celsius_to_fahr <- function(temp) {
     fahr <- temp * 9 / 5 + 32
     return(fahr)
}

# Test the new function
celsius_to_fahr(100)

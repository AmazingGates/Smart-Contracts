# In this section we will be going over more Advanced Functions.

# We've gone over some of the different basic functions here, but there are a lot of other functions.

#  We will be diving into some of those more advanced functions now.

# All of the functions we will be going over are external functions, which means that after we deploy the 
#contract, we'll be able to call these functions .

# We will start by adding the @extrenal decorator, followed by the @pure decorator.

# We'll go over the definition of the @pure decorator later in the module.

# Next we will start writing our function, starting with the def keyword. We will call the function 
#( multiply(): ).

# As the name implies, we will multiply two uint256 values. We will be multiplying x: uint256 and y: uint256.

# We want to return the product of X and Y. To this, we'll use an arrow ( -> ), then we'll say we're going
#to return uint256, and then we will give our function instructionsto return the product of x and y.

# This was an example of a function that takes in two inputs and returns the product of the two numbers, or
#inputs.

# Let's look at another example.

# We'll perform the same function, but this time, we will be dividing the inputs. 

# See the favorites.vy file for the example.

# Note: Keep in mind that in Vyper, when we want to divide two integers, we need to use the double slash "//".

# For the next example, we'll go over the process of declaring a function, but not implementing the code
#right away. We just want to make sure that the contract compiles. 

# In this case, we would use the keyword "pass".

# See the example in the favorites.vy file.

# In the last example, we will go over the process of returning multiple outputs.

# See the example in the favorites.vy file.

# Notice in the example we used the arrow "->" to put to the function that had multiple types (uint256, bool).

# This will tell our function that these are the types of the outputs we want returned.

# In the return, we will specify what we want returned in the function (123, True). This we will represent
#our unsigned integer and our boolean.

# These are a few examples of the advanced functions that we can use in Vyper. At this point we can start
#compiling these functions to see what kind of outputs we get.
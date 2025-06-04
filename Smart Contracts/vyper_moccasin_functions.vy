# In this section we will be going over the functions inside of Vyper.

# The functions are used, or called with the "def" keyword.

# Functions or methods are very small subsections of code that when called or invoked or clicked will
#execute some subset of code from our code base.

# Again, this concept is the same as in Python.

# To declare a function, we use the "def" keyword, followed by the name of the function.

# That would look like this: def store()

# We created a function called store, which means this is the name of our function.

# Then we add parentheses, which is where we would put any arguments that we want to pass into the function.
# For example, if we wanted to pass in a number, we would put that number inside the parentheses.

# This will update our function with the number we want to store as our favorite number. 

# That would look like this: def store(new_number: uint256)

# Then we add a colon after the parentheses, which is how we tell Vyper that we are done with the function
#name, and we are ready to start writing the code inside of the function.

# Note: After the colon, we will hit the enter key, and this will create a new line with a tab space
#indented. This is how we tell Vyper that we are inside of the function and we are ready to start writing
#the code that will be executed when the function is called.

# Once inside of our function, we are going to write: self.my_favorite_number = new_number
# This will update our favorite number to the new number that we passed into the function.

# Note: The "self" is avery specific keyword that is used to refer to the currrent instance of the contract.
# This is how we are able to access the variables that are inside of the contract.

# So when we say self.my_favorite_number, we are saying that we want to access the variable called
#my_favorite_number that is inside of the contract. Then we are going to set that variable equal to the 
#new number that we passed into the function. 

# If we didn't have self, the compiler would not know what we are talking about, and it would throw an error.

# So what our is going to do, is we're going to pass in a number, like 7 for example, and then save it to 
#my_favorite_number.

# Now similarly to how we need the "public" keyword, so we can view the variable and read the value of
#my_favorite_number, functions have the same concept.

# We need to add a visibility modifier to our function, so we can call it from outside of the contract.

# We can do this by adding: @external, right above our function.

# This is known as a decorator, and it is used to modify the behavior of our function, and allows us to
#call the function from outside of the contract.

# At this point, we recompile our contract in the Remix IDE, and Redeploy and see what has changed.

# Now we can see that we have a new button called store inside the Remix IDE, on top of our my_favorite_number
#button.

# The button appears grayed out at first because we have not given it any arguments yet.

# We can actually click the store button, and it will open up a the input box next to it. 

# This is where we can enter the number that we want to store as our favorite number.

# We will enter the number 7, and then hit the store button.

# This will call the store function, and pass in the number 7 as the argument.

# This will then execute the code inside of the function, and set my_favorite_number to 7.

# Now when we hit the my_favorite_number button, we will see that the value of my_favorite_number is now 7.
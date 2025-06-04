# In this section we will be going over the process of using the Constructor Init and Deploying it               

# In Vyper, there are a couple of other function decorators and a couple other special types of 
#functions. One of the most important types of functions is called the Constructor

# A Constructor is a special function that is called only once when the contract is deployed. The
#main use of a constructor is to set some State variables or to call other functions that are needed
#to set up the contract.

# One of the most common things that are done inside the of the constructor is to set the owner of the contract.

# For example, let's say that we have a state variable called owner that we will make public, and pass an
#argument called address.

# To define our Constructor we will start by using the @deploy decorator. Then we need to define a special
#function, and it has to be this exact name ( def __init__(): )

# Note: We will use the parentheses to pass in any arguments we want the Constructor to have, if we have
#any. For now, we'll leave it empty.

# To set the owner state variable, we'll use self.owner = msg.sender. Sender refers to the account that
#deployed this contract. So by setting the state variable to message sender, we're saying that the owner
#of this contract is the deployer of this contract.

# This is probably the most common use case of a constructor to set a state variable that stores the owner
#of the contract.

# Next we will go over some examples of passing parameters into the constructor. 

# For example, first let's create a state variable called (name:). This will be a public string with the
#max length of 100 ( public(string[100]) ).

# Now let's pass the parameter into the constructor. For the input we'll use ( name: ). Don't forget that
#this will be a string with a length of 100 ( name: String[100]).

# To use this input, we'll the self.name = name. 

# Note: We can pass more than one parameter at a time. 

# For example, we'll create a timestamp called expiresAt:, which will be a public unsigned integer.
#( expiresAt: public(uint256) ).

# And for the second parameter into the constructor, we will call the value ( duration: ). We will set
#this new parameter to the uint256 ( duration: uint256)

# To call this timestamp in our constructor function we will use ( self.expiresAt = block.timestamp ) + 
#( duration ) from our input into the constructor ( self.expiresAt = block.timestamp + duration )

# At this point we can compile our contract inside the Remix IDE and see the results.

# We should notice that we now have a file for the constructor button that contains our Constructor file.

# Here, we will have two fields where we can pass inputs into. The name field, and the duration field.

# In order to deploy this constructor file, we will need to enter values. Once we do, we can hit the transact
#button, which will deploy our contract. ( transact is an orange button )

# Once the contract is deployed we will notice three new buttons ( expiresAt, name, owner ). These will 
#all be blue buttons.

# The owner will be the address that deployed the contract. 

# The name will be the name we entered into the name field.

# The duration will be the value displayed when we hit the expiresAt button.

# Now that we have an understanding of what a Constructor is, let's create a Constructor function for our
#favorites.vy file

# We'll start by saying that our favorite number is 7.

# Then we'll build our constructor, starting with the @deploy, then underneath we will add start building
#our Constructor method ( def __init__(): ).

# For now we won't pass any parameters.

# Then we'll move inside our function to begin writing the instructions, or what the Constructor Function
#will be doing.

# For now we are just going to call self.my_favorite_number state, which we will set equal to 7.

# Now we have a Constructor saying the instant we deploy this Smart Contract, by calling this init function, 
#we will set my_favorite_number to 7.

# So when we compile this, we can hit the deploy button and see the buttons that are available. We will
#notice that we still have the blue my_favorite_number button as an option, and once we click on it, it 
#will return the value we set in our Constructor Function.

# Note: The blue retrieve button, which is view only, will also return the value that we set in our 
#Constructor Function.
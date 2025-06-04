# In this section we will be going over the visibility of functions in Vyper.

# The first thing we need to keep in mind is that when we don't use the Visibility Modifiers "public" or
#"external" on our variable or function, it will default to being private, or "internal" in Vyper.

# This means that we will not be able to access the variable or function from outside of the contract.

# @internal is another visibility modifier that we can use to make our function or variable only accessible
#inside of the contract, and can only be called by other functions, not from outside of the contract.

# Even though this is the default setting, this is how we can set it manually if we ever needed to.

# For example, if we added the @external to a new function: def store_other(): and then we wrote self.store(7) 
#inside of it, calling our original function, and we made our original function @internal, we would be able to
#call it using this method.

# So if we have an internal function, it can only be called by other functions inside of the contract, like
#in the example given in our favorites.vy file.

# Note: @external means that our variable, or function, can be called by people outside of the contract, while
#@internal functions cannot call external functions. 

# The next topics we are going to go over are the @view and the @pure 

# Additionally, we can make a function that returns a value. This is how we can do this in the example below.

# For example, let's look at the example given in the favorites.vy file that uses the def retrieve(). Notice
#that we have an "-> uint256" after the function name. Then we have return self.my_favorite_number. This is
#how we can return a value from a function in Vyper, similar to hitting the blue my favorites button in the
#Remix IDE.

# When we carry out this process, this will open up a new organge box inside of the Remix IDE that says
#"retrieve".

# Note: We should keep in mind that unless we specifically tell the Vyper compiler that a button is not
#a transaction, it'll assume that we're meaning to send a transaction.

# Also Note: When we hit the blue my_favorite_number button, we're not actually sending a transaction, we
#are just reading some state from the blockchain, we're not updating the state of the blockchain, so we don't 
#need to spend any gas to do that. 

# However, when we call store, or hit the orange store button, we are updating the state of the blockchain,
#and we have to spend gas to actually update the state of the blockchain. 

# So that's why the store button is orange, to signify that this is going to spend gas, unlike the blue
#my_favorite_number button which signifies that it would be spending any gas.

# This brings us back to the orange retrieve button. Even though it is orange, we're not updating anything,
#we're just returning the value of my_favorite_number. But, if we call, or just the orange retrieve button
#as is, it will act as if it is sending a transaction, and in this case spend gas.

# This is happening because we didn't tell Vyper that the retrieve function we created shouldn't send a 
#transaction, as mentioned above. So at this point we're actually spending gas to do nothing, which is 
#wasting gas, which is wasting our crypto.

# If we want to tell our compiler that this isn't a function that is sending a transaction, we can just 
#use the @view decorator above our function.

# This will change our function to a view function, and that will tell the compiler that this isn't a 
#transaction that we aretrying to spend gas on.

# This action we turn the retrieve button from orange to blue, letting thje compiler know that this will
#not be sending a transaction, and that it is view only, which doesn't require any gas to be spent.

# Now the retrieve button will behave in a similar fashion as the my_favorite_number button when we call it,
#or click it, it will return the value we stored as our number when we enter a number in the store field and 
#and save it as our new number.

# Note: When a transaction calls a view function it does spend gas. See example in the favorites.vy file.
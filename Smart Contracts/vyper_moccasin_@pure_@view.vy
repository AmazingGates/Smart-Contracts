# In this section we will go over the @pure vs the @view decorators in more detail, and are their 
#differences.

# Both the @pure and @view decorator let our contract know that a function is read only. It's not going
#to write anything to the blockchain. 

# @pure - Does not read any state or global variables

# @view - Reads state and global variables.

# That is the main difference between the two but we will go into more detail.

# Let's go over an example. 

# let's say that we have a @pure function first. Let's call the function add, which takes two inputs 
#(x: uint256) and (y: uint256), and then use an arrow ( -> ) to indicate that we want to return a uint256.

# Next we start writing our function with a return, and say return x + y

@external
@pure

def add(x: uint256, y: uint256) -> uint256:
    return x + y


# Why is this function a @pure function? Because it does not read any state or global variable. And also,
#it is read only.

# What would a function that is not read only look like? 

# Let's add a state variable which we will call (count), and make it a public(uint256).

# Now let's say we were to update this state variable using the self.count ( += ) 1, then would make our
#function not read only.

# It's trying to make updates to the state varaible count. This would be read only.

count: public(uint256)

@external
@pure

def add(x: uint256, y: uint256) -> uint256:
    self.count += 1
    return x + y


# What does it mean for a function not to read any state or global variables?

# Currently this function does not read any state variables, so it is @pure. However, if we were to add
#something like x + y + self.count, now it is reading from a state variable. So this function is not
#considered @pure, since it is reading from a state.

count: public(uint256)

@external
@pure

def add(x: uint256, y: uint256) -> uint256:
    return x + y + self.count 


# The same thing goes for global variables. That will make the function not considered a @pure function. 

# We can add a global variable by adding block.timmestamp. Now the function would be reading from a
#a global variable, and it would lose its read only status.


@external
@pure

def add(x: uint256, y: uint256) -> uint256:
    return x + y + block.timestamp


# Now let's take a look at an example of a @view function.

# Remember that the @view functions allow us to read state vaiables and global variables.

# This function will be called ( add_to_count ) and again, we will use the arrow ( -> ) to indicate
#that we want to do a return, and we will be returning a ( uint256: ). Then we'll say return
#x + self.count.

# Here, our function is taking the input ( x ), and then adding it to the current value of the count State
#variable, which is declared above our function.

count: public(uint256)

@external
@view

def add_to_count(x: uint256) -> uint256:
    return x + self.count


# This function is still read only since we are not making any updates, however this function is not a
#@pure function, since it's reading a value from a state variable, we can also read from a global variable.

# We can add a global variable by adding ( block.timestamp ) to our function.

count: public(uint256)

@external
@view

def add_to_count(x: uint256) -> uint256:
    return x + self.count + block.timestamp


# At this point we can start compiling the different versions of the code we have so far to see the
#differences.
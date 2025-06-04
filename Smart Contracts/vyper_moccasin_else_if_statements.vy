# In this section we will be going over "Conditionals", which are "Else" / "If", Statements.

# Let's go over these conditionals by creating some examples.

# In this first example we will create a function called "if_else", which is going to take a single
#input of type uint256, and it will return ( -> ) a uint256.

# To write a conditional statement in Vyper we would write "if" conditional, and then we would say "if"
#the input "x" is less than or equal to "10" (for example), then we are going to return 1, "else" we will
#return 0.

# We will also use the @pure decorator with this function.



@external
@pure
def if_else(x: uint256) -> uint256:
    if x <= 10:
        return 1

    else:
        return 0


# If we wanted to add another "conditional" statement in between our original "if/else" statement, we can
#add it in by writing "elif" x is less than or equal to 20, we will return 

@external
@pure
def if_else(x: uint256) -> uint256:
    if x <= 10:
        return 1
    elif x <= 20:
        return 2
    else:
        return 0


# This is an example of the "Conditional" Statements, "if/else", and "elif".

# At this point we can compile our code to see the results.

# Now that we deployed our first contract, we our done with our favorites.vy file and we can move on to
#more complex modules and files.
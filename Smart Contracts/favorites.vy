# pragma version 0.4.0
# @license MIT

# favorite things list:
# favorite numbers
# favorite people with their favorite number

#my_favorite_number: uint256

my_favorite_number: public(uint256) # This will produce a longer number when compiled because it is combined
#with a visibility modifier. It defines a variable that can store a 256-bit unsigned integer value and 
#automatically generates a getter function for it.

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

# ------------------------------------------------------------------------------------------------
# This is how we call an internal function using an external function. 

my_favorite_number: uint256.

@internal
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
def store_other():
    self.store(7)

# ------------------------------------------------------------------------------------------------
# This is how we can return a value from a function in Vyper.

my_favorite_number: public(uint256)

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number
    
# -------------------------------------------------------------------------------------------------
# This is how a transaction calls a view function which will cost gas.

my_favorite_number: public(uint256)

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 
    self.retrieve()

@internal
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

# ------------------------------------------------------------------------------------------------------
# This is how we use our Constructor Function

owner: public(address)

@deploy
def __init__():
    self.owner = msg.sender

# ------------------------------------------------------------------------------------------------------
# This is how we will pass parameters into the Constructor.

owner: public(address)
name: public(String[100])

@deploy
def __init__(name: String[100]):
    self.owner = msg.sender
    self.name = name 

# ------------------------------------------------------------------------------------------------------
# This is how we will pass a second parameter into the Constructor.

owner: public(address)
name: public(String[100])
expiresAt: public(uint256)

@deploy
def __init__(name: String[100], duration: uint256):
    self.owner = msg.sender
    self.name = name
    self.expiresAt = block.timestamp + duration

# ---------------------------------------------------------------------------------------------------------
# This is where we will build a Constructor Function that we can run in the Remix IDE.

my_favorite_number: public(uint256) # 7

@deploy
def __init__():
    self.my_favorite_number = 7

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number 

# ---------------------------------------------------------------------------------------------------------
# This is where we will add more people to our function to store data for manually.

my_favorite_number: public(uint256) # 7
alias_favorite_number: public(uint256)
delias_favorite_number: public(uint256)
tiffanys_favorite_number: public(uint256)

@deploy
def __init__():
    self.my_favorite_number = 7

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 
    self.alias_favorite_number = new_number
    self.delias_favorite_number = new_number
    self.tiffanys_favorite_number = new_number

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

# -------------------------------------------------------------------------------------------------------
# This is where we will go over some Advanced Functions. 
#The first is a multiplication function. This function will take in two inputs and return the product of
#the two inputs, or numbers.

@external
@pure
def multiply(x: uint256, y: uint256) -> uint256:
    return x * y

# -------------------------------------------------------------------------------------------------------
# This is where we will go over some Advanced Functions. 
#The second is a division function. This function will take in two inputs and return the dividend of
#the two inputs, or numbers.

@external
@pure
def divide(x: uint256, y: uint256) -> uint256:
    return x // y 

# -------------------------------------------------------------------------------------------------------
# This is where we will go over some Advanced Functions. 
#The third is a pass function. This function will allow us to declare our function, but not implement the
#code right away.

@external
@pure
def todo():
    pass 

# -------------------------------------------------------------------------------------------------------
# This is where we will go over some Advanced Functions. 
# In the final example we will go over the process of returning multiple outputs. 

@external
@pure
def return_many() -> (uint256, bool):
    return (123, True)

# ---------------------------------------------------------------------------------------------------------
# This is where we will add a minimal list of numbers using a Fixed Size List

my_favorite_number: public(uint256) # 7

list_of_numbers: public(uint256[5])

@deploy
def __init__():
    self.my_favorite_number = 7

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_number(favorite_number: uint256):
    self.list_of_numbers[0] = favorite_number

# ---------------------------------------------------------------------------------------------------------
# This is where we will add a minimal list of numbers
# This is where we'll have a way to keep track of the last number we set in the array.

my_favorite_number: public(uint256) # 7

list_of_numbers: public(uint256[5])
index: public(uint256)

@deploy
def __init__():
    self.my_favorite_number = 7
    self.index = 0

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_number(favorite_number: uint256):
    self.list_of_numbers[self.index] = favorite_number
    self.index = self.index + 1

# ---------------------------------------------------------------------------------------------------------
# This is where we will add a minimal list of numbers
# This is where we will add other people and their favorite numbers to our contract using a "struct".

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: String[100]
my_favorite_number: public(uint256) # 7

list_of_numbers: public(uint256[5])
list_of_people: public(Person[5])
index: public(uint256)

@deploy
def __init__():
    self.my_favorite_number = 7
    self.index = 0
    self.my_name = "Papi"

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_number(favorite_number: uint256):
    self.list_of_numbers[self.index] = favorite_number
    self.index = self.index + 1

# ---------------------------------------------------------------------------------------------------------
# This is where we will add a minimal list of numbers
# This is where we will update the add_number functionality to dynamically add people to our list of people
#using a "struct" and a "HashMap"

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: String[100]
my_favorite_number: public(uint256) # 7

list_of_numbers: public(uint256[5])
list_of_people: public(Person[5])
index: public(uint256)

name_to_favorite_number: public(HashMap[String[100], uint256])

@deploy
def __init__():
    self.my_favorite_number = 7
    self.index = 0
    self.my_name = "Papi"

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number 

@external
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_person(name: String[100], favorite_number: uint256):
    self.list_of_numbers[self.index] = favorite_number
    new_person: Person = Person(favorite_number = favorite_number, name = name)
    self.list_of_people[self.index] = new_person
    self.name_to_favorite_number[name] = favorite_number
    self.index = self.index + 1

# Now that we deployed our first contract, we our done with our favorites.vy file and we can move on to
#more complex modules and files.
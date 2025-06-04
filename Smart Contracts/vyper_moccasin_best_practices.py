# This is the section where we will be introduced to Vyper, which is the coding language used to write
#Smart Contracts. We will start with undersatnding the basics.

# Ww will start this section by going over Vyper Syntax.

# We will start by learning how to write a simple vyper contract.

# For this, we will be using a .vy extension file. This is the file extension used for vyper files, and it
#let's the compier know that we are using vyper.

# Note: We may need a vyper compiler to compile the vyper code. We can use the Vyper compiler to compile
#vyper code to EVM bytecode. We can install the Vyper compiler using pip.

# The first thing we are going to need to do in any smart contract, whether it's vyper or solidity, is to
#type the version of the compiler we are going to be using. This is done by using the @version pragma
#statement. This is the first line of code we will write in our vyper contract. The version we are 
#going to be using is 0.4.0. This is the latest version of vyper at the time of writing this code.

# There are a couple of ways to write the version pragma. The first way is to use the @pragma version
#statement. (@pragma version 0.4.0) This is the most common way to write the version pragma. The 
#@version pragma statement is used to specify the version of vyper we are using.

# The second way is to use just the @version staement. (@version 0.4.0)

# Another way is to use the @pragma version statement with the ^ symbol at the end of the statement. This 
#means that we want to use 0.4.0 and up. So this means that we will include any version after 0.4.0, IE
#0.4.1, 0.4.2, 0.4.3 and so on and so forth. (@pragma version ^0.4.0)

# There are a few more ways to write this statement, but for now we will just be using the most commonly
#used version (@pragma version 0.4.0).

# When using @pragma version 0.4.0, we are telling the compiler that we are using the 0.4.0 version of
#vyper. This is the version we are going to be using for this course.

# The next thing we want to see is the @license statement. This is used to specify the license
#we are using for our smart contract.

# This tells the compiler what license our compiler is under. 

# We will be using the MIT license for this course. This is the most common license used for smart
#contracts, and it is also open source. This means that anyone can use this code for free, and they can also
#modify it and use it for their own projects.

# If we don't give our code a license it means it's proprietary, and no one can use it without our permission.

# Also, some compilers will not compile our code if we don't give it a license.

# The next thing we want to do is make a favorite things list.

# We want to store our favorite numbers.

# We also want to store favorite people with their favorite number.

# This is what we want to build. A smart contract list that just stores and holds our favorite numbers,
#and different people with their favorite numbers.

# How do we do this?

# To get started, we are going to get to learn the value types of vyper. These are the basic data types
#we are going to be using in our smart contract that will allow us to store our data.

# In order for us to store different types of data, we need to specify the data type we are going to be
#using. This is done by assigning a value type to a variable.

# In Vyper we have a lot of different value types which include the following:
# - int
# - uint
# - bool
# - decimal
# - bytes
# - string
# - address
# - list
# - map
# - struct
# etc etc.

# We can use these different types to define different variables.

# The first data type we are going to be using is the uint data type. This is used to store positive integers.

# For us to deploy our contract, we need to compile it. 

# Note: Although we are writing code with words, we are not sending code with words. We are sending
#the runetime bytecode, which is made up of numbers.

# The bytecode is what the EVM understands. The EVM is the Ethereum Virtual Machine. This is the machine
#that runs our smart contract. The EVM is a virtual machine that runs on the Ethereum network. It is
#responsible for executing our smart contract code. The EVM is a decentralized machine that runs
#on the Ethereum network.

# So basically, whenever we compile our code, we are converting our code into bytecode. We are transforming
#our code into a language that the EVM understands.

# Using the Vyper compiler is similar to the Python compiler. If the laws of the syntax are not followed,
#the compiler will throw an error.

# The first thing we will be going over is the uint value type.

# As I mentioned before, the syntax of Vyper is similar to Python. So we will be using the same syntax.

# The syntax we will be using is the following: my_favorite_number: uint256. This syntax is the variable
#to the left, followed by a colon, then then the value type to the right. This is the same as Python, and
#it is ccalled a type hint. This is used to specify the type of the variable we are using.

# When we declare a variable, it is known as a state variable, or a storage variable (my_favorite_number).  

# This state variable, or storage variable, will get initialized to the default value of the type we are
#using. In this case, the default value of uint256 is 0. This means that when we deploy our contract,
#the value of my_favorute_number will be 0. This is the default value of uint256.

# We can actually check the value of my_favorite_number by changing the visibility of our variable.

# To do this, we can take a storage, or state, variable and we can wrap it in the word public.
#( public(uint256) ).

# This will turn it into a public variable. This means that we can access it from outside the contract.

# Doing this will show us the value of our variable. This is because we wrapped our variable with the word
#public.

# When we don't wrap our variable with the word public, we can't access it from outside the contract. This 
#is beacuse they are created implicitly as what we call internal, meaning that things inside the contract
#can call the function, or read the value. 

# So if we want a state, or storage, variable to be readable by people in the real world, we have to wrap
#it with the public keyword.

# Note: This should be done inside the remix IDE.

# To interact with the smart contract and view the value, you can use a tool like Remix, a web-based IDE 
#for Solidity and Vyper, or you can use web3.py in a Python script to call the getter function.
# In this section we will starting to over more complex modules and files.

# This will be the Buy Me A Coffee contract, which is a simple contract that allows users to send ether to
#the contract owner as a form of support or appreciation, with a couple of cool add-ons.

# The file that we will be building this contract in will be called "buy_me_a_coffee.vy".

# Before we start building we will do  walkthrough of everything we will be doing and everything we need to 
#build this contract.

# What we are going to do is allow people to fund us, which means that will send us money, based off of
#some price that we set, which will "$50" worth of Ethereum, for example, to fund us, in order for us
#to buy a coffee.

# We'll be doing things like getting the value of the Ethereum that's sent, which means that we will be
#getting the pricing information for our Smart Contract.

# Then we're going to add some functionality to withdraw the the money out as well.

# These are just some of things we will be implementing as we build this Smart Contract.

# We will be going over a lot of advanced Vyper, and EVM concepts along the way as well.

# Keep in mind, that it is very important to understand the basics and foundattions as we go, because as we
#move forward and introduce AI into our Smart Contracts, we have to be able to understand what is going
#on under the hood, in case AI does something unexpected or we need to debug something.


#                           Project Setup

# The first thing we will do in our Remix IDE is create the "hi.sol" file again, which will get compiled
#by the Solidity compiler.

# Again, this is what we are going to put in our hi.sol file.

# This time we will also //SPDX-License-Identifier: MIT, which is a license that allows us to use this code
#freely, as long as we give credit to the original author.

//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract hi {}

# Then we will compile this file, using the Solidity compiler.

# Now we will create a new file called "buy_me_a_coffee.vy", which will be the file that we will be building
#our Buy Me A Coffee Smart Contract in.

# Note: We will be using the Snake_case naming style for writing our file, which is standard for Vyper, but
#not the only way. There is also CamelCase, which is used in Solidity, which would look like this:
#"BuyMeACoffee.vy"

# Before we actually start coding, let's list all the things we will be doing in this file.

# The 3 things we want our Smart Contrcat to do are:

# 1. Get funds from users - So people can buy us coffee
# 2. Withdraw funds - So we can take the money out of the contract and buy the coffee.
# 3. Set a minimum funding value in USD - 

# Now we can start building our Smart Contract.

# As usaual, we'll start with the pragma version 0.4.0, and say @ license: MIT.

# As an option, we can add an author tag, leting everyone know who wrote this contract, which is us.

# There are other tags we can add as well, like "description", "title", and "version", but for now we will
#just keep it simple.

# Next, we will build some "Skeleton" code, which is the basic structure of our Smart Contract.

# This will include the following:

def fund():
    pass

# This will allow us to name our function, but not actually write the code for it yet.

# Next we will add:

def Withdraw():
    pass

# These two functions will be the main functions of our Smart Contract, which will allow us to get funds from 
#users and withdraw funds from the contract.

# Obviously we will be adding more functions, but these will be the main ones.

# For the fund function, we want anybody outside of the contract to be able to call it, so we will use
#the @external ddecorator, which is used to define a function that can be called from outside the contract.

# We'll do the samething for the withdraw function.

# Next we will focus on "Doc Strings", which are used to describe what our functions do.

# The first thing we'll do is add a doc string to the fund function, which will describe what it does.

# This is done by adding a comment above the function, which will look like this:

@external
def fund():
    """
    This function allows users to send funds to this contract.

    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    pass

# Notice that we used the tripe quotes to indicate where our comments start and end. The triple quotes 
#most commonly used in Python, but it also works in Vyper.

# This is the general way to add Doc Strings to our functions, which is a good practice to get into.

# Inbetween the triple quotes we will add a desription of what the function does, like we did above.

# Next we will go over sending ETH in a transaction.

# The first thing we to tackle is how do we send ETH to the contract.

# To start, every single transaction that we send, no matter what it is, has to have a value.

# We take a look at the Remix IDE, we will notice that it has a "Value" field, which is where we can
#specify the amount of ETH we want to send in the transaction.

# Every ecosytem has a "Value" field. 

# Every single transaction will a value, however, not every function can read that value. So what we need
#to do to tell our function that we want it read from the value field is add the decorator @payable,
#which will look something like this.

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract.

    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    pass

# This is a Vyper keyword that tells our function that it can read the value field from the transaction.

# Just like wallets can hold funds, contracts themselves can hold funds as well.

# This means that we can send ETH to the contract, and it will hold it for us until we withdraw it.

# We can access the value amount with something called a "Global Value", which is a built in variable
#that is available to us in Vyper.

# The Global Value we will be using is called "msg.value", which is a built in variable that holds the 
#value of the transaction.

# msg.value = Number of Wei sent in the transaction.

# So in order for us to require that whoever calls the fund function sends a minimum amount of ETH, we can
#use the "assert" function, which is a built in function that checks if a condtion is true or false.

# If the condition is true, it will continue to execute the code, but if it is false, it will throw an
#error and stop the execution of the code.

# This is how we would implement it into our contract.

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract.

    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value == 1000000000000000000, "You must send exactly 1 ETH to fund this contract."

# In this example, we are requiring that the user sends exactly 0.1 ETH, which is equal to 100000000000000000

# In this next section we will go over Wei, Gwei, and Ether, which are the three different units of
#measurement for ETH.

# 1 Ether = 1,000,000,000,000,000,000, Wei

# 1 Ether = 1,000,000,000 Gwei

# As we may have noticed, Wei is the smallest unit of measurement for ETH in the EVM ecosystem, and it is
#the unit of measurement that we will be using in our Smart Contract.

# This is because the EVM only understands Wei, and it is the most precise unit of measurement for ETH.

# assert msg.value == 1000000000000000000 is not very readable and it is not very user friendly, so we 
#will use some of Vypers built in utilities that will allow us to convert between the different units
#of measurement.

# Vyper has a built in function called "as_wei_value", which will convert the value we pass to it
#into wei.

# as_wei_value = Vyper built in function that converts a value to wei.

# So any time we send a transaction and we're working with wei, which we always will be, we can use the 
#as_wei_value function to convert the value to wei.

# This is how we would implement it into our contract.

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract.

    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value == as_wei_value(1, "ether"), "You must send exactly 1 ETH to fund this contract."

# In this example, we are requiring that the user sends the equivalent of 1 Ether in the form of wei.

# We can also add a message at the end of the function, which is optional. Notice that we used a comma
#after the assert statemnet, which allows us to add a meassage to the assert statement.

# This message will be displayed if the assert statement fails, which is a good way to let the user know
#what went wrong.
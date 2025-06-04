# In this section we will be begin the Introduction to the Web3py Favorites Project.

# Now that we have our bytecode and our compilation details, we have to actually create the project itself
#in Vyper.

# Now that we the object, what we need to do is turn the compilation detail information into a Contract
#object.

# We will do this by using a tool called "Web3.py".

# Web3.py is a Python library that allows us to interact with the Ethereum Blockchain and other EVM
#compatible blockchains.

# It is a very powerful library that allowsus to do a lot of things, such as:
# - Interact with Smart Contracts
# - Send Transactions
# - Query the Blockchain
# - Create Wallets
# - And much more.

# The classical way to install Web3.py is to use pip, which is would be:

# pip install web3

# However, we are using the UV tool, so we will use the following command to install the package:

# uv add web3

# This will add the package directly into our virtual environnment (venv) and we will be able to use it
#immdiately.

# If we want to make sure that the package is installed, we can use the following command:

# uv sync

# This will sync the package and make sure that it is installed correctly.

# Now that we have successfully installed the Web3.py package, we can start using it in our project.

# The first thing we will need to do is import the package into our project.

# We will do this by using the following command:

# from web3 import Web3

# Note: The from web3 has a lowercase "w", and the import Web3 has a capital "W".

# This will inport the web3 package into our project and we will be able to use it immdiately.

# Now that we have imported the package, we can start using it to interact with the Ethereum Blockchain.

# The first thing we will need to do is create, or initialize a Web3 object.

# Before we do that, we will need to also import the "EthereumTesterProvider" package, which is a package
#that allows us to use the Ethereum Tester as a provider for our Web3 object.

# Once we have imported the package, we will create a web3 object bybusing the following command:

# w3 = Web3(EthereumTesterProvider())

# The next step will be to create a "Contrcat" object that will allow us to interact with the Smart 
#Contract.

# We will do this by using tthe following command:

# w3.eth.contract(bytecode=compilation_details["bytecode"])

# Then we will store this object in a variable called "favorites_contract".

# This will look like this:

# favorites_contract = w3.eth.contract(bytecode=compilation_details["bytecode"])

# Now that we have our contract object, we can start interacting with it.

# The first thing we will do is deploy the contract to the blockchain.

# We will do this by using the following command:

# Note: The "compilation_details" variable is known as a "dictionary" in Python, which is a data
#structure that allows us to store data in key-value pairs.

# Using the EthereumTesterProvider was just for example, moving forward we will not be using it
#anymore, so we will remove from the code.

# What we are going to do instead is use the "HTTPProvider" package, which is a package that allows us to
#connect to the Ethereum Blockchain using HTTP.

# Luckily for us, we still have access to an HTTPProvider from previously in the coure.

# This HTTPProvider xan be located on the Tenderly network, which is the test network that we were using
#before.

# The HTTPPrrovider address will be located on the explorer page, and it will be titled "HHTPS".

# We will copy this address and use it to create our HTTPProvider object.

# This is the address that we will be using:

# "https://virtual.sepolia.rpc.tenderly.co/a242e760-2c11-4d04-938f-0675e3116867"

# Now that we have our HTTPProvider address, we can create our HTTPProvider object.

# We will do this by using the following command:

# w3 = Web3(Web3.HTTPProvider("https://virtual.sepolia.rpc.tenderly.co/a242e760-2c11-4d04-938f-0675e3116867"))

# Note: Notice that we uased the Web3.HHTPProvider syntax inside the Web3 object, and then we passed the 
#address as a parameter.

# This is the correct way to do it, and we will be using this syntax moving forward.

# Now that we have our HTTPProvider object, we can create our contract object.

# To intialize a web3 instance, we have to actually connect to a blockchain node, and right here we are
#using the Sepolia testnet node from Tenderly as our provider to do so.

# Note: Later on in this module we will go over a method that doesn't require this step at all, and we will 
#use an even easier approach to this problem. But for now, this is what we will be using.

# Again, to check that our work is correct so far, we will print out the favorites_contract object.

# This will look like this:

# print(favorites_contract)

# We will then run our code in the terminal to see what we get.

# If everything is correct, we should see the following output:

# <class 'web3._utils.datatypes.Contract'>

# This is the "String Interpretation", or the "print interpretation" of the favorites_contract object.

# What this is basically saying is that the favorites_contract object is a "Contract" object, or, of type
#"Contract".

# We have successfully created our contract object and we are ready to start interacting with it.

# With that being done, and us making sure that everything is correct, we can also remove the print
#statement for the favorites_contract object, as we will not be needing it anymore.


# In this section we will be going over a Python Tip that will help us run this code a different way.

# We will be using something called a "breakpoint()", which is a built-in function in Python that 
#allows us to pause the execution of our code and inspect the variables at that point in time.

# This is very useful for debugging and testing purposes, as it allows us to see what is going on in our
#code at that point in time.

# Once we have the "breakpoint()" added to our code, we will run it again in the terminal using the UV
#command.

# If everything is correct, the execute up until the breakpoint and then it will drop us into a Python
#shell where we can inspect the variables and see what is going on.

# We can then use the "exit()" command to exit the shell and continue the execution of our code, which
#is paused at the breakpoint.


# In this section we will go over a few Python breakpoint() tips that will help us use it more effectively.

# We will start by executing the code again so that it ca drop us into the "pdb", or the Python Debugger
#shell.

# On the pdb shell line we ccan once again type in the name of our variable, which is "favorites_contract",
#and we will see the output of the variable.

# This is the output that we will see:

# <class 'web3._utils.datatypes.Contract'>

# This is the same output that we saw before, but this time we are able to inspect the variable and see
#what is going on with it.

# Another thing we can do is use the print() function to print things as usual.

# If we were to use the print() function to print the favorites_contract object, we would see the same output
#as before, and it's not really being deployed.

# This is because we don't have any functions or anything that is actually doing anything with the object.

# Right now the favorites_contract object is just a placeholder for the bytecode and the compilation 
#details.

# We still have a few more things to do before we can actually deploy the contract to an actual network 
#and start using it.

# For now, we will exit the shell by typing this command:

# exit()

# This will exit the shell and continue the execution of our code.

# Note: A lot of debuggers let us type the letter "Q" to exit the shell, but in this case we will
#be using the "exit()" command to exit the shell.

# Once we have exited the shell, we will be back in our code and we can continue working on it.

# Before we move forward we will clear the terminal by using the "clear" command, which will clear the
#terminal.


# In this section we will be goning over the process of installing "anvil" in our project.

# We will be using the "anvil" package because we don't want to use the Sepolia testnet node from
#tenderly anymore.

# So we are going to move away from the Sepolia testnet node and we are going to use another test 
#network instead.

# Before we do that, we will be installing a tool called "foundry", which is a tool that allows us to 
#install and manage different Ethereum tools and packages.

# we will be using the "foundry tool" to install the "anvil" package.

# This is how we will install the "fondry" tool:

# curl -L https://foundry.paradigm.xyz | bash

# This will install the "fondry" tool in our project and we will be able to use it immediately.

# Once we have installed the "foundry" tool, we will be able to use it to install the "anvil" package.

# Running foundry will automatically install the "anvil" package for us, along with a few other 
#packages that we will be using in the future.

# To run foundry, we will start by deleting our current terminal and opening a new one.

# Once we have opened a new terminal, we will run the following command:

# foundryup

# This will run the "foundry" tool and it will install the "anvil" package for us.

# Once we have installed the "anvil" package, we will be able to use it to create a new test network
#and start using it in our project.

# Note: Whenever we want to update the "foundry" tool, we can just run the "foundryup" command again and
#it will update the tool for us.

# Now we can check to see if the "anvil" package is installed by using the following command:

# anvil --version

# This will show us the version of the "anvil" package that is installed in our project.

# If everything id correct, we should see the following output:

# anvil Version: 1.1.0-stable

# This means that the "anvil" package is installed and we are ready to start using it in our project.


# In this secttion we will be going over the process of working with the "anvil" package and how to
#use it to create a new test network.

# We will start by running the "anvil" command in the terminal.

# This will create a new test network and it will start runnung it in the background.

# We are now running a local test network Blockchain Ethereum node right in our terminal, and we can use it 
#to deploy our Smart Contracts and interact with them.

# What we will do is leave the anvil instance running in the background and we will open a new terminal
#window to work on our project.

# Note: We will be doing all of our work inside the new terminal window that we just opened, and we will
#not be using the old terminal window anymore. It is still running in the background, but we will not be
#using it anymore, it is just there to keep the anvil instance running.

# Instead of connecting to the Sepolia testnet node from Tenderly, we will be connecting to the anvil
#instance that we just created.

# To do this, we will go back to our old terminal window and scroll to the bottom of the terminal unitl we
#see "listening on", and we will copy the number that is next to it.

# This number is the port number that we will be using to connect to the anvil instance.

# Note: This is our port number, "127.0.0.1:8545"

# Now that we have our port number, we can go back to our Smart Contract code and update the 
#HTTPProvider address to use the anvil instance instead of the Sepolia testnet node from Tenderly.

# This is what the code will look like after we update it:

# w3 = Web3(Web3.HTTPProvider("https://127.0.0.1:8545"))

# Notice that we are usng the anvil instance address instead of the Sepolia testnet node from Tenderly.

# Now we can run our code again and we should see the same output as before, but this time we are
#connected to the anvil instance instead of the Sepolia testnet node from Tenderly.

# We will still our code by using the UV tool, and we will run the followng command:

# uv run deploy_favorites.py

# This will run our code and we should see the same output as before.

# Note: We can turn off the anvil instance by using the "Ctrl + C" command in the terninal window where
#we are running the anvil instance. Or we can just close the terminal window and it will turn off the
#anvil instance for us.


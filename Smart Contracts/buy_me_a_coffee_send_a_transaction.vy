# In this section we will be going over how to send a transaction in the Remix IDE with ETH.

# At this point, we can actually deploy the Smart Contract that we have so far, which looks like this:

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value == as_wei_value(1, "ether"), "You must send exactly 1 ETH to fund this contract."


@external
def Withdraw():
    pass


# If we deployed the contract now in the Remix IDE, we would see that we have two buttons, one for the
#"fund" function, and one for the "withdraw" function.

# We will also notice that the fund button is red, which means that it is a "payable" function.

# This means that we can send ETH to the contract when we call the fund function.

# At this point we can call our function, by putting in the amount of ETH we want to send to the contract
#in the "Value" field, and then clicking the fund button.

# This will send a transaction to the contract, and if we send the correct amount of ETH, we will see
#that the transaction was successful.

# If we send the wrong amount of ETH, we will see that the transaction failed, and we will see the error
#message that the transaction was reverted.

# A Reverted transaction is a transaction that was not successful, and it means that the contrcat threw
#an error and stopped the execution of the code.

# It also means that any changes that were made to the contract state were reverted, and the contract 
#state was returned to its original state.

# Note: The exact amount must be sent to the contract, otherwise the transaction will fail.


# In this section we will be going over "Reverts".

# A Revert is a built in function that stops the execution of the code and reverts any changes that were made
#to the contract state.

# This is useful for when we want to stop the executionof the code if a certain condition is not met.

# A Revert also sends the remaining gas back to the user, which means that the user will not lose any gas
#fees if the transaction fails.


# This next section we focus on "Oracles" and "Chainlink", which are two different ways to get data from
#the outside world into our Smart Contract.

# An Oracle is a third party service that provides data to Smart Contracts from the outside world.

# Chainlink is a decentralized Oracle network that provides data to Smart Contracts from the outside world.

# Chainlink is the most popular Oracle network, and it is used by many Smart Contracts to get data from
#the outside world.

# The first thing we are going to do is modify our contract to take any amount that is greater than or
#equal to 0.1 ETH, and we will do this by changing the assert statement to check if the msg.value is greater
#than or equal to 0.1 ETH. That will look like this:

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    We will request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value >= as_wei_value(1, "ether"), "You must send exactly 1 ETH or more to fund this contract."


# This means that we can send any amount of ETH to the contract, as long as it is greater than or equal to
#0.1 ETH.

# Next, we wil set the amount of funds we recieve to dollar amounts. We can do this by adding a state
#variable to our contract that will hold the amount of funds we recieve in dollars. That will look like this:

minimum_usd: public(uint256)

# This will go above our fund function.

# The next thing we will do is create a Constructor function that will set the minimum_usd variable to the
#amount of dollars we want to require for the fund function. That will look like this:

@deploy
def __init__():
    minimum_usd = 5



# When we add all of these together it will look like this:

minimum_usd: public(uint256)

@deploy
def __init__():
    self.minimum_usd = 5

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    We will request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value >= as_wei_value(1, "ether"), "You must send exactly 1 ETH or more to fund this contract."


# But we are not done yet. Now that we have updated our Contract to accept usd amounts, we have to update
#our assert statement to reflect the new minimum_usd variable.

# This is where Oracles and Chainlinks come into play.

# Oracles and Chainlinks will be very important for us we move forward with building our Smart Contracts.

# They make up between 70 and 85% of all Smart Contracts on the Ethereum Blockchain.

# Before we implement Oracles and Chainlinks into our Smart Contract, we will be looking at 
#"Chainlink Price Feeds In Vyper"

# Chainlink Price Feeds are a way to get the price of ETH in USD from the outside world into our Smart Contract. 

# This is important because we need to know the price of ETH in USD in order to set the minimum_usd variable
#to the correct amount.

# Let's get back to our problem, where we want users to send us one whole Ether to fund our contract.

# That is a little high for a cup of Coffee so we want to modify the contract to accept 5 USD instead of 
#1 ETH.

# So now we would be checking if the user is sending us at least 5 dollars USD.

# This brings us back to the question of how do we convert ETH to USD?

# We'll actually start the process of doing this by creating a new function, under our witdraw function.

# The function will be called get_eth_to_usd_price, and for now we'll use a pass keyword in this 
#function.

@deploy
def __init__():
    self.minimum_usd = 5

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value >= self.minimum_usd, "You must send more ETH"


@external
def Withdraw():
    pass


@internal
def _get_eth_to_usd_price():
    pass


# Notice that we have changed the assert statement to check if the msg.value is greater than or equal to
#self.minimum_usd.

# Also Notice that we have added an underscore (_) to the beginning of the function name. 

# This is a convention in Vyper to indicate that the function is internal, which means that it can only be
#called from within the contract.

# This is a good practice to follow, because it makes it clear that the function is not meant to be called
#by the user.

# Now we can go to the chainlink documentation for price feeds and get the price of ETH in USD.

# This is the website we can visit for that information: docs.chain.link/data-feeds/price-feeds

# The first thing we have to do in order to read data feeds is actually reading from some other contracts.

# So we're also going to be learning how to read from other contracts in Vyper.

# Once we are on the Chainlink documentation website, we'll go to Chainlink Data feeds, and then we'll go to
#Feed Addresses.

# From here we will go to Price Feed Addresses.

# Here we can see all the different networks that these chainlink price feeds are available on.

# We're going to stay on Ethereum and go to Sepolia.

# Once on Sepolia, we are going to scrool down to the ETH/USD price feed and copy the address.

# We can also click on the address to see the contract on Etherscan.

# Once inside the contract we can scroll down to latestAnswer, and we can see the price of ETH in USD.

# We can also see the latestRound, which is the round number that the price was last updated.

# But the latestAnswer is genuinely the price of ETH in USD, which is what we want.

# Note: The number that the price feed gives us is actually an integer, and we should add the decimal 8
#places to the right to get the actual price of ETH in USD.

# Also Note: Understanding Decimals is very important in the EVM (Ethereum Virtual Machine) ecosystem 
#because all numbers are stored as integers.

# So now that we have the price, we have to learn how to read it in our contract.

# What we want to do is reach out and interact with an @external contract.

# We're always going to need two things.

# We're going to need the address and we're going to need the "ABI", or Application Binary Interface.

# So how do we call a function in a different contract, because the contract from the ETH/USD address
#is the contract we want to read from.

# We can start by adding these two things to our new @internal Function, which will end up looking like this:

@internal
def _get_eth_to_usd_price():
    # Address: (This is where we will put the ETH/USD Address)
    # ABI: 
    pass


# In this next section we will go over what the ABI is and how we can implement it into our contract.

# We can actually see the ABI (Application Binary Interface) in the Compilation details. The compilation
#details are generated after we compile our contract.

# We can see the ABI in the Remix IDE by clicking on the "Compile" tab, and then clicking on the "Details"
#button.

# ABI is made up of the functions that are in our contract, and it is used to interact with
#our contract.

# The ABI is a JSON object that contains the functions in our contract.

# There is also other information in the ABI, such as the Version of the compiler that was used to compile
#the contract, the EVM version, and the contract name.

# Essentially the ABI is a list, or a design specification of how different applications can interact with
#our contract.

# How can we implement the ABI into our smart contract?

# For this process we will be going a new concept, In-Line Vyper Interface.

# An In-Line Vyper Interface is a way to interact with other contracts in Vyper.

# We can create an In-Line Vyper Interface by using the "interface" keyword, and then we can define the
#functions that we want to interact with.

# In essence, The Interface tells us the same thing as the ABI, but in a more readable way.

# Inside the Interface we would see the functions that we want to interact with, and the inputs and outputs
#of those functions.

# We don't need to know the logic of the functions, we just need to know which functions of the Aggregator
#V3 Interface we want to interact with.

# The Aggregator V3 Interface is the interface that we are going to be using to interact with the Chainlink
#Price Feeds.

# We can find the Aggregator V3 Interface on the Chainlink documentation website.

# For now, well copy the Aggregator V3 Interface from a previously built contract and paste it into our 
#contract, right at the top of the contract.

# Now our contract should look like this:

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)

@deploy
def __init__():
    self.minimum_usd = 5

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value >= as_wei_value(1, "ether"), "You must send exactly 1 ETH or more to fund this contract."


@external
def Withdraw():
    pass


# Note: We will be learning a different way to work with interfaces in the future, but for now we will be 
#using the In-Line Vyper Interface. 

# Note: If we want to ensure that these functions even exist, we can go back to the Chainlink documentation
#"https://docs.chain.link/", and look at the Price feed contract addresses to see the functions that are
#available to us.

# We'll search the Ethereum Mainnet Network.

# Once inside the Ethereum Mainnet Network, we can scroll down and select Sepolia testnet. Once inside the 
#the sepolia testnet we can select the ETH/USD address, which will bring us to the Etherscan.

# Once inside the Etherscan we can locate contract again and click on it. This will open up a set of new
#tabs underneath where we can click on the "Write Contract" tab.

# This will give us a whole bunch of functions that we can call to spend gas on. 

# We can also click the "Read Contract" tab and once inside we can scroll down to the "latestAnswer" tab
#to see the price of ETH in USD.

# So we know that there is some public variable that we can call in our contract. 

# Now to actually call the latestAnswer function in our contract, we can do so by adding a new function
#called "def get_price" and use the "pass" keyword for now.

# This function will be an @external function, and it will return the latest price of ETH in USD.

# This is how everything we look so far:

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)

@deploy
def __init__():
    self.minimum_usd = 5

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value >= as_wei_value(1, "ether"), "You must send exactly 1 ETH or more to fund this contract."


@external
def Withdraw():
    pass


@external
def get_price() -> int256:
    pass


# Now what we're going to do is use the interface that we just copied and pasted to interact with the 
#Chainlink Price Feeds, and call the latestAnswer function.

# Now inside our get_price function, we can say "AggregatorV3Interface()", which will be wrapped around
#the address of the ETH/USD Price Feed. Then we will add this variable to a state/store called price_feed.

# This is how we would implement it into our contract.

# price_feed: AggregatorV3Interface = public(AggregatorV3Interface("address of the ETH/USD Price Feed"))

# And then we'll say "return price_feed.latestAnswer()".

# Note: Our get_price function is returning an integer, and not an unsigned integer.

# This is what our contract should look like now:

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)

@deploy
def __init__():
    self.minimum_usd = 5

@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    assert msg.value >= as_wei_value(1, "ether"), "You must send exactly 1 ETH or more to fund this contract."


@external
def Withdraw():
    pass


@external
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
    return price_feed.latestAnswer()


# Now we will deploy just to see the price of ETH in USD.

# In this section we will go over a better way to send ETH.

# This is our Smart Contract so far:


# pragma version 0.4.0
"""
@license MIT
@title Buy Me A Coffee
@author "Python Papi"
@notice This contract is for creating a sample funding contract
"""


interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


# Constants and Immutables
MINIMUM_USD: public(constant(uint256)) = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
PRICE_FEED: public(immutable(AggregatorV3Interface)) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia
OWNER: public(immutable(address))
PRECISION: constant(uint256) = 1 * (10 ** 18)

# Store/State Variables
funders: public(DynArray[address, 1000])
# Funder -> how much they funded.
funder_to_amount_funded: public(HashMap[address, uint256])

@deploy
def __init__(price_feed_address: address):
    PRICE_FEED = AggregatorV3Interface(price_feed_address)
    OWNER = msg.sender  # Set the owner of the contract to the account that deployed it.


@external
@payable
def fund():
    self._fund()  # Call the internal _fund() function to handle the funding logic.


@internal
@payable
def _fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    usd_value: uint256 = self._get_eth_to_usd_rate(msg.value) # Get the usd value of the msg.value sent in.
    assert msg.value >= MINIMUM_USD, "You must spend more ETH"
    self.funders.append(msg.sender) # Add the funder to the array of funders.
    self.funder_to_amount_funded[msg.sender] += msg.value


@external
def Withdraw():
    """
    This function allows the owner of the contract to withdraw the funds sent to the contract.          
    How do we make sure that only we can pull the funds from the contract?
    """ 
    assert msg.sender == OWNER, "You are not the owner of this contract"
    send(OWNER, self.balance)  # Withdraw the funds to the owner of the contract.
    for funder: address in self.funders:
        self.funder_to_amount_funded[funder] = 0
    self.funders = [] # Reset the funders array to an empty array.


@internal
@view
def _get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall PRICE_FEED.latestAnswer()
    eth_price: uint256 = convert(price, uint256) * (10 ** 10)
    eth_amount_in_usd: uint256 = (eth_amount * eth_price) // PRECISION
    return eth_amount_in_usd 


@external
@view
def get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    return self._get_eth_to_usd_rate(eth_amount)  # Call the internal function to get the ETH to USD rate.


@external
@payable
def __default__():
    self._fund()  # Call the internal _fund() function to handle the funding logic.
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall PRICE_FEED.latestAnswer()


# There is one more thing that we can do to make this contract better.

# We will be looking at the send() function next, which has the OWNER as aa parameter, and the amount of ETH 
#to send as the second parameter.

# The OWNER will be the address that deployed the contract, and will be the one that can withdraw the funds
#from the contract.

# And the amount of ETH to send will be the balance of the contract, which is the total amount of ETH
#that has been sent to the contract.

# This is the easy way to send ETH, a simple way, however, it is not exactly recommended to use it in 
#production, for security reasons, but it is a good way to learn how to send ETH.

# We're actually going to explore a more advanced way to send ETH for this Smart Contract, which is more 
#secure and recommended for production use.

# This more advanced way to send ETH is the way we should always default to when sending ETH in a Smart
#Contract, and it is the way that we will be using in this Smart Contract.

# We will be using a built-in Vyper function called "raw_call" to send ETH.

# This function is more secure and allows us to send ETH to an address without having to worry about the
#security issues that come with using the "send()" function.

# This is how we can actually call anything in Vyper, any single function, even if the Smart Contract
#doesn't have the function defined in the ABI, we can still call it using the "raw_call" function.

# This is how we will use the "raw_call" in our Smart Contract:

raw_call(value = self.balance)

# This is how we can use the "raw_call", but we also need to specify the address that we want to send the ETH
#to, which is the OWNER of the contract.

# This is how we will update the "raw_call" function.

raw_call(OWNER, value = self.balance)

# We're still not done yet.

# We will also need to use this line of code (b"""), between the OWNER and the value parameters.

# This (b"") stands for the raw data that we will be sending with this "raw_call" function, which will be
#nothing.

# This is how the "raw_call" function will look now:

raw_call(OWNER, b"", value = self.balance)

# Although we haven't gone over this yet, we will make note that (OWNER), or the first input is considered
#the "to", and the second into is the data that we will be sending, whcih is nothing in this case, 
#represented by (b""), and the third input is the value that we will be sending, which is the balance of the
#contract, which is the total amount of ETH that has been sent to the contract.

# If there is an error in the "raw_call" function, Vyper has a built-in error handling mechanism that will
#revert the transaction and return an error ,essage, which is a good thing because it prevents the contract
#from being in an inconsistent state.

# This built-in mechanism will defult to true if the "raw_call" function is successful, and it will default
#to false if the "raw_call" function fails.

# But for now, we will just use the "raw_call" function as is, and we will not worry about the error handling
#mechanism.

# This is what our Smart Contract will look like now:


# pragma version 0.4.0
"""
@license MIT
@title Buy Me A Coffee
@author "Python Papi"
@notice This contract is for creating a sample funding contract
"""


interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


# Constants and Immutables
MINIMUM_USD: public(constant(uint256)) = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
PRICE_FEED: public(immutable(AggregatorV3Interface)) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia
OWNER: public(immutable(address))
PRECISION: constant(uint256) = 1 * (10 ** 18)

# Store/State Variables
funders: public(DynArray[address, 1000])
# Funder -> how much they funded.
funder_to_amount_funded: public(HashMap[address, uint256])

@deploy
def __init__(price_feed_address: address):
    PRICE_FEED = AggregatorV3Interface(price_feed_address)
    OWNER = msg.sender  # Set the owner of the contract to the account that deployed it.


@external
@payable
def fund():
    self._fund()  # Call the internal _fund() function to handle the funding logic.


@internal
@payable
def _fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    usd_value: uint256 = self._get_eth_to_usd_rate(msg.value) # Get the usd value of the msg.value sent in.
    assert msg.value >= MINIMUM_USD, "You must spend more ETH"
    self.funders.append(msg.sender) # Add the funder to the array of funders.
    self.funder_to_amount_funded[msg.sender] += msg.value


@external
def Withdraw():
    """
    This function allows the owner of the contract to withdraw the funds sent to the contract.          
    How do we make sure that only we can pull the funds from the contract?
    """ 
    assert msg.sender == OWNER, "You are not the owner of this contract"
    raw_call(OWNER, b"", value = self.balance)  # Withdraw the funds to the owner of the contract.
    for funder: address in self.funders:
        self.funder_to_amount_funded[funder] = 0
    self.funders = [] # Reset the funders array to an empty array.


@internal
@view
def _get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall PRICE_FEED.latestAnswer()
    eth_price: uint256 = convert(price, uint256) * (10 ** 10)
    eth_amount_in_usd: uint256 = (eth_amount * eth_price) // PRECISION
    return eth_amount_in_usd 


@external
@view
def get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    return self._get_eth_to_usd_rate(eth_amount)  # Call the internal function to get the ETH to USD rate.


@external
@payable
def __default__():
    self._fund()  # Call the internal _fund() function to handle the funding logic.
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall PRICE_FEED.latestAnswer()


# Now we will go over a recap of what we have learned so far in this module.

# So far w've built a minimal, but very professional Smart Contract.

# We've worked with the Interface to get the ABI, which is the "Application Binary Interface", WHich is the
#interface that we will be using to interact with the Smart Contract.

# We've gone over the process of calling other contracts to get real-time data, which is the price of ETH
#in USD.

# We've refactored some of our code to make it more readable and professional, which is a good practice
#and something that we should always do when writing Smart Contracts.

# We've added in Constants and Immutables, which are also a good practice to use in Smart Contracts.

# Constants are values that will never change, and Immutables are values that can only be set once, which
#is the case for the PRICE_FEED and OWNER Variables.

# The Constants and Immutables also make our Smart Contract more gas efficient.

# Also, not only are we able to fund our contract, but we are able to keep track of who funded the contract
#and how much they funded, which is a good way  to keep track of the funds that are being sent to the 
#contract.

# We've also modified the withdraw function to allow the OWNER of the contract to wothdraw the funds
#sent to the contract, which is a good way to make sure that only the owner of the contract can withdraw
#the funds sent to the contract.

# Also, we've set a @default function (which is also known as a fallback function) that will allow users to 
#send funds to the contract without having to call the fund() function explicitly, which is a good way to 
#make the contract more user-friendly.

# This also allows users to call the fund() function without having to specify the function name.

# We can also call the fund() function by sending ETH to the contract address, which will autmatically call
#the fund() function and send the ETH to the contract.

# We're able to get pricing data from the Chainlink Price Feed, which is a decentralized oracle network
#that provides real-time price data for various assets, including cryptocurriencies.

# This is the Vyper Fundamentals section of the course, and we've covered a lot of ground so far.

# There are still many other concepts that we will cover concerning fundamentals when we cover the 
#Python and Moccasin section of this course.

# Some of the fundamentals that we will cover in the Python and Moccasin section of the course include:

# Flags, which are a way to set certain conditions in our Smart Contract.
# Events, which are a way to log certain actions in our Smart Contract.
# Try / Catch, which is a way to handle errors in our Smart Contract.
# Function Selectors, which are a way to call specific functions in our Smart Contract.
# Encoding and Decooding, which is a way to convert data from one format to another.
# Hashing, which is a way to convert data into a fixed-size string of characters.
# MOdules / Imports, which are a way to import other Smart Contracts into our Smart Contract.
# Testing, which is a way to test our Smart Contract before deploying it to the blockchain.

# Learning these fundamental concepts are more advanced so we're going to learn them as we move forward
#in the course and have more context on how to use them.

# Also, this is the last time that we will be working with the Remix IDE.

# In the next section, we will be working with the Vyper CLI, which is a command-line interface for Vyper.

# 
# In this section we will discuss Antipatterns: Magic Numbers

# An "antipattern" is basically a "bad coding habit" or an unrecommended way of writing code.

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
    eth_amount_in_usd: uint256 = (eth_amount * eth_price) // (1 * (10 ** 18))
    return eth_amount_in_usd 


@external
@view
def get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    return self._get_eth_to_usd_rate(eth_amount)  # Call the internal function to get the ETH to USD rate.
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall PRICE_FEED.latestAnswer()


# Before we move forward, there is one more thing that we will update, which is this "(1 * (10 ** 18))".

# This is considerd a "Magic Number", or a floating number.

# The reason we will be updating this number is because it can be kind of difficult to read for some users, and
#we really want to simplify things as much as we can when possible.

# The general rule is that ideally, we want to use variables to describe what the number does, and we 
#probably should use a variable for this "(1 * (10 ** 18))" Magic Number we have in our contract.

# But instead of making this number a variable, we will make it a Constant.

# We can do that by doing this:

PRECISION: constant(uint256) = 1 * (10 ** 18)

# Notice that we are using the Constant "PRECISION" defined by its all capital letters, which will be an
#unsigned integer.

# Also notice that we do not need to make this public.

# And lastly, notice that we will directly set this new constant equal to our "Magic Number / Floating".

# Note: Remember, this number magic number "(1 * (10 ** 18))", is read as 1 times 10 raised to the 18th.

# And instead of dividing this floating number by our (eth_amount * eth_price), we'll just say divide
#(eth_amount * eth_price) by PRECISION.

# This will end up looking like this:

eth_amount_in_usd: uint256 = (eth_amount * eth_price) // PRECISION

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
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall PRICE_FEED.latestAnswer()
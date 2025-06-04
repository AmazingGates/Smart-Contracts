# In this section we will be going over "The __default__ function", also knwon as a (Fallback Function).

# At this point, our Smart Contract looks like this:


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


# We can recieve funds in our contract, and we can also withdraw them.

# But what if someone sends us funds without calling the fund() function?

# Would the function even work?

# The answer is no, it would not work. The reason is that the fund() function is marked with the @external
#decorator, which means it can only be called by an external account or another contract.

# If someone sends Ether directly to the contract address without calling the fund() function, the contract
#will not know what to do with the Ether, and it will be lost.

# This is where the "Fallback Function" comes in.

# The "Fallback Function" is a function that is called when a contract is sent Ether without any data,
#or when a function that does not exist is called.

# In Vyper, the "Fallbacck Function" is defined using the "@default" decorator.

# The @default decorator - Is used to define a fallback function in Vyper.

# Before we add the fallback function, let's look at our Remix IDE and see what happens when we send Ether
#to our contract without calling the fund() function.

# If we send Ether to our contract without calling the fund() function, we will see an error in the Remix IDE
#saying "Transaction reverted: function selector was not recognized and there's no fallback function".

# This means that the contract does not know what to do with the Ether that was sent to it.

# Also, if we scroll to the bottom of the Remix IDE in the Deploy section, we will see something called 
#"Low-level interactions". 

# This is where we can send Ether to our contract without calling any function.

# If we click on the "transact" button, we can send Ether to our contract without calling any function.

# If we do this, we will see the same error in the Remix IDE saying "Transaction reverted: function selector
#was not recognizsed and there's no fallback function".

# This means that the contract does not know what to do with the Ether that was sent to it.

# To fix this, we can add a fallback function to our contract.

# The fallback function will be called when someone sends Ether to our contract without callng any function.

# In Vyper, we can define a fallback function using the @default decorator.

# By nature, Vyper blocks any transaction that does not have a @default function defined.

# This means that if we do not define a fallback function, any transaction that does not call a function
#will be blocked and will not be executed.

# This is a security feature in Vyper to prevent accidental loss of funds.

# So, let's add a fallback function to our contract.

# This is how we can do that:

# Note: This @default function will also be a payable function, which means it can receive Ether.

@external
@payable
def __default__():
    pass

# Notice that for now that we are just using the pass statement, but if we wanted to send funds to our
#contract now, we can do that by sending Ether to the contract address without calling any function.

# This will call the fallback function, and the Ether will be received by the contract.

# So we can compile, add the price feed address to the deploy function, and deploy our contract, and then
#start a Transaction using the transact button in the low-level interactions section. 

# This will send Ether to our contract without calling any function, and the fallback function will be called.

# Note: Before we start the transaction, we will change the currency to Ether in the Remix IDE, and add a
#value of 1 Ether to send to our contract.

# Also Note: We want to leave the "Call Data" field empty, as we are not calling any functions.

# Now, if we wanted to get a little more fancy, we can use our @default function to modify our fund() function
#so that anytime someone sends Ether to our contract, it will automatically call the fund() function.

# We can do this by making our fund() function internal, and this how we will do that:

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


# Notice that we have changed the fund() function to _fund(), and we have made it internal.

# This means that it can only be called from within the contract, and not from outside the contract.

# LAstly, we will add another fund() function that will call the _fund() function, and this one will be
#@external and payable.

@external
@payable
def fund():
    self._fund()  # Call the internal _fund() function to handle the funding logic.

# All this does is allows us to call the _fund() function from the fund() function, and we can still 
#call the fund() function from outside the contract.

# We'll also do the same thing for the @default function, and this is how we will do that:

@external
@payable
def __default__():
    self._fund()  # Call the internal _fund() function to handle the funding logic.


# This is what our contract will look like now:


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


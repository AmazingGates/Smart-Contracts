# In this section we will be going over Static Calls.


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
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
    return price_feed.latestAnswer()

# If we tried to compile this Smart Contract right now, it will probably throw it error. To fix this
#what we would need to do is use a Specific keyword.

# This is because we are calling a function outside of our contract.

# This is a feature that exists only in Vyper, and doesn't exist in solidity, but there's basically two
#different keywords that we can use when calling out to an external contract.

# This is really good because calling external contracts is kind of a security issue, so we want to make 
#sure that we highlight the lins whenever we call out to external contracts.

# So whenever we're calling a view function, or we don't want to change any state of this call, we use
#"Static call", like this:

# return staticcall price_feed.latestAnswer(), 

# Otherwise, we would use extcall, which stands for "External Call", which would look like this: 

# return staticcall price_feed.latestAnswer()

# But since this is a view function, we are going to use the "staticcall" keyword, which means we're 
#going to call the latestAnswer() function, and we're assuming that it is a view or a pure function.

# What this function is going to do is look at all the functions inside the address we pasted the
#AggregatorV3Interface() function, and we're going to call the latestAddress() from that group of  
#functions.

# At that address, we're saying to the price_feed variable, that we're going to staically call it.

# We're not going to "extcall" it, or call it any other way besides a "staticcall", meaning we're 
#intending to call a @view or a @pure function, 

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


@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
    return staticcall price_feed.latestAnswer()


# In this section we will go over the steps of deploying our new contract over the Tenderly Virtual Network
#to get the price of ETH.

# This is the same exact process we went over when we deployed our first contract.

# Note: Before we deploy our Smart Contract, we have to remember to compile the hi.sol solidity file.

# Also Note: When we hit the get price button, it will give us the price of ETH at the time when we 
#set up our test network.

# Just as recap, we need to keep in mind that the two things that we are going to need when we interact
#with another contract are the ABI, and the Address. We also have to specify when we call out to that
#address if it's going to be a "staticcall", or an "extcall".

# In our case, as seen, we will be using the "staticcall" because we are only calling to view the function
#of lstestAnswer().
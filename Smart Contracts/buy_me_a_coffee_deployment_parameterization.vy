# In this section we will go over Deployment Parameterizartion.



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


@internal
def get_eth_to_usd_rate():
    pass
    

#@external
#@view
#def get_price() -> int256:
#    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
#    return staticcall price_feed.latestAnswer()


# For this next section we will actually comment out the get_price(), because we will not be working
#with it right now.

# For now we are going to finally write our "def get_eth_to_usd_rate():" function.

# So we just learned how to get the price, from the price_feed.latestAnswer() function, and since this
#is the only price feed that we're going to be using in this Smart Contract, what we're going to do is
#make the "price_feed:" variable a state/store variable.

# We'll put this new state/store variable at the top of our contract. 

# Just like the "struct"s we learned about in the last session, the "interface AggregatorV3Interface" is 
#another new type so we can create a state/store variable called price_feed, of type AggregatorV3Interface.

# That will look like this:

price_feed: AggregatorV3Interface

# Next, in our deploy function, we can say self.price_feed = AggregatorV3Interface() at address we used
#previously/

# So far our contract should look like this:

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: AggregatorV3Interface

@deploy
def __init__():
    self.minimum_usd = 5
    self.price_feed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)

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


@internal
def get_eth_to_usd_rate():
    pass
    

#@external
#@view
#def get_price() -> int256:
#    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
#    return staticcall price_feed.latestAnswer()


# Since we're pasting in the address, we're hard coding the price feed address.

# But there is kind of an issue with the contract so far with us hard coding the address into our 
#constructor.

# With the hard coding, it means that contract will only work on the sepolia network, since that is where
#we got it from.

# This is considered a bad habit, so instead of doing that, what we can do is add an address inside our 
#constructor function as a parameter as price feed address of type address.

# This is how we can do that, "def __init__(price_feed_address: address)", and then we can set the 
#price feed to AggregatorV3Interface at price feed address.

# We can also add the address to our new price_feed state/store and comment it out as a reminder that
#this is the address we will be using and where it is from.

# This is what our contract will look like now:


interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia

@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = 5
    self.price_feed = AggregatorV3Interface(price_feed_address)

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


@internal
def get_eth_to_usd_rate():
    pass
    

#@external
#@view
#def get_price() -> int256:
#    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
#    return staticcall price_feed.latestAnswer()


# Now, with this modification, if we change to a different chain or we want to use a different price feed
#address we can just pass it into our deploy function.

# At this point we can compile and deploy our contract to see how we can interact with the constructor
#function.

# We would see that we have an input option called price_feed that will accept an address.

# This is where we can paste the address of the price feed or chain we want to use.

# With this method, as soon as we deploy our contract we can customize the address that we want to use.

# This is a much more dymanic way to deploy our contract, rather than hard coding. 

# Now that we have our price_feed object, we can start working on our "get-eth_to_usd_rate()" function.

# The first thing we want to do inside the function is say, price, which will be of type "price: int256",
#and we will set that equal to "staticcall". ("price: int256 = staticcall").

# We're going to pretty much do exactly what we just did in the constructor with the "self.price_feed" 
#here in our "get_eth_to_usd_rate()" function.

# This will look ike this, ("price: int256 = staticcall self.price_feed.latestAnswer")

# The "self.price_feed" is the state/store variable, dot "latestAnswwer".

# This is what our Smart contract will look like now:

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address

@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = 5
    self.price_feed = AggregatorV3Interface(price_feed_address)

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


@internal
def get_eth_to_usd_rate():
    price: int256 = staticcall self.price_feed.latestAnswer()
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall price_feed.latestAnswer()


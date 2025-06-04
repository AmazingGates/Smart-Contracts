# In this section we will go over the differences between Dynamic Arrays and Fixed-Size Arrays in Vyper.

# This is our Smart Contract so far:


interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address
owner: public(address)

@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
    self.price_feed = AggregatorV3Interface(price_feed_address)
    self.owner = msg.sender  # Set the owner of the contract to the account that deployed it.


@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    usd_value: uint256 = self._get_eth_to_usd_rate(msg.value) # Get the usd value of the msg.value sent in.
    assert msg.value >= self.minimum_usd, "You must spend more ETH"


@external
def Withdraw():
    """
    This function allows the owner of the contract to withdraw the funds sent to the contract.          
    How do we make sure that only we can pull the funds from the contract?
    """ 
    assert msg.sender == self.owner, "You are not the owner of this contract"
    send(self.owner, self.balance)  # Withdraw the funds to the owner of the contract.


@internal
@view
def _get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall self.price_feed.latestAnswer()
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
    return staticcall price_feed.latestAnswer()


# Dynamic Arrays vs Fixed-Size Arrays

# In Vyper, arrays can be either dynamic or fixed-size.
 
# Dynamic Arrays: 

# Dynamic arrays can grow or shrink in size. They are useful when the number of elements is not known at 
#compile time. They are defined without a size.

# Fixed-Size Arrays:

# Fixed-Size arrays have a predetermined size that cannot be changed after the array is created. They are
#defined with a specific size.

# Our Smart Contract looks pretty good so far.

# So far we can send funds to the contract, check the ETH to USD rate, and Withdraw funds.

# But now, we want to make our Smart Contract more sophisticated, or Dynamic, by adding Arrays.

# This will add a little more functionality to our Smart Contract.

# Now, we want to keep track of who, sent us money. 

# Basically, we can keep track of all the people whosent us money.

# And also, how much they sent us.

# This is where some of the data structures from our last session will come in handy.

# So let's create a new data structure for our list of funders.

# We'll call it funders, and we could have it be an address array, or an address list (a list of addresses),
#but instead we are going to use a Vyper explicit type, called a "DynArray", or better known as a 
#"Dynamic Array".

# This will look something like this:

# keep track of who sent us funds
# How much they sent us

funders: address[]


# Note: We can add to our "Dynamic Array" by using the "append()" method.

# Also Note: We can not add to a Fixed-Sized Array because it is set at whatever size it is coded for.

# This is what our Smart Contract looks like now:


interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address
owner: public(address)
funders: address[]

@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
    self.price_feed = AggregatorV3Interface(price_feed_address)
    self.owner = msg.sender  # Set the owner of the contract to the account that deployed it.


@external
@payable
def fund():
    """
    This function allows users to send funds to this contract
    Will have request a minimum amount of money to be sent to the contract, which will be in USD.
    """
    usd_value: uint256 = self._get_eth_to_usd_rate(msg.value) # Get the usd value of the msg.value sent in.
    assert msg.value >= self.minimum_usd, "You must spend more ETH"


@external
def Withdraw():
    """
    This function allows the owner of the contract to withdraw the funds sent to the contract.          
    How do we make sure that only we can pull the funds from the contract?
    """ 
    assert msg.sender == self.owner, "You are not the owner of this contract"
    send(self.owner, self.balance)  # Withdraw the funds to the owner of the contract.


@internal
@view
def _get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall self.price_feed.latestAnswer()
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
    return staticcall price_feed.latestAnswer()
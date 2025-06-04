# In this section we will go over the process of sending ETH from a contract to a wallet address.

# We'll actually be learning two methods to send ETH from a contract to a wallet address. The first way we 
#will be using is the "send" method, which is a low-level function that allows us to send ETH from the 
#contract to a specified address.

# The second way, which we will be going over later, is the "raw_call" method, which is a higher-level
#function that allows us to send ETH from the contract to a specified address.

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


# Before we start, we should probably make it so that the Withdraw function actually gives us the money,
#because as of right now, it doesn't do anything, except for checking if the sender is the owner of the
#contract.

# To do this, we will be using the "send" method to send the balance of the contract to the owner of the
#contract.

# Vyper actually has a built-in function that allows us to send ETH from the contract to a specified address.

# This is the "send" function mentioned above, and this is how we can use it:

send(self.owner, self.balance)  # Withdraw the funds to the owner of the contract.

# Note: This function has be deprecated as of version 0.3.7 of Vyper, and the recommended way to send ETH is
#to use the "raw_call" method. However, for educational purposes, we will continue to use the "send" method.

# Using the send method is simple. Notice that all we had to do was say "send", then pass in the address
#we want to send the ETH to, and then the amount of ETH we want to send as parameters.

# self.owner is the address of the owner of the contract, and self.balance is the balance of the contract,
#indicating that we want to send the entire balance of the contract to the owner.

# If we wanted, we could also do something like this:

send(msg.sender, self.balance)

# This is possible because we asserted that send is equal to the owner of the contract, so we can send the
#balance of the contract to the sender of the transaction, if we chose to do so. But we'll stick with the
#way it is for now.

# This is what our Smart Contract looks like now:


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
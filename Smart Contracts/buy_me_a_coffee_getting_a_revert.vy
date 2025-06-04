# I this section we will go over the process of Getting a Revert in Vyper and what it means.

# This is our Smart Contract so far:

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address

@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
    self.price_feed = AggregatorV3Interface(price_feed_address)


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
    pass


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
    return eth_amount_in_usd  # This return may not be needed in the final Smart Contract we deploy.


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


# Now that we've come this far, we can check to see if the assert statement in the "fund()" ffunction is
#working correctly.

# To test this, we can deploy our Smart Contract to the Sepolia Test Network and then try to send a 
#transaction with ETH to the "fund()" function of our Smart Contract with an amount less than 5$ worth of
#ETH.

# If the transaction reverts, it means that the assert statement is working correctly and the user must
#send more ETH to meet the minimum USD value requirement.

# This is a good way to ensure that users are sending the required amount of ETH to the contract.

# We can deploy our Smart Contract the same way that we have previously.

# First we will test it out by sending a transaction of 5$ worth of ETH to the "fund()" function.

# Then we will depoy again, taking the same exact steps, but this time we will send a transaction with
#less than 5$ worth of ETH to the "fund()" function. 

# If the transaction reverts, we will know that the assert statement is wotking correctly and that the
#user must send more ETH to meet the minimum USD value requirement.


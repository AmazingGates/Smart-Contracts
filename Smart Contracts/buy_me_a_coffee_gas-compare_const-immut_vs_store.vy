# In this section we will be looking at the Gas Comparisons between Constants and Immutables vs Storages.

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


# Now that we have our Constants and Immutables, we can now see how exspensive it is to deploy this contract
#as is.

# We will also see how exspensive it is to call the fund() function as well with our Constants and 
#Immutables.

# We will compile and deploy the Smart Contract as usual.

# We will be still using the same PRICE_FEED address that we have been using to deploy and call the
#lastestAnswer() function to get the lastest price of Ethereum.

# Once we deploy our contract, and we use our PRICE_FEED address to deploy, we can check the terminal
#to see the actual cost of the transaction for deploying our contract.

# The entire cost of the transaction will be labeled "transaction cost".

# We can locate that number, and paste it right above our deploy function with the label "With Constants and
#Immutables".

# Next we can run the Smart Contract agian, but this time we will revert the MINIMUM_USD constant back to a 
#store and revert it to self.minimum_usd. We will also turn all of the MINIMUM_USD constants in our contract
#back to self.minimum_usd.

# Once we have reverted all of the constant MINIMUM_USD's back we can deploy our contract and compare the
#entire cost, which will be labeled "Transaction Cost" to the entire cost of our Smart Contract when ran
#with the Constants.

# We can then compare these too numbers and see which form of the Smart Contract will cost us less gas.

# Note: This step is completely optional.

# 
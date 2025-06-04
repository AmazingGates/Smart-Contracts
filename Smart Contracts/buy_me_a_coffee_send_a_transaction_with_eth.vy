# In this section we will go over the process of Sending a Transaction with ETH in Vyper.

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
    usd_value: uint256 = self.get_eth_to_usd_rate(msg.value) # Get the usd value of the msg.value sent in.
    assert msg.value >= self.minimum_usd, "You must spend more ETH"


@external
def Withdraw():
    pass


@internal
@view
def get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
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
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall price_feed.latestAnswer()


# At this point we can deploy our Smart Contract to the Sepolia Test Network, and then we can send a 
#transaction with ETH to the "fund()" function of our Smart Contract.

# To deploy, we will use the same steps we took in the previous sections to deploy our First Smart Contract.

# 1. Compile the Smart Contract using Vyper.
# 2. Deploy the Smart Contract to the Sepolia Test Network using a tool like Tenderly with Remix.
# 3. Once deployed, we will get the address of our deployed Smart Contract.
# 4. Use the address of the deployed Smart Contract to interact with it via a script or Remix.
# 5. To send a transaction with ETH, we can use the "fund()" function of our Smart Contract.
# 6. In Remix, we can select the "fund()" function, enter the amount of ETH we want to send (make sure it's
#at least 5$ worth of ETH), and then click the "transact" button to send the transaction.
# 7. After the transaction is sent, we can check the transaction status in Remix or Tenderly to see if it
#was successful.
# Note: Make sure to have enough ETH in our wallet to cover the transaction fees (gas) when sending the
#transaction.

# After following these steps, we should be able to successfully send a transaction with ETH to our Smart
#Contract's "fund()" function. This will allow us to test the functionality of our Smart Contract and ensure
#that iw works as expected. We can also use the "get_price()" function to verify the current price of ETH
#in USD. This will help us ensure that our Smart Contract is correctly interacting with the price feed.

# In summary, this section covered the process of sending a transaction with ETH to a Smart Contract in Vyper,
#including how to deploy the Smart Contract, interact with it, and verify its functionality. By following the 
#steps outlined above, we can successfully send a transaction with ETH to our Smart Contract and test its 
#features.

# The address that we use to deploy will be from the price feed that we used in our "get_price()" function.

# This is the address of the price feed on the Sepolia Test Network:
# 0x694AA1769357215DE4FAC081bf1f309aDC325306

# Note: we have to make sure we also compile the hi.sol Solidity file before deploying our Vyper Smart
#Contract, as the price feed is dependent on the hi.sol file to get the latest price of ETH.

# Also Note: Make sure that we have our metaMask linked to the Sepolia Test Network, and that we have some
#ETH in our wallet to cover the transaction fees (gas) when sending the transaction.

# We can link our MetaMask to the Sepolia by plugging in our MetaMask address into the Remix IDE.

# Once we have our MetaMask linked we can paste the address from the price feed Sepolia Network into the
#"Deploy" field in Remix, and then click the "deploy" button to deploy our Smart Contract.

# This will open a pop-up window in MetaMask asking us to confirm the transaction and pay the gas fees.

# Once we confirm the transaction, we will see our Smart Contract deployed in the Remix IDE.

# This will allow us to enter a Value in the Value field, and then click the "fund()" button to send the
#transaction with ETH to our Smart Contract.

# Note: The value we enter in the value field will be in the unit of wei, which means we have to convert the
#value we want to send to wei before entering it in the value field.

# For example, if we want to send 0.01 ETH, we have to convert it to wei by multiplying it by 10^18.
# So 0.01 ETH = 0.01 * 10^18 = 10000000000000000 wei.
# This means we have to enter 10000000000000000 in the value field in Remix before clicking the "fund()"
#button.

# There is a website that we can use to convert ETH to wei, which is:
# http://eth-converter.com/

# Once we click the "fund()" button, we will see a pop-up window in MetaMask asking us to confirm the
#transaction and pay the gas fees.

# Once we confirm the transaction, we will see the transaction status in the Remix IDE.

# We can also check the transaction status in Tenderly to see if it was successful.

# If everything goes well, we should see theTransaction status as "Success" in both Remix and Tenderly, and
#our balance in the Smart Contract should be updated with the amount of ETH we sent.

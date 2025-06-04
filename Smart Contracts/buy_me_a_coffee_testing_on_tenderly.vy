# In this section we will be testing the Smart Contract that we have so far on the Tenderly platform.

# This is the Smart Contract that we have so far:


interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view     
    def version() -> uint256: view
    def latestAnswer() -> int256: view


minimum_usd: public(uint256)
price_feed: public(AggregatorV3Interface) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address
owner: public(address)
funders: public(DynArray[address, 1000])

# Funder -> how much they funded.
funder_to_amount_funded: public(HashMap[address, uint256])

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
    self.funders.append(msg.sender) # Add the funder to the array of funders.
    self.funder_to_amount_funded[msg.sender] += msg.value


@external
def Withdraw():
    """
    This function allows the owner of the contract to withdraw the funds sent to the contract.          
    How do we make sure that only we can pull the funds from the contract?
    """ 
    assert msg.sender == self.owner, "You are not the owner of this contract"
    send(self.owner, self.balance)  # Withdraw the funds to the owner of the contract.
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

# Before we Deploy our contract and test it on Tenderly, let's make sure that we make our variables public 
#so that we can see and interact with them.

# With that done:

# Now we should be able to fund our Smart Contract
# List all of the different funders who send funds to our contract
# See the balances increase as we receive funds into our contract
# We should be able to withdraw the funds from our contract
# We should see what each particular funder actually funded to the contract


# To test this new contract out, we are actually going to create a new account in our MetaMask.

# To do this, we just hit the account tab in our Wallet, and select create new account tab, and then hit the 
#add new account tab.

# We can name our new account if we want, but it's ok if we leave it as "Account 2"

# We are still going to be on Test Virtual Network, but this time it will not be funded like it was 
#when we deployed our first Smart Contract.

# We're going to copy the address from our new account and paste it on the Tenderly Platform to get 
#this new account funded the same way we got our first account funded.

# Once our new account is funded, we can test it out end to end.

# We'll start by compiling our Smart Contract first.

# Then we will connect our MetaMask wallet to the remix IDE.

# The next will be to grab the price feed address from our contract and paste it into the deploy field
#and then deploy our Smart Contract.

# Once we deploy, our MetaMask wallet will pop up to confirm the transaction we just initiated.

# We'll go ahead and confirm.

# We can check that we are the owner of the Contract by scrolling down and hitting the "Owner" button
#in the Remix IDE to make sure it is indeed our MetaMask Wallet's address that is appearing as the owner.

# We can also check all of the other blue tabs (non transactional buttons) to make sure all of the 
#information is correct in our Smart Contract.

# For the next we will want to make sure that we have both of our accounts active inside our MetaMask 
#wallet.

# We are doing this because we will use our first account t actually call our first funding.

# We can connect both our accounts by hitting the little glode icon inside ourr MetaMask Wallet and then
#hitting the Edit button for the "See your accounts and suggest transactions" option.

# Once we hit the edit button, we will be able to select all of the accounts that we want to be active
#in our wallet, and we will make sure that both of our wallets are active.

# Then we will hit the update button to save the changes.

# The next step will be to paste in the amount of wei we want to fund to our contract.

# Note: We will have switched to our original account for this step, since this is the account we want
#to fund our coffee account (new account). 

# Also Note: Both accounts should be active.

# The price we want to fund to our new account (buy me a coffee Smart Contrcat) should be a little more
#than 5 dollars, to make sure that we cover gas fees and everything else. Maybe $6.50 (but in the form of wei).

# We can visit the website with the conversions to get the actual wei amount we are going to paste into the
#value field in the Remix IDE.

# Once we have the amount of wei we want to fund to our Smart Contract, we will hit the fund button.

# Note: Make sure that the currency is set to wei in the value field before we hit the fund button.

# As usual, our MetaMask wallet should pop up to confirm the transaction we just initiated.

# We will hit confirm.

# Now, we can take the address from our original contract (the address we just sent funds from) and paste 
#it into the "funder_to_amount_funded" field, and then hit the call button.

# If everything was done correctly, we should be able to see that the amount that we just sent from
#our original address to our Smart Contract is visible in the Remix IDE.

# We can also go to the "funders" tab and check the 0 index. We should be able to see our original account's
#address here as well, since this is the address that we used to fund our Smart Contract.

# With that being done, we are going to make sure that we are on our Smart Contract account (second account)
#inside our MetaMask wallet and attempt to withdraw the funds we just received from our original account. 

# We'll start by pulling up the terminal to see what's going on in the Remix IDE.

# Then we hit the Withdraw button.

# After we hit the "Send Transaction" button, MetaMask will pop up and ask us to confirmm the Transaction.

# At this point we can go ahead and confirm the transaction.

# Now, if we keep the owners address in the funder_to_amount_funded input field ( our second account address
#in MetaMask), and check the balance, it should be zero.

# At this point our Smart Contract is doing everything we want it to do.

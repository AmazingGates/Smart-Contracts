# In this section we will be going over the concept of Natspec Doctrings and how to implement them into our 
#Smart Contract.

# Now that we've learned a little more about "Immutables" and "Constants", let's level up our codesbase
#to make it look more professional and be more gas efficient with these new concepts.

# First off, before we even get to Immutables and Constants, let's level up our information at the top 
#of our Smart Contract.

# It would look a lot better if we used the Docstring type Comments for our information.

# Remember, Text in between 2 sets of three quotes will be classified as Comments.

# This saves us from having to put a hash tag on every single line, because every single line of code
#inbetween the the 2 sets of three quotes are comments.

# This is what we would have after we update our information at the top of our Smart Contract.


# pragma version 0.4.0
"""
@license MIT
@title Buy Me A Coffee
@author "Python Papi"
@notice This contract is for creating a sample funding contract
"""

# Notice that everything inbetween the quotes is orange, which is another color for comments.

# Also Notice that we added a new piece of information to our line up, which will be labled "notice".

# This "notice" will let people know what the purpose of this Smart Contract is.

# Note: All of our labels (pragma, license, title, author, notice) are known as "NatSpec Metadata".

# This is a way to provide documentation to our Smart Contracts.

# It is known as the "Ethereum Natural Language Specification Format", or "NatSpec" for short.

# That are lots of "tags", or labels that we can use other than the ones we used to label our NatSpec.

# Notice: pragma is not valid NatSpec, that's why it is outside of the NatSpec Comments and it has a
#hashtag to comment it out on its own.


# The next thing we will focus on is updating our Immutables and Constants

# The first thing we will do is take a look at our Storae variables.

# These are our storage variables:

# minimum_usd
# price_feed
# OWNER
# funders

# Storage variables can be very gas intensive to work with. Everytime we read or write to a storage 
#variable, it will cost us gas.

# We're going to learn about storage later in the course, but for now we can should just keep in mind that
#anytime a variable isn't ever gonna change, we want to think about makng it a constant or an immutable.

# Constant and Immutable variables can never be changed, however these are way more gas efficient for a 
#whole bunch of reasons.

# We can even test this out, so let's take our minimum_usd variable.

# Now minimum_usd will be set to 5 dollars and it will remain so.

# With that information, we can set our minimum_usd to be a constant. So we can do something like this to
#to modify our variable:

MINIMUM_USD: public(constant(uint256))

# Now our variable is set to a constant.

# Notice: Our constant variable is all uppercase letters. This is the conventional way to write constant
#variables.

# Also, since it is a constant, we will no longer need to set the variable in our construtor method to 
#call it, we can set it right where we initialized it.

# That will look something like this:

MINIMUM_USD: public(constant(uint256)) = as_wei_value(5, "ether")

# Now that we have set our constant variable in this way, we can delete it from our constructor as it
#is no longer needed there.

# This is what our Smart Contract woud look like now:

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


MINIMUM_USD: public(constant(uint256)) = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
price_feed: public(AggregatorV3Interface) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address
owner: public(address)
funders: public(DynArray[address, 1000])

# Funder -> how much they funded.
funder_to_amount_funded: public(HashMap[address, uint256])

@deploy
def __init__(price_feed_address: address):
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
    assert msg.value >= MINIMUM_USD, "You must spend more ETH"
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


# Note: Constant variables are not considered storage variables, which is another reason why we have to
#update the variables to include the constant or immutable classification.

# Actuallly, Constants AND Immutables are not considered storage variables.

# Since it's not a storage variable, when we look over the rest of our code, we will notice that we now
#have an error in our fund() function.

# This is because we are still using the "self" keyword to reference our minimum_usd variable, which is
#reserved for storages and states, which our variable no longer is.

# So we must update our Smart Contract to reflect that our variable is now a Constant.

# We can do that by doing this:

assert msg.value >= MINIMUM_USD, "You must spend more ETH"

# Notice that now we are only using the Constant state of our variable, which is designated by the all
#capital letters.

# Now, this is what our Smart Contract should look like updated:


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


MINIMUM_USD: public(constant(uint256)) = as_wei_value(5, "ether") # Set the minimum USD value to 5$ (5$ worth of ETH)
price_feed: public(AggregatorV3Interface) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Seplia Address
owner: public(address)
funders: public(DynArray[address, 1000])

# Funder -> how much they funded.
funder_to_amount_funded: public(HashMap[address, uint256])

@deploy
def __init__(price_feed_address: address):
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
    assert msg.value >= MINIMUM_USD, "You must spend more ETH"
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


# The next thing we will look at is our "price_feed" Store.

# If we wanted, we could change the "price_feed" to a constant, if we were always using the same price_feed.

# However, this would assume that we were always gonna use the price_feed address that we used already,
#which is incorrect.

# Different chains have different price_feed addresses that they use, so making this current version of our
#price_feed a constant will keep us locked in to only this chain, regardless if we wanted to use a 
#different chain or not.

# So we don't really want to make this a constant, but instead, we want to make it "Immutable".

# This is how we would change our price_feed from a store to an Immutable:

price_feed: public(immutable(AggregatorV3Interface)) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia 

# But keep in mind, that Immutables are Like Constants, so to specify that we are no longer using a 
#store variable, we would write PRICE_FEED with all capital letters to designate it as an Immutable.

# So our price_feed should actually look like this:

PRICE_FEED: public(immutable(AggregatorV3Interface)) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia 

# Also, just like with the Constants, we no longer need to use the "self" keyword with our Immutable.

# This means that we will modify our constructor method to use our new Immutable "PRICE_FEED".

# That will look like this:

PRICE_FEED = AggregatorV3Interface(price_feed_address)

# Now, whenever we deploy our contract using our Immutable PRICE_FEED, we will update the price_feed with
#whatever address that gets passed into __init__(price: address) as a parameter.

# So whenever we deploy this contract on different chains, we can use different price_feed addresses.

# Also, with the price_feed, we will need to modify the way we make our static call. We will no longer
#be static calling self.price_feed, but we will be static calling PRICE_FEED. 

# This will look like this:

staticcall PRICE_FEED.latestAnswer()

# So just to do a quick recap, our MINIMUM_USD is going to be a constant because it will always 5 dollars.

# And our PRICE_FEED will be Immutable because we it to adjust to our Smart Contract as we need.

# The next thing we will look at is the "owner", which we will want to be Immutable as well, just in case
#we ever want to change MetaMask addresses to deploy from.

# So now our owner variable will look like this:

OWNER: public(immutable(address))

# We will also update the self.owner to OWNER everywhere we find it in our Smart Contract.

# The next varaiable we will work on is the "funders".

# Because the "funders" is always going to change to reflect the list of funders to our Smart Contract,
#it can not be a constant or immutable, therefore it will remain a store/state variable.

# The last variable we will be looking at is the "funder_to_amount_funded". 

# Like the "funders" store/state, this too will continuous change to reflect the amount funder to our
#Smart Contract by a specific funder.

# This means that this must also stay a store/state variable.

# With the changes we made, and didn't make, this is what our Smarrt Contract should look like now:


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
    PRICE_FEED: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall PRICE_FEED.latestAnswer()
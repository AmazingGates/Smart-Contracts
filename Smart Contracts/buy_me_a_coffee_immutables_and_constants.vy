# In this section we will be going over the concept of Immutables and Constants.

# This is our Smart Contract so far:

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


# Now, our Smart Contract does exactly what we coded it to do.

# With that being said, we can level things up a bit.

# We will do this because there are a couple of things that we did inside our Smart Contract that are 
#still kind of new.

# They are also not very gas efficient.

# Therefore, in this section we will be working on improving our code quality.

# We will do this to make it more readable, and be more gas efficient.

# Remember, everything we do, anytime we change the state of the blockchain, we have to spend gas to do so.

# Whenever we're spending gas we want to make sure that we're doing it in the most gas efficient way.

# So, let's upgrade our Smart Contract with something called "Immutable", and "Constants".

# Sometimes we have a variable that we know will not change once the contract is deployed, however
#we do not want to make the variable a "Constant".

# This is because we want to be able to set the value once the contract is deployed.

# In this case, we would use an Immutable. 

# For example, let's say we have an owner of the contract as the store, which will have a public variable
#of type "address" as the parameter.

# That will look something like this.

owner: public(address)

# Next, in this example we will create a "Constructor Method" using the @deploy decorator to set the 
#Owner of the Contract. 

@deploy 
def __init__()

# Next we will say that the owner of our Smart Contract is inside the "Constructor Method we just created."

# This is how we will do that:

@deploy
def __init__():
    self.owner = msg.sender


# Here we are saying the owner of the contract is equal to the address that sent the contract.

# Now let's imagie a case where the owner is never gonna change inside this contract.

# So what we might want to use is a constant for the owner to save on gas, since constants use way less
#gas than accessing State Variables.

# So if we made the owner a constant, like this:

owner: public(constant(address))

# Then we will need to be able to declare the value of the owner when the contract is deployed, for 
#example like this:

owner: public(constant(address)) = msg.sender 

# And of course this would be an imbalanced syntax.

# The variable constant must be set when the contract is compiled, but we want to set the value when
#the contract is deployed.

# So this would be a good usecase for an "Immutable", since "Immutables are like "Constants, but the 
#value is set when the contract is deployed.

# This is the perfect example of using Immutables, since we know that the Owner will never change
#once the contract is deployed.

# So we would declare our variable as Immutable, like this:

owner: public(immutable(address)) = msg.sender 

# Next, inside our contructor we would set the Immutable variable to have the value msg.sender
#which would look like this:

@deploy
def __init__():
    self.owner = msg.sender


# Since "Immutables are like "Contstants", we don't refer to them or call them with "self."" Keyword, we 
#simply say owner, which would look like this:

@deploy
def __init__():
    owner = msg.sender


# For this example we will capitalize the entire state/store to indicate that this will act as a constant 
#owner.

# This is what our updated example will look like as a whole:

OWNER = public(immutable(address))

@deploy
def __init__():
    OWNER = msg.sender


# Let's add another example to this one.

OWNER: public(immutable(address))
VAL: public(immutable(uint256)) 

@deploy
def __init__(val: uint256):
    OWNER = msg.sender
    VAL = val


# Here we've added an Immutable Called VAL, which will be a public uint256.

# Then we will pass a number as input in our __init__() parameter by passing in "val: uint256", letting
#our constructor know that Immutable "Val" will be set to some number, or "val".

# Once we declare Immutable and we forget to set it somewhere inside the contructor, the contract will 
#not compile.

# To see why we need to do this, we can paste this example in our Remix IDE, but comment out the Val = val
#line, where we declared the Immutable Val and see what happens when we try to compile the code.

# So in summary, Immutables act like constants, and gas wise they are cheap to access like constants.

# Unlike constants, we'll be able to set the value of Immutables when the contract is deployed inside the
#contructor.
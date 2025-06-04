# In this section we will be going over the concept of Integer Precision.

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


# So far, the "price" in our "get_eth_to_usd_rate()" will return us the price, with 8 decimals.

# We're going to need to convert that to the eth amount in usd.

# We're going to need to convert the price we get from the address we used.

# With the "get_eth_to_usd_rate()" function that we are going to use we're going to have to pass in the
#"eth_amount" which will be of type "uint256" ("eth_amount: uint256"). That will look like this
#"get_eth_to_usd_rate(eth_amount: uint256):". 

# Additionally, we will be adding some Doc Strings to this function as well.

# The Doc String will acknowledge that someone sent us some eth. Then we will confirm if the amount is 
#enough for a coffee or not.

# That will look like this so far:

@internal
def get_eth_to_usd_rate(eth_amount: uint256):
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall self.price_feed.latestAnswer()


# Note: We want to check if it's more or less than 5 dollars because that is the minimum price that we 
#set for someone to send us.

# So now we want to convert the 0.01 of ETH that was sent to us to see if it is enough to get our coffee.

# So we'll get the price, which will be something like this:

# "price: int256 = staticcall self.price_feed.latestAnswer()"

# Remember that our eth_amount is going to have 8 decimals when we get the price returned in usd, so first
#we're going to need to update the "price: int256 = staticcall self.price_feed.latestAnswer()" function
#that we are using from having 8 decimals to 18.

# To do this, all we have to do is say "eth_price" which is of type "uint256" equals price times 10 raised
#to the tenth, which will look something like this:

"(eth_price: uint256 = price * (10 ** 10))"

# This is what our entire Smart Contract should look like so far:

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
def get_eth_to_usd_rate(eth_amount: uint256):
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall self.price_feed.latestAnswer()
    eth_price: uint256 = price * (10 ** 10)
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall price_feed.latestAnswer()


# The next thing we are going to look at is converting types in Vyper.

# The reason we want to go over converting types is because of conflicting issues. If we want to compile
#our code as is right it will throw a reference type error.

# This is because we are using two different types of integers, (eth_amount: uint256, price: int256).

# So we can't just say that eth_price is equal to price, because of the reference type differences.

# This is where we will be using another built-in Vyper tool called "convert".

# convert - Converts a variable or literal from one type to another.

# We will use this tool to convert our price to an unsigned integer (uint256) by saying "convert" price
#to uint256 ( convert(price, uint256) * (10 ** 10) ).

# This is what our updated Smart Contract will look like now:


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
def get_eth_to_usd_rate(eth_amount: uint256):
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall self.price_feed.latestAnswer()
    eth_price: uint256 = convert(price, uint256) * (10 ** 10)
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall price_feed.latestAnswer()


# At this point we can ahead compile our contract with no issues.


# Now that we have our price converted, we will be looking at the concept of "Integer Division"

# We have our price which is now set to uint256, we can now times it by 10 raised to the 10th.

# So now instead of having the eth_price displayed as the 8 decimal representation, we will add 10
#zeros to that that figure, because we just multiplied it by 10 raised to the 10th power.

# So we have the:

# eth_amount - which are in units of eth
# eth_price - which is in the unit of dollars per ETH

# And we want to get dollars back.

# To math this out we just do eth times dollars per eth.

# So we would say eth amount times the dollars per eth, or eth price ( "eth_amount * eth_price" ), and 
#this should equal the eth amount in usd "eth_amount_in_usd: uint256"

# eth_amount_in_usd: uint256 = eth_amount * eth_price

# This still isn't quite right and we need to make some adjustments.

# This is because we have too many zeros as of now. 

# So the final step we want to take is by doing something called "Integer Division"

# This will look something like this:

# ( eth_amount_in_usd: uint256 = (eth_amount * eth_price) // 1 * (10 ** 18) )

# Finally we can say that this function returns a uint256, which we can do by doing this

# "return eth_amount_in_usd"

# This is what our Smart Contract should look like with the updates.

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
@view
def get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    """
    Sender sent us 0.01 ETH for a coffee 
    Is that more or less than the 5$?
    """
    price: int256 = staticcall self.price_feed.latestAnswer()
    eth_price: uint256 = convert(price, uint256) * (10 ** 10)
    eth_amount_in_usd: uint256 = (eth_amount * eth_price) // (1 * (10 ** 18))
    return eth_amount_in_usd # This return may not be needed in the final Smart Contract we deploy.
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall price_feed.latestAnswer()


# To do a quick recap, we want to get our price, which has 8 decimal places.

# However, when people send the eth amount, we're going to be getting it in our fund function, which is
#going to use msg.value. 

# msg.val has 18 decimal places, so we need to convert the price from its 8 decimal places to 18 decimal
#places, and we need to convert it from an int256 to an unit256.

# So first we convert it then we add those additional places by multiplying 10 raised to the 10th power.

# Finally, once they're both uint256's, with 18 decimal places, we multiple them by each other, but since
#we added so many zeros to our value, we will need to divide by the 18 decimal places, like we did,
#which will give us our finally eth amount in usd.

# The next concept we will go over briefly is the double slash ( // )

# We can run this function below inside the Remix IDE and play around with it to get a feel for how integer
#division works inside Vyper.

# What we will observe is that integer division is basically cutting off the decimals to the answer we
#get returned.

# Since the blockchain and the Smart Contracts are a very precise Endeavor, we cannot have decimals that go
#to infinity.

# We need to be very precise when working with Smart Contracts and know exactly how much value everythings
#getting.

# So whenever we do division in our Smart Contract, it's always going to be integer division, where we cut off
#decimals.

# This is really important to know when we get more advanced, when we start doing more advanced defi 
#applications, because that is a crucial piece of knowledge when designing our very mathematically complex
#applications.

# As we went over previously, Vyper does have a decimals type as well, which is supposed to make it easier
#to do a lot of the heavy lifting, but even that gets cut off at some point, so whenever we're looking at
#division in the Smart Contract space, we should always keep in mind that it's integer division, and we
#we have to keep the precision of our math in mind. 

# We'll look at some examples of division that we can run in our Remix IDE.

#4 / 2 = 2
#6 / 3 = 2
#7 / 2 = 2 (Removes all decimals)

#@external
#@view
#def divide_me(number: unint256) -> uint256:
#    return number // 3


# Now that we have gone through all the math and we have our function get_eth_to_usd_rate set up, we can
#finally go back into our contract and convert the msg.value, the amount of eth that was sent to
#us, into usd, and compare it against our minimum usd value that we set for our Smart Contract.

# So now instead of saying, "the msg.value must be greater than or equal to 1 Ether", we will say that
#the value needs to be greater than the usd value. So we'll say:

usd_value: uint256 = self.get_eth_to_usd_rate(msg.value) # Get the usd value of the msg.value sent in.

# So here we're going to pass in the message value (msg.value), into get_eth_to_usd_rate(), it's going to
#take that message value as the input parameter eth amount, and then we're going to convert it to the 
#dollar amount.

# We're allowed to call (get_eth_to_usd_rate) again because it is an internal function.

# Remember, even though it is also a @view function, it's still going to cost gas because it is going
#to be called in a transaction.

# But then we're going to take the the usd_value_of_eth, and instead of comparing it like this:
#"msg.value >= as_wei_value(1, "ether")", we will now say the usd_value_of_eth must be greater than or
#equal to the self dot minimum usd (self.minimum_usd).

# This is what our Smart Contract will look like now.

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
    return eth_amount_in_usd  
    

@external
@view
def get_price() -> int256:
    price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#    ABI
#    Address
    return staticcall price_feed.latestAnswer()


# The minimum usd we're saying is 5 dollars. However this may cause issues in our contract.

# This is because we have the usd set to 5, and it will get 18 decimal places when it is converted to 
#eth_amount_in_usd, so the converted value will be 5000000000000000000. 

# We can't just compare 5 to 5000000000000000000, because that will always be false.

# So we need to make sure that our minimum usd value is in the same format as the eth_amount_in_usd.

# To do this, we can just update our minimum usd value to be in the same format as the eth_amount_in_usd.

# So instead of saying self.minimum_usd = 5, we can say:

"self.minimum_usd = 5 * (10 ** 18)"

# This will ensure that our minimum usd value is in the same format as the eth_amount_in_usd, which will
#allow us to compare the two values correctly.

# This is because they are both now in the same format, which is 18 decimal places.

# We can even go a step further and make sure that our minimum usd value is in the same format by doing
#the following:

"self.minimum_usd = as_wei_value(5, "ether")"

# This is what our final Smart Contract will look like with the updates:


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


# Note: This ( self.minimum_usd = as_wei_value(5, "ether") ), is just a shortcut for adding those 18
#decimal places.

# Yes, the minimum_usd is not ether, but rather 5$ worth of ether. This is why we used the as_wei_value
#function to set the minimum_usd value, which will convert 5$ worth of ether into wei, which is the smallest
#unit of measurement in the Ethereum Virtual Machine (EVM). 

# Now we can say assert msg.value >= self.minimum_usd, which will compare the msg.value (which is wei) to
#self.minimum_usd (which is also in wei). This will ensure that the comparison is valid and will work
#correctly when we deploy our Smart Contract.

# In Summary, we have successfully implemented integer precision in our Vyper Smart Contract.

# We have gone over the concepts of integer precision, type conversion, and integer division in Vyper.
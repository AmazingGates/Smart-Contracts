# This section will be our Introduction to Gas Fees

# In essence, gas fees are the cost of doing business on the Ethereum network.

# Or in other words, the cost of making a transaction.

# Gas fees are paid in ether, the native currency of the Ethereum network.

# Gas fees are paid to the miners who process and validate transactions on the network.

# The amount of gas you need to pay for a transaction depends on the complexity of the transaction.

# Transactions Fee - Amount paid to the producer for processing the transaction.

# Gas Price - Cost per unit of gas specified for the transaction, in either Ether or Gwei. The higher the
#gas price, the higher the chance of getting included in a block.

# Gas Limit = Maximum amount of gas you are willing to pay for a transaction.

# First we'll focus or the Transaction Fee and Gas Price.

# We should remember that blockchains are actually run by computers, and these computers are called nodes.

# These nodes are run by people, and these people need to be paid for their work.

# This is where gas fees come in.

# Gas fees are paid in ether, the native currency of the Ethereum network.

# For Ethereum, gas fees are paid in Ether/Gwei. (Gwei is a denomination of Ether, like cents)

# For Polygon, gas fees are paid in MATIC.

# For Arbitrum, gas fees are paid in Ether.

# These payments are incentives for the nodes to process and validate transactions, and they get paid 
#more the more gas we use.

# Gas is a unit of computational measurement.

# Gas is used to measure the amount of computational work required to process a transaction.

# For example, a simple transaction like sending ether from one address to another requires less gas.

# More complex transactions like minting an NFT, depositing funds into a defi protocol, or executing a 
#smart contract requires more gas, because they are more complicated to process.

# Transaction Fee = Gas Price * Gas Used

# This means that whoever sends the transaction also pays the transaction fee.

# Each Blockchain has their own unique way of much transaction fees are calculated.

# For most evm chains, this is the simple algorithm used.

# It's going to be gas used multiplied by gas price.

# After we understand the logic behind gas fees, we can start to understand how to calculate them.

# For now we should just remember that everytime we make a transaction, we are going to pay a gas fee.

# This applies to all evm compatible blockchains, including layer 2s, with respect to the native token.

# The amount of gas will be applied to the transaction, and the gas price will be applied to the gas.

# Note: We must have enough Ether in our wallet to pay for gas fees, or whatever the native token is for the 
#blockchain we are using.

# Also Note: The more people sending transactions at the same time, the higher the gas price.

# This is because the miners are going to prioritize the transactions with the highest gas price.

# This is called a gas war.

# Gas wars are when multiple people are trying to send a transaction at the same time, and they are all
#trying to outbid each other by increasing the gas price.

# This is why we need to be careful when sending transactions, because if we set the gas price too low,
#our transaction might not get included in a block.

# This is also why we need to be careful when sending transactions during peak times, because the gas
#price might be much higher than usual.

# We can manually set how much gas we are willing to pay for a transaction.

# We can also set a gas limit, which is the maximum amount of gas we are willing to pay for a transaction.

# Usually, we can just leave the gas limit at the default value, and it will be fine.
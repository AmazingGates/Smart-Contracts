# In this section we will be going the EVM.

# For now, when we actually compile our contract, we will do so by hitting the compile button in the 
#Remix IDE. 

# When we do this, we compile our contract down to machine readable code, which is also called the EVM, or 
#the (Ethereum Virtual Machine).

# The EVM is essentially a set of rules, or a set of standards of what compiled smart contract code should
#look like in machine readable code. 

# If we're on a chain that follows this set of rules, this set of "op" codes which we'll learrn about, 
#we're known as EVM compatible.

# Some examples of Ethereum Compatible Chains are going to be Ethereum, Arbitrum, Optimism, Polygon, 
#ZK Sync and more. 

# ZK Sync is known as Ethereum Compatible, whereas Ethereum is Known as Ethereum equivalent.

# The difference is that there is a kind of gradiaent of how Ethereum Compatible each one the chains
#actually is, which each of them will end up having a slightly different properties.

# The three listed above (Arbitrum, Optimism, ZK Sync), all being roll-ups, or Layer 2's of Ethereum, while
#polygon being its own chain, it's really important before deploying our Smart Contract to double check
#that our code is compatible with the chain that we are deploying to.

# This is important. For example, certain keywords with ZK Sync actually don't work with other chains.

# For the our first Smart Contract that we just deployed, ZK Sync works fine, and the ZK Sync compiler,
#but as we progress we will start to see where those differences actually are.
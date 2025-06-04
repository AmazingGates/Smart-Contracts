# In this section we will be going over High Level Blockchain Fundamentals.

# We will be going over how Blockchain Fundamentals work in actuality and what's really going on under the
#hood.

# We hould first keep in mind that each blockchain has slightly different algorithms and slightly different
#metrics in criteria for doing this sort of operations.

# So keep in mind that when we are talking about these specific implementations, remember that the exact
#algorithm might be a little different, but the concepts are all going to be exactly the same.

# Hashing and Hash Functions are going to be the same.

# No matter where we look, decentralized blockchain is going to be the same no matter where we look.

# How it's actual implemented is going to be a little different for each blockchain.

# Now traditionally, when we run an application we are interacting with a centralized entity, and unlike how 
#we saw with the blockchain, with multiple different peers, it's going to be run be a single centralized
#group. Even though it can be run on multiple different servers, all those servers are still controlled by 
#the same centralized group.

# Blockchains, as we saw run on a network of different independent nodes, like where we saw with the peer 
#to peer network, where each peer represented a node.

# Independent users are running the blockchain technology on their own node.

# Node - A single instance in a decentralized network

# So we should keep in mind that when we say node, we are refering to a peer in the decentralized network.

# Note: Anyone can join the network, as long as they have the proper Hardware. This is what makes it 
#decentralized.

# Blockchains are resilient in the fact that if one node, or an entity that runs several node goes down,
#the system is kept running properly by the other nodes in the system.

# The Blockchain and the system will persist so long as there is at least one node running.

# Luckily for us, Bitcoin and Ethereum have thousands of nodes running in their systems.

# And as we said previously, if one of the nodes in the system acts maliciously, all the other nodes will 
#ignore and exclude that node form the system.

# Each Blockchain node keeps a list of all the transactions that occur in the network.

# This is what gives Blockchain its potent immutabilty trait, where nothing can be changed or corrupted.

# So in essence we can think of the Blockchain as a decentralzed database, whereas with Ethereum,
#it has an additional feature where it also can do computation in a decentralized manner.

# Now let's look at this concept called "Consensus". Proof of work and proof of stake both fall under this 
#umbrella. 

# Consensus - This is the mechanism used to agree on the state of the blockchain.

# We briefly went over the concept of consensus when we talked about the nodes in a decentralized system. We
#learned that if one node is corrupt or changed from the other nodes in the system, by consensus, the 
#other nodes will exclude the offending node.

# Very roughly, a consensus protocol in a Blockchain, or a Decentralized system, can be broken down into two 
#pieces. A selection algorithm, and a sybil resistance mechanism.

# 2. Sybil Resistance - Mining, or The Proof of Work mechanism falls under this umbrella. And this is what
#Etheruem and Bitcoin currently use.

# Note: As of September 15, 2022, The Ethereum network migrated from Proof of Work, and now it is a 
#Proof of Stake system.

# This event was known as the merge.

# Proof of work is known as a sybil resistance mechanism because it defines a way to figure out who
#the block author is, or which node is the node that did the work to find and then mine that block, so all
#the other nodes can verify that it is accurate.

# Sybil Resistance is the Blockchains abilty to defend against users creating a large number of pseudo
#Anonymous identities to obtain dispropotinately advantageous influence over the system.

# In essence, this is a Blockchains defense mechanism against a user making a bunch of fake blockchains
#to try and get more of the mining rewards.

# There are two types of Sybil Resistance. They are the proof of work (PoW), and the proof of stake (PoS).

# We'll talk about Proof of Work (PoW) a little more in depth first.

# In Proof of work, it is sybil resistant because a single node has to go through a very computationally
#expensive process called mining, which we talked about previously, to figure out the answer to the 
#blockchains problem of finding the correct nonce, or whatever the blockchain system has in place.

# This works in proof of work because no matter how many fake accounts are created, each one still has to 
#undergo this very computationally expensive process of finding the answer to the proof of work problem,
#which again, in the demonstration from previously it was finding a nonce with the first 4 numbers as
#zeros.

# But again, each blockchain might change the problem to be a little different. In fact, some blockchains
#make the problem intentionally hard, or intentionally easy, to change what is called, the block time.

# The block time is how long it takes between blocks being published, and it's proportional to how hard
#the algorithms are. So the problems actually can change depending on how long they want the block to be.

# If a system wants the block time to be very long, they just make the problem very hard. Likewise, if
#they want the block time to be very short, they will make the problem very easy.

# We'll talk about Sybil attacks and how they can effect the system later on in the course, but with 
#proof of work, it's a verifiable way to figure out who the block author is, and be Sybil resistant.

# Now, we need to combine this with the chain selection rule to create this consensus. 

# There are some consensus protocols that have more features, but very roughly these are the two pieces that 
#we are going to look at.

# The second piece is going to be the Chain Selection Rule. How do we know which blockchain is actually the 
#real blockchain, and the true blockchain.

# Bitcoin uses a consensus algorithm Nakamoto Consensus.

# The Nakamoto Consensus uses a combination of Proof of Work, Sybil Resistance, and the Longest Chain Rule,
#which is their chain selection rule.

# We should point out that outside of this course and the curriculum work, most people just usually say that
#Bitcoins consensus algorithm is proof of work. This is technically a little bit inaccurate.

# Proof of Work is just a piece of Bitcoins Consensus Algorithm, where the actual consensus is called 
#Nakamoto Consensus, which includes that combination of the longest chain rule, and the proof of work,
#sybil resistance combination.

# So we want to keep in mind that in the real world we may hear each term interchangeably.

# The Decentralized network decides that whichever blockchain has the longest chain, or the most number
#of blocks on it is going to be the chain that they use.

# This makes sense because every additional block that a chain is behind is going to take more and more
#computation for it to come up. That's why when we see a transaction, we actually see confirmations.

# The number of confirmations is the number of additional blocks added on after our transaction goes
#through in a block.

# So if we see confirmations as two, it means that the block that our transaction was in has two blocks 
#ahead of it in the longest chain.

# Proof of Work also tells us where these transaction fees and the block rewards go to. 

# When we make a transaction, we have remember the gas and the transaction fee.

# Who's getting paid? Who's getting this transaction fee?

# Remember that the transaction fees are going to the miners and the validators.

# In a Proof of Work network they are called Miners, and in a Proof of Stake network they are called 
#Validators.

# There are slight differences between the two we will go over those a little later in the course when
#we talk about Proof of Stake.

# In the Proof of Work system, all the nodes are competing against each other to find the answer to the
#blockchain problem.

# Previously, it was to find a hash that has 4 zeros at the beginning of the hash.

# Again, depending on the blockchain implementation, the problem is going to be a little bit different, nut
#all the nodes are trying as many as possible to try and get thisanswer first.

# This is because the first node to figure the problem out gets the payment.

# That node will be the one to get paid.

# Now, when a node gets paid they actually get paid in two different ways.

# One is going to be with the transaction fee.

# And the other is going to be the block reward.

# We talked about transaction fees earlier in this module and it will be those fees that get paid to the 
#when we make a transaction. 

# The block reward is given to the node from the protocol, from the the blockchain itself.

# We may be familiar with the term Bitcoin halving (If not we can read up on it).

# This is when that reward is cut in half, and it's supposed to be cut in half roughly every 4 years.

# This block reward increases the circulating amount of whatever cryptocurrency that is being rewarded.

# For example, on Ethereum, the block reward is giving out Ethereum, and likewise with Bitcoin, the block
#reward will be given out in Bitcoin.

# So the nodes are competing against each other to get these rewards by being the first one to figure
#the blockchain problem.

# The node that solves the problem first gets the block reward andthe transaction fee. 

# Some blockchains, like Bitcoin for example, have a set time when they're no longer going to give out 
#block rewards, and the miners, or nodes, are only going to get paid the transaction fee.

# Keep in mind, the gas fee is paid by whoever is making the transaction.

# In Proof of Stake there is also a gas fee, but it's paid to the validators instead. But we'll talk 
#about that more when we talk about Proof of Stake.

# Let's talk about two types of attacks that can happen in these blockchain worlds.

# The first one we are going to talk about is the Sybil Attack.

# Sybil Attack - This is when the user creates a whole bunch of fake accounts to try and influence a 
#network.

# Obiviously with Bitcoin and Ethereum this is really difficult because a user needs to do all the 
#computations in the Proof of Work, or have a ton of colleteral in Proof of Stake, which is something 
#else we will talk about when we talk about Proof of Stake.

# The other, more prevalent attack is known as a 51% attack. As we saw, as part of our consensus
#protocol, the blockchains are going to agree that the longest chain is the one that they are going to
#go with, so long as it matches up with 51% of the rest of the network. 

# 51% Attack - This means if we have the longest chain, and we have more than 51% of the rest of the network,
#we can do what is called a fork in the network, and bring the network onto our now longest chain.

# 51% Attacks are known to happen Ethereum Classic networks (Which is NOT Ethereum).

# This is why the bigger a blockchain is, the more decentralized and the more secure it becomes.

# Although Proof of Work offers a very secure system, it has it drawbacks also. The Proof of Work uses 
#a lot of energy.

# This is because every single node is running as fast as they can to win the race of solving the blockchain
#problem, to win the reward and fees.

# This is why a lot of platforms moved to the Proof of Stake system, which is more environmentally friendly.

# Now let's talk about Proof of Stake.

# Proof of Stake - Proof of Stake nodes put up collateral as a sybil resistance mechanism. 

# Proof Of Stake, which is a different Sybil Resistance mechanism. Instead of solving
#the difficult problem, proof of stake nodes put up some collateral that they're going to behave 
#honestly.

# A.K.A, they stake.

# In the example of Ethereum 2 nodes put up ethereum as a stake to ensure that they are going to behave
#honestly in the network.

# If they misbehave in the network they are going to be slashed, or have some of their collateral removed.

# Obviously, this is a very good sybil Resistance mechanism because if we tried to create a whole bunch
#of anonymous accounts, then each one of those accounts would have to put up some collateral, or stake, which
#would be in the form of ethereum.

# And if we were to misbehave in the network, we run the risk of losing all of that collateral.

# In this system, miners are called Validators.

# This is because they are no longer mining anything, they are actually just validating other nodes.

# Now unlike proof of work, where every node is racing to be first to solve the blockchain problem, in 
#the proof of stake, nodes are actually randomly chosen to propose the new block, and then the rest of the
#validators will validate, if the node has proposed the new block honestly.

# Proof of Stake obviously has some pros and cons.

# Pros - It is a great Sybil Resistance mechanism, and a great way to figure out who the author of a block
#should be.

# Another pro, is that it's way less computationally expensive to figure out, or solve, the new block. 

# This is because instead of every single node on the network trying to do this, only one node needs to
#do this, and the rest of the nodes just needs to validate it.

# Proof of Stake uses much less energy.

# Cons - It is usually considered a slightly less decentralized network.

# This is due to the upfront staking costs it takes to paticipate.

# Although there is always debate about how decentralized a network needs to be to be considered
#decentralized, the general consensus amongst Engineers is that Proof of Stake is very decentralized
#and very secure.

# Now there is another term that might be used to hearing, which is a Layer 1, or L1.

# We're going to talk about Layer 1s (L1's) and Layer 2s (L2's) in terms of scalability briefly.

# Layer 1 - Base layer blockchain implementation.

# A L1 refers to base layer blockchain implementation. Bitcoin's a layer 1, ethereum's a layer 1, and 
#their are many others that operate on the layer 1.

# Layer 2 - Any network/application built on top of a layer 1.

# A L2 is any application that is added on top of a L1. Some examples of this are going to be Chainlink,
#Arbitrum, or Optimism. 

# Arbitrum and Optimism are interecting because they are L2's that also look to solve the scalability issue.

# Arbitrum and Optimism are what's known as rollups, and they roll up their transactions into a L1 like
#Ethereum. 

# We're not going to go too deep into rollups here, but the main point is that they help with scalabilty.

# These are different from side chains, which derive security from their own protocols, whereas rollups
#derive their security from the base layers that they are built on top of.

# So Arbitrum and Optimism, for example, are going to be just about as secure as Ethereum.
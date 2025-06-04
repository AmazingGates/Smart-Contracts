# In This section we will be going over the process of How Blockchains Work.

# The first thing we will do is visit this website andersbrownworth.com.

# This website is a simple blockchain explorer that allows you to see the blocks and transactions on the
#Bitcoin blockchain in real time with a visual demonstration.

# The first thing we will want to understand is the sha 256 hash function.

# The sha 256 hash function is a one way function that takes an input and produces a fixed size output.

# The output is always the same size, regardless of the size of the input.

# First let's discuss the concept of a hash.

# Hash - A unigue fixed length string, meant to identify a piece of data. They are created by placing
#said data into a hash function.

# The hash function takes the data and produces a unique fixed length string.

# Ethereum uses the keccak 256 hash function, which is a variant of the sha 256 hash function.

# The sha 256 hash function is used by the Bitcoin blockchain.

# The same rules apply to both hash functions.

# No matter how big the input is, the output, or Hash, will always be the same size.

# Now that we have an understanding of what a hash is, let's go over what the concept of a Block.

# With the block concept, we are going to take the exact process when we hash the data section,
#but instead of just having a singular data area, we are going to have a block. 

# We are going to split the block into three sections.

# The Block, The Nonce, and the Data.

# So what we're going to do is we're going to hash all three of these sections together.

# The Block number is the number of the block.

# The Nonce is a random number that is used to make the hash unique, and also it is used as the solution
#to the proof of work problem.

# The Data is the data that we want to store in the block.

# The data is going to be the transactions that we want to store in the block.

# This is the process that is taking place when a miner is mining a block.

# The miner is taking the block number, the nonce, and the data, and hashing them together.

# The miner is trying to find a nonce that solves the proof of work problem.

# Now that we have an understanding of what a block is, let's go over the concept of a Blockchain.

# A Blockchain is a chain of blocks that are linked together by the hashes of the previous block.

# This is what makes a Blockchain secure.

# The first block in a Blockchain is called the Genesis Block.

# Unlike the singular block, the block chain is going to have a previous hash section on top of the
#output hash(or just "hash") section.

# The previous hash section of the current block is the output hash(or just "hash") of the previous block.

# Every block in the Blockchain has a previous hash section, except for the Genesis Block, which has
#no previous hash to point to.

# Just like the singular block, all of the sections of the blockchain are going to be hashed together.

# This includes the block number, the nonce, the data, and the previous hash section.

# The output of the hash is going to be the hash of the current block.

# If we change any of the data in the block, the hash of the current block will change, which will
#cause an error in the previous hash section of the next block, because this number is already set in
#stone.

# The only way to fix this error is if we own the blockcahin, and we can re-mine the current block with the
#new data, and then re-mine all of the blocks after that.

# This is why the Blockchain is immutable.

# Immutable - Cannot be changed.

# This is where the Decentralized part of the Blockchain comes into play.

# The Blockchain is decentralized because it is not owned by any one person.

# The Blockchain is owned by everyone that is a part of the network.

# This is a peer to peer network.

# Peer to Peer - A network of computers that are all connected to each other, and they all have the same
#copy of the Blockchain.

# The best way to confirm that we have the same copy of the Blockchain is to check the hash of the last block.

# If we all have the same hash, then we all have the same copy of the Blockchain.

# This is how we can confirm that we have the same copy of the Blockchain.

# This is the power of Decentralization.
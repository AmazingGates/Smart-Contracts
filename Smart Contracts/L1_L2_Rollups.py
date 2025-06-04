# In this section we will dive deeper into the aspects of Layer 1's, Layer 2's, and Rollups. We will also
#begin our introduction into learning to code these smart contracts on our own.

# As we mentioned previously, we'll be working with sepolia to deploy our smart contracts, and interact 
#with them throughout this course, but we will also be deploying to, and interacting with our contracts 
#on ZK sync sepolia.

# Sepolia is a L1 test net, and ZK sync sepolia is a L2 Rollup. But what do these terms mean?

# What is a Layer 1 - A Blockchain in its purest form, where there are nodes that contribute to Sybil
#Resistance and help the chain reach consensus. 

# L1 - Base Layer of the blockchain ecosystem in which transactions are executed and confirmed.

# It is often referred to as the settlement layer because it's the layer of the blockchain ecosystem
#that all plugins, layers, or additional components eventually lead back to. 

# Examples of L1 chains include Bitcoin, BNB, Solana, Avalance, and Ethereum.

# Ethereum is the chain that we will be working with most during this course, so when we talk about L1's, 
#we're most likely talking about Ethereum.

# We can think of this L1 as the Hub of the ecosystem. 

# For example, in evm or Ethereum ecosystem, the Ethereum Manor is that Hub of the ecosystem, and anything
#that hooks back into Ethereum is known as a Layer 2, or L2.

# What is a Layer 2 - A L2 is anything that is built on top of the L1.

# The first layer of the system is the L1, the second layer of the ecosystem is the L2. 

# It's important to note that apps deployed to L1 are not considered L2's.

# For example, popular decentralized exchange Uni Swap is not considered to be an L2, but an app to be
#deployed on Ethereum.

# This means that its Smart Contracts directly deployed on Ethereum.

# L2 - Secondary framework or protocol that is built on top of the Layer 1.

# Basically any application that is built outside of the L1, and then hooks back into it.

# There are different Types of L2's, such as L2 applications.

# For example, Chainlink, which we briefly discussed previously.

# Chainlink is a decentralized oracle network that brings offchain data onchain, in a decentralized way.

# Another type of L2 is Event Indexing Networks, like the "Graph", which enables applications to access
#onchain data, but the most popular type of L2 is an L2 chain, or a Rollup.

# When people mention L2's, or Layer 2's, they are most often referring to Rollups.

# What is a Rollup - Scaling solution that increases the number of transactions 
#on the L1 chain.

# Blockchain Rollups are an L2 scaling solution that increase the number of transactions on Ethereum
#without increasing the gas cost. This is achieved by rolling up multiple transactions into one, hence the 
#name rollup.

# The first thing that is important to understand is why we need L2 chains or rollups.

# In an ideal world, we need blockchain systems to have three properties. 

# 1. We need them to be decentralized, I.E, not controlled by a single centralized entity. 

# 2. We need them to be secure so the system is protected against security vulnerabilities, like 51%
#attacks, where a malicious actor has control over a majority of the network, over 51%. Sybil attacks, where
#a malicious actor creates multiple nodes to gain control over a network by having a majority of the 
#nodes on the network. Both of these attacks mean that the malicious actor can control the network, to
#pass through any transactions they like, or reorder transactions, and also replay attacks where the 
#same transactions are sent more than once.

# 3. And Finally, we need it to be Scalable. This means that the system can grow without sacrificing 
#speed or running cost.

# This is known as the Blockchain Trilemma.

# The Blockchain Trilemma states that a blockchain system can only ever have two out of three of these
#properties.

# For example, if the system is secure and decentralized, then scalability will be sacrificed, as is
#the case with Ethereum. 

# Ethereum inherently has a scalability problem. It can only process 15 transactions per second. And as
#Ethereum is gaining in popularity, the number of transaction requests is increasing. The gas cost to
#pay for these transactions is increasing to jump the queue and avoid long wait times. If blockchain
#systems are to reach mainstream adoption, gas prices need to reduced, even in the face of high 
#transaction volumes. Enter Rollups.

# Rollups - Rollups aim to solve the Trilemma problem by increasing the throughput of Ethereum, without
#sacrificing either the decentralization or the security of the system. This is achieved by processing
#the transactions off of the L1 blockchain.

# How does this work?

# When a user submits a transaction to a rollup, such as ZK Sync, an operator picks up the transaction.

# An Operator is a general term and it can refer to a node, a set of components or entity responsible
#for processing the transactions. This operators job is to pick up the transactions, order them with 
#other peoples transactions, and then bundle them together, compress them, and then submit them back
#to the L1, such as Ethereum. And so if Ethereum rolls back, so does the rollup, therefore they have
#the security of Ethereum. 

# By bundling the transactions together, this enables rollups to handle the transactions efficiently,
#because the gas cost associated with the transaction is split among all of the users. All of the 
#transactions in the transaction batch.

# The validity of this transaction is then checked on the L1, and this can work a little differently
#depending on the type of rollup.

# There are two main types of rollups, and the difference between these two lies in how the rollup
#checks the validity of the transaction, how they check if it is legitimate, rather than fraudulent.

# Optimistic Rollups vs ZK Rollups

# The two main types of rollup are the optimistic rollup, and the zero knowledge rollup (zk rollup).

# Let's start with the Optimistic Rollups.

# Optimistic Rollups - Assume Transactions are legitimate. 
#                    - Use fraud proof to verify correctness in the case of a dispute.

# This type of rollup assumes that the offchain transactions are valid by default. They are pretty 
#optimistic, hence the name. Operators can propose what they believe to be the valid state of a rollup
#chain. 

# After this, there is a time period known as "The Challenge Period". During this time, operators can 
#challenge the rollup transaction. Operators can send a challenge by Computing a fraud proof, if they
#notice a potentially fraudulent transaction.

# This fraud proof involves the operator playing a call and response game with the another operator,
#until they narrow down the dispute to single computational step. 

# This computational step is then executed on the L1, which is the base layer, and if executing this 
#step results in a different outcome, the state of the blockchain is different. The challenging or 
#disputing operator wins the challenge, and the fraud proof succeeds.

# If the proof succeeds, the rollup will re-execute the batch of transactions, and the operator responsible
#for the incorrect transaction inclusion will be penalized.

# This is usually done using some kind of staking mechanism, where operators send tokens to a Smart 
#Contract that are held to yes, I agree to behave properly while on the network. Then if they don't,
#their tokens are taken away from them.

# This is known as "Slashing", which we spoke about previously, and works the same on Optimistic Rollups.

# If the transaction proposals are not invalidated during the challenge period, then the proposals are 
#assumed to be correct.

# Now let's move on to Zero Knowledge Rollups (ZK Rollups).

# ZK Rollups - Use validity or zk proof to verify transaction correctness. 

# Zero Knowledge Rollup solutions prove each transaction batch to be correct using validity proofs or 
#ZK proofs.

# ZK Proofs are a complex mathematical cryptographic problem.

# Blockchain ZK Proofs - Algorithm that verifies that a "prover" knows something to be a "verifier" without
#revealing the information.

# ZK Proofs involve two participants. The prover, which is the entity that is trying to prove that they
#know something. And the verifier, which is the entity that is verifying that the prover does in fact
#know the answer to the problem.

# The answer to the problem in the ZK Rollup world is referred to as the "Witness". In the context of ZK 
#Rollups the prover is an operator, and the verifier is just an L1 contract. 

# So for each transaction batch that is submitted to the L1, a validity or ZK proof is computed by 
#an apporver, and verified by the verifier, or the L1 contract.

# This ZK Proof then confirms the transaction validity.

# Essentially what happens is,the problem gets reduced down to a single mathematical equation, meaning the 
#prover can then prove that their input satisfies this problem, and then the verifier can say yes, the 
#output is as expected, and the proof succeeds.

# So to summarize, Rollups help scale Ethereum by processing transactions off chain, bundling them 
#together, and then submitting them back to Ethereum, with some kind of proof, which is different
#depending on whether it is an Optimistic Rollup or a ZK Rollup.

# Next we will talk about Sequencers.

# Sequencers are a type of operator associated with rollups.

# The Sequencer usually refers to the operator which is ordering transactions, and sometimes bundling
#them together, to make it easier for processing.

# Now in some rollups this sequencer is in fact centralized, so it's controlled by a centralized entity.
#This can be problematic because it can lead to things like censorship, where the centralized entity
#is stopping some users transactions from being processed, or it can manipulate the order of transactions
#for their own gain. So something like us being unable to make withdrawals because they're blocking our 
#withdrawal transaction could occur.

# The other issue is that if the Sequencer is centralized or if the sequencer goes down, then no one 
#will be able to make any transactions at all. Withdrawals can't happen and this can be extremely 
#problematic, because what if withdrawals are halted for an extended amount of time, will the funds be
#worth anything if we can't withdraw them.

# These are just a few issues with Sequencers being Centralized, and this is why projects like ZK Sync
#are working right now, to decentralize their Sequences.

# Now we will talk about Rollup Stages.

# L2 Chains, or Rollups, are graded on certain properties and given A Stage.

# Now for this section we are going to be going over the L2 Beat website, which we can see at 
#L2Beat.com/scaling/summary

# Here, we will be able to see all of the different chains, there stages, and lots of different information
#that we will be going over. 

# So the Stage of a Rollup is a categorization framework based on vitalics proposed Milestones. It is an
#opinionated assessment on the maturity of the rollup by the L2B team, and it's purpose is to create an
#incentive for projects to work towards decentralization, and they have proposed three stages. 

# Stage 0 - Full training wheels 
#         - Centralized management
#         - Security Council makes decisions
#         - Open Source software for data availabilty

# Stage zero is Full training wheels mode. The operators and security coucil prominatly manage the rollup. 
#This is like a committee of members who can make decisions in the case of bugs, or problems, or upgrades. 
#And so in stage zero, the management of the rollup is pretty centralized.

# Data Availability refers tothe confidence a user can have that the data required to verify a block really
#is available to all the network participants. So in terms of rollups, this transaction data needs be 
#available in order to verify the transaction. So for srage zero rollups there needs to be open-source 
#software to enable state reconstructionof the L1 data to ensure both transparency and also the verification.

# And Finally in stage zero, in the case of an unwanted upgrade, users have less than 7 days to exit the 
#system. Exiting in this context refers to the users wihtdrawing their funds from the system, and in stage
#zero this usually requires some kind of operator coordination. So some entity is going to have to help
#then exit. 

# Stage 1 - Enhanced Rollup Governance
#         - Governed by Smart Contracts
#         - Security for bug resolution
#         - Decentralized fraud/validity proof system

# Stage one the rollup is starting to be governed by smart contracts. The security council is probably still
#in place for things like bug resolution, but it is starting to become more decentralized. 

# In stage one, the rollup has fully functional proof system with a decentralized fraud or validity proof
#submission system.

# In stage one a user can exit without coordination from an operator in the case of these unwanted
#upgrades.

# Now in stage 2 there are no training wheels.

# Stage 2 - No Training Wheels
#         - Completely Decentralized 
#         - Smart Contracts manage the rollup
#         - Full Decentralized & Permissionless fraud/validity proof system
#         - Ample Time To Exit System in case of upgrades
#         - Security Adressess Errors adjudicated on-chain
#         - User Protection againts governance attacks

# Now in stage 2 there are no training wheels. Smart contracts now fully manage the rollup. It's pretty
#decentralized at this point, and so the fraud or validity proof system is completey permissionless, and
#users are given an ample time to exit in case of inwanted upgrades. There usually is some kind of security
#council where its role is strictly confined to addressing errors that can be adjudicated on-chain, meaning
#that users are now protected against governance attacks.

# And so if we look through the L2Beat website, then we can see what stage all of the different rollups are
#at. 

# If we further inspect the Rollups, we can find additional information about them and their properties.

# The final thing we will say about the rollup stages and the L2Beat is that these stages do not reflect
#the security of the rollup. It is purely an opinionated assessment of the maturity in order to push these
#protocols towards decentralization.
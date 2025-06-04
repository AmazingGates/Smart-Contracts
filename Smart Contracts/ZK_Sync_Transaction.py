# In this section wewill be going over the steps to create our first transaction using ZK Sync

# We will be making our first transaction on tthe ZK testnet.

# The ZK testnet is sometimes called ZK Sepolia, or ZK Sync Era testnet. We'll use the terms 
#interchangeably, but they are all referring to the same thing.

# Some of the things we do in this section are going to be repeated, or the similar process from eariler in
#the course, which is a good thing since repetition is key understanding these processess.

# The first thing we will do is add ZK Sync Sepolia To our metamask, so we can see the transaction summaries,
#see our balance, and other things of that nature from inside metamask.

# This is how we will add ZK Sync to our metamask account.

# The first the we are going to do is go to chainlist.org, and make sure we have the include test nets box
#checked, and then search for ZK Sync Era Testnet.

# Once we find it, we will click on the button that selects ZK Sync Sepolia testnet, and then we're going
#to connect our wallet and confirm that this site is allowed to have access to our metamask wallet. We
#can click approved to allow this site to add a network to our metamask wallet. This is going to add
#the network to our metamask wallet, and we will be able to see the ZK Sync Sepolia testnet in our metamask
#network list.

# The second thing we want to do is we want to be able to see transactions and contracts, and in more
#detail, like we did with sepolia with Etherscan.

# The block explorer equivalent to Etherscan for ZK Sync is called ZK Scan. We can go to zk scan.io, and
#once there, we can select the ZK Sync Era testnet from the dropdown menu. Once we do this, we can then 
#head back to our metamask wallet and grab our address. We can then paste our address into the search bar
#of ZK Scan, and we will be able to see our address, and the transaction history of our address.

# Once we send our first transaction, we will be able to see a summary of it on ZK Scan, and we will be able
#to see the transaction hash, and other details of the transaction as well. 

# The next thing we want to do is get some testnet ETH, so we can send a transaction. We can do this by
#going to the ZK Sync faucet, and requesting some testnet ETH. We can do this by going to the ZK Sync
#faucet, and connecting our wallet. Once we do this, we can request some testnet ETH, and it will be sent
#to our wallet. We can then check our balance on ZK Sync Scan, and we will see that we have some testnet ETH
#in our wallet. We can then send a transaction, and we will be able to see the transaction on ZK Scan.

# Bridging Funds.

# We will use the bridging method to get funds from the faucet to send to our wallet. We can do this by
#going to the ZK Sync bridge, and connecting our wallet. Once we do this, we can select the amount of 
#testnet ETH we want to send, and then we can click on the bridge button. This will send the testnet ETH
#to our wallet, and we will be able to see the transaction on ZK Scan. We can then check our balance on
#ZK Scan, and we will see that we have some testnet ETH in our wallet. We can then send a transaction,
#and we will be able to see the transaction on ZK Scan.

# Basically, we will be taking funds from one chain, and sending it to the another chain. But we're not
#actually taking those funds and moving them, we'll be using a mechanism. Now there's two types of 
#briding mechanisms.

# The first is a locking and unlocking method. And what happens here is that the tokens are locked on the 
#source chain.

# So they are locked inside a smart contract, and then they're unlocked on the destination chain. They're 
#released on a smart contract and sent to our wallet from the destination chain. 

# The second method is a minting and burning Bridge.

# What happens here, is on the soure chain the tokens are burned, so they are sent to the zero address, and 
#they are taken out of circulation. They're destroyed. They are no longer in circulation, and then tokens
#are minted on the destination chain. They're given to the user on the destination chain. They're created
#out of thin air.

# BAsically, the tokens are destroyed on the source chain, and then they are created on the destination chain.

# Now here, the bridge protocol needs to have control over the supply of the tokens, in order to be able to
#burn them and mint them.

# For instance, an example this is cctp, which was created by the circle team, where usdc is burned and 
#minted in order to create a bridge, in which their bridge implements a burn and a mint bridge mechanism.

# This can occur because the circle team has control over the usdc supply.

# Now we can carry out the process of bridging our funds from Sepolia to ZK Sync Sepolia.

# We're going to use the Google cloud Sepolia Faucet. As of this course, this is the best faucet for 
#Sepolia we can use. cloud.google.com

# We'll make sure to set the network as sepolia. Next we'll copy our address from metamask, and paste it into
#the faucet. Then we will click the receive button.

# This should initiate our transaction, and we should be able to see our transaction on ZK Scan. Keep in mind
#that will we have to switch to the Sepolia testnet network in our wallet in order to see the transaction
#in our wallet.

# Now we need to take these tokens andtransfer them to the ZK Sync Sepolia to get some ZK Sync Sepolia ETH.

# In order to do this, we will have to use the bridge. We will head to portal.zksync.io/bridge to bridge
#our funds. This is going to be a lock and unlock method bridge.

# While in the portal, we will locate the ZK Sync drop down menu, and select the ZK Sync Sepolia testnet.

# The bridge transaction is going to be from Ethereum Sepolia testnet to ZK Sync Sepolia testnet. Then we
#will select the amount of ETH we want to bridge. We will then click on the bridge button, and then we will
#confirm the transaction in our wallet. This will initiate the transaction, and we will be able to see the
#transaction on ZK Scan. We will also be able to see the transaction in our wallet once it is confirmed.

# Finality

# The finality of a transaction is the point at which a transaction is considered to be irreversible. 

# This also often refers to the amount of time it takes from sending the transaction to when the transaction
#is considered to be irreversible, or settled. At this point it can't be altered or reversed.

# On the Ethereum mainnet, this is usually around 12 minutes.

# Finality on the ZK Sync Era is aroud 24 hours for the entire batch to be finalized. 

# Note: We should keep in that just because we can see the transaction on ZK Scan, doesn't mean that the 
#transaction is finalized. Instant confirmations just means the transaction was submitted to the network.

# The transaction is not finalized until the entire batch is finalized. 

# Before we wrap up this module, we will explain why we are recommending using the ZK Sync.

# There are four main reasons.

# 1. Security - Security on the ZK Sync Era is directly inherited from Ethereum. If Ethereum detects an issue
#and rolls back, so does ZK Sync Era.

# 2. Compatible - ZK Sync is evm compatible. When we compile a smart contract, it doesn't compile to evm byte
#code, instead it compiles down to Era VM byte code, which is like a ZK Sync special version. 

# The ZK Sync compiler, K Sulk, can compile and understand solidity. This means that we can take our smart
#contracts that we've written in solidity, abd deploy them to ZK Sync Era without really making any 
#adjustments. 

# 3. Support - ZK Sync supports Ethereum wallets out of the box, so there is no need to ceate special
#wallets. So what does this mean. This means that we can use metamask wallet and addresses as we normally
#would.

# 4. Cost and Scalibilty - ZK Sync offers users low cost and scalibilty with its use. This is due to the 
#transactions being bundled together. This allows the gas cost to be split among all of the transactions.
#So instead of one transaction alone costing us a lot of gas, our transaction is bundled with others to be
#sent out together which will incur a single gas cost that will be split between every transaction in the 
#bundle.

# This also effets scalibilty. As Ethereum grows, more transactions will mean higher gas cost for 
#transactions that want to get sent out as soon as possible, as opposed to the ZK Sync, which will send
#send transactions out in bundles, regardless of how big the network grows.
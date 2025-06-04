# In this section we will learn about transactions in Ethereum and how they are used to transfer value
#and execute smart contracts. We will also learn about the different types of transactions and how they
#are processed by the Ethereum network.

# A transaction is a signed data package that contains the information needed to transfer value or execute
#a smart contract on the Ethereum network.

# Now that we finally have our favorites_contract object, how dow we actually deploy it?

# To deploy this contract, we must build a transaction that contains the bytecode of the contract and send
#it to the Ethereum network. The transaction must be signed with the private key of the account that is
#deploying the contract. The transaction will be processed by the Ethereum network and the contract will
#be deployed to the blockchain.

# This is how we will learn about transactions and how to create and send them to the Ethereum network.

# This will be one of the ffew times we will manually create a transaction, as most of the time we will
#use a library like web3.py to handle the transaction creation and sending for us.

# If we go to the Ethereum.org website, we can see that a transaction is defined as follows:

# A transaction is a signed data package that contains the information needed to transfer value or execute
#a smart contract on the Ethereum network.

# We will also see that a transaction contains the following information:

# - The sender's address - From which the transaction is sent
# - The recipients's address - To which the transaction is sent
# - The amount of ether to be transferred
# - The data to be sent to the contract (if any)
# - The gas limit and gas price for the transaction
# - The nonce of the sender's account
# - The signature of the transaction - The idenitifier of the transaction
# - The chain ID of the network
# - The transaction type (Legacy, EIP-1559, or EIP-2930)
# - The access List (if any)
# - The max fee per gas (if EIP-1559)
# - The max priority fee per gas (if EIP-1559)
# - The base fee per gas (if EIP-1559)
# - The transaction hash (if the transaction has been sent)
# - The transaction receipt (if the transaction has been mined)
# - The transaction logs (if the transaction has been mined)
# - The transaction status (if the transaction has been mined)
# - The transaction block number (if the transaction has been mined)
# - The transaction block hash (if the transaction has been mined)
# - The transaction timestamp (if the transaction has been mined)
# - The transaction gas used (if the transaction has been mined)
# - Etc.

# If we scroll down a little more, we will see "The transaction object will look like this:"

# {
#   "from": "0x
#   "to": "0x",
#   "value": "0x",
#   "gas": "0x",        
#   "maxFeePerGas": "0x",
#   "maxPriorityFeePerGas": "0x",
#   "nonce": "0x",
# }

# This is kind of a minimal example of a json or javascript object notation transaction, it has no real
#inputs or outputs, but it is a good starting point to understand how transactions work in Ethereum.

# Also, this is an unsigned transaction, which means that it has not been signed with the private key of 
#the sender's account. This is important because a transaction must be signed before it can be sent to the
#Ethereum network. The signature is used to verify that the transaction was indeed sent by the owner of the
#account and that the transaction has not been tampered with.

# What we will do in this section is to create a transaction object that contains the information needed to
#deploy our favorites_contract to the Ethereum network. We will then sign the transaction with the private
#key of the account that is deploying the contract and send the transaction to the Ethereum network.


# In this section we will go over the process of crafting a manually created transaction (tx).

# Note: Transactions are often referred to as "tx" in the Ethereum community, so we will use that 
#abbreviation in this section.

# Note: This transaction will also go inside our favorites_contract.py file.

# The first tthing we'll do to create a transaction is to create an object.

# We will cal this object "transaction", and we'll set it up like this.

# transaction = {}

# We are leaving it blank for now, but we will fill it in with the necessary information to deploy our
#favorites_contract to the Ethereum network.

# We can also keep track of what we're doing by adding a print statement above the transaction object.

# This is the print statement we'll use:

# "print("Building the transaction...")"

# Now we can start adding the necessary information to the transaction object that we need to deploy our
#favorites_contract to the Ethereum network.

# The first thing we need to add is the "from" field, which is the address of the account that is deploying
#the contract. We can get this address from the account object that we created earlier.

# Note: We will add the "from" field but we will be skipping it for now by commenting it out. We will
#uncomment it later when we are ready to deploy the contract.

# This is what we should have so far:

#Transaction = {
 #   from
#}

# We'll see why we had to comment it out later, but for now we can move on to the next field.

# The next field we need to add is the "to" field, which is the address of the contract that we are deploying.

# Since we are deploying a new contract, we can leave this field empty for now. We will fill it in later
#when we have the address of the contract.

# This is what we should have so far:

#transaction = {
#    from:
#    to:
#}

# The next thing we will add is the "gas" field, which is the maximum amount of gas that we are willing to
#pay for the transaction. We can set this to a high value to ensure that the transaction is processed 
#quickly. For now, we can set it to 1,000,000 gas.

# This is what we should have so far:

#transaction = {
#    from:
#    to:
#    gas:
#}

# We can 100% keep creating the transaction object like this, but we will be using web3.py to handle the
#transaction creation and sending for us. So we will not be going into the details of how to create a 
#transaction object manually. Instead, we will use web3.py to create the transaction object for us.

# And since we have our favorites_contract object, we can kind of skip the process of creating a 
#transaction object manually, as web3.py will handle that for us when we deploy the contract using the
#favprites_contract object.

# This is how we will deploy our contract using web3.py:

#transaction = favorites_contract.constructor().buildTransaction()

# Doing this will help populate alot of the fields automatically for us.

# Just to check things as we go, we will add a breakpoint() to the code to see what the transaction
#object looks like after we build it.

# After we add our breakpoint(), we can run the code and see what the transaction object looks like.

# If we ran the code as is right now, we will throw an error because we have to add the "abi" as a
#parameter to our compilation_details object. "abi" (Application Binary Interface)

# So we will add the "abi" parameter to our compilation_details object like this:

# compilation_details = compile_code(favorites_code, output_formats=["bytecode", "abi"])

# We also have to modify our favorites_contract object to account for the added "abi". We can do that
#like this.

#favorites_contract = w3.eth.contract(bytecode=compilation_details["bytecode"], 
#                                         abi=compilation_details["abi"])

# We will also be adding a print statement after this line of code where we will be printing out
#favorites_contract.

# We will also uncomment the print statement for the compilations details to ensurre that we are now 
#picking up the "abi" as well.

# Note: Even though we will still throw an error up until this point, we should still be able to see the
#"abi" in the compilation details printout inside the terminal if we run the code and scroll up to the 
#compilation details printout section.

# Now that we are sure that we have the "abi" in our copilation details, we can address the issue of the
#transaction object throwing an error when we try to build it.

# Note: Inside the "abi" compilation details, we will see that it is a list of dictionaries, each
#dictionary representing a function or event in the contract. This is where we can find the "constructor"
#fuction that we will be using to deploy the contract.

# When we call the "conctructor()" method on the favorites_contract object, we are actually calling the
#constructor function of the contract, which is defined in the "abi" compilation details. This is how we
#can deploy the contract using web3.py.

# This is going to help us build the transaction with the Constructor for us, and the error we were
#throwing before is telling us that we have to connect to an Ethereum node before we can build the
#transaction.

# Again we can do this by running anvil in a separate terminal window, and then running our code in
#another terminal window.

# Once we have anvil running, we can run our code and see that the transaction object is built successfully.

# At this point our code should be compiling and running without any errors, and we should be able to see
#the transaction object printed out in tghe terminal.

# We should also be in a breakpoint() where we can inspect the transaction object and see what it looks like.

# If we copy and pasted "transaction" into the terminal, we should see our transaction object.

# We should see something like this:

#{'value': 0, 'gas': 221148, 'maxPriorityFeePerGas': 1000000000, 'maxFeePerGas': 3000000000, 'chainId': 31337,
#'data': '0x3461001a5760075f5561029e61001e6100003961029e610000f35b5f80fd5f3560e01c60026007820660011b61029001601
#e395f51565b636057361d81186100345760243610341761028c576004355f55005b632986c0e58118610288573461028c5760245460405
#260206040f35b632e64cec18118610288573461028c575f5460405260206040f35b6305a8568681186101455760443610341761028c576
#0043560040180356064811161028c5750602081350180826040375050602435602454600581101561028c576001015560243560e052602
#0604051018060406101005e506006602454600581101561028c570260060160e051815560206101005101600182015f82601f0160051c6
#005811161028c57801561011657905b8060051b6101000151818401556001018181186100fe575b5050505050602435602560405160602
#06020525f5260405f20556024546001810181811061028c579050602455005b6374ec933f81186102885760243610341761028c5760043
#560040180356064811161028c575060208135018082604037505060256040516060206020525f5260405f205460e052602060e0f35b633
#a40c6f28118610288573461028c575f5460405260206040f35b632578e0f081186102885760243610341761028c5760043560058110156
#1028c576001015460405260206040f35b635ec0e9c981186102885760243610341761028c5760208060405260066004356005811015610
#28c5702600601816040016040825482528060208301526001830181830160208254015f81601f0160051c6005811161028c57801561025
#257905b808501548160051b85015260010181811861023c575b5050508051806020830101601f825f03163682375050601f19601f82516
#020010116905090508101905090509050810190506040f35b5f5ffd5b5f80fd006b01db019200500018028801ad85582028502975b0b61
#a06a4bdce77284d733cd4d2fa405ac8d4f7d415191c3b90d78819029e810e00a1657679706572830004010036', 'to': b''}

# We can see that the transaction object has been built successfully and it has all the necessary fields
#to deploy our favorites_contract to the Ethereum network.

# Let's break down the transaction object a little bit to understand what each field means:

# - 'value': 0 - This means that we are not sending any ether with the transaction, as we are only
#deploying a contract and not transactioning with an existing contract.

# - 'gas': 221148 - This is the maximum amount of gas that we are willing to pay for the transaction.

# - 'maxPriorityFeePerGas': 1000000000 - This is the maximum priority fee per gas that we are willing to
#pay for the transaction. This is used to incentivize miners to include our transaction in the next block.

# - 'maxFeePerGas': 3000000000 - This is the maximum fee per gas that we are willing to pay for the
#transaction. This is used to cover the base fee and the priority fee for the transaction.

# - 'chainId': 31337 - This is the chain ID of the network that we are deploying the contract to. In this
#case, we are deploying the contract to the local Anvil network, which has a chain ID of 31337.

# - 'data': - This is the bytecode of the contract that we are deploying. This is the compiled code of our
#favorites_contract that we want to deploy to the Etherreum network.

# - 'to': b'' - This is the address of the contract that we are deploying. Since we are deploying a new
#contract, this field is empty for now. Once the contract is deployed, this field will be filled with the
#address of the deployed contract.

# Once we run the code again, we will see that we have some new information inside the terminal where 
#we are running anvil.

# This is the infomation we will see that appears in the terminal under the listening on line:

# eth_chainId
# eth_estimateGas
# eth_chainId
# eth_maxPriorityFeePerGas
# eth_getBlockByNumber
# eth_chainId

# These are the JSON-RPC methods that are being called by web3.py to interact with the Anvil.

# Anytime we see any of these lines pop up under the "listening on" line, it represents us interecating
#with the blockchain.

# So these are some of the RPC calls that are being called on Anvil by web3.pyto interact with the
#blockchain. We will see these lines pop up every time we interact with the blockchain, whether it is
#deploying a contract, sending a transaction, or querying the blockchain for iformation.

# In this case Python is cgalling the Anvil node to estimate the gas for the transaction, get the chain ID,
#and get the max priority fee per gas for the transaction. This is all done automatically by web3.py when
#we build the transaction object using the "build_transaction()" method.

# Python will get the cahin ID, which is 31337, and the data field will be the bytecode of the contract
#that we are deploying. 


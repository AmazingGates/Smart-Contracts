# In this section we will go over the process of deploying a contract to the EVM (Ethereum Virtual Machine)
#using the web3.py library.

# The first thing we will be going over is why our "to" field is set to None.

# The "to" field is set to None because we are deploying a new contract, and the "to" field is only used
#when we are sendng a transaction to an existing contract. When we deploy a new contract, the "to" field 
#is not needed, and we can set it to None.

# This is an example of us sending a transaction to an existing contract.

# Note: We will use our Metamask address for this example.

# This is how we will implement that into our code:

# transaction["to"] = "MetamaskAddress"

# Note: We will remove the breakpoint(), and add a print statement to show the transaction after we have
#the "to" field set to see what the compilation details look like now that we have the "to" field set.

# Now that we have the "to" field set, we can see that the transaction is now a valid transaction that 
#can se sent to the EVM, and we will see our Metamask address in the "to" field when we print the
#transaction and view the compilation details.

# Note: We are only using the Metamask address as an example, and we will not be sending this transaction
#to the EVM, as we are only using this as an example to show how the "to" field is set when sending a
#transaction to an existing contract.

# Now that we have seen an example of using the Metamask address to populate inside our compilation details,
#we can delete that line of code, and set the "to" field back to None, as we are not sending a transaction
#to an existing contract, but rather deploying a new contract to the EVM.

# The data field contains all the information needed to deploy the contract, including the bytecode of the
#contract, the ABI (Application Binary Interface), and any constructor arguments that are needed to 
#initialize the contract.

# The "data" field is set to the bytecode of the contract, which is the compiled version of the contract
#written in Vyper. The bytecode is what is sent to the EVM to deloy the contract.

# There is a lot of stuff that goes into the "data" field, and it is not something that we need to worry
#about when deploying a contract using web3.py. The library takes care of all the details for us, and we
#just need to provide the bytecode of the contract and any constructtor arguments that are needed.


# In this next section, we will go over the process we need to "set the transaction nonce".

# The nonce is a number that is used to keep track of the number of transactions that have been sent from
#an account. It is used to prevent replay attacks, where an attacker could try to send the same transaction
#multiple times. The nonce is incremented by 1 for each transaction that is sent from the account.

# When we deploy a contract, we need to set the nonce to the current number of transactions that have been
#sent from the account. This is done to ensure that the transaction is unique and cannot be replayed.

# The nonce is set using the "get_transaction_count" method of the web3.py library. This method returns the
#current number of transactions that have been sent from the account, and we can use this value to set the
#nonce for the transaction.

# Moving forward, it might be a good idea to update some of the parameters in the transaction diccionary.

# For example, one of the things we will need to update is the "nonce" field, which is the unique number
#that is used to identify the transaction.

# What we might do to help customize the transaction is set the "nonce" field to the current number of
#transactions that have been sent from the account. This is done using the "get_transaction_count".

# The "get_transaction_count" method returns the current number of transactions that have been sent from
#the account, and we can use this value to set the nonce for the transaction.

# This should help our transaction actually run, as the nonce is a required field for the transaction.

# We can get the nonce by using the following code:

# nonce = w3.eth.get_transaction_count(account_address)

# Since we need an address to get the nonce, we will need to set the "account_address" variable to the
#address of the account that we are using to deploy the contract. This is typically the address of the
#account that we are using to sign the transaction, but for now we can go to our anvil terminal and copy
#an address from a list of accounts that are available to us.

# Once we have the address, we can set the "account_address" variable to that address, and then we can
#use the "get_transaction_count" method to get the nonce for that account.

# The addresses will be located in the anvil terminal, and we will see them when we scroll up in the 
#terminal. 

# The addresses will look something like this:

# 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

# Note: The address above is just an example, and we will need to use an actual address when we are
#deploying the contract. 

# Also Note: We will need to initialize the address variable at the top off our contract before we can use 
#it to get the nonce.

# Once we have initialized the address variable, we can just use the MY_ADDRESS variable to pass as the
#account address to the "get_transaction_count" method, and we can get the nonce for that acaount.

# As of right now, our transaction dictionary does not have a nonce field, so we will need to add it.

# We can do this by adding the following line of code to our transaction dictionary:

# transaction["nonce"] = nonce

# This will set the nonce field to the current number of transactions that have been sent from the account,
#and will help ensure that the transaction is unque and cannot be replayed.

# Now that we have set the nonce field, we can see that the transaction is now a valid transaction that
#can be sent to the EVM, and we can print the transaction to see the compilation details.

# After we have configured the nonce and the address we can print the transaction again, and this time
#we will see that we now have a nonce field in our transaction dictionary, and it will be set to the 
#current number of tranactions that have been sent from the account, which should be "0" if this is the
#first transaction that we are sending from the account.

# It is important that we do this web3 transaction count instead of just setting the nonce directly to 
#zero because the nonce is a unique number that is used to identify the transaction, and if we set it to
#zero, it could cause the transaction to fail if there are other transactions that have been sent from the
#account. 

# This means that we need to use the "get_transaction_count" method to get the current number of 
#transactions that have been sent from the account, and use that value to set the nonce for the transactions.

# The web3 sets the nonce to the current number of transactions that have been sent from the account,
#and this helps ensure that the transaction is unique and cannot be replayed.

# If the code compiles successfully, we can proceed to deploy the contract to the EVM.

# Once deployed this is the information we will have access to:
# - The address of the deployed contract
# - The transaction hash of the deployment transaction
# - The bytecode of the contract
# - The ABI of the contract

# We can use this information to interact with the contract, such as calling its functions or sending
#transactions to it.

# We can also use the adddress of the deployed contract to interact with it using web3.py or other
#Ethereum libraries.


# In this section we will go over the process of siging the transaction.

# Now that we've created our transaction object which is going to include the code for our Vyper contract,
#we need to sign the transaction before we can send it to the EVM.

# We're going to send it to the zero address, which is the address that is used to deploy contracts
#to the EVM. The zero address is a special address that is used to indicate that the transaction is a 
#contract deployment transaction, and it is not an address that is used to send transactions to existing
#contracts.

# Signing the transaction is a process that involves using our private key to create a digital signature
#that proves that we are the owner of the account that is sending the transaction. This is done to ensure
#that the transaction is valid and can be processed by the EVM.

# We will be using the web3 tooling to sign the transaction, and we will be using the "sign_transaction"
#method of the web3.py library to sign the transaction.

# The "sign_transaction" method takes the transaction object as an argument, and it returns a signed
#transaction object that can be sent to the EVM.

# This is how we will implement that into our code:

# signed_transaction = w3.eth.account.sign_transaction(transaction)

# Here our "transaction" variable is the transaction object that we created earlier, and the 
#"signed_transaction" variable is the signed transaction object that we will use to send the transaction
#to the EVM.

# Just for an example we will hard code our private key into the code, but in a real-world application,
#we would want to use a secure method to store and retrieve our private key, such as using a hardware
#wallet or a secure key management service. Or we can use a .env file to store our private key.

# Note: We will be using a private key that is provided by Anvil, which is a local Ethereum development
#environment that allows to test and deploy smart contracts without needing to connect to a live Etereum
#network. Anvil provides a set of pre-funded accounts that we can use to test our contracts,, and we can
#use the private key of one of these accounts to sign our tranaction.

# This is the "PRIVATE_KEY" variable that we will use too sign the transaction:

# PRIVATE_KEY = "0xYOUR_PRIVATE_KEY_HERE"

# Note: We will need to replace "0xYOUR_PRIVATE_KEY_HERE" with the actual private key that we want to use
#to sign the transsaction.

# Now that we have the private key, we can use it to sign the transaction.

# Note: We must pass in private_key as an argument to the "sign_transaction" method.

# This is how we will implement that into our code:

# signed_transaction = w3.eth.account.sign_transaction(transaction, private_key=PRIVATE_KEY)
# This will sign the transaction using the private key that we provided, and it will return a signed
#transaction object that can be sent to the EVM.

# Now that we have the signed transaction, we can send it to the EVM.

# We will also be printing the signed transaction to see the compilation details.

# At this point we can compile the code and see if it runs without any errors.

# If the code compiles successfully, we can proceed to send the signed transaction to the EVM.

# We can now see the output ofthe signed transaction by printing it to the console.

# We will see that the signed transaction object contains all the information that we need to send the
#transaction to the EVM.

# Among the information that we will see in the signed transaction object is the "rawTransaction" field,
#which is the signed transaction in hexadecimal format that can be sent to the EVM.

# In addition to the "rawTransaction" field, we will also see the fields with three letters.

# The fields are "r" field, "s" field, and "v" field, which are the componemmts of the digital signature
#that we created using our private key. These fields are used to verify the signature and ensure that the
#transaction is valid and can be processed by the EVM, or Blockchain.

# The "r" field is the first part of the signature, the "s" field is the scond part of the signature,
#and the "v" field is the recovery id that is used to recover the public key from the signature.

# Now that we have the signed transaction, we can send it to the EVM, because yp until this point we 
#haven't actually sent it yet.

# The transaction is signed but it is still sitting in our code, and we need to send it to the EVM
#before it can be processed and the contract can be deployed.


# In this next section, we will go over the "Private Key" and "Mini Promise". 

# The private key is a secret key that is used to sign transactions and prove ownership of an account.

# The mini promise is a way to create a promise that can be used to send a transaction to the EVM.

# The first thing we will talk about is the private key, and why we should not hard code it. Ever.

# The private key is a secret key that is used to sign transactions and prove ownership of an account.

# Hard coding the private key in our code is not a good idea, because it can be easily accessed by anyone
#who has access to the code. This can lead to the private key being compromised, and the account being
#hacked.

# Instead of hard coding the private key in our code, we should use a secure method to store and retrieve
#the private key, such as using a hardware wallet or a secure key management service. Or we can use a 
#.env file to store our private key.

# And we definitely do not want to use a plain text file to store our private key, as this can lead 
#to the private key being compromised, and the account being hacked.

# A plain text file is not a secure way to store sensitive information, and it can be easily accessed
#by anyone who has access to the file.

# Basically, plain text means that the file is not encrypted.

# As of 2024, the number one attack vector in all of web 3 was for hackers to steal private keys.

# Stolen private keys accounted for 90% of all hacks in web 3, which resulted in billions of dollars
#being stolen from users.

# This is why it is important to use a secure method to store and retrieve the private key, and
#not to hard code it in our code.

# Now that we have talked about the private key, we can talk about the mini promise.

# The first thing we will do before we dive in is create a new file called "promise.md"

# This is what we will put in the "promise.md" file:

# "I promise to never hard code my private key in my code, and to always use a secure method to store
# and retrieve my private key, such as using a hardware wallet or a secure key management service."

# "I will always encrypt my private key, and I will never store it in a plain text file."

# "I will never share my private key with anyone, and I will always keep it safe and secure."

# This exercise is to help us remember the importance of keeping our private key safe and secure, and to
#never hard code it in our code.

# Now that we have created the promise.md file, we can move on to the next section.


# In this section we will go over the concept of "Loading Environment Variables".

# Loading environment variables is a way to store sensitive information, such as private keys, in a 
#secure way, without hard coding them in our code.

# Environment variables are variables that are set in the operating system, and they can be accessed by 
#our code using the "os" module in Python.

# Note: Although we have ".env file" listed here as a method to secure our private key, that is an option we 
#don't want to choose, and we'll go over the proper way to secure our sensitive information.

# With that being said, we can go over the process of sending a signed transaction.

# After that we will go over the process of properly securing our private key.

# To send our transaction, we would simply use this line if code in our contract:

# w3.eth.send_raw_transaction(signed_transaction.raw_transaction) 

# This line of code will go under our "signed_transaction" line of code.

# This will send our signed transaction to the "http" address that we have in our w3 Provider line of
#code.

# We will store this send transaction method inside of text hash variable that will end looking like
#this when we are done.

# tx_hash = w3.eth.send_raw_transaction(signed_transaction.raw_transaction) 

# This will help us get a response for our transaction.

# We will use a print statement to see our response. This is how we will implement that into our code:

# print(f"My TX hash is {tx_hash}")

# Note: Notice that we are using an "f" string to plug in our "tx_hash" variable into the print statement
#to get access to the response we want.

# So far we have only sent the transaction, and we have to wait for the transaction to actually complete
#to be included in the block.

# So we would say:

# tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)

# This line of code is letting us know that we are waiting for the response, or receipt (confirmataion)
#of the transaction we just sent, and we want to store that response, or receipt (confirmation) in the 
#tx_receipt variable.

# And once it is deployed we want to see the receipt, or response (confirmation) by putting it inside 
#a print statement.

# This is how we will implement that into our code with an "f" string.

# print(f"Done! Contract Deployed to {tx_receipt.contractAddress}")

# Timestamp: 11:13:00 
# In this section we will go over the Concept of Signing Transactions, and Private Keys.

# Private Key - A private key is a secret number that allows you to access your cryptocurrency. It is 
#like a password that you should never share with anyone. It is used to "sign" transactions. If someone gets
#ahold of your private key, they can access your funds.

# Public Key - A public key is derived from your private key and is used to receive funds. It is like your
#bank account number that you can share with others to receive money. Used to verify the signature of a 
#transaction.

# Instead of a hash, the Public Key is generated from the Private Key by using an Elliptic Curve Digital 
#Signature Algorithm (ECDSA).

# The Private Key is only known to the owner, while the Public Key is shared with others. The Private Key
#is used to sign transactions, while the Public Key is used to verify the signature of the transaction.

# If the Public Key is incorrect or has been tampered with, the signature will not match, and the transaction
#will be rejected.

# This is why it is important to keep your Private Key safe and secure, and to only share your Public Key 
#with trusted parties.

# Note: Signing a Transaction and Sending a Transaction are two different things. Signing a transaction is
#the process of creating a digital signature using your Private Key, while sending a transaction is the
#process of sending a signed transaction to the network.

# Also Note: Every account will have a different Private Key, and a different Public Key. If someone has
#your Private Key, they can access the account associated with that Private Key.

# This is completely different from a "Seed Phrase" or "Recovery Phrase". A Seed Phrase is a list of words
#that can be used to generate a Private Key, and is used to recover your account if you lose your Private Key.
# A Seed Phrase is usually 12 or 24 words long, and is generated when you create a new wallet. It is important
#to keep your Seed Phrase safe and secure, as it can be used to access your funds.

# While a Private Key gives you access to the account associated with it, the Seed Phrase gives you access to 
#all the accounts created in that wallet. This is why it is important to keep your Seed Phrase safe and secure,
#as it can be used to access all your funds in the entire wallet.

# The Seed Phrase is used to generate the Private Key (for however many accounts you have in your wallet), 
#and the Private Keys are used to sign transactions.

# Public Keys don't have acces to the funds in the account, they are used to verify the signature of a
#transaction. The Private Key is used to sign the transaction, and the Public Key is used to verify the
#signature of the transaction.
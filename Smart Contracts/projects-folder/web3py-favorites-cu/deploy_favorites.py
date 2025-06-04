# This is where we are actually going to deploy our Smart Contract to a blockchain.

from vyper import compile_code
from web3 import Web3

MY_ADDRESS = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
PRIVATE_KEY = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"


def main():
    print("Long Live Gates")
    with open("favorites.vy", "r") as favorites_file:
        favorites_code = favorites_file.read()
        compilation_details = compile_code(favorites_code, output_formats=["bytecode", "abi"])
        print(compilation_details)

    w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))
    favorites_contract = w3.eth.contract(bytecode=compilation_details["bytecode"], 
                                         abi=compilation_details["abi"])
#        breakpoint()
#        print(favorites_contract)
        
    


    print("Building the transaction...")
    nonce = w3.eth.get_transaction_count(MY_ADDRESS)
    transaction = favorites_contract.constructor().build_transaction(
        {
            "nonce": nonce,
            "from": MY_ADDRESS,
            "gasPrice": w3.eth.gas_price
        }
    )
    signed_transaction = w3.eth.account.sign_transaction(transaction, private_key=PRIVATE_KEY)
    print(signed_transaction) # This will be deleted after we see the example

    tx_hash = w3.eth.send_raw_transaction(signed_transaction.raw_transaction)
    print(f"My TX hash is {tx_hash}")
    tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)

    print(f"Done! Contract Deployed to {tx_receipt.contractAddress}")

#    transaction["nonce"] = nonce
#    transaction["to"] = "MetamaskAddress" # This will be deleted after we see the example
    
#   transaction = {
#    from:
#    to:
#    gas:
#}

if __name__ == "__main__":
    main()


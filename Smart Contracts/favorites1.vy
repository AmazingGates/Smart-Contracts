# pragma version 0.4.0
# @license MIT

# favorite things list:
# favorite numbers
# favorite people with their favorite number

has_favorite_number: bool # This is an example of setting a variable to a boolean. This can be True
#or false.

my_favorite_number: uint256 # This is an example of setting a variable to a number.The Uint256 is saying
#that my number is a 256 bit unsigned integer. Unsigned means that it can only be a positive number. 

my_favorite_number: int256 # If we use int256, it can be a negative number, or a positive number.

my_address: address # This is an example of setting a variable to an address. An address is a 20 byte
#number that is used to identify an account on the Ethereum network. This is same addess that we use from
#our metamask wallet.

my_decimal: decimal # A decimal is a type to store a decimal fixed point value. As of version 0.4.0, decimals
#must be enabled with the CLI flag --enable-decimals. 

my_bytes: bytes32 # A bytes32 is a type to store a 32 byte value. This is used to store a hash or a fixed
#length byte array.

my_string: String # A string is a type to store a string value. This is used to store a string of
#characters. A string is a variable-length byte array.
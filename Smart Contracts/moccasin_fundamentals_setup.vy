# In this section we will be going over the Setup of Moccasin Fundamentals and everything taht we need to do
#to get started with Mocassin and Python.

# Note: This is a Pyhton Crash Course, so we will be going over some Python Basics, and we will be using
#Google Colab to write and test our Python Code.

# What's really nice about Google Colab is that if we don't understand something, we can just use the 
#built-in AI features to help us unserstand the code better.

# This will most likely be Google Gemini, which is a really powerful AI that can help us understand Python
#and Vyper Code better.

# The first concept that we will be going over is Variables in Python.

# Variables are used to store Data in Python,and they are used to store Data in Vyper as well.

# We can assign Variables in Pyhon like this:
my_variable = 5 # This is a variable that stores the value 5

# We assign almost anything to a variable, and Pyhton comes with many types.
my_number = 10 # This is a variable that stores the value 10
my_float = 3.14 # This is a variable that stores a floating point number
my_boolean = True or False # This is a boolean variable that can be True or False
my_string = "Hello, World!" # This is a string variable that stores a string

# Next wee will go over Type Hints in Python

# In Python we can go over something called Type Hints, which are used to indicate the Type of a variable.

# Type Hints are not required in Python, but they are used to indicate the type of a variable to make the
#code more readable and understanable.

# We can use Type Hints in Python like this:
my_variable: int = 5 # This is a variable that stores the value 5 and is of type int

# Notice that we use a colon (:) to indicate the type of the variable, and we can use any type that we want.

# For this example, we used the int type, but we can use any type that we want, ie. str, float, bool, etc.

# We can also use Type Hints in Vyper, and we will be using them in our Vyper Smart Contracts.

# We can use Type Hints in Vyper like this:
my_variable: uint256 = 5 # This is a variable that stores the vvalue 5 and is of type uint256.

# Notice that we use the same syntax as in Python, but we use the Vyper types instead of the Python types.

# For this example, we used the uint256 type, which is a Vyper type, but we can use any Vyper type that
#we want, ie. address, bytes32, int256, etc.

# This is because Vyper is a subset of Python, and it uses the same syntax for Type Hints.

# We can also use Type Hints in Vyper to indicate the type of a function parameter or return value.

# We can also update the value of a variable in Python and Vyper.

# We can update the value of a variable in Python like this:
my_variable = 10 # This updates the value of my_variable to 10, regardless of what it was before.

# This also applies to other types of variables, such as strings, floats, booleans, etc.

# We can also update the value of a variable in Vyper like this:
my_variable: uint256 = 7 # This updates the value of my_variable to 7, regardless of what it was before.

# This also applies to other types of variables, such as address, bytes32, int256, etc.

# Next we will look at Arrays / Lists in Python and Vyper.

# In Python, we can create a list like this:
my_list = [1, 2, 3, 4, 5] # This is a list that stores the values 1, 2, 3, 4, and 5.

# We can also create an empty list like this:
my_empty_list = [] # This is an empty list that doesn't store aby values.

# We can also create a list of strings like this:
my_string_list = ["Hello", "World", "Python"] # This is a list that stores a list of strings.

# We can also create a list of mixed types like this:
my_mixed_list = [1, "Hello", 3.14, True] # This is a list that stores a list of mixed types.

# We can also create a list of lists like this:
my_list_of_lists = [1, 2, 3], [4, 5, 6], [7, 8, 9] # This is a list that stores a list of lists.

# We can also create a list of dictionaries like this:
my_list_of_dicts = [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 25}, {"name": :"Charlie", "age": 35}]
# This is a list that stores a list of dictionaries.

# Note: A dictionary is a data structure that stores key-value pairs, and it is similar to a JSON object.

# Also Note: We can Type Hint lists in Python, but it is not required.
# We can use Type Hints in Python like this:
my_list: list[int] = [1, 2, 3, 4, 5] # This is a list that stores the values 1, 2, 3, 4, and 5. 

# That is just a brief overview of lists in Python, and we will be using them in our Vyper Smart Contracts
#as well.

# In Vyper, we can create a list like this:
my_list: uint256[5] = [1, 2, 3, 4, 5] # This is a list that stores the values 1, 2, 3, 4, and 5.

# We can also create an empty list like this:
my_empty_list: uint256[0] = [] # This is an empty list that doesn't store any values.

# We can also create a list of strings like this:
my_string_list: string[3] = ["Hello", "World", "Vyper"] # This is a list that stores a list of strings.

# We can also create a list of mixed types like this:
my_mixed_list: (uint256, string, decimal, bool)[4] = [1, "Hello", 3.14, True] 
# This is a list that stores a list of mixed types.

# We can also create a list of lists like this:
my_list_of_lists: uint256[3][3] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# This is a list that stores a list of lists.

# We can also create a list of dictionaries like this:
my_list_of_dicts: map(address, uint256)[3] = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Charlie", "age": 35}
]  # This is a list that stores a list of dictionaries.

# Note: A dictionary is a data structure that stores key-value pairs, and it is similar to a JSON object.

# Also Note: We can Type Hint lists in Python, but it is not required.
# We can use Type Hints in Vyper like this:
my_list: uint256[5] = [1, 2, 3, 4, 5] # This is a list that stores the values 1, 2, 3, 4, and 5.

# That is just a brief overview of lists in Vyper, and we will be using them in our Vyper Smart Contracts.

# With Python and Vyper, we can index into lists and arrays to get the values stores in them.

# We can index into a list in Python like this:
my_list[0]  # This gets the first value in the list, which is 1.
my_list[1]  # This gets the second value in the list, which is 2.
my_list[2]  # This gets the third value in the list, which is 3.

# We can also index into a list in Vyper like this:
my_list: uint256[5] = [1, 2, 3, 4, 5]
my_list[0]  # This gets the first value in the list, which is 1.    

# We can follows the same pattern as in Python.

# We can also update the value of a list in Python by indexing into it, like this:
my_list[0] = 10  # This updates the first value in the list to 10.
my_list[1] = 20  # This updates the second value in the list to 20.

# We can also update the value of a list in Vyper by indexing into it, like this:
my_list: uint256[5] = [1, 2, 3, 4, 5]
my_list[0] = 10  # This updates the first value in the list to 10.
my_list[1] = 20  # This updates the second value in the list to 20.

# We can also append values to a list in Python like this:
my_list = [1, 2, 3, 4, 5]  # This is our initial list.
my_list.append(6)  # This appends the value 6 to the end of the list.

# Our list will now be [1, 2, 3, 4, 5, 6]

# We can also append values to a list in Vyper like this:
my_list: uint256[6] = [1, 2, 3, 4, 5, 6]  # This appends the value 6 to the end of the list.

# One last thing we will use is a .sort() method in Python, which allows us to sort a list in ascending order.
# We can use the .sort() method in Python like this:
my_list = [5, 3, 1, 4, 2]  # This is our initial list.
my_list.sort()  # This sorts the list in ascending order. 
# Our list will now be [1, 2, 3, 4, 5]

# We can also sort a list in Vyper like this:
my_list: uint256[5] = [5, 3, 1, 4, 2]  # This is our initial list.
my_list.sort()  # This sorts the list in ascending order.
# Our list will now be [1, 2, 3, 4, 5]

# We can also use the .reverse() method in Python to reverse a list.

# We can use the .reverse() method in Python like this: 
my_list = [1, 2, 3, 4, 5]  # This is our initial list.
my_list.reverse()  # This reverses the list. 
# Our list will now be [5, 4, 3, 2, 1]


# We can also reverse a list in Vyper like this:
my_list: uint256[5] = [1, 2, 3, 4, 5]  # This is our initial list. 
my_list.reverse()  # This reverses the list.
# Our list will now be [5, 4, 3, 2, 1]

# There are many other methods that we can use to manipulate lists in Python and Vyper, but these are the
#most common ones that we will be using in our Vyper Smart Contracts.


# In this section we will be going over Inputs and Strinngs inn Python and Vyper.

# Inputs are used to get data from the user in Python and Vyper, and they are used to get data from the user
#in our Vyper Smart Contracts.

# We can get input from the user in Python like this:
user_input = input("Enter your name: ") # This gets input from the user and stores it in the user_input
#variable.

# To use the input in our code, we can just print it out like this:
print(f"Hello, {user_input}!")  # This prints out a greeting with the user's name.
# This will print out "Hello, <user_input>!" where <user_input> is the name that the user entered.

# Note: We don't have to a variable to store the input, we can just use the input directly in our code. But
#it is a good practice to store the input in a variable so that we can use it later in our Smart Contract.

# Also Note: Vyper does not have a built-in input function like Python, so we will use a function to get input from
#the user.
@external
def get_user_input(name: string) -> string:
    """
    This function gets input from the user and returns it.
    """
    return f"Hello, {name}!"  # This returns a greeting with the user's name.

# Notice that we used an "f-string" to format the string with the user's name.
# This is a new feature in Python 3.6 and later, and it allows us to easily format strings with variables, so 
#this means that we can use variables inside the string by using curly braces {}.

# So for example, if the user enters "Tiffany", the function will return "Hello, Tiffany!"


# In this next section, we will be going over Type Casting in Python and Vyper.

# Type Casting is used to convert a variable from one type to another type in Pyhton and Vyper.

# We can use Type Casting in Python like this:
my_variable = 5  # This is an integer variable.
my_variable_as_string = str(my_variable)  # This converts the integer variable to a string variable.
# Now my_variable_as_string is a string variable that stores the value "5".

# We can also convert a string variable to an integer variable like this:
my_string_variable = "10"  # This is a string variable.
my_string_variable_as_int = int(my_string_variable)  # This converts the string variable to an integer 
#variable.
# Now my_string_variable_as_int is an integer variable that stores the value 10.

# We can also do this for other types, such as float, bool, etc.

# We can use Type Casting in Vyper like this:
my_variable: uint256 = 5  # This is an integer variable.
my_variable_as_string: string = convert(my_variable, string)  # This converts the integer variable to a 
#string variable.
# Now my_variable_as_string is a string variable that stores the value "5".

# We can also convert a string variable to an integer variable like this:
my_string_variable: string = "10"  # This is a string variable.
my_string_variable_as_int: uint256 = convert(my_string_variable, uint256)  # This converts the string
#variable to an integer variable.

# Next we will be going over some Math in Pyhton and Vyper.

# Math is used to perform calculations in Python and Vyper, and it is used to perform calculations in our
#Vyper Smart Contracts.

# We can perform basic math operations in Python like this:
my_number = 5  # This is an integer variable.
my_float = 3.14  # This is a float variable.
my_sum = my_number + my_float  # This adds the two variables together.
# Now my_sum is a float variable that stores the value 8.14.

# We can also perform other math operations in Python like this:
my_difference = my_number - my_float  # This subtracts the two variables.
# Now my_difference is a float variable that stores the value 1.86.

my_product = my_number * my_float  # This multiplies the two variables.
# Now my_product is a float variable that stores the value 15.7.

my_quotient = my_number / my_float  # This divides the two variables.
# Now my_quotient is a float variable that stores the value 1.591549295774647.


# We can use the same math operations in Vyper like this:
my_number: uint256 = 5  # This is an integer variable.
my_float: decimal = 3.14  # This is a float variable.
my_sum: decimal = my_number + my_float  # This adds the two variables together.
# Now my_sum is a decimal variable that stores the value 8.14.

# The same applies for the other math operations, we can use the same syntax as in Python.

# We can do math operations on intergers directly in Python like this:
my_number = 5 + 5  # This adds the two integers together.
# Now my_number is an integer variable that stores the value 10.

# We can do the same with the other math operations in Python

# We can also do math operations on integers directly in Vyper like this:
my_number: uint256 = 5 + 5  # This adds the two integers together.
# Now my_number is an integer variable that stores the value 10.

# We can do the same with the other math operations in Vyper


# For this section we will be going over some more advanced Math in Pyhton and Vyper.

# There are even more advanced math operations that we can perform inPython and Vyper, for example, we can
#do something called "Integer Division" in Python and Vyper.

# Integer Division is used to divide two integers and get the result as an integer, which means that it will
#not return a float or decimal value, but instead it will return the integer part of the division.

# We can perform Integer Division in Python like this:
my_number = 5  # This is an integer variable.
my_other_number = 2  # This is another integer variable.
my_integer_division = my_number // my_other_number  # This performs Integer Division.

# Now my_integer_division is an integer variable that stores the value 2, which is the integer part of the
#division of 5 by 2.

# Notice that we used the double slash (//) to perform Integer Division in Python.

# Integer Division will always round down to the nearest integer, so if we had used 5.5 instead of 5, it 
#would still return 2, because it rounds down to the nearest integer.


# The next thing we will be looking at is Functions / Methods in Python and Vyper.

# Functions are used to group code together and make it reusable in Python and Vyper, and they are used to
#group code together and make it reusable in our Vyper Smart Contracts.

# We can define a function in Python like this:
def my_function(param1: int, param2: str) -> str:
    """
    This is a simple function that takes two parameters and returns a string.
    """
    return f"Hello, {param2}! You passed the number {param1}."  # This returns a greeting with the parameters.


# Notice that we used Type Hints to indicate the types of the parameters and the return value of the function.

# This is a good practice to make the code more readable and understandable.

# We can call the function like this:
result = my_function(5, "Alice")  # This calls the function with the parameters 5 and "Alice".

# We could also use a print statement to print the result of the function:
print(result)  # This prints the result of the function, which is "Hello, Alice! You passed the number 5."

# Note: A function must always be defined with the def keyword, followed by the name of the function. Also,
#the parameters must be defined inside the parantheses () after the name of the function, and the return
#value must be defined after the arrow (->) if the function returns a value. Lastlt, the function body must
#be indented with four spaces or tabs to indicate that it is part of the function. 


# Let's look at a function that doen't take any parameters and doesn't return any value:
def print_hi_two_times():
    """
    This function prints "Hi!" two times.
    """
    print("Hi!")  # This prints "Hi!" to the console.
    print("Hi!")  # This prints "Hi!" to the console again.

# We can call the function like this:
print_hi_two_times()  # This calls the function and prints "Hi!" two times to the console.

# Notice that we didn't define any parameters or return value for the function, so it doesn't take any
#parameters and doesn't return any value.

# Functions are incredibly useful for when we have very complex code or chunks of code that we want to reuse
#in our Smart Contracts.

# All we have to do is define the function once, and then we can call it as many times as we want without
#having to rewrite the function every time we want to use it.

# We can also use functions for math opertaions. For example, we can say:
def add_six(my_number):
    print(my_number + 6)  # This adds 6 to the number passed as a parameter and prints the result.

# We can call the function like this:
add_six(4)  # This calls the function with the parameter 4, and it will print 10 to the console.

# We can also use our functions for math operations like this:
def add_together(my_first_number, my_second_number):
    print(my_first_number + my_second_number) # This adds the two numbers passed as parameters and prints the
#result.

add_together(4, 5)  # This calls the function with the parameters 4 and 5, and it will print 9 to the console.


# In this section we will be going over Conditionals in Python and Vyper.

# Conditionals are "if statements" that are used to execute code based on a condition in Pythonn or Vyper,
#and they are used to execute code based on a condition in our Vyper Smart Contracts.

# We can define a conditional in Python like this:
def check_number(my_number: int) -> str:
    """
    This function checks if the number is even or odd and returns a string.
    """
    if my_number % 2 == 0:  # This checks if the number is even.
        return f"{my_number} is even."  # This returns a string indicating that the number is even.
    else:
        return f"{my_number} is odd."  # This returns a string indicating that the number is odd.

# We can call the function like this:
result = check_number(5) # This calls the function with the parameter 5.

# We could also use a print statement to print the result of the function:
print(result) # This prints the result of the function, which is "5 is odd".

# Notice that we used the if statement to check if the number is even or odd, and we used the modulo operator
#(%) to check if the number is even or odd.

# The modulo operator returns the remainder of the division, so if the number is even, the remainder will be 
#0, and if the number is odd, the remainder will be 1.

# We can also use the elif statement to check for multiple conditions, like this:
def check_number_with_elif(my_number: int) -> str:
    """
    This function checks if the number is even, odd, or zero and returns a string.
    """
    if my_number == 0:  # This checks if the number is zero.
        return "The number is zero."  # This returns a string indicating that the number is zero.
    elif my_number % 2 == 0:  # This checks if the number is even.
        return f"{my_number} is even."  # This returns a string indicating that the number is even.
    else:
        return f"{my_number} is odd."  # This returns a string indicating that the number is odd.


# We can call the function like this:
result = check_number_with_elif(0) # This calls the function with the parameter 0.


# The next concept we will be going over is Loops in Python and Vyper.

# Loops are used to execute code multiple times in Python and Vyper, and they are used to execute code
#multiple times in our Vyper Smart Contracts.

# Loops work on a "for" and "while" basis, which means that they will execute code for a certain number of
#times or while a certain condition is true.

# We can define a loop in Python like this:
my_number = 0

while my_number < 10: # This is a while loop that will execute as long as my_number is less than 10.
    print(my_number) # This prints the value of my_number to the console.
    my_number += 1 # This increments my_number by 1 after each iteration of the loop, unitl it reaches 10.

# Notice that we used the while keyword to define the loop for the condition in this example.

# Also notice that we had to start with a value for my_number, and we had to increment it by 1 after each
#iteration of the loop, otherwise the loop would run indefinitely and never stop.

# This is because the condition my_number < 10 will always be true if we don't increment my_number.

# Now let's look at a for loop in Python, which is used to iterate over a sequence of values, like this:
my_list = [1, 2, 3, 4, 5]  # This is a list of numbers.
for i in range(len(my_list)):  # This is a for-range loop that will iterate over the indices of the list.
    print(my_list[i])  # This prints the value of the number at index i in the list.

# Notice that we used the range function to get the indices of the list, and we used the len function to get
#the length of the list.
# We can also use the for-range loop to iterate over a range of numbers, like this:
my_number = 0
for i in range(10):  # This is a for-range loop that will iterate over the numbers from 0 to 9.
    print(my_number + i)  # This prints the value of my_number + i to the console.


# Notice that we used the range function to get the numbers from 0 to 9, and we used the i variable to
#iterate over the numbers.


# In this section we will be going over "for-each" loops in Python and Vyper

# For-each loops are used to iterate over a sequence of values in Python and Vyper, and they are used to
#iterate over a sequence of values in our Vyper Smart Contracts.

# We can define a for-each Loop in Python like this:
my_list = [1, 2, 3, 4, 5] # This is a list of numbers.

for number in my_list: # This is a for-each Loop that will iterate over each number in the list.
    print(number) # This prints the value of number to the console.

# The for-each Loop will iterate over each number in the list, and it will print the value of number to
#the console.

# Notice that we used the in keyword to define the for-each Loop, and we used the number variable to 
#iterate over the numbers in the list.

# The difference between a for-each Loop and a for-range Loop is that a for-each Loop will iterate over
#the values in the sequence, while a for-range Loop will iterate over the indices of the sequence.

# The for-each Loop is the same as a regular for Loop, but it is more concise and easier to read.


# Now that we have an understanding of Loops, we will go over a practice exercise to test our knowledge.


#           Workshop

# In this workshop, we will be creating a simple Python program that will ask the user for their name and
#age, and then it will print out a greeting with their name and age.

# See the practice file for the workshop.


# This example below is the solution to the workshop exercise without inputs.

def workshop(int, int1, int2) -> str:
    return f"{int} days after January 1st {int1} is my Birthday, and I am {int2} years old."

result = workshop(16, 2025, 33) # This calls the function with the given parameters.

print(result) # This prints the result of calling the function with the given parameters. 



# This example below is the solution to the workshop exercise with inputs.

def workshop1():
    days = int(input("How many days: ")) # This get the number of days from the user.
    year = int(input("What Year: ")) # This gets the year from the user.
    age = int(input("How old will I be?: ")) # This gets the age from the user.
    print(f"{days} days after January 1st {year} is my Birthday, and I will be {age} years old.")

workshop1() # This calls the function.
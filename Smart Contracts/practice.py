# This function doesn't take any parameters and it doesn't return anything. It just prints out a greeting
#to the user.

def greet_user():
    """
    This function asks the user for their name and age, and then it prints out a greeting with their name 
    and age.
    """
    name = input("What is your name? ")  # This gets the user's name.
    age = int(input("What is your age? "))  # This gets the user's age and converts it to an integer.
    
    print(f"Hello, {name}! You are {age} years old.")  # This prints out a greeting with the user's name and
    #age.

# We can call the function like this:
greet_user() # This calls the function and asks the user for their name and age.



# The following code defines a function that takes two parameters, name and age, and returns a greeting 
#string.

# This is another way to define a function.

# Notice that this function uses the f-string format to create the greeting string.

# Also notice that we do not need to use the input function here, because we are passing the values 
#directly to the function. Also, we are not calling the function here, we are just defining it, then we
#print the result of calling the function with the given parameters.


def workshop(int, int1, int2) -> str:
    return f"{int} days after January 1st {int1} is my Birthday, and I am {int2} years old."

result = workshop(16, 2025, 33) # This calls the function with the given parameters.

print(result) # This prints the result of calling the function with the given parameters.


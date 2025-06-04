# In this section we will go over the concept of Reference Types.

# So far we have been using our function to store our own favorite number.

# In the next step we will explore how we can use our function to store input from other people.

# As we create more people, we could create more inputs for them manually, but we want our contract to be
#clever and dynamic enough to take different amounts of data as we go, without having to set everything in 
#hardcode.

# This is where arrays and structs, and different reference types come into play.

# Note: Data types are types that are passed by their reference.

# This is different than a value type where we assign a type, or use it as function input, or as outputs,
#where the value will be copied.

# For refernce types, the data will not be copied, but instead have a pointer that points to where the data
#actually is stored. 

# Data types that are available in Vyper are:

# - Fixed Size List
# - Dynamic Arrays
# - Mappings
# - Structs

# For now we will just be going over the Fixed size list, Mappings, and Structs.

# We'll start with Fixed size list.

# We'll create a list for unsigned integer 256 with a size of 10. And we'll call it "nums". We'll also make 
#it a public state variable. 

# To declare that it will be of a fixed size list of type uint256, we'll use the type declaration. And then
#to declare that this is a list we'll need to use a bracket "[]", and to declare that this is indeed a
#fixed size list, we will put in the size of the list in the bracket. For example, we'll have a list size
#of 10. This is what we should have so far.

nums: public(uint256[10])

# How do we read and write into a fixed size list in Vyper?

# We will do this by using a Constructor function.

@deploy
def __init__():
    self.nums[0]

# Note: We used a zero in the self.nums[0] because we are indicating that we want to store the value at this
#location. 

# Also Note: 0 is the first location. if we wanted to get the of second position, we would index into
#the position [1].

# If we wanted to store a value at position [0], we can do this to assign a value.

@deploy
def __init__():
    self.nums[0] = 123

# We will also create another index so we can store another value at position [1], which is the second
#position. We will do that by doing this.

@deploy
def __init__():
    self.nums[0] = 123
    self.nums[1] = 456

# That is our fixed size list. Next we will go over Mappings.

# Mapping is data type that is built off of two other value types.

# The first value will represent the key of a mapping. And the other value type will represent the value
#of the mapping.

# we'll create an example of a mapping called "myMap:", which will be a public state variable.

# To create this mapping, we'll call "HashMap", followed by brackets "[]".

# Inside the brackets we'll need to declare the two value types of our Mapping.

# we'll say that we want Map an address type to an unsigned integer 256.

# So the first type will be an address, and the next type will be uint256.

# This is what our Mapping should like so far:

myMap: public(HashMap[address, uint256])

# Now let's access our Mapping.

# For this we will also use a Constructor. We can use the same Constructor from our Fixed size list.

# We'll use the self.myMap to start.

# Then we will add our key type, which is an address. So we'll say msg.sender, and this is how we get the
#value for a Mapping stored at that address.

# To store a value for our myMap at that address, let's say equals to 1.

# For another example, let's say we update the value store at myMap. We'll use the same steps as previously,
#but this time, it will equal 11

@deploy
def __init__():
    self.nums[0] = 123
    self.nums[1] = 456

    self.myMap[msg.sender] = 1
    self.myMap[msg.sender] = 11

# That was an example of Mapping. 

# Now let's go over Structs

# We'll begin by declaring a Struct.

# To declare a Struct, we'll say "struct" and call it "Person:" 

# The Person struct will hold two pieces of data.

# The first data we will call "name", and this will be a String with a length of 10.

# The second data will be an "age" for the Person. Let's say uint256.

# Next, we'll create a state variable of type struct.

# Let's name this "person", and make it a public variable.

# The data type that we are going to store is "Person", the Struct.

# This is what we have so far.

struct Person:
    name: String[10]
    age: uint256

person: public(Person)

# Next we will put some data into our person struct.

# We will use the Constructor we used for the previous examples.

# Note: We can also load this state variable person into memory.

# This is how we can do that. First we'll have a "p:", and then we'll declare a data type.

# The data type will be the struct of "Person" we created. 

# All we have to do to laod it into memory from state variable is set it equal to self.person

# This will copy the state variable, meaning it will copy the data of name and age from state variable
#person into memory into a variable called "p:"

# If we wanted to now modify this, we could say "p.name" and "p.age", and eneter in the new data for both
#states. 

# The difference is that the data in self.person is stored in a state variable, while the updated data in 
#"p:" is loaded into the memory. So when we deploy our contract, the updated data will not be reflected, 
#since it is stored in the memory and not in our state variable.

# The state variable still has the original data and that data wil be accessed once we deploy the contract.

@deploy
def __init__():
    self.nums[0] = 123
    self.nums[1] = 456

    self.myMap[msg.sender] = 1
    self.myMap[msg.sender] = 11

    self.person.name = "Papi"
    self.person.age = 40

    p: Person = self.person
    p.name = "Python"
    p.age = 33

# We can now compile our contract to see what our results are.

# In this next section, we will be going over Arrays / Lists

# Now that we've learned about some of these reference types, let's start adding them into our favorites.vy
#contract.

# While start by adding a minimal list of numbers to contract.

# This is how we will do that.

# We'll start by creating a new variable called list of numbers, which will be of type uint256, with an
#array of 5. We will also make it public.

# See favorites.vy file for example.

# By adding the number [5] means that this list of numbers will be 5 elements long.

# By default it would look like this [0, 0, 0, 0, 0]. This array is 5 elements long.

# At this point we can compile and see what results we get.

# Note: If we deploy our contract and try to index into a position that is outside of the allowed five long
#array [0, 0, 0, 0, 0], we will get a "Tranasaction has been reverted back to the initial state" message.

# An example of this would be us trying index into the 6th position, which would look like this [5] (not to be
#confused with length of our array.). This would happen because there is no 6th element in the array, so
#there wouldn't be a 6th position to index into.

# Now that we have our array, we will want a way to update it inside our contract.

# We'll do this by creating a new function.

# We'll be updating the state of the blockchain so we're not going to want to use the @view decorator, since
#we'll have to actually send a transaction to update the state of the blockchain.

# We'll start with @external, followed by def add_number, then we'll pass in favorite_number:, which will
#be of type uint256, as a parameter.

# Then we'll copy list_of_numbers[0] into our function and set it equal to favorite_number as instruction.

# This means that anytime we call add_number, the element at index 0, or the first position, is going to
#be set to that number as our updated favorite_number. 

# Note: No matter how many times we deploy the contract as is, we will only be affecting the first position,
#or 0 index, since we have it hard coded inside our function.

# See favorites.vy file for example

# Now that we have that, we would want to make it so that we can add a value to every index in the array.

# This means that we would want to set it up so that everytime we call add_number it'll add a value to
#the next available position, or index, in the array.

# To do this we would probably want some way to keep track of the last number we set in the array.

# So at the top of function, under list_of_numbers, we could say, "index: uint256", and make it public.

# With this, what we'll do is, every time we update our list_of_numbers, instead of hardcoding it into 
#the zero index [0], Well say "self.index". Index gets defaulted to zero.

# We can even get a little more explicit by saying, "self.index = 0" in our constructor init.

# After we update this index, after we update our list, we could "self.index = self.index + 1"

# Now we can compile this to see the results.

# Note: Keep in mind that our list_of_numbers is still a fixed size of five elements, which means that if we 
#try to index into any position beyond that it will cause an error.

# In this section we will be going over "Structs(New Types) and Strings".

# Now that we have our contract, that is dynamic, we will want a way to assign these numbers to different
#people.

# This will be a favorites list of multiple people, not just ourselves.

# So we want to come up with a way to store those peoples names.

# We actually already partially explained how to do that when we went over Structs previously, which is
#what we will be using to keep track of other people.

# We're going to have an array of structs, which is going to be pretty advanced because arrays are kind
#of a complex data structure, and so are structs. 

# To do this we are going to create a new type, and call it "struct Person:"

# Note: If we haven't noticed by now this is the typical way we write our structs, with their capitalizations
#and the colon.

# And we're going to say that this Person is going to have two things. It's going to contain their 
#favorite number, which will be a uint256, which will also be public, and it is going to contain their name,
#which is going to be a String with a 100 character limit.

# The simple breakdown of a String is an Array of characters, or an Array of bytes.

# Basically, when we see a String with the [100], this means that we have a variable with 100 or less
#characters, which would look something like this ( example_str: String[100] = "Test String" )

# Now that we have our Person struct, we can add the my_name variable, which will store the names of the
#people added to the contract.

# Next we will add self.my_name = "Name"

# See favorites.vy file for full example.

# At this point if we compiled our contract we would see that we have a file called "my_name", which will
#contain the string of the name we entered in our contract.

# Now we want to add different people that will be able to have their own name, and then we'll save that
#in a list of people. 

# To do this we're going to create a complex "Person" type.

# We'll start by adding a list_of_people store to our contract, which will have a public variable of 
#"Person", which will have be a Fixed size list of five [5].

# So this is going to be a list of persons.

# Basically our list of favorite numbers plus names will behave something like this ( 7, Papi), (3, Mama), 
#(10, Mami), (9, Mini), (1, Casa).

# Note: Keep in mind that both our favorite numbers, and our persons have a fixed size of five [5].

# Each of these favorite number / persons pair will hold an index position, until all five positions are
#filled.

# Now that we have our list of people, we are going to update our add_number funtionality, to add a new
#person to our list of people.

# To do this we will locate the add_number function and modify it.

# We will be changing it to add_person, since this is the name of our struct. This function will keep the
#favorite_number store, but additionally, we will be adding the name store, which will be a string with a fixed
#size of 100. This way we can access both the stores that in struct Person:

# Now, inside this new add_person function, we are going to add the favorite number to our list of 
#favorite_numbers.

# And additionally, we will add a person to the list_of_people list.

# So exactly how we're doing variable name type, we can use this our Person (from our struct) as a new type.

# We can do this by saying new_person:, which is going to the variable name, which will be of type Person,
#and we will set that equal to Person (which we got from our struct). We will add parentheses to the end of
#Person, which will contain (favorite_number = favorite_number, name = name)

# Inside this new_person variable, we are saying that we are going to create a new person, and the 
#favorite_number that's getting passed to that person is going to be set to the favorite_number from our
#struct.

# We are also saying that we are setting the name to the name from our struct.

# So now for example, if we pass in Papi 3, it'll create a new variable called new person, which has a
#favorite number, which will be 3, and a name, which will be Papi.

# The next step we will take is to add the list_of_people variable to our add_person function with the
#self.index. That will look like this self.list_of_people[self.index], which we will set to equal new_person.

# We may notice that this is exactly how we did it with our list_of_numbers.

# At this point we can compile our contract and see what results we get.

# In this next section we will be going the concept of HashMap, or (Mapping).

# So now we have a way to add people to our list, and we have a way to look them up.

# So we can go ahead start making our contract more dynamic. To start, we want to find a way to get a
#persons favorite number without having to know their index position. We want to be able to get that
#information just by looking up the persons name.

# This is where the HashMap (Mapping) comes into play. 

# The Mappings are powerful because they allow us to do exactly what we're trying to do.

# To start this process, we're going to go back to our smart contract and create one more stored variable
#for us to this.

# This is the stored variable that we will create to add to our contract, (name_to_favorite_number:),
#and this is going to be of type (HashMap), with a String set to a [100] fixed size list, and an uint256. And
#we will also make this public

# That will end looking like this (name_to_favorite_number: public(HashMap[String[100], uint256]))

# What this HashMap keyword will do for us is take in a string, and output an integer.

# We can kind of think of the HashMap as a Dictionary, where the "key" will be a string, and the "value"
#will be a integer.

# Note: Dictionaries Have "Key" and "Value" pairs.

# For example, we'll be able to input a String like "Tiffany", which would work as the key, and get back
#an integer like "3", that would work as the value. This would represent our Key and Value pair.

# Note: HAshMaps and Arrays are very important concepts to coding in the Python language, and will be
#very important to understand throughout our career.

# Now that we have our newly created store variable, we can add it to our def add_person function.
#to be able to call it in our contract.

# Now, not only are we assigning a new person to our list_of_people, but we will also store that new person
#to our newly created store. This is how we will do this.

# self.name_to_favorite_number[name] = favorite_number

# This is telling our contract that we want the name we store to be set equal to an integer, which will
#be their favorite_number.

# At this point we can compile and deploy our contract to see the results.

# Now that we've added all of this funtionality to our smart contract, we can deploy this contract to an
#actual network.

# Before we do that, let's do a recap of everything we've done to smart contract so far.

# Step 1: We created a new type called a structof Person. This struct had a favorite_number: and name:

# Step 2: We created several storage/state variables, whcih were, my_name:, my_favorite_number:,
#list_of_numbers:, list_of_people:, an index: for both of those list, and name_to_favorite_number: HashMap.

# Step 3: We created our special Constructor Function, which is also known as the @deploy function in
#Vyper. This is where we set our default number to 7, we set our index to 0, which we know it actually
#gets defaulted to anyway if we don't specify a value. Lastly, we set our name to "Papi".

# Step 4: This step has both a store and a retrieve function. The store function allows us to set our favorite
#number, and the retrieve function allows us to view that number using the @view decorator.

# Step 5: This is where we created our add_person function. This is where we add a favorite_number to a 
#list of numbers. We add a person to our list_of_people. Then in the Mapping, we set the [name] of the
#favorite_number to equal that favorite number, which means that when the name of the person is called, it 
#returns their favorite_number. Lastly we created the index: as well, which will progress along the index
#as data is entered into the index positions until the index has reached its Fixed Size.
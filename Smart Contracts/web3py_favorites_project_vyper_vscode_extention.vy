# In this section we will start with Vyper VSCode Extentions.

# To save ourselves some time, we will start by copy and pasteing our original Favorites.vy file and create
#a copy of it in our web3 folder.

# Note: After we have created our in new favorites.vy file in our web3 folder, we may see an error 
#notification, but we will address that with UV.

# Next we will focus on Compiling Vyper in Python.

# This was the first thing we did in the Remix IDE when wewanted to engage with our Smart Contract, we 
#would compile it.

# We wwant to do the same thing in our VSCode, but the difference is that we don't have a "Compile" button
#inside this environment, but we still need to compile somehow.

# There are a couple of ways that we can actually get this done inside VSCode, but no matter which way
#we decide to this, we have to download thw Vyper Compiler.

# The way we will be downlaoding the Vyper Compiler is by using the UV method.

# We will type this command inside our WSL termninal:

# "uv tool install vyper"

# This is the first thing we will do to start off our project.

# If done correctly, we should have installed our depencies, and we should see this message after 
#installation:

# "Installed 4 executables: fang, venom, vyper, vyper-json"

# To get a better understanding of what we just downloaded, we can run this command inside the WSL 
#terminal:

#"vyper --help"

# This will return a massive documentation that explains everything we need to know about Vyper.

# Next we can run "vyper --version" in our WSL terminal to see what version of Vyper we are running.

# After we check everything is installed correctly, and everything else we want to confirm, we can
#begin the process of compiling.

# This is the command that we will run inside our WSL terminal inside our web3py folder to compile it.

# "vyper favorites.vy"

# This should compile our favorites file, which holds our basic contract.

# We should get back a hex code from our favorites file. 

# Our return will look like this:

#"0x3461001a5760075f5561029e61001e6100003961029e610000f35b5f80fd5f3560e01c60026007820660011b61029001601e395f5
#1565b636057361d81186100345760243610341761028c576004355f55005b632986c0e58118610288573461028c57602454604052602
#06040f35b632e64cec18118610288573461028c575f5460405260206040f35b6305a8568681186101455760443610341761028c57600
#43560040180356064811161028c5750602081350180826040375050602435602454600581101561028c576001015560243560e052602
#0604051018060406101005e506006602454600581101561028c570260060160e051815560206101005101600182015f82601f0160051
#c6005811161028c57801561011657905b8060051b6101000151818401556001018181186100fe575b505050505060243560256040516
#060206020525f5260405f20556024546001810181811061028c579050602455005b6374ec933f81186102885760243610341761028c5
#760043560040180356064811161028c575060208135018082604037505060256040516060206020525f5260405f205460e052602060e
#0f35b633a40c6f28118610288573461028c575f5460405260206040f35b632578e0f081186102885760243610341761028c576004356
#00581101561028c576001015460405260206040f35b635ec0e9c981186102885760243610341761028c5760208060405260066004356
#00581101561028c5702600601816040016040825482528060208301526001830181830160208254015f81601f0160051c60058111610
#28c57801561025257905b808501548160051b85015260010181811861023c575b5050508051806020830101601f825f0316368237505
#0601f19601f82516020010116905090508101905090509050810190506040f35b5f5ffd5b5f80fd006b01db019200500018028801ad8
#5582028502975b0b61a06a4bdce77284d733cd4d2fa405ac8d4f7d415191c3b90d78819029e810e00a1657679706572830004010036"

# This is what our entire returned hex code will look like when we compile the favorites.vy file.

# This is the raw code that actually gets sent to Ethereum when we compile our favorites.vy file, or 
#whatever chain we're running on.

# This is what actually gets sent to the blockchain.

# Everything inside our favorites.vy file is just human readable text, the hex code that we get returned
#when we compile is what actually gets sent to the blockchain.

# The next section we will be going over is "Isolated Virtual Environments", and "(uv tool install)"


# Isolated Virtual Environments (uv tool install)

# We will be going over what we just did by using the "uv tool install vyper" method.

# Using Python, we're probably more used to just using a "pip install" to install packages that we want
#to have access to.

# We could do that and that would work perfectly fine, however, that will only install packages into our
#active environments, whereas the UV method will install the package inside it's own isolated environmet.

# Let's explain why that is.

# When we use pip install to install packages, we are only installing the package inside our active 
#environment, which means no other versions of Python, or environments, outside of the one we just 
#installed the package into will have access to the package, because it was a specific install for
#that specific version.

# This is why it is better to use the UV tool to install packages in most cases. This is because the
#package goes into an Isolated Environment that we can point to with whatever vesion of Python we are
#using.


# In this next section we will goover the concept of "__name__".

# Now that we've learded how to compile Vyper Contracts using our command line, we will move to learning
#how to compile scripts, and then actually deploy to a blockchain.

# We're goingg to start thid process by closing everything (all the files we have open).

# Then we're going to create a new file called "deploy_favorites.py".

# Note: Here is a little Python tip. Whatever we call our Python file, for example, "deploy_favorites.py",
#we can run it using the UV tool (uv run deploy_favorites.py), and our terminal will automatically 
#configure the environment we need to run this file, regardless of what configuration is active at the 
#moment. It will remove the existing environmemt (if it's different from the one we need), and create a
#new environment specifically for the file we are running with the UV tool.

# Moving forward, we are going to start our deploiy_favorites.py file with a "__name__ == "main" " script.

# This will look like this"

#def main():
#   print("Long Live Gates")

#if __name__ == "__main__":
#   main()

# This template will serve as our main file.

# That means that whenever we run a file, where saying make "__name__" equal, or set to, main,
#and run the script that is inside that file.

# This is the logic that we will be using to start our Smart Contract inside our "deploy_favorites.py"
#file.

# Note: For our def main(): inside the contract we are just going to pass for now and nnot actually define 
#main, but we can run the script above to ensure that it is working correctly.


# Now that we have successfully tested our script and ran our "deploy_favorites.py" file, we will move
#on to the concept of "Using the Vyper Compiler As A Package"

# For this we will be going over the process of reading in Vyper code and deploying it.

# We are going to be working with the same deploy_favorites.py file for this example, but this time we
#will be adding some additional code to our script.

# This is what we will be adding:

#with open("")

# Also, inside this new line of code we will be adding the name of the file that we want to open when
#we run this script i our terminal.

# The file we will be adding is the "favorites.vy" file.

# Note: We will also be adding an "r", as a parameter inside the code,, to let the compiler know that
#we want to open the file in read only mode. 

# Also Note: We will be giving this file a name (optional), which we will be adding after the parameters,
#which will end up looking like this:

#with open("favorites.vy", "r") as favorites_file:

# This is what the line of code should look like after we have given it parameters, and a name.

# The last piece of new code we will be adding will tak place after we hit enter on our "with open"
#line of code, which should automatically tab us on into a new line.

# Once tabbed into the new line, we will write this code into our script;

#favorites_code = favorites_file.read()

# This is howwe read the contents of a whole file (favorites_file.read())to a single variable 
#(favorites_code)

# This "favorites_code" should have everything inside of it that the favorites.vy file has inside itt.

# Then we are going to compile this file in our codebase (script).

# We can actually use the Vyper compiler itself to do this.

# We will be using the Vyper as a package, which we can access by adding it into our environment using
#the uv tool.

# This is what we wil run in our terminal to add the Vyper package:

# uv add Vyper

# Note: Up until now we have been using Vyper as a command line tool, but once we add it using the 
#uv add method, we'll have access to using it as an actual package.

# Also Note: We can open our (pyproject.toml) file inside our web3py folder to see that the Vyper package
#has been added to our dependencies.

# Now that we have added the Vyper package to our dependencies, we can use it inside our script.

# The next step we will take is run the "uv sync" command in our terminal to sync our dependencies.

# This will ensure that our dependencies are up to date and that we have access to the Vyper package.

# After we run the "uv sync" command, we will be able to use the Vyper package inside our script, as well
#as our environment.

# Now we can import "compile_code"  from the Vyper package, and use it inside our sccript.

# This will look like this:

# from vyper import compile_code

# Next we will be using the "compile_code" function to compile our favorites_code.

# This will look like this:

#compile_code(favorites_code, output_formats=["byteccode"])

# With this, we'll get that hex code that we got when we compiled our favorites.vy file in the terminal.

# Next we will want to save this code to a variable, so we can use it later on in our script.

# This will look like this:

#compilation_details = compile_code(favorites_code, output_formats=["bytecode"])

# Note: Just to make sure we doing things correctly, we wil print the compilation details to our terminal
#to see if we are getting the correct output.

# This will look like this:

#print(compilation_details)

# Now we will run our script using the uv too to see if we are getting the correct output.

# This is the command we will run in our terminal:

# uv run deploy_favorites.py

# This should return the hex code that we got when we compiled our favorites.vy file in the terminal.

# Note: Once we tested our script to ensure that everything is running smoothly, we can remove the print
#statement from our script.


# In this next section we will go over the process of "Telling VSCode what our Python environment is".

# This is a very important step, because if we don't do this, we will not be able to run our script
#correctly.

# Note: We are taking this step because as of now, we are getting an error message that says this 
#(Import "vyper" could not be resolved) under the problems tab in our terminal.

# This is because we have not told VSCode what our Python Environment is.

# Also Note: Even though we got this error message, we are still able to run our script using the uv tool,
#and it still worked correctly.

# This is because the uv tool is using the Python environment that we have set up with the uv tool.

# However, VSCode does not know what environment we are using, so we need to tell it.

# We can do this by going to the bottom right corner of our VSCode window, and clicking on the Python
#environment that we are using, which will lok like this (3.12), or whatever version you are using
#that isn't compatible.

# This will open up a menu that will show us all the Python environments that we have installed on our
#machine.

# We will select the one that we are using for this project, which should be the one that we have set up
#with the uv tool, which will most likely be the "Recommended" option.

# Once we select the correct environment, we should see that the error message has gone away.

# This means that we have successfully told VSCode what our Python environment is.

# The reason we are using the venv folder is because we don't want our dependencies to clash with each
#otther, and we want to be able to use different versions of Python for different projects.

# This is why we are using the venv folder, which is a virtual environment that we can use to isolate
#our dependencies from each other.

# Note: We can always install everything we need in a global environment, butt this is not recommended
#because it can cause issues with dependencies clashing with each other, and we want to be able to use
#different versions of Python for different projects.
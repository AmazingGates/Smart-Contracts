# In this section we will finally begin writing our Python code.

# The first thing we will do is create our first project folder.

# This is going to be our Python Updraft folder.

# We will do this creating a new directory called (python-in-updraft-cu)

# Once our new folder is created, we will cd into it.

# The next tning we want to do is open our newly created folder in it's own folder.

# We can do that by typing this command (while inside the python-in-updraft-cu) in the terminal ( code .), 
#if we've installed this functionality, or we can go to the file tab and select open folder, there we will
#select the python-in-updraft-cu folder which should open up a new window where we will be automatically
#placed inside our folder (python-in-updraft-cu)


# In this section we will be going over the Python Shell / Console

# At this point we have everything setup the way we need, and we have the specifi version of Python
#we will be using, and one of the quickest ways to try stuff out in Python is to enter what is
#known as the Python Shell, or the Python Console, where we can just write anything we want.

# To get started, we can just type "python3.12" (or whatever version we will specifically be using) on 
##the command line in our python-in-updraft-cu folder terminal.

# This will drop us into a Python Shell, which is actually very similar to the Google Colab that we
#used previously.

# We should be able to write code and print code directly from our terminal now. 

# For example, if we write "print(Hi)" on the command line in our terminal, we should see the word
#"Hi" get printed out in the same terminal on the same comand line.

# Another example we can use is typing "my_var = 7", and hit enter.

# Then we will type "print(my_var)", and hit enter.

# This should print out the number 7 to our terminal command line.

# So this is where we can quickly test and work with different Python things.

# Now if we typed in "quit()" on the command line, and hit enter, this should exit us from the Shell
#and take us back to the normal Terminal.

# And to reenter the Shell, all we have to do is type "python3.12" (or whichever specified version we will
#be using) on the command line in the terminal.

# Note: Keep in mind that everytime we exit the Shell, all of the commands we ran and actions we took
#will be reset. They are not saved.


# The next thing we will be going over is Jupyter and Python VSCode Extensions.

# VSCode is really powerful, and one of things we can do, if we wanted to is create an environment
#very similar to the Google Colab Environment, as we saw.

# Additionally, once the Google Colab like environment, we can create a new file.

# We would call this file "cells.ipynb" 

# Once this file is created, and we opened it, we would see that it is in the ffashion of the cells
#that we normallyy see inside the Google Colab.

# This cell will behave and function very similar, if not identical, to the cells we use inside the
#Google Colab.

# Note: Our cells won't function right away. Once we try to run our first cell we will be prompted to
#download extensions for "Python + Jupyter".

# We don't want to take this step so we won't run anything in our cell just yet.

# First, our "ipynb" file in VSCode needs a VSCode extension for us to be able to run the code in 
#our cells.

# So what we want to do is go to our extensions (inside our WSL VSCode python-in-updraft-cu standalone) 
#and look for the extension "Jupyter".

# Once we have located the extension, we want to install it.

# Additionally, we will want install a Python extension also, so let's make sure we do that.

# The Python Extension will give us a lot of really helpful tools, including syntax highlighting,
#formatting, and a lot more.

# Once we have our installs installed, we can head back over to over cell and try to run it.

# We'll still run into a prompt, but this time we will be asked to select a "Kernel Source".

# We will be selecting a source from the "Python Environments" option.

# We can choose a kernel that we have already created, or one that is recommended as the default.

# Note: We may get one last popup asking us to install ipyKernel, which we will do. That's only
#if we get the popup.

# Now, we should working inside of our selected kernel, and our cells should be capable of running.

# To test out our new cell, we will again run this code (my_var = 7), and in the same cell, right 
#underneath, we will type print(my_var).

# Once the code is type out, we can run the cell by hitting the play button. This should run the cell
#and print out the code results, which should be the number (7) as the output.

# Note: We can also write the print(my_var) code in its own cell andwe should still get back the same 
#results, as long as it's underneath the initial (my_var = 7)


# Now that we have everything setup, we will focus on writing our first Python File.

# Using the Google Colab like environment is good for running and testing code, but for writing 
#professional code, we will stick to using .py files.

# Note: These are files that we have already been using and should be familiar with. These files are 
#created by adding .py after whatever name we give our file, for example (new_file.py). This would
#be a .py file named "new_file".

# Using the .py file is the same in the WSL version of VSCode as it is in the regular VSCode.

# We will start by writing python, followed by the name of the file we are running. For example, 
#to run this "new_file" that we just created using the .py, we would run this command in the WSL command 
#line terminal (python new_file.py)

# Running that command in the terminal will run the code that we have written in this file.

# Note: We can also execute the code by writing the version of Python we are using, and this may be required
#in certain cases. That will look like this (python3.12 new_file.py). But we will only use this method
#if we can't run the regular command of (python new_file.py)


# The next thing we will focus on is installing libraries and using imports.

# The concept of installing packages for Python in the WSL version of VSCode is the same as usual, and
#we should be familiar with the process at this point in our journey.

# We will ne installing the "titanoboa" library using the normal steps.

# Note: If the normal "pip" method doesn't work, we may have to use a work around, which will look 
#something like this (python3.13 -m pip install titanoboa)

# We will be installing this package inside of our "Global Python" environment (the source kernel we are
#working out of.)

# To check all the packages, orr libraries, that we have installed, we can run these 2 commands in 
#terminal. The first is the basic universal way (pip list). The second is a bit more specific to the
#WSL VSCode we are using (python3.13 -m pip freeze).

# Note: The first version (pip list) is universal and should work with any Python environment.

# Running these commands in the terminal will return to us a list of the packages, or libraries that
#we currently have installed, and what versions of those packages, or libraries we are running.

# Now that we have our titanoboa package, or library, installed we can run commands using this package
#in our Python.

# One thing that we are able to do with titanoboa is we can actually evaluate Vyper code directly in 
#titanoboa.

# To have access to these features we will need to import the titanoboa library using the import method.

# We will be importing titanoboa like this (import boa)

# Once we have imported the library we can evaluate Vyper code. For example we can do this:
#(print(boa.eval("empty(uint256)")))

# This is actually some valid Vyper code, and it is a way to create an empty unsigned 256 integer
#object, AKA a Zero.

# So if we print this command, we get a Zero returned.

# This is because an empty uint256 is Vyper's way of saying Zero.


# The next concept we will be going over is "UV Installation".

# We will be going over a lot of information about Python versioning, and we may come acroos issues 
#that teach us things as we go and grow in coding.

# One of the issues we may face behind the scenes is that Titanoboa may have some features that only
#work with certain versions of Python.

# It can can extremely frustrating to be on the wrong version of Python and then have to go through
#all the different versions to find the one that works with the package, or library that we are using.

# Also, imports, like "boa", for example, might have versions that only work with certain versions of
#Python, which all get a bit confusing and frustrating. 

# It gets even more complicated with multiple packages that only work with certain versions of other 
#packages, which can all be one big headache.

# This is why for the duration of this course we're going to be using a tool called "UV".

# This "UV" tool is an extremely powerful and fast Python package and project manager written in rust.

# This "UV" tool will help us maintain both, our Python versions, and our package versions, so we rarely,
#if ever, have to deal with confliction errors in the future.

# Additionally, when we get to environments, this tool will be extremely useful.

# So first, we will go over the process of installing "UV", and then we will go over the process of
#running it and working with it in our virtual environments, so that whenever we create projects in
#Python, they are incredibly professional and easy to reproduce so that anybody can work with it.

# So these are the steps we will take to install "UV"

# First, since we are using the WSL VSCode version, we will not be using the Windows method to install
#this package. Instead we will be using the macOS and Linux commands to install our "UV" package.


# This is the command we want to type in our WSL command line terminal:
#( $ curl -LsSf https://astral.sh/uv/install.sh | sh )

# This is going to install the "UV" and the "UVX" commands onto our device.

# Once we have the package installed, we can delete the terminal and open a new one.

# Inside the new terminal we can type "which uv" to make sure that it was installed correctly.

# Also, we can type "uv --version" to see what version of UV we are running.

# Now that we have UV installed, what we can do is create a new professional Python project using
#this command "uv init" in the terminal.

# If this is done correctly we should see the following terminal message 
#"Initialized project `python-in-updraft-cu`".

# This is letting us know that our project was initialized, and it will let s know the name of the 
#project that was initialized.

# We will also see that we have some new files installed in our folder that were automatically
#created when we ran that command in the terminal.

# These are files that we now have and what they mean.

# gitignore - This is a file specifically for working with Git and Github.
# python-version - This file let's the world know what version of Python we are running.
# main.py - This file comes with a precoded constructor method which we can use to be our main file 
#that we designate to be the main file we need to run inorder to run our program.
# pyproject.toml - This file is incredibly important because it will hold information about our project.
#Whenever we are creating Python projects, it's this file that will tell the world how to interact, and
#what is needed to interact with our project.

# The other files that are in our folder are the ones we have already created ourselves at this point.


# In this section, we will go over the process of using UV to automatically change Python versions.

# What's cool about UV are the features. For example, if we run "python basic_python.py", which holds
#the "print(boa.eval("empty(uint256)")) " code, we will get "0" returned in our terminal.

# What we could also do is, we can run this with UV.

# We would do that by runnung this code in our terminal "uv run python basic_python.py".

# This method will most likely return an error, but that is where the power of UV comes into play.

# First we can add this piece of code to see if our Python version is compatible with our UV version.

# We can do that by doing this. First we will add the import sys, then we wil add this code to our
#script:

#if sys.version_info < (3, 14):
#    raise RuntimeError("This Script requires Python 3.14 or higher")

# This is a kind of way for us to say that this script requires Python 3.13 or higher, and if we 
#don't meet these requirements, we will raise this RuntimeError.

# Note: We are not running python3.14, we are just using this as an example to raise the RuntimeError
#in the terminal when we run this code.

# What we can do instead is run this code in our terminal:
# "uv python install 3.14", which will directly install the version of Python we want to use in our
#UV tool.

# Note: We can use "uv python list" to see which version of python we have installed on our machine.

# If we still get an error when attempting to run our code, we can run this command:
#"uv python pin 3.14"

# This will update our .python-version, and we can check our .python-version file to see that the
#Pythin version has been updated.

# Now we can rerun this command " uv run python basic_python.py " in our terminal, and it should run.

# Note: When we run this code initially, the code should run, and we should get a setup configuration
#message along with our returned code, but, we will only get this setup confirguration message once,
#as long as our configuration stays the same.

# Note: At this point, we can even go inside our .python-version file and update our version there
#to the version we want to use, and then rerun our code. This should automatically update our version
#of Python to the version that we just changed to in our .python-version file.

# Again, UV is a great tool for switching between Python Versions that we want to use. All we have to 
#do is update the version we want to use in the .python-version file and then run our script.

# Now we no longer have to specify the version of Python we want to use in the terminal. All we have
#to do is use "uv run python" plus our file name, and run our code.

# Note: We must make sure that we have the specific version of Python that we need to use in our
#.python-version file.


# The next section we will go over is Adding Python packages/libraries with uv.

# Note: We should keepmin mind that when we install packages inside specific versions of Pythton, those
#packages will not be installed in other versions of Python if we have to switch to a different version.

# It would get really troublesome to have to keep installing the same package across different versions
#Python that we are using, and that is where UV comes in handy.

# We can install packages using UV instead of using pip.

# To install packages using UV we would run this command inside our terminal:
#"uv add (package name)"

# To see an example of this we will reinstall "titanoboa" again, but this time we will use the UV
#method.

# Note: We must be inside the WSL terminal to install using the UV method.

# If everythig is done correctly, we will see that we have two new files added to our folder. The ".venv"
#file, and the "uv.lock" file.

# Note: If the UV command doesn't work at first, we may have to perform a sync using this command inside
#the WSL terminal "uv sync". This will sync all of the packages from our Global terminal into our WSL
#terminal.

# Once we sync, we should be able to run our basic_python.py file using uv by running this command in the WSL
#terminal, "uv basic_python.py"

# Also Note: We had issues running the uv sync with python3.13, butt everything worked fine when we ran
#python3.12.
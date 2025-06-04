# In this section we will ve going over the process of setting up a Develoment Environment for Vyper Smart
#Contracts using Moccasin.

# For this next section we will be working in the VSCode. We were only working with Google Colab to test
#out the code that we were working on in the last section, but moving forward we will be using the VSCode
#exclusively.

# We will be switching over because the VSCode works best for the environments we will be building.

# The first thing we will want to do is install "WSL".

# WSL - Windows Subsyytem for Linux.

# The WSL offers:

# Better LibrarySupport
# Powershell Improvement
# Winget Installer 
# More Cool Things etc...

# Also, the Smart Contract developement generally works best with the WSL.

# To install WSL, we will take these steps:

# First we open a command prompt terminal.
# Once inside our prompt command termnal, we are going to run this command (wsl --install)
# Once the installation is complete, we should have to reboot our computer to continue.
# Once we have rebooted our computer, the changes and the installation will take effect.

# Now that we have Ubuntu set up, we will be doing most of our work directly in our Ubuntu app.

# Also, the next thing we will do is install the wsl extention inside our VSCode.

# Once wehave it installed, will open a new terminal and hit the drop down tab near powershell. From the
#options we will select the wsl terminal to run. Once we select this option, give it a few minutes to load
#up and boot the wsl terminal in our VSCode. 

# This is the terminal we willbe using.

# We can also use the "Open Remote Tab" inside our VSCode, located right below the settings gear, to open
#a drop down that will give us to select the WSL option that will open VSCode in WSL Ubuntu setup mode
#automatically.

# Once we open the VSCode like this, we can open our terminal and not have to select the WSL version from
#the Powershell dropdown, this is because we will already be in WSL Unbuntu setup mode and so the terminal
#will automatically be set to the WSL version.

# As a reminder, anytime that we are working with the WSL Ubuntu setup terminal, we should always see the
#WSL Ubuntu display in the left hand corner at the same location where we selected the tab in the first 
#place, whether we used that tab to connect to WSL or not, it should still be displayed if we are working
#in the WSL Ubuntu setup.

# Note: Keep in that even if we close the VSCode and reopen it, we will still be connected to the WSL
#Ubuntu setup. We will have to manually disconnect if we want to return to the original Powershell
#terminal.

# Moving forwad with our Smart Contracts, we will be working with the WSL Ubuntu terminal mainly.

# This is because we want to have access to WSL and Ubuntu terminal commands.

# The next thing we want to do is make sure that we have Python installed for the WSL Ubuntu version of 
#VSCode that we will be using.

# What w want to do is download Python (and every package we need) directly to our WSL terminal.

# This is how we can ddo that.

# The first thing we want to do is make sure that we are inside our WSL terminal.

# Once we are in the WSL terminal we can proceed with the installation of Python.

# If we followed the instructions correctly when installing the WSL package, Python 3 should be installed
#by default.

# We can check this by typing (which python) on our WSL terminal command line. 

# If nothing pops up we can try typing (which python3) on our WSL terminal command line. This should
#bring back a result letting us know that we have Python 3 installed (which we should if we followed the
#instructions).

# Next we can type (python3 --version) on the WSL terminal command line to see what version we have of
#Python we are running.

# Even though we have Python already installed, we will bee running these commands to install a specific
#version of Python that we want to run.

# For now we will keep the version we have, but the steps below will help us navigate between Python 
#Versions in the future if we choose to.

# We may may choose to use specific Python Versions because certain features only work with certain 
#Versions of Python.

# These are the commands, in order, we need put in our WSL terminal command line when we want change 
#Python Versions.

# sudo apt-get update
# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt-get update
# sudo apt-get install (python version we want to install)

# These are the steps we would take to change the version of Python we want to use.

# To check to see if the version that we changed to is in fact installed, we won't use the (python3 --version)
#to check, instead, we'll use whatever version we installed --version to check. 

# For example, if we changed to Python 3.11, we would type in (python3.11 --version) to check if we are 
#running that version.

# We can also type in (which python3.11), which will also clarify what version is installd.

# Note: Even though we are working with python3 now, we won't be for long. 

# Soon we will move over to working with UV and Moccasin.

# This is because using those tools, we will not have to worry about python versioning.

# This will help us bypass the issues of certain features only working with versions of the program
#language we are using.

# Moccasin and UV will aloows us to much more easily switch between versions, use tooling with versions
#the correct way, etc etc.


# In this next section we will be going over VSCode Quickstart 2 for All OS (Operating Systems).

# From here we will be using our VSCode WSL version of our terminal and writing all of our coomands here,
#this way regardless of what OS we are using, the instructions will always work the same no matter what.

# Now we can start the process of setting up our VSCode so that it will be easy for us to save all the 
#files and projects related to this course in a single folder. 

# We'll start by openning up a new terminal.

# Note: A number of commands that we will be running are known as Linux Commands, and they work on (zsh,
#bash, etc.) pretty much any shell that comes with the OS we're using. 

# We can see what directory we're in this command in our terminal (pwd).

# This should show us what folder we're inside of.

# Also, if we type in (cd), which stands for change directory, we will change the directory to our home
#directory.

# Once inside our home directory, we will create a new folder for our files.

# We can do this by typing the command (mkdir), which stands for make directory, in our terminal.

# This command will create a brand new folder for us.

# We can also give our foldr a name by typing it after mkdir on the command line.

# For example, if we wanted to name our folder "Vyper Course", it would look like this 
#(mkdir vyper-course). Keep in mind we can name the folder whatever we want.

# Once the folder is created we cd into by saying (cd vyper-course).

# This will change the directory to the folder we just created.

# To make sure we are in the correct folder, we can run the (pwd) command agian and it will let us know
#what folder we are in.

# This folder is where we are going to store all of our different projects, and this is where we are going
#to build up our resumes and skillsets.

# The final thing we want to install (for now), is an AI extention.

# The AI extention that we want to install is the (Github Copilot).

# At this point, we have everything setup that we need to move forward.


# This next section we will focus on Mental Preparation and using our tools.

# At this point we should be in WSL terminal, and we should be running the specified version of Python
#we need.

# With everything setup we will finally do some Python coding in our project, and we're going to be showing
#how we do Python in Cyphon Updraft, and how we aork with Python in Cyphon Updraft. 

# Later on, we will go over the process of using Moccasin, but first we're going to be doing some raw 
#Python coding.

# That's because raw Python coding will teach us what's going on under the hood the Moccasin tool that we 
#will be learning later on. So we're going to start with Python, then  we're going to move to a tool 
#called UV. So let's jump in.

# One last thing we want to do before we get started is to make sure that we are inside our folder that is
#going to hold all of our files and projects.

# Note: For us, this folder is called (projects-folder)

# Once inside this folder, we will create a new file called (README.md)

# The Read Me is a classic file that all coding projects have that will explain to people what the project
#is about and what it does. The md is short for Mark Down.

# We're going to be creating a README for our Learning Journey, and in this README.md, we want to write
#and answer these questions.

# Why am I learning Vyper & Python?

# What do I want to do/be when I finish this course?

# What are the steps I'm going to be take to get there?

# The reason this is so important and we need to do this is because it will serve as a reminder as to why 
#we got started and what we hope to accomplish when things get tuff, or we run into problems along the
#way.

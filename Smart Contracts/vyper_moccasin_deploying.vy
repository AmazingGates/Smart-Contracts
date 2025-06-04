# In this section we will be Deploying our first smart contract.

# We will be Deploying our contrcat to the "Tenderly Virtual Testnet"

# We will be going over a few different ways to deploy our contract.

# The first way we are going to learn to deploy is to the Sepolia Testnet.

# The Sepolia Chain is exactly like a real blockchain, except that there's no real money invoved in the 
#process.

# The issue with this method is getting testnet Sepolia to send transactions.

# Because of this issue, we will go over two additional methods of deploying our contract.

# Note: In the future, we will never deploy to a testnet. We should always be testing locally, so we 
#shouldn't rely on a testnet to deploy our smart contract. As a rule of thumb, we want to deploy to a 
#testnet as little as possible. It's considered a bad habit. But for the purposes of this example, we will
#do it now, so we can see and feel, and get a true experience of deploying a smart contract.

# As a welcome to the community we can visit the X platform and tag the Cyfrin Updraft account to let them
#know that we have successfully deployed our first Smart Contract. This will be good Networking and
#community building.

# At this point we will go back to contract and compile it to ensure that everything is working as it 
#should before we move forward.

# Once we have deployed our Smart Contract in the Remix IDE we will stay stay inside the environment but 
#we will change the settings that we are working under. 

# We will be changing the environment from the Remix VM (Cancun) to the "Injected Provider - MetaMask"
#environment.

# Note: This environnment works if we have our MetaMask wallet installed on the device we are deploying 
#from.

# Once we have or environment changed, we will proceed to connect our MetaMask wallet to the environment
#via our wallet address.

# Once our wallet is connected, we will go inside our MetaMask wallet and change the network from
#Ethereum Mainnet to the Sepolia network.

# Note: We will need Sepolia Eth for deploying our contract with this method. If we are unable to get
#test sepolia, we will go with a different method.

# The Method we will use is Deploying to a virtual testnet.

# For this, we will be using a service called "Tenderly", which we will need to sign up for.

# The website we want to visit to do this is "tenderly.co" through the Cyfrin github repo address -
#( https://github.com/Cyfrin)

# Note: If we can't find the repo or have trouble getting the link, we always the URL by itself, but
#that may affect any free trial offers.

# To get our free trial, once we sign up we will open up the chat box and enter this phrase "CYFRIN2024"

# If the link is still live we should get a 1 Month free trial.

# Once everything is done we can go ahead and log in.

# Tenderly is going to be a service that we use to get testnet funds. 

# Note: We can go through the Onboarding process if we want to get more familiar with the platform, but 
#it is not needed for this process.

# We will fill out our information, we can name our project "Cyfrin Updraft First Smart Contract".

# Once we finish everything the platform will setup a project for us.

# Once inside our project, we open the chat box again and enter in the same code as we did previously.

# If it is still active, it should extend our Trial for an additional 2 weeks.

# Once we are inside the Tenderly platform, we will navigate to the "Virtual Testnet" environment. 

# What we're going to do here is create our own fake sepolia chain that we're going to deploy to. We're
#going to get an Ether Scan, like Explorer, to actually view our contracts.

# So we're going to go ahead and hit the "Create Virtual Network". This is going to make us our own fake
#virtual testnet that we can deploy our smart contract to, and see it on an ether scan like interface
#without having to go through the pain of dealing with getting testnet tokens, or testnet Ethereum.

# To start, we are going to hit the the "Parent Network" dropdown and select Sepolia. This will make it
#more obvious that this is a test network. 

# Then we will choose a name, which we will call "Our Test Chain".

# For the chain ID we want to choose a custom chain ID, that it's easier to work with MetaMask and other
#tools where they are looking for specific chain ID's. So the sepolia chain ID is 111555111.

# The next thig we will do is  turn the "Public Explorer" On. If we leace it off, we will actually be
#able to view the explorer, but it will be restricted to members only. remember, the explorer is kind of 
#like our Ether scan. So we're going to turn it on in order to have Smart Contract visibility options. 

# From the Smart Contracts Visibility options we will select the Full option, which will allow us access
#to all the Smart Contracts that are verified on the Virtual Testnet.

# The next option will be the "State Sync", which we will leave off.

# This will be how we set up our Virtual Testnet.

# At this point we can go ahead and hit the create button.

# Now Our Test Sepolia Chain has been created.

# Now that we have this, we want to actually add this into our MetaMask.

# Note: We have the network the correct way, because if we go to our MetaMask wallet and tried to switch to
#that network as is, we wouldn't find it in our wallet. This is because the network we are looking for is 
#custom chain. 

# To add the custom network, we will scroll down to end of the page in our wallets network section, and 
#then click onn the "Add a custom network button".

# We are going to name this custom network "Our Test Network".

# Next we will add an PRC URL. For this we will paste the https: address for our Tenderly project test
#chain page.

# Next we will add the chain ID we created, which was "111555111".

# The currency we are going to be using is ETH.

# For now we will skip the "Block Explore URL"

# Once we are done we can save our changes.

# At this point we should be able to select "Our Test Network" as an option in our MetaMask Network section.

# Once inside "Our Test Network", we will copy the address and paste it into our Tenderly project.

# We will do this by hitting the "Fund Account" button on our Test Network project page, and we will be
#able to paste our wallet address into the box provided.

# This process should give us 1,000 ETH. Once everything is filled out we hit the fund button.

# At this point we should be able to go back into our MetaMask wallet and see that our funds have indeed
#been sent to us.

# Now we should finally have tokens on our Test Network.

# Note: If we visit the "Explorer" tab inside our Tenderly account, we will be able to view all of Test
#transactions that took place on our Test Chain on our Test Network. Our transactions should have check
#marks near them.

# Now that everything is set and we finally have our funds, we head back over to the Remix IDE so that 
#we can deploy our Test Chain with the MetaMask, the exact way we need to deploy to Ethereum mainnet, 
#or ZK Sync, or any other chain that we want to deploy to.

# Note: Make sure that we are on our test chain where our funds are located.

# Aslo Note: If our Test Chain isn't showing up at first, we can disconnect our wallet and reconnect it
#to reset the connection with the updated custom test network.

# Another Note: There is/was a known bug inside of the Remix IDE where it wasn't reading the Sepolia
#network. For That issue we can take these steps.

# We will open a new file called "hi.sol", and in this file we will put the following information.
#"pragma solidity 0.8.18;"

#"contract Hi {}" 

# Once we have this information entered into our hi.sol file, we will go to our solidity compiler and 
#compile the new file we just created.

# Once we do this we can go back to our regular favorites.vy file where our contract is.

# Once back in favorites.vy file let's be sure that we compile it before we move forward.

# Note: Make sure that our MetaMask is set to our Test Chain Network.

# Once we are sure everything is set up properly we can deploy as usual, but this time our MetaMask
#wallet should pop up with a "Deploy Request" from the Remix IDE.

# Note: We have to ensure that we do the Solidity compilation with the hi.sol file in order for this part 
#of the process to work.

# Once the Request Form pops up with our MetaMask wallet, we can hit the "confirm" button to actually
#deploy this contract.

# This is the same process and the same look an actual deployment to an actual chain will take and look.

# Once we confirm, we can pull up the terminal in our Remix IDE and verify that the contract has been
#deployed.

# Although we won't be able to see this transaction on the actual ether scan platform, because we are
#using a test chain network, we can go to the Tenderly website and view this deployment, in the form
#of a transaction in the Explorer section.

# We can click on the contract to view the information on this deployment.

# At this point we have actually deployed our first contract.

# Note: This contract is live. This means that it still has all of the functions that we created and tested
#in the Remix IDE, so whenever we update data in the contract, via a name, or favorite number, this will
#start the deployment process all over again within our MetaMask to reflect the updated information for our
#contract, which we can view as a transaction on the Tenderly platform. 

# Also Note: When we send updates to a Contract on the actual blockchain, it will require us to
#make an actual transaction, because it is treated like a Contract Deployment, which is a transactional
#event.

# Again, we can confirm this deployment inside the terminal inside our Remix IDE.

# And this update can also be viewed from the Tenderly platform, as a transaction.

# The process and steps we just took will work with every single network, so we have just learned how to
#write, and deploy our very first Smart Contract.

# Note: If we had actual funds in our wallet, we would send an actual transaction the same exact way
#with the same exact process we just took.

# We Are Officially Smart Contract Developers.
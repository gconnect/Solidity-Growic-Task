# Description
You must complete the task from the 'Mapping' topic before you begin this one.
Perform the task and share the link to your github in the field below.

# Instructions
This task extends the functionality of the previous contract by allowing users to save their additional info into the smart contract as a KYC measure.

The contract should now contain the following:

setUserDetails(string calldata name, uint256 age) this function accepts 2 arguments that represent the details of the user calling the smart contract and it saves them into a defined struct,
getUserDetail() this function retrieves and returns the details saved for the user calling the contract.

# How to run

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

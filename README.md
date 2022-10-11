# Mapping Task - Deposit Contract
## Description
Perform the task and share the link to your github in the field below.

## Instructions
Create a smart contract that saves user balance. The contract should have the functions:

- deposit (uint256 amount) this function accepts one argument and it saves the amount a user is depositing into a mapping,
- checkBalance() this function searches for the user balance inside the balance mapping and returns the balance of whoever is calling the contract.

# How to run

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

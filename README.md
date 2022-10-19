# Description
You must complete the tasks from the previous topics before you begin this assignment.
Perform the task and share the link to your github in the field below.

# Instructions
To ensure that our smart contract can receive ETH sent to it via transfers, we will create a fallback or receive payable function. The task is to create the fallback function and make sure when a user transfers ETH to the smart contract, the transaction does not get reverted

# How to run

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

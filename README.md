# Description
You must complete the tasks from the previous topics before you begin this assignment.
Perform the task and share the link to your github in the field below.

# Instructions
In this task, we will re-write the deposit function from the ‘Mappings’ topic. We will allow users to send real ETH deposits to our smart contract by adding a payable function. Function deposit will be re-written to accept no arguments but receive real ETH deposits and still save and update user balance.

deposit() accepts ETH through the payable modifier and updates user balance accordingly

# How to run

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

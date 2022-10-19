# Description
You must complete the tasks from the previous topics before you begin this assignment.
Perform the task and share the link to your github in the field below.

# Instructions
Extend the previous task to use blockchain events. The contact should emit the following events when a user deposits and updates their profile information respectively:

FundsDeposited(address user, uin256 amount)
ProfileUpdated(address user)

# How to run

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

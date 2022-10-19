# Description
You must complete the tasks from the 'Mapping' and 'Structs' topics before you begin this assignment.
Perform the task and share the link to your github in the field below.

# Instructions
This task extends the functionality of the previous task. Create a deposit function that allows anybody to send funds. Store the user and the amount in a mapping as the previous task.

Add a withdraw function and create a modifier that only allows the owner of the contract to withdraw the funds.
Add an addFund function and create a modifier that only allows users that have deposited using the deposit function, to increase their balance on the mapping. The function should accept the amount to be added and update the mapping to have the new balance
Hint: if their balance is zero on the mapping, it should revert

Hint: theMapping[userId] = theMapping[userId] + _amount;

Create a modifier that accepts a value(uint256 _amount):
Create a private constant variable called Fee
In the modifier check if the value(_amount) it accepts is less than the Fee, revert with a custom error AmountToSmall()
Add it to the addFund function
Hint: addFund(uint256 _amount)..........

# How to run

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

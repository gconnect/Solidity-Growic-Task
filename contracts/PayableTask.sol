//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// In this task, we will re-write the deposit function from the ‘Mappings’ topic. We will allow users 
// to send real ETH deposits to our smart contract by adding a payable function. Function deposit 
// will be re-written to accept no arguments but receive real ETH deposits and still save and update user balance.

// deposit() accepts ETH through the payable modifier and updates user balance accordingly

contract PayableTask {

    struct User {
        address userId;
        uint256 balance;
    }

    mapping(address => User) public balances;

    function deposit() public payable {
        balances[msg.sender].balance += msg.value;
        balances[msg.sender] = User(msg.sender, msg.value);
    }

    function checkBalance() public view returns(uint256) { 
       return balances[msg.sender].balance;
    }

}

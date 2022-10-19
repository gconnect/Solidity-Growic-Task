//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// To ensure that our smart contract can receive ETH sent to it via transfers, we will create a 
// fallback or receive payable function. The task is to create the fallback function and make sure 
// when a user transfers ETH to the smart contract, the transaction does not get reverted

contract FallbackTask {

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


    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
    }

}

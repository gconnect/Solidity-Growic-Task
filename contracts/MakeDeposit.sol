//SPDX-License-Identifier : MIT

pragma solidity ^0.8.4;

contract MakeDeposit {

    struct User {
        address userId;
        uint256 amount;
    }
    uint256 public newAmount ;

    mapping(address => User) public balances;

    function deposit(uint256 amount) public {
        newAmount += amount ;
        balances[msg.sender] = User(msg.sender, newAmount);
    }

    function checkBalance() public view returns(uint256) { 
       return balances[msg.sender].amount;
    }

}


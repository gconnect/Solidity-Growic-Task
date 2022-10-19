// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// setUserDetails(string calldata name, uint256 age) this function accepts 2 
// arguments that represent the details of the user calling the smart contract 
// and it saves them into a defined struct,

// getUserDetail() this function retrieves and returns the details saved for the 
//user calling the contract.

contract StructTask {
    struct User {
        address addr;
        string name;
        uint256 age;
    }

    mapping (address => User) public users;

    //This function accepts 2 arguments that represent the details of the user calling the smart contract 
    // and it saves them into a defined struct
    function setUserDetails(string calldata name, uint256 age) public {
       users[msg.sender] = User(msg.sender, name, age);
    }

    //This function retrieves and returns the details saved for the user calling the contract.
    function getUserDetail() public view returns(address, string memory, uint256){
        return (users[msg.sender].addr, users[msg.sender].name, users[msg.sender].age);
    }
}

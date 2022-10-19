// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// Create a deposit function that allows anybody to send funds. Store the user and the amount in 
//a mapping as the previous task.

// Add a withdraw function and create a modifier that only allows the owner of the contract to 
//withdraw the funds.

// Add an addFund function and create a modifier that only allows users that have deposited using the
// deposit function, to increase their balance on the mapping. The function should accept the amount 
// to be added and update the mapping to have the new balance
// Hint: if their balance is zero on the mapping, it should revert

// Hint: theMapping[userId] = theMapping[userId] + _amount;

// Create a modifier that accepts a value(uint256 _amount):
// Create a private constant variable called Fee
// In the modifier check if the value(_amount) it accepts is less than the Fee, revert with a custom
// error AmountToSmall()
// Add it to the addFund function
// Hint: addFund(uint256 _amount)..........

contract ModifierTask {

    uint256 public constant FEE = 1000000000000000000;
    struct User {
        address addr;
        uint256 balance;
    }
    error AmountToSmall(string);
     mapping(address =>  User) public users;
     address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    modifier ownerOnly() {
        require(msg.sender == owner, "You are not the owner");   
        _;
    }

    modifier onlyExistingUsers(uint256 _amount) {
        require(users[msg.sender].balance != 0, "You don't have an intial balance");
        if(_amount < FEE){
           revert AmountToSmall("Amount too small");
        }
        _;
    }

    // Create a deposit function that allows anybody to send funds. Store the user 
    // and the amount in a mapping

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.

    function deposit(uint _amount) public payable {
        // require(msg.value == _amount);
        _amount ==  msg.value;
        users[msg.sender] = User(msg.sender, _amount);
    }


    // Add a withdraw function and create a modifier that only allows the owner of the contract to 
    //withdraw the funds.
    function withdraw() public ownerOnly{
        // get the amount of Ether stored in this contract
        uint amount = address(this).balance;
        // send all Ether to owner
        // Owner can receive Ether since the address of owner is payable
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Add an addFund function and create a modifier that only allows users that have deposited using the
    // deposit function, to increase their balance on the mapping. The function should accept the amount 
    // to be added and update the mapping to have the new balance
    // Hint: if their balance is zero on the mapping, it should revert
    function addFund(uint256 amt) public onlyExistingUsers(amt){
        users[msg.sender].balance += amt;
    }
}
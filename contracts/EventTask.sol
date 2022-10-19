// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// The contract should emit the following events when a user deposits and updates their profile
// information respectively:

// FundsDeposited(address user, uin256 amount)
// ProfileUpdated(address user)
contract EventTask {
  
  event FundsDeposited(address user, uint256 amount);
  event ProfileUpdated(address user);

  struct User {
      address addr;
      uint256 bal;
  }

  mapping(address => User) public users;

  function deposit(uint256 amount) public  {
      users[msg.sender] = User(msg.sender, amount);
      emit FundsDeposited(msg.sender, amount);
  }

  function updateProfile(uint256 amount) public {
      amount += users[msg.sender].bal;
      users[msg.sender] = User(msg.sender, amount);
      emit ProfileUpdated(msg.sender);
  }

}
// SPDX-License-Indentifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// A simple use case for inheritance is to launch an ERC20 token using the OpenZepellin ERC20 
// implementation. Try to launch your custom ERC20 on any test network and then send me the address 
// to the contract!

contract InheritanceTask is ERC20 {
    uint256 constant public TOTAL_SUPPLY = 100000000000000000000;

    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, TOTAL_SUPPLY);
    }
}
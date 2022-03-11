//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

abstract contract ERC20V {
    //Varibles
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public supply;
    uint256 public maxSupply;
    mapping(address => uint256) public balance;
    mapping(address => mapping(address => uint256)) public allowed;
}

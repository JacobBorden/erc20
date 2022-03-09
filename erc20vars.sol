pragma solidity ^0.8.12;

import "./ierc20.sol";

contract ERC20V {
    //Varibles
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public supply;
    mapping(address => uint256) balance;
    mapping(address => mapping(address => uint256)) allowed;
}

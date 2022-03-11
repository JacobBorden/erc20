//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./erc20.sol";

contract Token {
    string _name = "Name";
    string _symbol = "SYB";
    uint8 _decimals = 9;
    uint256 _initalSupply = (10**_decimals) * 0;
    uint256 _maxSupply = (10**_decimals) * 1000000;
    ERC20Token token;

    constructor() {
        token = new ERC20Token(_name, _symbol, _decimals, 0, _maxSupply);
        mint(_initalSupply);
    }

    function mint(uint256 _amount) public {
        token.mint(_amount, msg.sender);
    }

    function burn(uint256 _amount) public {
        token.burn(_amount, msg.sender);
    }

    function total() public view returns (uint256 _amount) {
        return token.supply();
    }
}

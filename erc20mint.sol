pragma solidity ^0.8.12;

import "./erc20event.sol";
import "./erc20vars.sol";

contract MintERC20 is ERC20Events, ERC20V {
    function mint(uint256 _amount) public {
        supply += _amount;
        balance[msg.sender] += _amount;
        emit Transfer(address(0), msg.sender, _amount);
    }
}

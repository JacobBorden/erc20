pragma solidity ^0.8.12;

import "./erc20event.sol";
import "./erc20vars.sol";
import "./erc20.sol";

contract AERC20 is ERC20V, ERC20Events {
    function mint(uint256 _amount) public returns (bool success) {
        require((_amount + supply) <= maxSupply);
        require(address(0) != msg.sender);
        supply += _amount;
        balance[msg.sender] += _amount;
        emit Transfer(address(0), msg.sender, _amount);
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        require(_amount <= supply);
        require(address(0) != msg.sender);
        require(balance[msg.sender] >= _amount);
        supply -= _amount;
        balance[msg.sender] -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
        return true;
    }
}

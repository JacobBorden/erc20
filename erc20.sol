//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ierc20.sol";
import "./erc20vars.sol";
import "./erc20event.sol";

contract ERC20Token is IERC20, ERC20V, ERC20Events {
    //Constructor
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply,
        uint256 _maxSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        supply = _initialSupply;
        maxSupply = _maxSupply;
    }

    //Methods

    function totalSupply() public view returns (uint256) {
        return supply;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balance[_owner];
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balance[msg.sender] >= _value);
        balance[msg.sender] -= _value;
        balance[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(allowed[_from][msg.sender] >= _value);
        require(balance[_from] >= _value);
        balance[_from] -= _value;
        balance[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256 remaining)
    {
        return allowed[_owner][_spender];
    }

    function mint(uint256 _amount, address _to) public {
        require((_amount + supply) <= maxSupply);
        require(address(0) != _to);
        supply += _amount;
        balance[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function burn(uint256 _amount, address _from) public {
        require(_amount <= supply);
        require(address(0) != _from);
        require(balanceOf(_from) >= _amount);
        supply -= _amount;
        balance[_from] -= _amount;
        emit Transfer(_from, address(0), _amount);
    }
}

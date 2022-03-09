pragma solidity ^0.8.12;

import "./ierc20.sol";
import "./erc20vars.sol";
import "./erc20event.sol";

contract ERC20Token is IERC20, ERC20V, ERC20Events {
    //Constructor
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimal,
        uint256 _supply
    ) {
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
        supply = _supply;
    }

    //Methods

    function totalSupply() public view returns (uint256) {
        return supply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balance[_owner];
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(_balance[msg.sender] >= _value);
        _balance[msg.sender] -= _value;
        _balance[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_allowed[_from][msg.sender] >= _value);
        require(_balance[_from] >= _value);
        _balance[_from] -= _value;
        _balance[_to] += _value;
        _allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256 remaining)
    {
        return _allowed[_owner][_spender];
    }
}

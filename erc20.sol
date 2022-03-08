pragma solidity ^0.8.12;

contract ERC20Token {
    //Varibles
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 private supply;

    mapping(address => uint256) _balance;
    mapping(address => mapping(address => uint256)) _allowed;

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
    {}

    function allowance(address _owner, address _spender)
        public
        returns (uint256 remaining)
    {}

    //Events

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
}

// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

contract BabyCakes {
    string public name = "Baby Cakes";
    string public symbol = "BCk";
    uint public totalsupply = 100000000000000000;
    uint public decimal = 18;

    event Transfer (
        address indexed _from,
        address indexed _to,
        uint _value
    );

    event Approve(
        address indexed _onwer,
        address indexed _spender,
        uint _value
    );


    mapping(address => uint256) balance;
    mapping(address => mapping(address=> uint256)) allowance;

    constructor() public{
        balance[msg.sender] = totalsupply;
    }

    function transfer (address _to, uint256 _value) public returns (bool){
        require(balance[msg.sender] >= _value);
        balance[msg.sender] -= _value;
        balance[_to] += _value;
        emit Transfer (msg.sender, _to, _value);
        return true;
    }

    function approve (address _spender, uint256 _value) public returns (bool){
        allowance[msg.sender][_spender] = _value;
        emit Approve(msg.sender, _spender,_value);
        return true;
    }

}

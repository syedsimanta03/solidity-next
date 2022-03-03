//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract coin {
    // public making variables accessible to other contract
    address public minter;
    mapping(address => uint) public balances;
    event Sent(address from, address to, uint amount);
    // runs once after deployed
    constructor() {
        minter = msg.sender; //= guy who deployed this contract
    }
    // only owner = guy who deployed this contract can send coin - mint fun
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // send any amount of coin to any addresses - token fun
    error InsufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
        revert InsufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }


}
pragma solidity >= 0.5.0<0.9.0;

// VARIABLE SCOPE - Functions & Variables

// Private = You can only call the function inside the contract
// Internal = called only within the contract OR other contracts that inherit the smart contract 
// Internal is slightly less restrictive than public
// External you can only call the function outside the contract not from other functions within 
// Public you can call the function from outside the smart contract as well inside the smart contract
// c++ also has inheritance 

// How to decide which one to use?
// RULE OF THUMB: Give the minimum amount of priviledge to any entity. 
// 1. Private, 2. Internal 3. External 4. Public 

// modify the rules of scope in Solidity with keywords
// private public external internal 

// State Variables vs Local Variables 

// create a function that subtracts 3 from  the data variable in our contract C 
// that is only accessible in a new contract D or within contract C and return
// the value of the new function in contract D


//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract C {
    
    uint public data = 10; // state variable 
    
    function x() private pure returns (uint) {
        uint newData = 25;
        return newData;
    }
    
    function l() internal view returns(uint) {
        uint newData = data - 3;
        return newData;
    }
   
    
    function y() internal view returns (uint) {
        return data;
    }
     
     
    function g() public view returns (uint) {
        return l();
    }
     
}

// inherited from parent C
contract D is C{

    
    function f() public view returns (uint) {
        return l();
    }
    
}

// external l() can be call outside new contract without inherit
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract C {
    
    uint public data = 10; // state variable 
    
    function x() private pure returns (uint) {
        uint newData = 25;
        return newData;
    }
    
    function l() external view returns(uint) {
        uint newData = data - 3;
        return newData;
    }
    
    
    function y() internal view returns (uint) {
        return data;
    }
     
     
}

contract D {

    C c = new C(); // new contract with all funcs available from C() & D()
    
    function f() public view returns (uint) {
        return c.l();
    }
    
}
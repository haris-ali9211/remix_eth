
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract local
{
    function store() pure public returns(uint)
    {
        string memory name = "raza"; //local veriable
        uint age = 10;
        return age;
    }
}
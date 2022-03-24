// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract array
{
    uint[4] public arr = [10,22,32,11];

    function setter(uint index, uint value) public
    {
        arr[index] = value ; 
    }

    function length() public view returns(uint)
    {
        return arr.length;
    }
}
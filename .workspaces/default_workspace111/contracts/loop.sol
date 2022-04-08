// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract loop
{
    uint[3] public arr;
    uint public count ;

    function loopPrint() public
    {
        while(count<arr.length)
        {
        arr[count] = count;
        count = count + 1; 
        }   
    }

}
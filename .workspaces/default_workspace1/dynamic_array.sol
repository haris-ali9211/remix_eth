// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract dynamic_arr
{
    uint[] public arr;

    function puchElement(uint item) public
    {
        arr.push(item);
    }

    function length() public view returns(uint)
    {
        return arr.length;
    }

     function popElement() public
    {
        arr.pop();
    }
    
    
}
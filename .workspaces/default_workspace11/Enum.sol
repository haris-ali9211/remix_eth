// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


enum user
    {
        allowed,
        not_allowed,
        wait
    }

contract eNum
{
    

    user public u1 = user.not_allowed;

    uint public lottery = 100;

    function owner() public
    {
        if(u1 == user.not_allowed)
        {
            lottery = 10 ;
        }
    }

    function changeOwner() public
    {
        u1 = user.allowed;
    }
}
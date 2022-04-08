// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract demo
{
    address payable user = payable(0x583031D1113aD414F02576BD6afaBfb302140225);

    // function getter() public view returns(uint block_no, uint timestamp, address msgSender)
    // {
    //     return(block.number, block.timestamp, msg.sender);
    // }

    function payEther() public payable
    {

    }

    function getBalance() public view returns(uint)
    {
        return address(msg.sender).balance;
    }

    function sendEtherAccount() public
    {
        user.transfer(1 ether);
    }
}
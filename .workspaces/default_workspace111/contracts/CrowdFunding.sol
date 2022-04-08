// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract crowdFunding
{
    mapping( address => uint ) public contributors;
    address public manager;
    uint public minContributers;
    uint public deadline;
    uint public target;
    uint public noOfContributers;
    uint public raisedAmount;


    constructor(uint  _target, uint _deadline)
    {
        target = _target;
        deadline = block.timestamp+_deadline;
        minContributers = 100 wei;
        manager =  msg.sender; 
    }

    function sendEth() public payable
    {
        require(block.timestamp < deadline, "Deadline has passed");
        require( msg.value >= minContributers, "Minimum  Contribution is not met");

        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value; 
    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}
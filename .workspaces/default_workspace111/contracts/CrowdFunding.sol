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

    struct Request
    {
        string description;
        address payable recipient;
        uint value;
        bool complete;
        uint noOfVoters;
        mapping(address => bool) voters;
    }

    mapping(uint => Request) public requests;

    uint public numRequests;


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

        if(contributors[msg.sender] == 0)
        {
            noOfContributers ++;
        }

        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value; 
    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function refund() public
    {
        require(block.timestamp > deadline && raisedAmount < target, "You are not eligible for refund");
        require(contributors[msg.sender] > 0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0; 
    }

    modifier onlyManager()
    {
        require(msg.sender == manager, "Only Manager can do this function");
        _;  
    }

    function createFunction(string memory _description, address payable _recipient, uint _value) public onlyManager
    {
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.complete = false;
        newRequest.noOfVoters = 0;
    }

    function voteRequest(uint _reqestNo) public
    {
        require(contributors[msg.sender] > 0, "You must be Contributer");
    }
    
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract AirlineTickets {

    address public owner;
    address public user;
    
    constructor() {
        owner = payable(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
        user = msg.sender;
    }

    struct User 
    {
        string name;
        string des;
        uint pass_id;
        string ticket;
        uint cost;
    }

    bool booked = false;

    enum classTypes{ firstClass, economyClass, busnissClass }

    uint convert;
    string realVal = "Economy Class";
    uint cost;


    //payment
    uint public oneWei = 1 wei;

    mapping (address => User) public data;

    classTypes public u1= classTypes.economyClass;


    // function getter() public view returns(uint block_no, uint timestamp, address msgSender)
    // {
    //     return(block.number, block.timestamp, msg.sender);
        
    // }

    function payment() public payable
    {
        require(msg.value >= data[msg.sender].cost);
        // require(address(user).balance >= data[user].cost);
        payable(owner).transfer(msg.value);
    }

    function economyClass() public 
    {
        u1= classTypes.economyClass;
        convert = uint(u1);
        if(convert==1)
        {
            realVal = "Economy Class";
            cost = oneWei * 5e15;
        }
        booked = true;
    }
    
    function firstClass() public 
    {
        u1= classTypes.firstClass;
        convert = uint(u1);
        if(convert==0)
        {
            realVal = "First Class";
            cost = oneWei * 1e16;
        }
        booked = true;
    }

    function busnissClass() public {
        u1= classTypes.busnissClass;
        convert = uint(u1);
        if(convert==2)
        {
            realVal = "Busniss Class";
            cost = oneWei * 7e15;
        }
        booked = true;
    }
    
    function setData(string memory _name, string memory _des, uint _pass_id) public 
    {
        require(booked,"please select the class first");
        data[msg.sender] = User(_name,_des,_pass_id,realVal ,cost);
    }
    
}
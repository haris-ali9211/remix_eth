// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract AirlineTickets {

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
    uint eth;
    uint cost;

    //payment
    uint public oneWei = 1 wei;
    uint public oneEth = 1 ether/1e18;
    uint public costTry = oneEth/5e14;
    // uint public ecoClassCost = oneWei * 5e15;
    // uint public firstClassCost = oneWei * 5e15;
    // uint public busClassCost = oneWei * 5e15;

    mapping (address => User) public data;

    classTypes public u1= classTypes.economyClass;

    function economyClass() public 
    {
        // require(!booked, "you have already book a class");
        u1= classTypes.economyClass;
        convert = uint(u1);
        if(convert==1)
        {
            realVal = "Economy Class";
            cost = oneWei * 5e14;
            // eth = 1;
        }
        booked = true;
    }
    
    function firstClass() public 
    {
        // require(!booked, "you have already book a class");
        u1= classTypes.firstClass;
        convert = uint(u1);
        if(convert==0)
        {
            realVal = "First Class";
            cost = oneWei * 1e15;
            // eth = 2;
        }
        booked = true;
    }

    function busnissClass() public {
        // require(!booked, "you have already book a class");
        u1= classTypes.busnissClass;
        convert = uint(u1);
        if(convert==2)
        {
            realVal = "Busniss Class";
            cost = oneWei * 7e14;
            // eth = 3;
        }
        booked = true;
    }
    
    function setData(string memory _name, string memory _des, uint _pass_id) public 
    {
        require(booked,"please select the class first");
        data[msg.sender] = User(_name,_des,_pass_id,realVal ,cost);
    }
    
}
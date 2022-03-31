// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;
contract AirlineTickets {
    struct User {
        string name;
        string des;
        uint pass_id;
        string ticket;
        uint cost;
        bool booked;
        bool confrim;
    }

    enum classTypes{firstClass,economyClass,busnissClass}

        classTypes u1;
        uint oneWei = 1 wei;
        uint convert;
        string realVal;
        uint _cost;
        address public owner;
        bool _confrim = false;
        bool _booked = false;
      
      

mapping (address => User) public data;

constructor() {
    owner = msg.sender;
}

    function payment() public payable {
        require(!data[msg.sender].confrim,"You have already paid the amount");
        require(msg.value >= data[msg.sender].cost);
        payable(owner).transfer(msg.value);
        data[msg.sender].confrim = true;
        _confrim = data[msg.sender].confrim;
        if(data[msg.sender].confrim) {
            delete data[msg.sender];
        }

    }
    function see() public view returns(bool){
        return data[msg.sender].confrim;
    }

    
  function economyClass() public {
        require(!data[msg.sender].booked, "you have already book a class");
         u1= classTypes.economyClass;
             convert = uint(u1);
             if(convert==1){
                realVal = "Economy Class";
                 _cost = oneWei * 5e15;
                 data[msg.sender].booked = true;
                 _booked =  data[msg.sender].booked;
             }
    }
    
  function firstClass() public {
        require(!data[msg.sender].booked, "you have already book a class");
         u1= classTypes.firstClass;
             convert = uint(u1);
             if(convert==0){
                realVal = "First Class";
                _cost = oneWei * 1e16;
                 data[msg.sender].booked = true;
                 _booked =  data[msg.sender].booked;
             }
    }
     function busnissClass() public {
       
        require(!data[msg.sender].booked, "you have already book a class");
         u1= classTypes.busnissClass;
             convert = uint(u1);
             if(convert==2){
                realVal = "Business Class";
                _cost = oneWei * 7e15;
                   data[msg.sender].booked = true;
                   _booked =  data[msg.sender].booked;
             }
    }
    
    function setData(string memory _name, string memory _des, uint _pass_id) public {
    //  require(msg.sender != owner, "You are the owner you cant buy ticket");
        require(data[msg.sender].booked,"please select the class first");
       data[msg.sender] = User(_name,_des,_pass_id,realVal,_cost,_booked,_confrim);
    }
}
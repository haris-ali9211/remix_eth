// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct Student
    {
        string name;
        string destination;
        string class;
    }

contract demo  
{

    string classType = "Economy Class";

    mapping( uint => Student ) public data;

    function changeClassToEcomomic() public
    {
        classType = "First Class";
    }

    function changeClassToFirst() public
    {
        classType = "First Class";
    }

    function changeClassToBusiness() public
    {
        classType = "Business Class";
    }

    // string public classData =;

    function setter(uint _passportId, string memory _name, string memory _destination) public
    {
        data[_passportId] = Student(_name, _destination, classType);
    }
}
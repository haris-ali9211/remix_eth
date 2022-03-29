// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/utils/Strings.sol";


contract demo  
{

    enum class
    {
        economy_class,
        first_class,
        business_class
    }

    struct Student
    {
        string name;
        string destination;
        string class;
    }

    class public u1 = class.economy_class;

    mapping( uint => Student ) public data;

    function changeClassToEcomomic() public
    {
        u1 = class.economy_class;
    }

    function changeClassToFirst() public
    {
        u1 = class.first_class;
    }

    function changeClassToBusiness() public
    {
        u1 = class.business_class;
    }

    string public classData = u1;

    function setter(uint _passportId, string memory _name, string memory _destination) public
    {
        data[_passportId] = Student(_name, _destination, classData);
    }
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct Student
{
    uint roll_no;
    string name;
}

contract struct_datatype
{
    Student public s1;

    constructor(uint _roll, string memory _name)
    {
        s1.roll_no = _roll;
        s1.name = _name;
    }

    function changeStruct(uint _roll, string memory _name) public
    {
        Student memory new_Student = Student(
            {
                roll_no : _roll,
                name : _name
            }
        );

        s1 = new_Student;

    } 
}
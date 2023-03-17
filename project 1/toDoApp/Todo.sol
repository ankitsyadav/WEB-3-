// SPDX-License-Identifier: GPL-3.0

import "@openzeppelin/contracts/utils/Strings.sol";
pragma solidity >=0.7.0 <0.9.0;

contract Todo{

    string[] public toDoList;

    function createTask(string memory _task) public {
        toDoList.push(_task);
    }

    function updateTask(string memory _updatedTask,uint _index) public{
        toDoList[_index]=_updatedTask;
    }
    
    function deleteTask(uint _index) public{
        delete toDoList[_index];

        toDoList[_index]=toDoList[toDoList.length-1];

        toDoList.pop();

    }


    function proritizeTask(uint _i1,uint _i2) public{
        string memory temp = toDoList[_i1];
        toDoList[_i1]=toDoList[_i2];
        toDoList[_i2]=temp;
    }


}
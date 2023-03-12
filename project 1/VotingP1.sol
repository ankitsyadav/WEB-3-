// SPDX-License-Identifier: GPL-3.0

import "@openzeppelin/contracts/utils/Strings.sol";
pragma solidity >=0.7.0 <0.9.0;

contract VotingP1{
        using Strings for uint256;
        address owner;
        string ques;
        uint op1;
        uint op2;

        constructor(){
            owner=msg.sender;
            op1=0;
            op2=0;
            ques="";
        }

        modifier onlyOwner(){
            require(msg.sender==owner,"Only Owner is allowed to post Questions");
            _;
        }

        function setQues(string memory q) external onlyOwner {
            ques=q;
        }
        
        function getQues() public view returns(string memory){
            return ques;
        }

       function vote(string memory v) external returns (string memory) {
        if (keccak256(bytes(v)) == keccak256(bytes("a"))) {
            op1++;
            return "You have voted option a";
        } else if (keccak256(bytes(v)) == keccak256(bytes("b"))) {
            op2++;
            return "You have voted option b";
        } else {
            return "Wrong answer entered!! You have to vote only a or b";
        }
    }

     function getRes() public view returns (string memory) {
        return string(abi.encodePacked(ques, "\noption 1 votes are : ", op1.toString(), "\noption 2 votes are : ", op2.toString()));
    }
}
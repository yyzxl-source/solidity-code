// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
    uint256 public myNumber = 10;
}

contract DataTypes {
    uint256 public myUnit = 100;
    int256 public myInt = -50;
    bool public isActive = true;
    string public myString = "I am a String!";
    address public myAddress = msg.sender; //以太坊地址
}

contract Variables {
    uint256 public stateVar = 10;

    function myFunction() public  pure {
    }
}

contract FunctionContract {
    uint public myNumber;

    // 写入函数（修改状态变量，需要Gas）
    function setNumber(uint _num) public {
        myNumber = _num;
    }
    // 读取函数（view 关键字，不消耗Gas）
    function getNumber() public view returns (uint) {
        return myNumber;
    }
}

contract ConstantsAndModifiers{

    address public owner;

    constructor(){
        owner=msg.sender;
    }    
    // 修饰符
    modifier onlyOwner{
       require(owner==msg.sender,"you can't do that");
       _; //在函数执行之前执行
   }
   //修饰符表示在调用函数setOwner()时，在之前校验用户信息是否正确
   function setOwner(address _newOwner) public onlyOwner{
    owner=_newOwner;
   }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
    uint256 public myNumber = 10;
}

// 类型
contract DataTypes {
    uint256 public myUnit = 100;
    int256 public myInt = -50;
    bool public isActive = true;
    string public myString = "I am a String!";
    address public myAddress = msg.sender; //以太坊地址
}

// 全局变量与局部变量
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
// 修饰符
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
// 合约交易
contract PaymentContract{
    address public  owner;
    constructor(){
        owner=msg.sender;
    }

    //允许合约接受ETH
    receive() external payable { 
    }

    //提取合约余额
    function withdraw() public {
        require(msg.sender==owner, "you can't do that");
        address payable to =payable(owner);//转账地址
        uint256 amount= address(this).balance; // 转出总额
        to.transfer(amount);
    }

    //查询合约余额
    function getBalance() public view returns (uint){
        return address(this).balance;//获取地址余额
    }
}
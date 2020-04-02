pragma solidity ^0.6.4;

contract MappingStructExample {
    
    struct Payment {
        uint amount;
        uint timestamps;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    mapping(address => Balance) public balanceReceived;
    
    function geBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function sendMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value, now);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }
    
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[_to].totalBalance >= _amount, "Not enough founds");
        balanceReceived[_to].totalBalance -= _amount;
        _to.transfer(_amount);
    }
}

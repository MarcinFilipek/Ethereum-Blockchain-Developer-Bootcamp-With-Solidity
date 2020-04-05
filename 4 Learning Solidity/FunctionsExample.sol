pragma solidity ^0.6.4;

contract FunctionsExample {
    
    mapping (address => uint) public balanceReceived;
    
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function destroySmartContract() public {
        require(owner == msg.sender, "You are not the owner");
        selfdestruct(owner);
    }
    
    function getOwner() view public returns(address) {
        return owner;
    }
    
    function convertWeiToEth(uint _amountInwei) public pure returns(uint) {
        return _amountInwei / 1 ether;
    }
    
    function recieveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[_to] >= _amount, "You don't have enough ether!"); 
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[_to] -= _amount;
        _to.transfer(balanceReceived[_to]);
    }
    
    // The “fallback” function is called when no other function matches and no money is sent along.
    // The “receive” function matches when no other function matches and money is sent along.
    receive () external payable {
        recieveMoney();
    }
}

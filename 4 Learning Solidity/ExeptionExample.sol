pragma solidity ^0.6.4;

// require is use for input validation
// assert is for check internal states 

contract ExeptionExample {
    
    mapping (address => uint64) public balanceReceived;
    
    function recieveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }
    
    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(balanceReceived[_to] >= _amount, "You don't have enough ether!"); 
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[_to] -= _amount;
        _to.transfer(balanceReceived[_to]);
    }
}

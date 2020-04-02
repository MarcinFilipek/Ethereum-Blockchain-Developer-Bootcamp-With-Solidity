pragma solidity ^0.6.4;

contract StartStopUpdateExample {
    address owner;
    bool paused;
    
    constructor() public {
        owner = msg.sender;    
    }
    
    function sendMoney() public payable {
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner of contract.");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You are not the owner of contract.");
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);   
    }
    
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner of contract.");
        selfdestruct(_to);
    }
}

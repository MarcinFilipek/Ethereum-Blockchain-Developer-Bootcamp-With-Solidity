pragma solidity ^0.6.5;

contract InteractWithSmartContracts {
    
    uint public myUint = 10;
    
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
}

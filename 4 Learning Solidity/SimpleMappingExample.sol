pragma solidity ^0.6.4;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddresMapping;
    
    function setValue(uint _key) public {
        myMapping[_key] = true;
    }
    
    function setMyAddressToTrue() public {
        myAddresMapping[msg.sender] = true;
    } 
}

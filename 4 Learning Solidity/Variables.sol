pragma solidity ^0.6.4;

contract WorkingWithVariables {
    uint256 public myUint;
    
    function setMyUint(uint _myUnit) public {
        myUint = _myUnit;
    }
    
    bool public myBool;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUint8;
    
    function incrementUint() public {
        myUint8++;
    }
    
    function decrementUint() public {
        myUint8--;
    }
    
    address public myAddress;
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }
    
    string public myString = 'hello';
    
    function setMyString(string memory _string) public {
        myString = _string;
    }
}

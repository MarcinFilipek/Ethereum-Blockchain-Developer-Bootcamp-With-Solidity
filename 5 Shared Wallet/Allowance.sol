pragma solidity ^0.6.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract Allowance is Ownable {
    
    using SafeMath for uint;
    
    event AllowanceChanged( 
        address indexed _forWho, 
        address indexed _fromWho, 
        uint _oldAmount,
        uint _newAmount
    );
    
    mapping(address => uint) public allowance;
    
    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }
    
    function isOwner() internal view returns(bool) {
        if (owner() == msg.sender)
            return true;
        return false;
    }
    
    function addAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }
    
    function reduceAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
        allowance[_who] = allowance[_who].sub(_amount);
    }
}

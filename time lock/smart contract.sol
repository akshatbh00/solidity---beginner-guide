pragma solidity ^0.8.0;

contract TimeLock {
    address public owner;
    uint public lockTime;
    uint public creationTime;
    uint public totalAmount;
    mapping(address => bool) public beneficiaries;
    
    constructor(uint _lockTime, address[] memory _beneficiaries) payable {
        owner = msg.sender;
        lockTime = _lockTime;
        creationTime = block.timestamp;
        totalAmount = msg.value;
        
        for (uint i = 0; i < _beneficiaries.length; i++) {
            beneficiaries[_beneficiaries[i]] = true;
        }
    }

    function release() public {
        require(beneficiaries[msg.sender], "Only designated beneficiaries can release funds");
        require(block.timestamp >= creationTime + lockTime, "Lock period has not expired yet");
        uint amount = address(this).balance;
        require(amount > 0, "No ether to release");
        payable(msg.sender).transfer(amount);
    }

    function addBeneficiary(address _beneficiary) public {
        require(msg.sender == owner, "Only the owner can add beneficiaries");
        beneficiaries[_beneficiary] = true;
    }

    function removeBeneficiary(address _beneficiary) public {
        require(msg.sender == owner, "Only the owner can remove beneficiaries");
        beneficiaries[_beneficiary] = false;
    }

    function setLockTime(uint _newLockTime) public {
        require(msg.sender == owner, "Only the owner can set the lock time");
        require(block.timestamp < creationTime + lockTime, "Lock period has already expired");
        lockTime = _newLockTime;
    }

    function extendLockTime(uint _timeToAdd) public {
        require(msg.sender == owner, "Only the owner can extend the lock time");
        lockTime += _timeToAdd;
    }

    receive() external payable {
        totalAmount += msg.value;
    }
}

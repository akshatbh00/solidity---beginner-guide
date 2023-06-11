
pragma solidity ^0.8.0;

contract TimeLock {
    address public owner;
    uint public lockTime;
    uint public creationTime;
    uint public totalAmount;
    
    constructor(uint _lockTime) payable {
        owner = msg.sender;
        lockTime = _lockTime;
        creationTime = block.timestamp;
        totalAmount = msg.value;
    }

    function release() public {
        require(msg.sender == owner, "Only the owner can release funds");
        require(block.timestamp >= creationTime + lockTime, "Lock period has not expired yet");
        uint amount = address(this).balance;
        require(amount > 0, "No ether to release");
        payable(owner).transfer(amount);
    }

    receive() external payable {
        totalAmount += msg.value;
    }
}

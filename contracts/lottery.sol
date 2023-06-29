pragma solidity ^0.8.0;

contract Lottery {
    address public manager; // variable to store manager's address
    address payable[] public participants; // we are storing participant's address

    constructor() {
        manager = payable(msg.sender);
    }

    function enterLottery() public payable {
        // require(msg.value > 0.01 ether);
        participants.push(payable(msg.sender));
    }

    function pickWinner() public {
        // check only that the manager can call the pick winner function
        require(msg.sender == manager);

        // select a random participant
        uint index = random() % participants.length;

        participants[index].transfer(address(this).balance);

        participants = new address payable[](0);
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants)));
    }
}

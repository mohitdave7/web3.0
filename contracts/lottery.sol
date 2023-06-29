pragma solidity ^0.4.0;

contract Lottery {
    address public manager; // variable to store manager's address
    address[] public participants; // we are storing participant's address

    constructor() public {
        manager = msg.sender;
    }

    function enterLottery() public payable {
        // require(msg.value > 0.01 ether);
        participants.push(msg.sender);
    }

    function pickWinner() public {
        // check only that the manager can call the pick winner function
        require(msg.sender == manager);

        // select a random participant
        uint index = random() % participants.length;

        address  winner = (address(participants[index]));
        uint256 balance = address(this).balance;

        winner.transfer(balance);

        participants = new address[](0);
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants)));
    }
}

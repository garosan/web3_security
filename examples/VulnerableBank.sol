// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title VulnerableBank
 * @dev This contract is pseudocode from G.A.'s course, not to be used in production
 */

contract VulnerableBank {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external nonReentrant {
        uint256 balance = balances[msg.sender];
        require(balance >= _amount, "Insufficient balance");

        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Withdrawal failed");
        balances[msg.sender] = balance - amount;
    }

    function transfer(address _to, uint256 _amount) external {
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

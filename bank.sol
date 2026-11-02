
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BankAccount {

    // Store the account balance
    uint256 private balance;

    // Deposit money into the account
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");

        balance = balance + msg.value;
    }

    // Withdraw money from the account
    function withdraw(uint256 amount) public {

        require(amount > 0, "Amount must be greater than zero");
        require(amount <= balance, "Insufficient balance");

        balance = balance - amount;

        payable(msg.sender).transfer(amount);
    }

    // Show account balance
    function showBalance() public view returns (uint256) {
        return balance;
    }
}

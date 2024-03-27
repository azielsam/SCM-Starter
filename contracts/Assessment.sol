// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

contract Assessment {
    address payable public owner;
    uint256 public balance;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);

    struct Item {
        string name;
        uint256 price;
    }

    mapping(string => Item) private _items;

    event Buy(address indexed buyer, string item, uint256 price);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;

        _items["Dog"] = Item("Dog", 20);
        _items["Cat"] = Item("Cat", 150);
        _items["Fish"] = Item("Fish", 250);
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");

        // perform transaction
        balance += _amount;

        // assert transaction completed successfully
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdraw the given amount
        balance -= _withdrawAmount;

        // assert the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }

    function buy(string memory itemName) public {
        Item memory item = _items[itemName];
        require(bytes(item.name).length > 0, "Item not found");
        require(balance >= item.price, "Insufficient balance");

        // Perform purchase
        balance -= item.price;

        // Emit the Buy event
        emit Buy(msg.sender, itemName, item.price);
    }
}

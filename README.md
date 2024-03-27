# Assessment Contract

## Description
The Assessment contract is a simple smart contract written in Solidity. It allows users to deposit and withdraw funds, as well as buy predefined items using the deposited funds. The contract owner can manage the contract's balance and track transactions.

## Usage
### Deployment
Deploy the contract to an Ethereum-compatible blockchain using tools like Remix, Hardhat, or Truffle. Ensure to provide an initial balance upon deployment.

### Interacting with the Contract
1. **Deposit Funds**: Users can deposit Ether into the contract using the `deposit` function.
2. **Withdraw Funds**: Contract owner can withdraw Ether from the contract using the `withdraw` function. Only the owner can withdraw funds.
3. **Buy Items**: Users can buy predefined items such as Dog, Cat, or Fish using the `buy` function by specifying the item name.

## Contract Details
### Functions
- `getBalance()`: View function to retrieve the contract's current balance.
- `deposit(uint256 _amount)`: Allows users to deposit Ether into the contract.
- `withdraw(uint256 _withdrawAmount)`: Allows the contract owner to withdraw Ether from the contract.
- `buy(string memory itemName)`: Allows users to buy predefined items using their deposited funds.

### Events
- `Deposit(uint256 amount)`: Event emitted when funds are deposited into the contract.
- `Withdraw(uint256 amount)`: Event emitted when funds are withdrawn from the contract.
- `Buy(address indexed buyer, string item, uint256 price)`: Event emitted when a user buys an item.

### Struct
- `Item`: Struct representing an item available for purchase, containing the item name and its price.

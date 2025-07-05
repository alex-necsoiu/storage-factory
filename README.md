<!-- Banner / Logo -->
<p align="center">
  <img src="https://cdn.simpleicons.org/ethereum" alt="Ethereum Logo" width="100"/>
</p>

<h1 align="center">🚀 Ethereum Smart Contracts: From Fundamentals to Advanced — with Foundry & Solidity</h1>

<p align="center">
  <b>Modular Solidity project for experimenting with contract deployment, inheritance, storage patterns, and crowdfunding using <a href="https://getfoundry.sh/">Foundry</a>.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Solidity-0.8.30-blue.svg?logo=solidity" alt="Solidity Version"/>
  <img src="https://img.shields.io/badge/Foundry-%F0%9F%94%A5%20Forge-green?logo=data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMDAwMDAwIiBoZWlnaHQ9IjE2IiB2aWV3Qm94PSIwIDAgMTYgMTYiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNOCwwQzMuNTgyLDAuMDAwMDEyIDAsMy41ODIgMCw4QzAsMTIuNDE4IDMuNTgyLDE2IDgsMTZDMTIuNDE4LDE2IDE2LDEyLjQxOCAxNiw4QzE2LDMuNTgyIDEyLjQxOCwwIDgsMFogTTgsMUMxMS4zMDgsMSAxNSwxLjY5MiAxNSw4QzE1LDE0LjMwOCAxMS4zMDgsMTUgOCwxNUM0LjY5MiwxNSA0LDE0LjMwOCA0LDhDNCwxLjY5MiAxIDgsMVoiLz48L3N2Zz4=" alt="Foundry"/>
  <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License: MIT"/>
</p>

---

## 🚀 Overview

This repository demonstrates:
- 📦 Basic and advanced storage contracts
- 🧬 Inheritance and function overriding in Solidity
- 🏭 Factory pattern for deploying and managing multiple contract instances
- 💰 Crowdfunding contracts with price conversion
- 🔗 Chainlink price feed integration

---

## 📚 Contracts

### 🗃️ SimpleStorage
A basic contract for storing and retrieving a favorite number, as well as mapping names to numbers.
- Store and retrieve a single `uint256` value
- Add people with a name and favorite number
- Public mapping for quick lookup by name

### ➕ AddFiveStorage
Extends `SimpleStorage` and overrides the `store` function to always add 5 to the input value before storing.
- Demonstrates Solidity inheritance and function overriding

### 🏭 StorageFactory
A factory contract for deploying and interacting with multiple `SimpleStorage` contracts.
- Deploys new `SimpleStorage` instances
- Stores and retrieves values from any deployed instance by index

### 💰 FundMe
A crowdfunding contract that allows users to fund with ETH and withdraw funds (owner only).
- Minimum funding amount of $5 USD (converted from ETH)
- Chainlink price feed integration for real-time ETH/USD conversion
- Owner-only withdrawal functionality
- Automatic funding via receive() and fallback() functions

### 🔗 PriceConverter
A library for converting ETH amounts to USD using Chainlink price feeds.
- Real-time price conversion from ETH to USD
- Integration with Chainlink AggregatorV3Interface
- Gas-efficient price calculations

---

## 🗂️ Directory Structure

```
src/
  storage/
    AddFiveStorage.sol      # Inherits from SimpleStorage, overrides store()
    SimpleStorage.sol       # Basic storage contract
    StorageFactory.sol      # Factory for deploying/interacting with SimpleStorage
  foundMe/
    FundMe.sol             # Crowdfunding contract with price conversion
    PriceConverter.sol     # Library for ETH/USD price conversion
script/
  DeploySimpleStorage.s.sol # Example deployment script
```

---

## 📖 Documentation

- [Foundry Book](https://book.getfoundry.sh/)
- [Chainlink Documentation](https://docs.chain.link/)

---

## 🛠️ Usage

### 🏗️ Build

```sh
forge build
```

### 🧪 Test

```sh
forge test
```

### 🎨 Format

```sh
forge fmt
```

### ⛽ Gas Snapshots

```sh
forge snapshot
```

### 🦄 Anvil (Local Node)

```sh
anvil
```

### 🚀 Deploy Example

```sh
forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### 🧰 Cast

```sh
cast <subcommand>
```


### 🆘 Help

```sh
forge --help
anvil --help
cast --help
```

---

<p align="center">
  <sub>Inspired by the <a href="https://github.com/Cyfrin/foundry-full-course-cu">Cyfrin Foundry Full Course</a> 📚</sub>
</p>

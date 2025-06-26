// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30; 

// Importing the SimpleStorage contract definition from the local file
import {SimpleStorage} from "./SimpleStorage.sol";

// This contract acts as a factory for deploying and interacting with multiple SimpleStorage contracts
contract StorageFactory {
    
    // Array to hold addresses (instances) of deployed SimpleStorage contracts
    SimpleStorage[] public listOfSimpleStorageContracts;

    // Function to deploy a new SimpleStorage contract and store its address in the array
    function createSimpleStorageContract() public {
        // Deploy a new instance of the SimpleStorage contract
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();

        // Add the new contract to the list
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);
    }

    // Allows you to call the 'store' function on a specific SimpleStorage contract
    // _simpleStorageIndex: index of the contract in the array
    // _simpleStorageNumber: number to be stored in that contract
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Calls the store function on the selected contract using its index
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    // Reads the stored number from a specific SimpleStorage contract
    // _simpleStorageIndex: index of the contract in the array
    // Returns the stored uint256 value
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // Calls the retrieve function on the selected contract and returns the result
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}

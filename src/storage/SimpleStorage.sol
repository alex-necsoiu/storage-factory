// SPDX-License-Identifier: MIT
pragma solidity 0.8.30; 

// Example of a simple storage contract
contract SimpleStorage {
    // Declares a state variable to store a favorite number
    uint256 myFavoriteNumber;

    // Defines a struct named Person with two fields: favoriteNumber and name
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Declares a dynamic array of Person structs
    Person[] public listOfPeople;

    // A public mapping from a person's name to their favorite number
    // This allows quick lookup of stored values by name
    mapping(string => uint256) public nameToFavoriteNumber;

    // Stores a given number in the myFavoriteNumber state variable
    // The function is marked 'virtual' to allow it to be overridden in derived contracts
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    // View function that reads the state without modifying it
    // Returns the currently stored favorite number
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // Adds a new Person to the listOfPeople array
    // Also updates the mapping with the person's name and favorite number
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// Empty placeholder contracts (could be used for inheritance or testing purposes)
contract SimpleStorage2 {}
contract SimpleStorage3 {}
contract SimpleStorage4 {}

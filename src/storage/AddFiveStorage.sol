// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

import {SimpleStorage} from "./SimpleStorage.sol";

// Inherence in Solidity AddFiveStorage inherits functions from SimpleStorage
// Function stores has the ability to overrride the initial SimpleStorage.store() function becaus is  defined as: virtual
contract AddFiveStorage is SimpleStorage {
    function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
}
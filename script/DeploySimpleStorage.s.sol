// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import "forge-std/Script.sol";
import {SimpleStorage} from "../src/storage/SimpleStorage.sol";
import {StorageFactory} from "../src/storage/StorageFactory.sol";
import {AddFiveStorage} from "../src/storage/AddFiveStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external {
        vm.startBroadcast();
        new SimpleStorage();
        vm.stopBroadcast();
    }
}

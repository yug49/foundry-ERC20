// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {TokenDew} from "../src/TokenDew.sol";

contract DeployTokenDew is Script{
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(TokenDew){
        vm.startBroadcast();
        TokenDew td = new TokenDew(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return td;
    }
}
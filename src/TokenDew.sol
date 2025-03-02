// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {console} from "../lib/forge-std/src/Script.sol";

contract TokenDew is ERC20 {
    
    constructor(uint256 totalSupply) ERC20 ("TokenDew", "TD"){
        console.log("voila", msg.sender);
        _mint(msg.sender, totalSupply);
    }
}
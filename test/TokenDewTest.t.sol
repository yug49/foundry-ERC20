// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployTokenDew} from "../script/DeployTokenDew.s.sol";
import {TokenDew} from "../src/TokenDew.sol";

contract TokenDewTest is Test{
    TokenDew public tokenDew;
    DeployTokenDew public deployer;

    uint256 public constant STARTING_BALANCE = 100 ether;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        deployer = new DeployTokenDew();
        tokenDew = deployer.run();

        vm.prank(address(msg.sender));
        tokenDew.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(STARTING_BALANCE, tokenDew.balanceOf(bob));
    }

    function testAllownancesWorks() public {
        // tranferFrom
        uint256 initialAllowance = 1000;

        //Bob approves alice to spend tokens on her behalf
        vm.prank(bob);
        tokenDew.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        tokenDew.transferFrom(bob, alice, transferAmount);

        assertEq(tokenDew.balanceOf(alice), transferAmount);
        assertEq(tokenDew.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
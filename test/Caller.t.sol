// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console } from "forge-std/Test.sol";
import { Caller } from "../src/Caller.sol";
import { TargetContract } from "../src/TargetContract.sol";
import { DelegateCaller } from "../src/DelegateCall.sol";
import { StaticCaller } from "../src/staticcall.sol";

contract CounterTest is Test {
    TargetContract public targetContract;
    // Caller public caller;
    DelegateCaller public delegateCaller;
    StaticCaller public staticCaller;

    function setUp() public {
        targetContract = new TargetContract();
        // caller = new Caller();
        delegateCaller = new DelegateCaller();
        staticCaller = new StaticCaller();
    }

    function test_callSetNumber() public {
        delegateCaller.callSetNumber(address(targetContract), 1000);
        console.log("==== targetContract ======");
        uint256 a = targetContract.number();
        console.log(a);
        console.log("===== delegateCaller =====");
        console.log(delegateCaller.number());
    }

    function test_callInCrease() public {
        delegateCaller.callIncrement(address(targetContract));
        console.log("==== targetContract ======");
        console.log(targetContract.number());
        console.log("==== delegateCaller ======");
        console.log(delegateCaller.number());
    }

    function test_StaticCaller() public {
       uint256 a = staticCaller.readNumber(address(targetContract));
       console.log("===== staticCaller ====");
       console.log(a);
    }

}

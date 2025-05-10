// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console } from "forge-std/Test.sol";
import { FunctionSelector } from "../src/FunctionSelector.sol";

contract CounterTest is Test {
    FunctionSelector public functionSelector;

    function setUp() public {
        functionSelector = new FunctionSelector();
    }

    function test_encodeCase() public view {
        bytes memory functionbytes = functionSelector.encodeCase(100, "theweb3");
        console.log("=== encodeCase ===");
        console.logBytes(functionbytes);
        console.log("=== encodeCase ===");
    }

    function test_encodePacked() public view {
        bytes memory functionbytes = functionSelector.encodePackedCase(1, "hello");
        console.log("=== encodePacked ===");
        console.logBytes(functionbytes);
        console.log("=== encodePacked ===");
    }

    function test_encodeSelector() public view {
        bytes memory functionbytes = functionSelector.encodeWithSelector(msg.sender, 10000);
        console.log("===encodeSelector===");
        console.logBytes(functionbytes);
        console.log("===encodeSelector===");
    }

    function test_encodeWithSignature() public view {
        bytes memory functionbytes = functionSelector.encodeWithSignature(msg.sender, 10000);
        console.log("===encodeWithSignature===");
        console.logBytes(functionbytes);
        console.log("===encodeWithSignature===");
    }
}

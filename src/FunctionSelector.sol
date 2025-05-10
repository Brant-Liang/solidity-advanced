// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract FunctionSelector {
    /**
     * encodeCase(1, "theweb3")
     * 0000000000000000000000000000000000000000000000000000000000000064
     * 0000000000000000000000000000000000000000000000000000000000000040
     * 0000000000000000000000000000000000000000000000000000000000000007
     * 7468657765623300000000000000000000000000000000000000000000000000
     */
    function encodeCase(uint256 a, string memory bstr) public pure returns (bytes memory) {
        return abi.encode(a, bstr);
    }

    // 0x000000000000000000000000000000000000000000000000000000000000000168656c6c6f
    function encodePackedCase(uint256 a, string memory bstr) public pure returns (bytes memory) {
        return abi.encodePacked(a, bstr);
    }

    //  0x9d61d234
    // 0000000000000000000000001804c8ab1f12e6bbf3894d4083f33e07309d1f38
    //                         1804c8ab1f12e6bbf3894d4083f33e07309d1f38
    // 0000000000000000000000000000000000000000000000000000000000002710
    function encodeWithSelector(address a, uint256 b) public pure returns (bytes memory) {
        return abi.encodeWithSelector(bytes4(keccak256("transfer(address, uint256)")), a, b);
    }

    // [4 bytes 函数 selector][32 bytes 参数1][32 bytes 参数2]
    // 0x9d61d234  函数选择器 
    // 0000000000000000000000001804c8ab1f12e6bbf3894d4083f33e07309d1f38  recipient
    // 0000000000000000000000000000000000000000000000000000000000002710  amount
    function encodeWithSignature(address recipient, uint256 amount) public pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address, uint256)", recipient, amount);
    }
}

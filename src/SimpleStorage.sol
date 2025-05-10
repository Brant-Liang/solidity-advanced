// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Factory {
    event Deployed(address addr);

    function deploy(bytes32 salt, bytes memory bytecode) public returns (address) {
        address addr;
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
        require(addr != address(0), "Deploy failed");
        emit Deployed(addr);
        return addr;
    }

    function computeAddress(bytes32 salt, bytes memory bytecode) public view returns (address) {
        return address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xFF),
            address(this),
            salt,
            keccak256(bytecode)
        )))));
    }
}
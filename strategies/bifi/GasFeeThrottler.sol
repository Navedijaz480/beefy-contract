// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IGasPrice {
    function maxGasPrice() external returns (uint);
}

contract GasFeeThrottler {

    bool public shouldGasThrottle = true;

    address public gasprice = address(0xA43509661141F254F54D9A326E8Ec851A0b95307);


function isContract(address _addr) internal view returns (bool) {
    uint32 size;
    assembly {
        size := extcodesize(_addr)
    }
    return (size > 0);
}
    modifier gasThrottle() {
//         if (shouldGasThrottle && Address.isContract(gasprice)) {
//             require(tx.gasprice <= IGasPrice(gasprice).maxGasPrice(), "gas is too high!");
//         }
if (shouldGasThrottle && isContract(gasprice)) {
        require(tx.gasprice <= IGasPrice(gasprice).maxGasPrice(), "gas is too high!");
    }
    _;

}


    }

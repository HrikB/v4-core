// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {IProtocolFeeController} from "../interfaces/IProtocolFeeController.sol";
import {IPoolManager} from "../interfaces/IPoolManager.sol";
import {PoolId, PoolIdLibrary} from "../types/PoolId.sol";
import {PoolKey} from "../types/PoolKey.sol";

contract ProtocolFeeControllerTest is IProtocolFeeController {
    using PoolIdLibrary for PoolKey;

    mapping(PoolId => uint16) public swapFeeForPool;
    mapping(PoolId => uint16) public withdrawFeeForPool;

    uint16 private constant MAX_FEE_DENOMINATOR = 0xFFF;

    function protocolFeesForPool(PoolKey memory key) external view returns (uint16, uint16) {
        return (swapFeeForPool[key.toId()], withdrawFeeForPool[key.toId()]);
    }

    // for tests to set pool protocol fees
    function setSwapFeeForPool(PoolId id, uint16 fee) external {
        swapFeeForPool[id] = fee;
    }

    function setWithdrawFeeForPool(PoolId id, uint16 fee) external {
        withdrawFeeForPool[id] = fee;
    }
}

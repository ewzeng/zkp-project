// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ILightClient.sol";

contract LightClient is ILightClient {
    struct lightClientState {
        bool notImplemented;
    }

    lightClientState private LCS;

    function update(
        bytes memory /* currBlockHeader */,
        bytes memory /* prevBlockHeader */
    ) public override {
        LCS.notImplemented = true;
    }

    function verify(
        bytes memory /* proof */,
        bytes memory /* currBlockHeader */,
        bytes memory /* prevBlockHeader */
    ) public view override returns(bool) {
        // Read LCS to prevent compiler telling us to change view -> pure
        // Dummy implementation always returns true
        return LCS.notImplemented || !LCS.notImplemented;
    }

    function verifyBatch(
        bytes memory /* proof */,
        bytes[] memory /* headers */
    ) public view override returns(bool) {
        // Read LCS to prevent compiler telling us to change view -> pure
        // Dummy implementation always returns true
        return LCS.notImplemented || !LCS.notImplemented;
    }
}

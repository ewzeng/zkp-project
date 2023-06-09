// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


library LightClientWithSkip {
    struct lightClientState {
        bool notImplemented;
    }

    function update(
        lightClientState storage LCS,
        bytes memory /* currBlockHeader */,
        bytes memory /* prevBlockHeader */,
        bytes memory /* syncCommittee */,
        bytes memory /* syncCommitteeProof */
    ) public {
        LCS.notImplemented = true;
    }

    function verify(
        bytes memory /* proof */,
        lightClientState storage LCS,
        bytes memory /* currBlockHeader */,
        bytes memory /* prevBlockHeader */,
        bytes memory /* syncCommittee */,
        bytes memory /* syncCommitteeProof */
    ) public view returns(bool) {
        // Read LCS to prevent compiler telling us to change view -> pure
        // Dummy implementation always returns true
        return LCS.notImplemented || !LCS.notImplemented;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


library SourceChain {
    function getBlockHeaderFields(
        bytes memory blockHeader
    ) public pure returns(
        bytes32 prevBlockHash,
        uint256 blockNumber,
        bytes memory syncCommittee
    ) {
        bytes32 blockNumberBytes;
        // prevBlockHash is located at bytes 32 + [0:32] and blockNumber
        // is located at 32 + [468:500] because we need to skip the first
        // 32 bytes (reserved for the length of the byte string).
        /* solium-disable-next-line */
        assembly {
            prevBlockHash := mload(add(blockHeader, 32))
            blockNumberBytes := mload(add(blockHeader, 500))
        }
        blockNumber = uint256(blockNumberBytes);
        // TODO Get syncCommittee
        syncCommittee = bytes("TODO");
    }

    function getBlockHeaderHash(
        bytes memory blockHeader
    ) public pure returns(bytes32) {
        return keccak256(blockHeader);
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

enum Action {
    Create,
    Mint
}

struct Message {
    Action action;
    bytes payload;
}

struct CreatePayload {
    bytes32 assetID;
    string name;
    string symbol;
    uint8 decimals;
}

struct MintPayload {
    bytes32 assetID;
    address recipient;
    uint256 amount;
}

contract MessageDecoder {
  event log_named_uint(string name, uint256 gas);

  function decode(bytes memory message) external {
    uint256 cp1 = gasleft();

    Message memory dm = abi.decode(message, (Message));
    if(dm.action == Action.Create) {
      abi.decode(dm.payload, (CreatePayload));
    } else if (dm.action == Action.Mint) {
      abi.decode(dm.payload, (MintPayload));
    }
    else {
      revert("Unknown action.");
    }

    uint256 cp2 = gasleft();
    emit log_named_uint("Gas used:", cp1 - cp2);
  }
}

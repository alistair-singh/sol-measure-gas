// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Decoder.sol";

contract MessageDecoderTest is Test {
  MessageDecoder decoder;

  function setUp() public {
    decoder = new MessageDecoder();
  }

  function testCreatePayloadWithMetadata() public {
    CreatePayload memory payload;
    payload.assetID = 0xFF000000000000000000000000000000000000000000000000000000000000AB;
    payload.name = "Uniswap";
    payload.symbol = "UNI";
    payload.decimals = 18;

    Message memory m;
    m.action = Action.Create;
    m.payload = abi.encode(payload);

    bytes memory message = abi.encode(m);
    decoder.decode(message);
  }

  function testCreatePayloadWithMetadata2() public {
    CreatePayload memory payload;
    payload.assetID = 0xFF000000000000000000000000000000000000000000000000000000000000AB;
    payload.name = "Xxxxxxx";
    payload.symbol = "XXX";
    payload.decimals = 10;

    Message memory m;
    m.action = Action.Create;
    m.payload = abi.encode(payload);

    bytes memory message = abi.encode(m);
    decoder.decode(message);
  }

  function testCreatePayloadWithoutMetadata() public {
    CreatePayload memory payload;
    payload.assetID = 0xFF000000000000000000000000000000000000000000000000000000000000AB;
    payload.name = "";
    payload.symbol = "";
    payload.decimals = 18;

    Message memory m;
    m.action = Action.Create;
    m.payload = abi.encode(payload);

    bytes memory message = abi.encode(m);
    decoder.decode(message);
  }

  function testMintPayloadDecode() public {
    MintPayload memory payload;
    payload.assetID = 0xFF000000000000000000000000000000000000000000000000000000000000AB;
    payload.recipient = 0x00000000000000000000000000000000000000AB;
    payload.amount = 10;

    Message memory m;
    m.action = Action.Mint;
    m.payload = abi.encode(payload);

    bytes memory message = abi.encode(m);
    decoder.decode(message);
  }
}

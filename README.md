
# Gas Measurement

```sh
forge test -vv --gas-report
[⠆] Compiling...
No files changed, compilation skipped

Running 4 tests for test/Decoder.t.sol:MessageDecoderTest
[PASS] testCreatePayloadWithMetadata() (gas: 14175)
Logs:
  Gas used:: 3097

[PASS] testCreatePayloadWithMetadata2() (gas: 14187)
Logs:
  Gas used:: 3097

[PASS] testCreatePayloadWithoutMetadata() (gas: 13402)
Logs:
  Gas used:: 2761

[PASS] testMintPayloadDecode() (gas: 10877)
Logs:
  Gas used:: 1435

Test result: ok. 4 passed; 0 failed; finished in 2.44ms
| src/Decoder.sol:MessageDecoder contract |                 |      |        |      |         |
|-----------------------------------------|-----------------|------|--------|------|---------|
| Deployment Cost                         | Deployment Size |      |        |      |         |
| 276518                                  | 1413            |      |        |      |         |
| Function Name                           | min             | avg  | median | max  | # calls |
| decode                                  | 4051            | 5235 | 5571   | 5746 | 4       |


```

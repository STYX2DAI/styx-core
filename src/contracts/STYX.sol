pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract STYX is ERC20 {
    constructor() public ERC20("STYX Token", "STYX") {
      _mint(msg.sender, 1000000000000000000000000);
    }
}

pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/presets/ERC20PresetMinterPauser.sol";

contract TokenFarm is ChainlinkClient, Ownable {
    string public name = "STYX Token Farm";
    ERC20PresetMinterPauser public STYX;

    address[] public stakers;
    // token > address
    mapping(address => mapping(address => uint256)) public stakingBalance;
    mapping(address => uint256) public uniqueTokensStaked;

    constructor(address _STYXAddress) public {
        STYX = ERC20PresetMinterPauser(_STYXAddress);
    }

    function stakeTokens(uint256 _amount, address token) public {
        require(_amount > 0, "amount cannot be 0");
        updateUniqueTokensStaked(msg.sender, token);
        IERC20(token).transferFrom(msg.sender, address(this), _amount);
        stakingBalance[token][msg.sender] = stakingBalance[token][msg.sender] + _amount;
        if (uniqueTokensStaked[msg.sender] == 1) {
            stakers.push(msg.sender);
        }

        issueTokens(msg.sender, _amount);
    }

    function unstakeTokens(address token) public {
        uint256 balance = stakingBalance[token][msg.sender];
        require(balance > 0, "staking balance cannot be 0");
        IERC20(token).transfer(msg.sender, balance);
        stakingBalance[token][msg.sender] = 0;
        uniqueTokensStaked[msg.sender] = uniqueTokensStaked[msg.sender] - 1;

        // uint256 balanceSTYX = STYX.balanceOf(msg.sender);
        // STYX.approve(address(this), balanceSTYX);
        // STYX.transferFrom(msg.sender, address(this), balanceSTYX);
        // burnTokens(msg.sender);

        uint256 balanceSTYX = STYX.balanceOf(address(msg.sender));
        STYX.transferFrom(msg.sender, address(this), balanceSTYX);
    }

    function updateUniqueTokensStaked(address user, address token) internal {
        if (stakingBalance[token][user] <= 0) {
            uniqueTokensStaked[user] = uniqueTokensStaked[user] + 1;
        }
    }

    function issueTokens(address recipient, uint256 amount) internal {
        // STYX.mint(recipient, getStyxPrice());
        STYX.transfer(recipient, getStyxPrice(amount));
    }

    // function burnTokens(address recipient) internal {
    //     // STYX.transfer(recipient, getStyxPrice());
    //     // STYX.burn(recipient, getStyxPrice());
    // }

    function getStyxPrice(uint256 amount) public view returns (uint256) {
        // address priceFeedAddress_DAI_USD = 0x777A68032a88E5A84678A77Af2CD65A7b3c0775a;
        // address priceFeedAddress_EUR_USD = 0x0c15Ab9A0DB086e062194c273CC79f41597Bbf13;

        AggregatorV3Interface priceFeed_DAI_USD = AggregatorV3Interface(0x777A68032a88E5A84678A77Af2CD65A7b3c0775a);
        (
            uint80 roundID_DAI_USD,
            int256 price_DAI_USD,
            uint256 startedAt_DAI_USD,
            uint256 timeStamp_DAI_USD,
            uint80 answeredInRound_DAI_USD
        ) = priceFeed_DAI_USD.latestRoundData();

        AggregatorV3Interface priceFeed_EUR_USD = AggregatorV3Interface(0x0c15Ab9A0DB086e062194c273CC79f41597Bbf13);
        (
            uint80 roundID_EUR_USD,
            int256 price_EUR_USD,
            uint256 startedAt_EUR_USD,
            uint256 timeStamp_EUR_USD,
            uint80 answeredInRound_EUR_USD
        ) = priceFeed_EUR_USD.latestRoundData();

        // 1 euro = x DAI

        // uint256 calc_EUR_USD = uint256(price_EUR_USD * (10**10));
        // uint256 calc_DAI_USD = uint256(price_DAI_USD * (10**10));
        // uint256 price = (calc_EUR_USD / calc_DAI_USD);

        // return amount * price;

        return amount * (uint256(price_EUR_USD * (10**10)) / uint256(price_DAI_USD * (10**10)));
    }
}

// 116217500/106217500
// 1,0941464448

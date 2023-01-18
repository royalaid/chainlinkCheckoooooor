// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import "./interfaces/IChainlinkFeed.sol";

contract CounterScript is Script {
    IChainlinkFeed feed;

    function setUp() public {
        feed = IChainlinkFeed(0xDE31F8bFBD8c84b5360CFACCa3539B938dd78ae6);
    }

    function run() public {
        vm.startBroadcast();
        (,int256 answer,,,) = feed.latestRoundData();
        console.log("Latest Round:");
        console.logInt(answer);
        console.log("Latest Answer:");
        console.logInt(feed.latestAnswer());
        console.log("Current Blocktimestamp:");
        console.log(block.timestamp);
        vm.stopBroadcast();
    }
}

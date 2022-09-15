// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//import directly from github
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    //constructor(){priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e)}
    uint public minimumUSD = 50 * 1e18;
    //sets minimum amount someone can fund

//let's keep track of the people who send us money
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable{
        //msg.value is considered the parameter for getConversionRate
        //additional parameters can get put in the paratheses though
        require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough");
        //but let's convert it
        //msg.value is ethereum
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value
    }


    

    //function withdraw(){}
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//import directly from github


contract FundMe{
    //constructor(){priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e)}
    uint public minimumUSD = 50;
    //sets minimum amount someone can fund
    function fund() public payable{

        require(msg.value >= minimumUSD, "Didn't send enough");
        //but let's convert it
    }
    function getPrice() public{
        //abi - how? interface
        //Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

//destructor by looking at github and on using data example on chainlink page too
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e)
        (,int price,,) =  priceFeed.latestRoundData();
        
        //we can convert the int to uint easily like this. remember
        //solidity doesn't do decimal places
        //make sure the numbers become the same. 
        return uint256(price * 1e10); // 1 ** 10 == 1000000000

        //Goerli Testnet is now recommended
        //Rinkeby Testnet is Deprecated!
    }
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e)
        return priceFeed.version();
    }
    function getConversionRate() public {}

    //function withdraw(){}
}

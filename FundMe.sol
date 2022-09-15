// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//import directly from github


contract FundMe{
    //constructor(){priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e)}
    uint public minimumUSD = 50 * 1e18;
    //sets minimum amount someone can fund

//let's keep track of the people who send us money
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable{

        require(getConversionRate(msg.value) >= minimumUSD, "Didn't send enough");
        //but let's convert it
        //msg.value is ethereum
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value
    }


    function getPrice() public view returns(uint256){
        //abi - how? interface
        //Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //destructor by looking at github and on using data example on chainlink page too
        
        
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) =  priceFeed.latestRoundData();         
        return uint256(price * 1e10); // 1 ** 10 == 1000000000
            
            //return in USD
            //these commas were important and needed to match in number and placement
            //we can convert the int to uint easily like this. remember
            //solidity doesn't do decimal places
            //make sure the numbers become the same.
            //Goerli Testnet is now recommended
            //Rinkeby Testnet is Deprecated!
    }



    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }


    function getConversionRate(uint256 ethAmount) public view returns (uint256){
         uint256 ethPrice = getPrice();

        //3000 $ -> 3000_000000000000000000 ETH / USD
        //1_000000000000000000 ETH
        //2000.9999999...
        //so it is 3000 dollars
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
        //always multiple before dividing

    //function withdraw(){}
}

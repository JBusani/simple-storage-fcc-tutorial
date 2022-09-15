// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import directly from github
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    //constructor(){priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e)}
    uint public constant MINIMUM_USD = 50 * 1e18;
    //sets minimum amount someone can fund

//let's keep track of the people who send us money
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    constructor(){
        i_owner = msg.sender;//person who deployed it.
    }
    function fund() public payable{
        //msg.value is considered the parameter for getConversionRate
        //additional parameters can get put in the paratheses though
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough");
        //but let's convert it
        //msg.value is ethereum
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }


    function withdraw() public onlyOwner {
        /*require(msg.sender == owner, "Sender is not owner!");
        this almost acts like if and return if not to exit funciton early*/

        //we will loop and remove values from address back to 0 after withdrawing
        //use a for loop
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        // the 0 says without any objects in it.
        funders = new address[](0);
        /*actually withdraw the funds
            3 WAYS
            1. transfer
                //msg.sender = address
                //payable(msg.sender) = payable address
                payable(msg.sender).transfer(address(this).balance);
            2. send
            bool sendSuccess = payable(msg.sender).send(address(this.)balance);
            require(sendSuccess, "Send failed");

            3. call
            can call any function in all of Ethereum without ABIs
            (bool callSuccess, bytes memory dataReturned)= payable(msg.sender).call{value: address(this).balance}("")*/

            (bool callSuccess, )= payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess, "Call failed");
    }
    modifier onlyOwner{
        require(msg.sender == i_owner, "Sender is not owner!");
        _;
        /*underscore tells us when to run the rest of the code in the function
        so if it was first then the code in the withdraw function for example 
        would run first, and then the require runs. that's not what we want.
        similar to a spread operator*/
    }
}

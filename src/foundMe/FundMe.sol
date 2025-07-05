// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./PriceConverter.sol";
import {AggregatorV3Interface} from "@chainlink/contracts@1.4.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


error NotOwner();
error NotEnothEth();
error CallFailled();

//Cost 863631 gas
contract FundMe {
   
   
    mapping(address => uint256 amountFunded) public addressToAmount;
    AggregatorV3Interface public priceFeed;
    uint256 public constant MIN_AMOUNT_USD =  5 * 1e18; // $5 in 18 decimals 
    using PriceConverter for uint256;
    address[] public funders;
   
    address public immutable i_owner; 

    constructor() {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        i_owner = msg.sender;
    }

    function fund() public payable {
        uint256 converted = msg.value.getConversionRate(priceFeed);
        if(converted < MIN_AMOUNT_USD){revert NotEnothEth();}
        // require(converted >= MIN_AMOUNT_USD, "Not enough ETH");
        funders.push(msg.sender);
        addressToAmount[msg.sender]+= msg.value;
    }

        // Helper for debugging
    function getConversion(uint256 ethAmount) public view returns (uint256) {
        return ethAmount.getConversionRate(priceFeed);
    }
    function withdraw() public onlyOwner{ 
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address fumder = funders[funderIndex];
            addressToAmount[fumder] = 0;
        }
        // Reset the array
        funders = new  address[](0);

        // Transfer balance to an address, reverts if the tx fails 
        // payable(msg.sender).transfer(address(this).balance);

        // Send balance to an address returns a boolean if fails but not revert
        // bool sendSucces = payable(msg.sender).send(address(this).balance);
        // require(sendSucces, "Send failed");

        // Call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        if(callSuccess != true){revert CallFailled();}
    } 

    modifier onlyOwner() {
        if(msg.sender != i_owner){revert NotOwner();}
        //require(msg.sender == i_owner, "Not the owner"); 
        _; // executes the code above and returns to the initial function withdraw() *** Order is important!
        }


     receive() external payable {fund(); }  
     fallback() external payable { fund();} 
}

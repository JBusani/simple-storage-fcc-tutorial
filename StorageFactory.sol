//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import  "./SimpleStorage.sol";


//this factory is like a top level component with simple storage file as it's smaller component we are just reusing to create new contracts and save them in the factory. Each create contract has all the funcitons and variables included so we don't have to recreate them in the factory too. 
//SimpleStorage is an object. Factory copies the object at will.
contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;
    //type of elements - public - name of variable

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //always need address of contract and ABI - Application Binary Interface
        //address is in the simpleStorageArray
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
        //Use the SimpleStorage type to create a new variable setup, get the address.
        //refactor - simpleStorage.store(_simpleStorageNumber);
        //now we have that address contract so let's call the store function and store the number
    
        //set it / update it
    
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        //view remember means just reading.
        return simpleStorageArray[_simpleStorageIndex].retrieve();

        //get that number
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


contract ExtraStorage is SimpleStorage{
    //inherit everything from SimpleStorage
    //like React class inheritance and this.super constructors

    //lets alter a function. the store function;

    //+ 5 to any number we give

    //how?

    //override it
    // there's also virtual override option


    //if Simple Storage file also has matching function, you need to specify an override
    //also, you must go to simple storage file and type virtual next to the public
    //because that makes it overridable.

    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}

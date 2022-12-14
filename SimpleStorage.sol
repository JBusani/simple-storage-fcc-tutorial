// SPDX-License-Identifier: MIT
//EVM = Ethereum Virtual Machine


pragma solidity ^0.8.8;


    // pragma solidity ^0.8.0;
    // pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    //boolean, uint (unsigned integer - a whole number and non negative), int (positive or negative whole number, address, bytes

    //gets initialized to zero auto
  uint256 favoriteNumber;

  function store(uint256 _favoriteNumber) public {
      favoriteNumber = _favoriteNumber;
  }
  
      mapping(string => uint256) public nameToFavoriteNumber;

  
      //People public person = People({favoriteNumber: 2, name: "Jake"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }//putting a ; here caused an error. interesting.


    //arrays
    //uint256[] public favoriteNumberList;
    //this is a dynamic array becuase size isn't predetermined
    People[] public people;//it's empty. add a function


  //view, pure
  //view = just read state, can't update anything
  //pure = can't update and can't read from blockchain state

  function retrievel() public view returns(uint256){
      return favoriteNumber;
  }

  function add() public pure returns (uint256){
      return (1+1);
  }

//calldata, memory, storage
//calldata = temp variable we can't alter
//memory = temp variable we can alter
//storage = permanent variable that can be modified

  function addPerson(string memory _name, uint256 _favoriteNumber) public {
      people.push(People(_favoriteNumber, _name));
      nameToFavoriteNumber[_name] = _favoriteNumber;

  }//putting a ; here got an error too. so unlike JavaScript


//contract address @: 0xd9145CCE52D386f254917e481eB44e9943F39138
//smart contracts have addresses too like our metamask does
}

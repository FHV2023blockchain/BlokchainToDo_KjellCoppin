// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CustomContract {
  string[] public toDoList;
  
  constructor() { }

  function addTodo(string memory todo) payable external {
    toDoList.push(todo);
  }

  function getAllTodos() public view returns (string memory) {
    string memory allTodos;
    for (uint256 i = 0; i < toDoList.length; i++) {
      allTodos = string(abi.encodePacked(allTodos, uintToString(i), ": ", toDoList[i], "\n"));
    }
    return allTodos;
  }

  function completeTodo(uint256 index) payable external {
    require(index < toDoList.length, "Index out of bounds");
    for (uint256 i = index; i < toDoList.length - 1; i++) {
      toDoList[i] = toDoList[i + 1];
    }
    toDoList.pop();
  }

  // Helper function to convert uint to string
  function uintToString(uint256 v) internal pure returns (string memory) {
    if (v == 0) return "0";
    uint256 maxlength = 100;
    bytes memory reversed = new bytes(maxlength);
    uint256 i = 0;
    while (v != 0) {
      uint256 remainder = v % 10;
      v = v / 10;
      reversed[i++] = bytes1(uint8(48 + remainder));
    }
    bytes memory s = new bytes(i);
    for (uint256 j = 0; j < i; j++) {
      s[j] = reversed[i - 1 - j];
    }
    return string(s);
  }
}

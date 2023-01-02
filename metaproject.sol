// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract onlyOwner {
    address owner;

    constructor() {
        owner=msg.sender;
    }
//sendEth function use to send eth to contract.
    function sendEth() public payable {
        if(msg.value<= 1 ether ){
            revert("amt should be greater than 1 eth");
        }

    }
//this function use to get balance of contract.
    function getBalance() public view returns(uint){
        require(owner==msg.sender,"only Owner can call this");
        return address(this).balance;
    }
//This function is used to get owner address by other addresses except owner address.
    function getOwnerAddress() public view returns(address){
        assert(owner!=msg.sender);
        return owner;
    }
}
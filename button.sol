// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract button {
    uint256 public buttonCount = 0;
    address public addr;
    uint256 public money;
    uint256 oneEth = 1000000000000000000;
    
    uint256 public openingTime = 0;
    address payable wallet;
    
    // constructor(address payable _wallet){
    //     wallet = _wallet;
    // }
    event Received(address,uint);
    receive() external payable {}
    
    function addButton()
    public
    payable
    returns(address)
    {
        money += oneEth;
        if ((openingTime >= block.timestamp) || (openingTime == 0)) {
            openingTime = block.timestamp + 10;
            buttonCount += 1;
            addr = msg.sender;
            // wallet.transfer(msg.value);
            return (addr);
        }
        else{
            payable(addr).transfer(money-2000000000000000000);
            return (addr);
        }
    }
}
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
        if ((openingTime >= block.timestamp) || (openingTime == 0)) {
            openingTime = block.timestamp + 10;
            buttonCount += 1;
            addr = msg.sender;
            money += oneEth;
            // wallet.transfer(msg.value);
            return (addr);
        }
        else{
            money = money-200000000000000000;
            payable(addr).transfer(money);
            return (addr);
        }
    }
}
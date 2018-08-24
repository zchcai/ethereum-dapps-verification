pragma solidity ^0.4.24;
// # **** Hodl Contract *****
// # - Contract has an owner
// # - Owner can set lock period
// # - Contract is locked when today is within lock period
// # - Owner can deposit ether if contract is not locked
// # - Owner can withdraw ether if not within lock period

contract Hodl{
    address owner;
    uint lockedFrom;
    uint lockedDelta;
    
    event Withdraw(
        address who
    );
    
    event Deposit(
        address _from,
        uint _amount
    );
    
    constructor() 
    public 
    {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    function set_lock(uint _from, uint _period)
    public
    onlyOwner()
    {
        require(_from > now);
        
        lockedFrom = _from;
        lockedDelta = _period;
    }
    
    function is_locked()
    public
    view
    returns (bool)
    {
        return ((lockedFrom <= now) && (now <= lockedFrom + lockedDelta));
    }
    
    function withdraw() 
    public 
    onlyOwner() 
    {
        msg.sender.transfer(address(this).balance);
        emit Withdraw(msg.sender);
    }
    
    function deposit()
    public
    payable
    {
        emit Deposit(msg.sender, msg.value);
    }
}
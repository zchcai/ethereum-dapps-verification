# **** Hodl Contract *****
# - Contract has an owner
# - Owner can set lock period
# - Contract is locked when today is within lock period
# - Owner can deposit ether if contract is not locked
# - Owner can withdraw ether if not within lock period

Deposit: event({_from: address, _amount: wei_value})
Withdraw: event({_to: address})

owner: public(address)
lockedFrom: public(timestamp)
lockedDelta: public(timedelta)

# splice, concat


@public
def __init__():
    self.owner = msg.sender
    
@public
def set_lock(_from: timestamp, _period: timedelta):
    assert msg.sender == self.owner
    assert _from > block.timestamp
    
    self.lockedFrom = _from
    self.lockedDelta = _period
    
@public
@constant
def is_locked() -> bool:
    return block.timestamp > self.lockedFrom and block.timestamp < (self.lockedFrom + self.lockedDelta)
    
@public
@payable
def deposit():
    assert msg.sender == self.owner
    assert not self.is_locked()

    # raise event
    log.Deposit(msg.sender, msg.value)
    
@public
def withdraw():
    assert msg.sender == self.owner
    assert not self.is_locked()

    send(msg.sender, self.balance)
    
    # raise event
    log.Withdraw(msg.sender)
    
    
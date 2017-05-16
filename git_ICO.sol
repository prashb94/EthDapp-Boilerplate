 contract ICO {
    
    mapping(address => uint) public balanceOf;
    
    uint public priceWeiPerToken = 10;
    
    address public owner;
    
    function ICO() {
        owner = msg.sender;
    }
    
    // helper function
    function getMyAddress() constant returns (address) {
        return msg.sender;
    }   
    
    function transfer(address _to, uint _value) {
        if (_value <= balanceOf[msg.sender]) {
            balanceOf[_to] += _value;
            balanceOf[msg.sender] -= _value;
        } else {
            throw;
        }
    }
    
    function buyToken() payable {
        balanceOf[msg.sender] += msg.value / priceWeiPerToken ;
    } 
    
    function payOutBalance() {
        if (msg.sender != owner)
            throw;
        owner.send(this.balance);
    }
    
    function getMyBalanceEther() constant returns (uint) {
        return msg.sender.balance / 1 ether;
    }
    
}

pragma solidity 0.8.7;

contract election{
    address owner;
    
    
    constructor(){
        owner = msg.sender;
    }
    
    struct  Candidats{
        uint CandidateId;
        string name;
        uint ward;
        uint voteCount;
        
    } 
    struct Voter{
        string voterName;
        uint voterWard;
        
        address voterId;
    }
    
    mapping(address => bool) public votes;
    mapping (uint => Voter) public voter;
    mapping (uint => Candidats) public candidats;
    uint candedatsCount;
    uint voterCount;
    
    modifier onlyOwner(){
        require(msg.sender == owner,"Only Owner can add candidate");
        _;
    }
    
    function regieterVoters( string memory _name, uint _ward ) public {
        for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterId == msg.sender){
                revert("already created");
            }
        }
        voterCount++;
        voter[voterCount] = Voter(_name, _ward, msg.sender);
    }
    
    function addcadidet(address _voteraddress) public onlyOwner {
          for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterId == _voteraddress && voter[i].voterId != 0x0000000000000000000000000000000000000000){
                candedatsCount++;
                candidats[candedatsCount]= Candidats(candedatsCount, voter[i].voterName,voter[i].voterWard,0);
      
            }
        }
       
    }
    
    function vote(uint candidatsId) public {

        require(candidatsId > 0 && candidatsId <= candedatsCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterId == msg.sender){
                if(voter[i].voterWard == candidats[candidatsId].ward){
                     votes[msg.sender] = true;
                      candidats[candidatsId].voteCount++;
                }else{
                    revert("you can't vote another ward candidate");
                }
                
            }
        }
        
        
        
    }

}
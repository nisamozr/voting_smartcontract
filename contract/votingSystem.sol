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
        uint voterIndex;
        uint voterId;
        string voterName;
        uint voterWard;
        string homeaddress;
        address voteraddress;
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
    
    function regieterVoters(uint index,uint _voterid, string memory _name, uint _ward , string memory _houseName) public {
        for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voteraddress == msg.sender){
                revert("already created");
                
            }
            
        }
        voterCount++;
        voter[voterCount] = Voter(index,_voterid, _name, _ward,_houseName, msg.sender);
    }
    
    function addcadidet(string memory _name, uint _ward) public onlyOwner {
        candedatsCount++;
        candidats[candedatsCount]= Candidats(candedatsCount, _name,_ward,0);
    }
    
    function vote(uint candidatsId) public {
        require(candidatsId > 0 && candidatsId <= candedatsCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
         votes[msg.sender] = true;
        candidats[candidatsId].voteCount++;
    }

}
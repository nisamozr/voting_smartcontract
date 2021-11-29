// SPDX-License-Identifier: GPL-3.0

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
        address id;
        uint VoterId;
        
    } 
    struct Voter{
        string voterName;
        uint voterWard;
        address voterAddress;
        bool verify;
        uint voterId;
    }

    
    mapping(address => bool) public votes;
    
    mapping (uint => Voter) public voter;
    mapping (uint  => Candidats) public candidats;
    uint candedatsCount;
    uint voterCount;
 
    
    modifier onlyOwner(){
        require(msg.sender == owner,"Only Owner can add candidate");
        _;
    }
    
    function voterRegistration( string memory _name, uint _ward, uint _voterId ) public {
        for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                revert("already created");
            }
        }
        voterCount++;
        voter[voterCount] = Voter(_name, _ward, msg.sender, false, _voterId);
    }

     function voterVerify(uint _voterId) public onlyOwner {
        
            if(voter[_voterId].verify == true){
                revert("already verify");
            }
            else{
                  voter[_voterId].verify = true;
            }  
    }
    
    function addcadidet(address _voteraddress) public onlyOwner {
          for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterAddress == _voteraddress){
                if(voter[i].verify == true){
                    candedatsCount++;
                    candidats[candedatsCount] = Candidats(candedatsCount, voter[i].voterName,voter[i].voterWard,0,_voteraddress, voter[i].voterId);

                }else{
                    revert("candidate voter regitration not verified");
                }
           
            }else if(candidats[i].id == _voteraddress){
                   revert("same candidate can't be addd");
            }       
        }
    }
     
}


contract voteing is election{

     function vote(uint candidatsId) public {

        require(candidatsId > 0 && candidatsId <= candedatsCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                if(voter[i].voterWard == candidats[candidatsId].ward && voter[i].verify == true){
                     votes[msg.sender] = true;
                      candidats[candidatsId].voteCount++;
                }else{
                    revert("you can't vote another ward candidate");
                }       
            }
        }
    }


}

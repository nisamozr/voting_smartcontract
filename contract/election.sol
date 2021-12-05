// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;



contract voterId{

 struct VoterIdcard{
        string voterName;
        uint voterWard;
        uint age;
        uint voterIds;
     
    }
    uint num = 1000;
    uint count;

     mapping (uint => VoterIdcard) public voteridcard;
     function voterIdReg(string memory _name, uint _ward, uint age ) public{
     
         count++;
           voteridcard[count] = VoterIdcard(_name,_ward,age, num+count );

     }
}


contract election is voterId{
    address owner;
    constructor(){
        owner = msg.sender;
    }
      enum candidateStatus {pending, approved, rejected}
    
    struct  Candidats{
        uint CandidateId;
        string name;
        uint ward;
        uint voteCount;
        address id;
        uint VoterId;
        candidateStatus  status;
      
        
    } 
    struct Voter{
        uint index;
        string voterName;
        uint voterWard;
        address voterAddress;
        bool verify;
        uint voterId;
    }

    
    mapping(address => bool) public votes;
    mapping (uint => Voter) public voter;
    mapping (uint  => Candidats) public candidats;
    mapping (uint  => Candidats) public candidatslist;
    uint candedatsCount;
    uint voterCount;
    uint approvedCandidateCount;
 
    
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
        voter[voterCount] = Voter(voterCount ,_name, _ward, msg.sender, false, _voterId);
    }

     function voterVerify(uint _voterId) public onlyOwner {
        
            if(voter[_voterId].verify == true){
                revert("already verify");
            }
            else if(_voterId < 0 || _voterId > count  ){
                revert("voter not found");
            }
               
             else if(voter[_voterId].voterId == voteridcard[_voterId].voterIds){
                  voter[_voterId].verify = true;
            }else{
                 revert("voter id no found");

            }       
    }
    function applyForCantidate()public{
         for(uint i=1; i<= voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender && voter[i].verify == true){
               
                    candedatsCount++;
                    candidateStatus _candidateStatus = candidateStatus.pending;
                    candidats[candedatsCount] = Candidats(candedatsCount, voter[i].voterName,voter[i].voterWard,0,msg.sender, voter[i].voterId, _candidateStatus);

           
            }else if(candidats[i].id == msg.sender){
                   revert("same candidate can't be addd");
            }       
        }
        
    }
    //  function approveCadidedress(address _voteraddress) public onlyOwner {
    //         for(uint i=1; i<= candedatsCount; i++ ){

    //         }
    //  }
    
    function approveCadidedress1(address _voteraddress) public onlyOwner {
          for(uint i=1; i<= candedatsCount; i++ ){
              if(candidats[i].id == _voteraddress   ){
                  for(uint j =1; j<= count; j++){
                      if( candidats[i].ward == voteridcard[j].voterWard && candidats[i].VoterId == voteridcard[j].voterIds){
                                approvedCandidateCount++;
                    candidateStatus _candidateStatus = candidateStatus.approved;
                    candidatslist[candedatsCount] = Candidats(approvedCandidateCount, candidats[i].name,candidats[i].ward,0,_voteraddress, candidats[i].VoterId, _candidateStatus);
                    
                      }else{
                           candidateStatus _candidateStatus = candidateStatus.rejected;
                    candidats[i] = Candidats(candedatsCount, voter[i].voterName,voter[i].voterWard,0,msg.sender, voter[i].voterId, _candidateStatus);

                      }
                  }
              
              }
            //   else{
            //       revert("there is no such candidate");
            //   }     
        }
    }
     
}



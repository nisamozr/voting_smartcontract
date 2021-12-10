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
    mapping (uint  => Candidats) public candidateReg;
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
            //   require(voter[i].voterAddress == msg.sender, "account  not match");
           
                  if(voter[i].voterAddress == msg.sender && voter[i].verify == true){
               
                    candedatsCount++;
                    candidateStatus _candidateStatus = candidateStatus.pending;
                    candidateReg[candedatsCount] = Candidats(candedatsCount, voter[i].voterName,voter[i].voterWard,0,voter[i].voterAddress, voter[i].voterId, _candidateStatus);

           
            }else if(candidateReg[i].id == msg.sender || voterCount == 0){
                   revert("same candidate can't be addd");
            }

             
               
                  
        }
        
    }

     function approveCadidedress(address _voteraddress) public onlyOwner {
         for(uint j ; j<=approvedCandidateCount;j++){
             if(candidatslist[j].id == _voteraddress){
                 revert("already aproved");
             }
         }
            for(uint i=1; i<= candedatsCount; i++ ){
          
                if(candidateReg[i].id == _voteraddress){
                    for(uint j =1; j<= count; j++){
                    if( candidateReg[i].ward == voteridcard[j].voterWard && candidateReg[i].VoterId == voteridcard[j].voterIds){
                                
                                approvedCandidateCount++;
                                candidateStatus _candidateStatus = candidateStatus.approved;
                                 candidateReg[i] = Candidats(candedatsCount, candidateReg[i].name,candidateReg[i].ward,0,msg.sender, candidateReg[i].VoterId, _candidateStatus);
                                candidatslist[approvedCandidateCount] = Candidats(approvedCandidateCount, candidateReg[i].name,candidateReg[i].ward,0,_voteraddress, candidateReg[i].VoterId, _candidateStatus);    
                      }
                    //   else{
                    //        candidateStatus _candidateStatus = candidateStatus.rejected;
                    //        candidateReg[i] = Candidats(candedatsCount, voter[i].voterName,voter[i].voterWard,0,msg.sender, voter[i].voterId, _candidateStatus);

                    //     }
                                }


                }else if(candidatslist[i].id == _voteraddress ){
                    revert("alreay approved");
                }

            }
     }


     function result() public view returns(string memory , uint ){
         require(approvedCandidateCount>=1, "there is no candidate");
         uint votecont ;
         uint index ;
         for(uint i =1 ; i<=approvedCandidateCount; i++){
             if(candidatslist[i].voteCount > votecont){
                 votecont = candidatslist[i].voteCount;
                 index = i;
             }

         }
        return(candidatslist[index].name,candidatslist[index].voteCount);


         
     }
    
 
     
}



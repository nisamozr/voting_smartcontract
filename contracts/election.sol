// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract VoterId{
 struct voterIdcard{
        string voterName;
        uint voterWard;
        uint age;
        uint voterIds;
    }
    uint num = 1000;
    uint public count ;
    mapping (uint => voterIdcard) public voteridcard;

    function voterIdReg(
        string memory _name,
        uint _ward,
        uint _age 
    ) 
        public
    {
        require(
            _age >= 18,
            "This person is not eligible for voters Id"
        );
        count++;
        voteridcard[count] = voterIdcard(
            _name,
            _ward,
            _age,
            num+count
        );
    }
}

contract Election is VoterId{
    address authority;
    constructor(){
        authority = msg.sender;
    }
     struct Voter{
        uint index;
        string voterName;
        uint voterWard;
        address voterAddress;
        bool verify;
        uint voterId;
    }
    struct  Candidate{
        uint CandidateId;
        string name;
        uint ward;
        uint voteCount;
        address id;
        uint VoterId;
        candidateStatus  status;   
    } 
    enum candidateStatus {pending, approved, rejected}
    mapping(address => bool) public votes;
    mapping (uint => Voter) public voter;
    mapping (uint  => Candidate) public candidateReg;
    mapping (uint  => Candidate) public candidatelist;
    uint public candidateCount;
    uint public voterCount;
    uint public approvedCandidateCount;
 
    modifier authorization(){
        require(msg.sender == authority,"authority can only call this function");
        _;
    }
    
    function voterRegistration(
        string memory _name, 
        uint _ward, 
        uint _voterId 
    ) 
        public
    {
        for(uint i = 1; i <= voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                revert("already created");
            }
        }
        voterCount++;
        voter[voterCount] = Voter(
            voterCount,
            _name,
            _ward,
            msg.sender,
            false,
            _voterId
        );
    }

    function voterVerify(uint _voterId) public authorization {
            if(voter[_voterId].verify == true){
                revert("already verify");
            }
            else if(_voterId <= 0 || _voterId > count  ){
                revert("voter not found");
            }   
            else if(voter[_voterId].voterId == voteridcard[_voterId].voterIds){
                  voter[_voterId].verify = true;
            }else{
                 revert("voter id no found");
            }       
    }

    function applyForCantidate()public{
           for(uint j=1 ; j<=candidateCount;j++){
             if(candidateReg[j].id == msg.sender ){
                 revert("same candidate can't be addd");
             }
         }
         for(uint i=1; i<= voterCount; i++ ){           
                if(voter[i].voterAddress == msg.sender && voter[i].verify == true){
                    candidateCount++;
                    candidateStatus _candidateStatus = candidateStatus.pending;
                    candidateReg[candidateCount] = Candidate(
                        candidateCount,
                        voter[i].voterName,
                        voter[i].voterWard,
                        0,
                        voter[i].voterAddress, 
                        voter[i].voterId, 
                        _candidateStatus
                    );

                }          
        } 
    }

    function approveCadidedress(address _voteraddress) public authorization {
         for(uint j=1 ; j<=approvedCandidateCount;j++){
             if(candidatelist[j].id == _voteraddress){
                 revert("already aproved");
             }
         }
        for(uint i=1; i<= candidateCount; i++ ){
            if(candidateReg[i].id == _voteraddress){
                for(uint j =1; j<= count; j++){
                    if( candidateReg[i].ward == voteridcard[j].voterWard && candidateReg[i].VoterId == voteridcard[j].voterIds){
                        approvedCandidateCount++;
                        candidateStatus _candidateStatus = candidateStatus.approved;
                        candidateReg[i] = Candidate(candidateCount, candidateReg[i].name,candidateReg[i].ward,0,msg.sender, candidateReg[i].VoterId, _candidateStatus);
                        candidatelist[approvedCandidateCount] = Candidate(
                            approvedCandidateCount, 
                            candidateReg[i].name,
                            candidateReg[i].ward,
                            0,
                            _voteraddress, 
                            candidateReg[i].VoterId, 
                            _candidateStatus
                        );    
                    }
                }
            }
        }
     }

     function result() public view returns(string memory , uint ){
         require(approvedCandidateCount>=1, "there is no candidate");
         uint votecont ;
         uint index ;
         for(uint i =1 ; i<=approvedCandidateCount; i++){
             if(candidatelist[i].voteCount > votecont){
                 votecont = candidatelist[i].voteCount;
                 index = i;
             }
         }
        return(
            candidatelist[index].name,
            candidatelist[index].voteCount
        );   
     } 
}



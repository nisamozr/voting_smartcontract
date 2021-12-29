// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Election {
    address public authority;
    constructor(){
        authority = msg.sender;
    }
     struct Voter{
        uint RegId;
        string voterName;
        uint voterWard;
        address voterAddress;
        uint voterId;
        bool status;
        
    }
    struct  Candidate{
        uint CandidateRegId;
        string name;
        uint ward;
        address id;
        uint vote;
        uint VoterId;
        candidateStatus  status;
        string remark;   
    } 
    enum candidateStatus {pending, approved, rejected}
    mapping (address => bool) public votes;
    mapping (uint => Voter) public voter;
    mapping (uint  => Candidate) public candidateReg;
    mapping (uint  => Candidate) public candidatelist;
    mapping (address => uint ) public voterlogin;
    mapping (address => uint) public candidatelogin;
    uint public candidateCount;
    uint public voterCount;
    uint public approvedCandidateCount;
 
    modifier authorization(){
        require(msg.sender == authority,"authority can only call this function");
        _;
    }
    
    function voterRegistration(
        string memory _name, 
        uint _ward 
    ) 
        public
    {
        for(uint i = 1; i <=  voterCount; i++ ){
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
            1,
            false
        );
        voterlogin[msg.sender] = voterCount;
    }
    uint voterIdgenerator = 1000;

    function allocateId(uint _voterRegId) public authorization {
            if(voter[_voterRegId].status == true){
                revert("Already voter ID Allocated ");
            }
            // else if(_voterRegId <= 0 || _voterRegId > count  ){
            //     revert("voter not found");
            // }   
        
                else if(voter[_voterRegId].voterId == 1){
                     voterIdgenerator++;
                      voter[_voterRegId].voterId = voterIdgenerator;
                  voter[_voterRegId].status = true;
            } 
            else{
                revert("Fist you need to register");
            }

                         
    }

    function cantidateRegistration(string memory _name, uint _ward, uint _voterId)public{
           for(uint j=1 ; j<=candidateCount;j++){
             if(candidateReg[j].id == msg.sender ){
                 revert("same candidate can't be register again");
             }
         }

         candidateCount++;
                    candidateStatus _candidateStatus = candidateStatus.pending;
                    candidateReg[candidateCount] = Candidate(
                        candidateCount,
                        _name,
                        _ward,
                        msg.sender, 
                        0,
                        _voterId, 
                        _candidateStatus,
                        ""
                     
                    );
                    candidatelogin[msg.sender] = candidateCount;  
    }

    function approveCadidedress(address _voteraddress, string memory _remark) public authorization {
         for(uint j=1 ; j<=approvedCandidateCount;j++){
             if(candidatelist[j].id == _voteraddress){
                 revert("already aproved");
             }
         }
         uint flag = 0;
        for(uint i=1; i<= candidateCount; i++ ){
            if(candidateReg[i].id == _voteraddress){
                
                        approvedCandidateCount++;
                        candidateStatus _candidateStatus = candidateStatus.approved;
                        candidateReg[i] = Candidate(candidateCount, candidateReg[i].name,candidateReg[i].ward,_voteraddress,0, candidateReg[i].VoterId, _candidateStatus,_remark);
                        candidatelist[approvedCandidateCount] = Candidate(
                            approvedCandidateCount, 
                            candidateReg[i].name,
                            candidateReg[i].ward,
                            _voteraddress, 
                            0,
                            candidateReg[i].VoterId, 
                            _candidateStatus,
                            _remark
                        );  
                        

                        flag =1;
                      }

        }
        if(flag != 1){
            revert("ther is no such candidate");
        }
     }
       function RejectedCadidedress(address _voteraddress, string memory _remark) public authorization {
         for(uint j=1 ; j<=approvedCandidateCount;j++){
             if(candidatelist[j].id == _voteraddress){
                 revert("already aproved");
             }
         }
         uint flag = 0;
        for(uint i=1; i<= candidateCount; i++ ){
            if(candidateReg[i].id == _voteraddress){
                
                        approvedCandidateCount++;
                        candidateStatus _candidateStatus = candidateStatus.rejected;
                        candidateReg[i] = Candidate(candidateCount, candidateReg[i].name,candidateReg[i].ward,_voteraddress,0, candidateReg[i].VoterId, _candidateStatus,_remark);
                        candidatelist[approvedCandidateCount] = Candidate(
                            approvedCandidateCount, 
                            candidateReg[i].name,
                            candidateReg[i].ward,
                            _voteraddress, 
                            0,
                            candidateReg[i].VoterId, 
                            _candidateStatus,
                            _remark
                        );  
                        candidatelogin[_voteraddress] = i;  

                        flag =1;
                      }

        }
        if(flag != 1){
            revert("ther is no such candidate");
        }
     }

     function result() public view returns(string memory, uint, uint){
         require(approvedCandidateCount>=1, "there is no candidate");
         uint votecount ;
         uint index ;
         for(uint i =1 ; i<=approvedCandidateCount; i++){
             if(candidatelist[i].vote > votecount){
                 votecount = candidatelist[i].vote;
                 index = i ;
                }
          }
         return(
            candidatelist[index].name,
            candidatelist[index].vote,
            candidatelist[index].ward
            );   
     } 
}



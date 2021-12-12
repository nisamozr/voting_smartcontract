// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract VoterId{
 struct voterIdcard{
        string voterName;
        uint voterWard;
        uint age;
        uint voterIds;
    }
    uint num = 1000;
    uint count;
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
    struct  Candidates{
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
    mapping (uint  => Candidates) public candidateReg;
    mapping (uint  => Candidates) public candidateslist;
    uint candedatesCount;
    uint voterCount;
    uint approvedCandidateCount;
 
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
                    candedatesCount++;
                    candidateStatus _candidateStatus = candidateStatus.pending;
                    candidateReg[candedatesCount] = Candidates(
                        candedatesCount,
                        voter[i].voterName,
                        voter[i].voterWard,
                        0,
                        voter[i].voterAddress, 
                        voter[i].voterId, 
                        _candidateStatus
                    );

                }
                else if(candidateReg[i].id == msg.sender || voterCount == 0){
                    revert("same candidate can't be addd");
                }          
        } 
    }

    function approveCadidedress(address _voteraddress) public authorization {
         for(uint j ; j<=approvedCandidateCount;j++){
             if(candidateslist[j].id == _voteraddress){
                 revert("already aproved");
             }
         }
        for(uint i=1; i<= candedatesCount; i++ ){
            if(candidateReg[i].id == _voteraddress){
                for(uint j =1; j<= count; j++){
                    if( candidateReg[i].ward == voteridcard[j].voterWard && candidateReg[i].VoterId == voteridcard[j].voterIds){
                        approvedCandidateCount++;
                        candidateStatus _candidateStatus = candidateStatus.approved;
                        candidateReg[i] = Candidates(candedatesCount, candidateReg[i].name,candidateReg[i].ward,0,msg.sender, candidateReg[i].VoterId, _candidateStatus);
                        candidateslist[approvedCandidateCount] = Candidates(
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
             if(candidateslist[i].voteCount > votecont){
                 votecont = candidateslist[i].voteCount;
                 index = i;
             }
         }
        return(
            candidateslist[index].name,
            candidateslist[index].voteCount
        );   
     } 
}



// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "./election.sol";

contract Voteing is Election{
     function vote(uint candidateId) public {
        require(candidateId > 0 && candidateId <=  candidateCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=1001; i<=1000+voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                if(voter[i].voterWard == candidatelist[candidateId].ward && voter[i].status == true){
                     votes[msg.sender] = true;
                      candidatelist[candidateId].vote++;
                }else{
                    revert("you can't vote another ward candidate");
                }       
            }
        }
    }
}
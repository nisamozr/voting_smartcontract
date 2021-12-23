// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "./election.sol";

contract Voteing is Election{
     function vote(uint candidatesId) public {
        require(candidatesId > 0 && candidatesId <=  candidateCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=1001; i<=1000+voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                if(voter[i].voterWard == candidatelist[candidatesId].ward && voter[i].verify == true){
                     votes[msg.sender] = true;
                      candidatelist[candidatesId].voteCount++;
                }else{
                    revert("you can't vote another ward candidate");
                }       
            }
        }
    }
}
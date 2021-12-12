// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

import "./election.sol";

contract Voteing is Election{
     function vote(uint candidatesId) public {
        require(candidatesId > 0 && candidatesId <=  candedatesCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=1; i<=voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                if(voter[i].voterWard == candidateslist[candidatesId].ward && voter[i].verify == true){
                     votes[msg.sender] = true;
                      candidateslist[candidatesId].voteCount++;
                }else{
                    revert("you can't vote another ward candidate");
                }       
            }
        }
    }
}
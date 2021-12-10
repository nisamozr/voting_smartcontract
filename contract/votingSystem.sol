// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

import "./election.sol";

contract voteing is election{

     function vote(uint candidatsId) public {

        require(candidatsId > 0 && candidatsId <=  candedatsCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=1; i<=voterCount; i++ ){
            if(voter[i].voterAddress == msg.sender){
                if(voter[i].voterWard == candidatslist[candidatsId].ward && voter[i].verify == true){
                     votes[msg.sender] = true;
                      candidatslist[candidatsId].voteCount++;
                }else{
                    revert("you can't vote another ward candidate");
                }       
            }
        }
    }


}
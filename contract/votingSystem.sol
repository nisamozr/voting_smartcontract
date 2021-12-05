// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

import "./election.sol";

contract voteing is election{

     function vote(uint candidatsId) public {

        require(candidatsId > 0 && candidatsId <=  candedatsCount, "invalide user");
        require(!votes[msg.sender], "you are already voted");
        
        for(uint i=101; i<=100+ voterCount; i++ ){
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
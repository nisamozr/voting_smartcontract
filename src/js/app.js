



if (typeof web3 !== 'undefined') {
  ethereum.enable().then(result => {
    console.log("Account: ", result);
    document.getElementById("connect").innerHTML = result
    console.log(voting)


  })

}
else {
  console.log("dfdf")
}



web3 = new Web3(ethereum);
console.log("Connection Object: ", web3)




const contractAdderes = "0x2dBFf25fDa4D9ce016c7546baADe355aC51df830";

const abi = [
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_voteraddress",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "_remark",
        "type": "string"
      }
    ],
    "name": "RejectedCadidedress",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_voterRegId",
        "type": "uint256"
      }
    ],
    "name": "allocateId",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_voteraddress",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "_remark",
        "type": "string"
      }
    ],
    "name": "approveCadidedress",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "approvedCandidateCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "authority",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "candidateCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "candidateReg",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "CandidateRegId",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "name",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "ward",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "id",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "vote",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "VoterId",
        "type": "uint256"
      },
      {
        "internalType": "enum Election.candidateStatus",
        "name": "status",
        "type": "uint8"
      },
      {
        "internalType": "string",
        "name": "remark",
        "type": "string"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "candidatelist",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "CandidateRegId",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "name",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "ward",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "id",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "vote",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "VoterId",
        "type": "uint256"
      },
      {
        "internalType": "enum Election.candidateStatus",
        "name": "status",
        "type": "uint8"
      },
      {
        "internalType": "string",
        "name": "remark",
        "type": "string"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "name": "candidatelogin",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "string",
        "name": "_name",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "_ward",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_voterId",
        "type": "uint256"
      }
    ],
    "name": "cantidateRegistration",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "result",
    "outputs": [
      {
        "internalType": "string",
        "name": "",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "time",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "voteEnd",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "voteStart",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "voter",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "RegId",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "voterName",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "voterWard",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "voterAddress",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "voterId",
        "type": "uint256"
      },
      {
        "internalType": "bool",
        "name": "status",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "voterCount",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "string",
        "name": "_name",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "_ward",
        "type": "uint256"
      }
    ],
    "name": "voterRegistration",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "name": "voterlogin",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "name": "votes",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "candidateId",
        "type": "uint256"
      }
    ],
    "name": "vote",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
];
let voting = new web3.eth.Contract(abi, contractAdderes);
profile()
votlist()

voterlist()
cadidatesList()



async function voterReg() {

  let name = document.getElementById('voterName').value
  let ward = document.getElementById('voterWard1').value


  web3.eth.handleRevert = true
  await voting.methods.voterRegistration(name, ward).send({ from: ethereum.selectedAddress, gasLimit: "927000" })
    .then((result) => {
      swal("SUCCESS", "voter registration", "success");
    }).catch((err) => {

      swal("Failed", `${err.message}`, "warning");
    })



  // 	swal("You are filed");

  // 	let message = JSON.parse(error.message.substring(56).trim().replace("'", "")).value.data.data;
  // 	console.log(message[Object.keys(message)[0]].reason);
  // 	console.log("dfdg", message)

  // }


}
// async function voterIdlist() {
//   await voting.methods.voterCount().call({ from: ethereum.selectedAddress })
//     .then(async (count) => {
//       for (let index = 1; index <= count; index++) {
//         await voting.methods.voteridcard(index)
//           .call({ from: ethereum.selectedAddress })
//           .then((result) => {



//             var table = document.getElementById("table");
//             var row = table.insertRow(index);
//             var cell1 = row.insertCell(0);
//             var cell2 = row.insertCell(1);
//             var cell3 = row.insertCell(2);
//             cell1.innerHTML = result.voterName;
//             cell2.innerHTML = result.voterWard;
//             cell3.innerHTML = result.voterIds;

//           })
//       }
//     })
// }


let a;
async function profile() {
  let pward;
  await voting.methods.voterCount().call({ from: ethereum.selectedAddress })
    .then(async (count) => {



      for (let index = 1; index <= parseInt(count); index++) {
        await voting.methods.voter(index)
          .call({ from: ethereum.selectedAddress })
          .then((result) => {
            let add = result.voterAddress;

            if (add.toLowerCase() == ethereum.selectedAddress) {



              // document.getElementById("display").style.display = "block"

              document.getElementById("NAME").innerHTML = result.voterName
              //  document.getElementById("AGE").innerHTML = result.voterName
              document.getElementById("WARD").innerHTML = result.voterWard
              document.getElementById("VOTERID").innerHTML = result.voterId
              if (result.status == true) {
                document.getElementById("STATUS").innerHTML = "Approved"
              } else {
                document.getElementById("STATUS").innerHTML = "Not Approved"
              }



              pward = result.voterWard


              if (result.status == true) {
                document.getElementById("vol").style.display = "block"
              }
              if(result.status == false){
                document.getElementById("vol1").style.display = "block"
                
              }



            }
           

          })

      }


    })

  a = pward

}



results()

async function voterlist() {
  await voting.methods.voterCount().call({ from: ethereum.selectedAddress })
    .then(async (count) => {

      let tcont = 0;
      for (let index = 1; index <= count; index++) {
        await voting.methods.voter(index)
          .call({ from: ethereum.selectedAddress })
          .then((result) => {
            console.log(result, "fefffffff")

            tcont++

            var table = document.getElementById("tables");
            var row = table.insertRow(tcont);
            var cell = row.insertCell(0);
            var cell1 = row.insertCell(1);
            var cell2 = row.insertCell(2);
            var cell3 = row.insertCell(3);
            var cell4 = row.insertCell(4);
            var cell5 = row.insertCell(5);

            cell.innerHTML = result.RegId;
            cell1.innerHTML = result.voterName;
            cell2.innerHTML = result.voterWard;
          
            if (result.voterId == 1) {
              cell4.innerHTML = "Not allocated";
            } else {
              cell4.innerHTML = result.voterId;
            }
            cell3.innerHTML = result.status;

            cell5.innerHTML = result.voterAddress;


          })
      }
    })
}



function verifyVoter() {


  let id = document.getElementById('vid').value
  voting.methods.allocateId(id).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
    swal("Verified", `${id} voter Id verified`, "success");
  }).catch((err) => {
    swal("Failed", `${err.message}`, "warning");
  })
}

function apply() {
  voting.methods.applyForCantidate().send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
    swal("SUCCESS", "Application succesfully registerd", "success");
  }).catch((err) => {
    swal("Failed", `${err.message}`, "warning");
  })

}
function approve() {
  let remark = document.getElementById("remark").value;
  let id = document.getElementById("radd").value;



  voting.methods.approveCadidedress(id, remark).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then((result) => {
    swal("SUCCESS", "Approved", "success");
    location.reload();
  }).catch((err) => {
    swal("Failed", `${err.message}`, "warning");
  })

}
function reject() {
  // let id = document.getElementById('CandidateApprove').value

  let id = document.getElementById("radd").value;
  let remark = document.getElementById("remark").value;
  console.log(remark)


  voting.methods.RejectedCadidedress(id, remark).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
    swal("SUCCESS", "Rejected", "success");
    location.reload();
  }).catch((err) => {
    swal("Failed", `${err.message}`, "error");
  })

}

async function cadidatesList() {

  await voting.methods.candidateCount().call({ from: ethereum.selectedAddress })
    .then(async (count) => {
      console.log(count)

      for (let index = 1; index <= count; index++) {
        await voting.methods.candidateReg(index)
          .call({ from: ethereum.selectedAddress })
          .then((result) => {



            var table = document.getElementById("tables1");
            var row = table.insertRow(index);
            var cell = row.insertCell(0);
            var cell1 = row.insertCell(1);
            var cell2 = row.insertCell(2);
            var cell3 = row.insertCell(3);
            var cell4 = row.insertCell(4);
            // var cell5 = row.insertCell(5);
            cell.innerHTML = result.CandidateRegId;
            cell1.innerHTML = result.name;
            cell2.innerHTML = result.ward;
            cell3.innerHTML = result.id;
            if (result.status == 0) {
              cell4.style.color = "yellow"

              cell4.innerHTML = "pending";
            }
            else if (result.status == 1) {
              cell.style.color = "green"
              cell4.innerHTML = "Approved"
            } else {
              cell.style.color = "red"
              cell4.innerHTML = "Rejected"
            }



          })
      }
    })
}

async function votlist() {
  await voting.methods.voterCount().call({ from: ethereum.selectedAddress })
    .then(async (count) => {



      for (let index = 1; index <= parseInt(count); index++) {
        await voting.methods.voter(index)
          .call({ from: ethereum.selectedAddress })
          .then(async (results) => {
            let add = results.voterAddress;

            if (add.toLowerCase() == ethereum.selectedAddress) {


              // document.getElementById("WARD").innerHTML = results.voterWard


              await voting.methods.approvedCandidateCount().call({ from: ethereum.selectedAddress })
                .then(async (count) => {
                  let g = 0;
                  for (let index = 1; index <= count; index++) {
                    await voting.methods.candidatelist(index)
                      .call({ from: ethereum.selectedAddress })
                      .then(async (result) => {
                        let w = 5


                        if (result.ward == results.voterWard) {

                          g++;

                          var btn = document.createElement("BUTTON");
                          var text = document.createTextNode("Vote");
                          btn.appendChild(text)
                          btn.setAttribute("class", "btn btn-warning");
                          btn.setAttribute('onclick', `vote(${result.CandidateRegId})`);

                          var table = document.getElementById("tablevote");
                          var row = table.insertRow(g);
                          var cell = row.insertCell(0);
                          var cell1 = row.insertCell(1);
                          var cell2 = row.insertCell(2);
                          var cell3 = row.insertCell(3);

                          cell.innerHTML = result.CandidateRegId;
                          cell1.innerHTML = result.name;
                          cell2.innerHTML = result.ward;
                          cell3.appendChild(btn)
                        }



                      })
                  }
                })




            }

          })

      }


    })



}

function vote(id) {

  voting.methods.vote(id).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
    swal("SUCCESS", "Your vote registerd", "success");
  }).catch((err) => {
    swal("Failed", `${err.message}`, "warning");
  })
}
// jj()

// async function jj() {

//   await voting.methods.approvedCandidateCount().call({ from: ethereum.selectedAddress })
//     .then(async (count) => {

//       for (let index = 1; index <= parseInt(count); index++) {
//         await voting.methods.candidatelist(index)
//           .call({ from: ethereum.selectedAddress })
//           .then((result) => {
//             let add = result.id;

//             if (add.toLowerCase() == ethereum.selectedAddress) {
//             }
//           })
//       }


//       for (let index = 1; index <= count; index++) {
//         await voting.methods.candidatelist(index)
//           .call({ from: ethereum.selectedAddress })
//           .then((result) => {
            

//             // var table = document.getElementById("tableresult");
//             // var row = table.insertRow(index);
//             // var cell = row.insertCell(0);
//             // var cell1 = row.insertCell(1);
//             // cell.innerHTML = result.name;
//             // cell1.innerHTML = result.vote;
//           })
//       }
//     })

// }
async function results() {

  await voting.methods.result().call({ from: ethereum.selectedAddress }).then(result => {
    document.getElementById("winname").innerHTML = result[0]
    document.getElementById("winvote").innerHTML = result[1]

  })
}









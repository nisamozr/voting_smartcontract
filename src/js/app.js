// const deployContract = require("../../build/contracts/Voteing.json") 
// import Voteing from "../../build/contracts/Voteing.json"
function connect() {
	ethereum.enable().then(result => {
		console.log("Account: ", result);
		document.getElementById("connect").innerHTML = result
		console.log(voting)


	})
}

web3 = new Web3(ethereum);
console.log("Connection Object: ", web3)




const contractAdderes = "0x87ED38944941d36F5b45f3511C730f3d36288c60"
//  "0x2801f1f1e0473A77007A97Dff2F9003cd7dE5Fba" ;
const abi = [
	{
		"inputs": [],
		"name": "applyForCantidate",
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
		"name": "candedatesCount",
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
				"name": "CandidateId",
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
				"internalType": "uint256",
				"name": "voteCount",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "id",
				"type": "address"
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
		"name": "candidateslist",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "CandidateId",
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
				"internalType": "uint256",
				"name": "voteCount",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "id",
				"type": "address"
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
			}
		],
		"stateMutability": "view",
		"type": "function",
		"constant": true
	},
	{
		"inputs": [],
		"name": "count",
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
				"name": "index",
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
				"internalType": "bool",
				"name": "verify",
				"type": "bool"
			},
			{
				"internalType": "uint256",
				"name": "voterId",
				"type": "uint256"
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
			},
			{
				"internalType": "uint256",
				"name": "_age",
				"type": "uint256"
			}
		],
		"name": "voterIdReg",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
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
		"name": "voterRegistration",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_voterId",
				"type": "uint256"
			}
		],
		"name": "voterVerify",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "voteridcard",
		"outputs": [
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
				"internalType": "uint256",
				"name": "age",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "voterIds",
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
				"name": "candidatesId",
				"type": "uint256"
			}
		],
		"name": "vote",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]


let voting = new web3.eth.Contract(abi, contractAdderes);
profile()
votlist()
voterIdlist()
voterlist()
cadidatesList()

function voterId() {

	let name = document.getElementById('voterIdName').value
	let age = document.getElementById('voterAge').value
	let ward = document.getElementById('voterWard').value
	voting.methods.voterIdReg(name, ward, age).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
		swal("Good job!", "SUCCESS", "success");

		window.location.reload()
	})

}

async function voterReg() {

	let name = document.getElementById('voterName').value
	let ward = document.getElementById('voterWard1').value
	let id = document.getElementById('voterID').value

	try {
		await voting.methods.voterRegistration(name, ward, id).send({ from: ethereum.selectedAddress, gasLimit: "927000" })
		// .then( (err, result) => {
		swal("You are registerd");
		console.log(err)

	} catch (error) {
		swal("You are filed");

		let message = JSON.parse(error.message.substring(56).trim().replace("'", "")).value.data.data;
		console.log(message[Object.keys(message)[0]].reason);
		console.log("dfdg", message)

	}


}
async function voterIdlist() {
	await voting.methods.count().call({ from: ethereum.selectedAddress })
		.then(async (count) => {
			for (let index = 1; index <= count; index++) {
				await voting.methods.voteridcard(index)
					.call({ from: ethereum.selectedAddress })
					.then((result) => {



						var table = document.getElementById("table");
						var row = table.insertRow(index);
						var cell1 = row.insertCell(0);
						var cell2 = row.insertCell(1);
						var cell3 = row.insertCell(2);
						cell1.innerHTML = result.voterName;
						cell2.innerHTML = result.voterWard;
						cell3.innerHTML = result.voterIds;

					})
			}
		})
}

async function profile() {
	await voting.methods.voterCount().call({ from: ethereum.selectedAddress })
		.then(async (count) => {
			for (let index = 1; index <= count; index++) {
				await voting.methods.voter(index)
					.call({ from: ethereum.selectedAddress })
					.then((result) => {
						let add = result.voterAddress
						console.log(add)
					
						if (add.toLowerCase() == ethereum.selectedAddress) {
							console.log(result.voterName)
							 document.getElementById("NAME").innerHTML = result.voterName
							//  document.getElementById("AGE").innerHTML = result.voterName
							 document.getElementById("WARD").innerHTML = result.voterWard
							 document.getElementById("VOTERID").innerHTML = result.voterId
							 document.getElementById("STATUS").innerHTML = result.verify



						}





					})
			}
		})
}



async function voterlist() {
	await voting.methods.voterCount().call({ from: ethereum.selectedAddress })
		.then(async (count) => {
			for (let index = 1; index <= count; index++) {
				await voting.methods.voter(index)
					.call({ from: ethereum.selectedAddress })
					.then((result) => {


						var table = document.getElementById("tables");
						var row = table.insertRow(index);
						var cell = row.insertCell(0);
						var cell1 = row.insertCell(1);
						var cell2 = row.insertCell(2);
						var cell3 = row.insertCell(3);
						var cell4 = row.insertCell(4);
						var cell5 = row.insertCell(5);
						cell.innerHTML = result.index;
						cell1.innerHTML = result.voterName;
						cell2.innerHTML = result.voterWard;
						cell3.innerHTML = result.verify;
						cell4.innerHTML = result.voterId;
						cell5.innerHTML = result.voterAddress;

					})
			}
		})
}

function verifyVoter() {


	let id = document.getElementById('vid').value
	voting.methods.voterVerify(id).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
		swal("You are registerd");
	})
}

function apply() {
	voting.methods.applyForCantidate().send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
		swal("You are registerd");
	})

}
function approve() {
	let id = document.getElementById('CandidateApprove').value


	voting.methods.approveCadidedress(id).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
		swal("You are registerd");
	})

}

async function cadidatesList() {

	await voting.methods.candedatesCount().call({ from: ethereum.selectedAddress })
		.then(async (count) => {

			for (let index = 1; index <= count; index++) {
				await voting.methods.candidateReg(index)
					.call({ from: ethereum.selectedAddress })
					.then((result) => {

						console.log(result);

						var table = document.getElementById("tables1");
						var row = table.insertRow(index);
						var cell = row.insertCell(0);
						var cell1 = row.insertCell(1);
						var cell2 = row.insertCell(2);
						var cell3 = row.insertCell(3);
						var cell4 = row.insertCell(4);
						var cell5 = row.insertCell(5);
						cell.innerHTML = result.CandidateId;
						cell1.innerHTML = result.name;
						cell2.innerHTML = result.ward;
						cell3.innerHTML = result.id;
						cell4.innerHTML = result.status;
						cell5.innerHTML = result.voteCount;

					})
			}
		})
}

async function votlist() {

	await voting.methods.approvedCandidateCount().call({ from: ethereum.selectedAddress })
		.then(async (count) => {

			for (let index = 1; index <= count; index++) {
				await voting.methods.candidateReg(index)
					.call({ from: ethereum.selectedAddress })
					.then((result) => {

						console.log(result);
						var btn = document.createElement("BUTTON");
						var text = document.createTextNode("Vote");
						btn.appendChild(text)
						btn.setAttribute("class", "btn btn-warning");
						btn.setAttribute('onclick', `vote(${result.CandidateId})`);

						var table = document.getElementById("tablevote");
						var row = table.insertRow(index);
						var cell = row.insertCell(0);
						var cell1 = row.insertCell(1);
						var cell2 = row.insertCell(2);
						var cell3 = row.insertCell(3);

						cell.innerHTML = result.CandidateId;
						cell1.innerHTML = result.name;
						cell2.innerHTML = result.ward;
						cell3.appendChild(btn)


					})
			}
		})
}

function vote(id) {

	voting.methods.vote(id).send({ from: ethereum.selectedAddress, gasLimit: "927000" }).then(result => {
		swal("Your vote successufly register");
		console.log(result)
	})
}






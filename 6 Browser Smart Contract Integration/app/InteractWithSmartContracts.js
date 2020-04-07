var Web3 = require("web3");
var web3 = new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545"));

const functionSignature = web3.utils.sha3("myUint()").substr(0, 10);

console.log('Function signature: ', functionSignature);

web3.eth.call({
	from:"0xeb4B0BFabc918246f7Bf7C8F22C328C43c94c9A4", 
	to:"0xb1B73B3C484D734B5E90C64999E17515C985d982", 
	data: functionSignature,
}).then(console.log);

const contract = new web3.eth.Contract([
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_myUint",
				"type": "uint256"
			}
		],
		"name": "setUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
], "0xb1B73B3C484D734B5E90C64999E17515C985d982");

contract.methods.myUint().call().then(res => console.log('myUint: ', res));
console.log('Set my uint: 59');
contract.methods.setUint(59).send({
	from:"0xeb4B0BFabc918246f7Bf7C8F22C328C43c94c9A4"
}).then(res => {
	console.log(res);
	contract.methods.myUint().call().then(res => console.log('myUint: ', res));
});

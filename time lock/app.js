// Initialize Web3
const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");

// Define contract ABI and address
const contractABI = [
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "_lockTime",
                "type": "uint256"
            },
            {
                "components": [
                    {
                        "internalType": "address",
                        "name": "beneficiary",
                        "type": "address"
                    }
                ],
                "internalType": "struct TimeLock.Beneficiary[]",
                "name": "_beneficiaries",
                "type": "tuple[]"
            }
        ],
        "payable": true,
        "stateMutability": "payable",
        "type": "constructor"
    },
    {
        "inputs": [],
        "name": "addBeneficiary",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "creationTime",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "extendLockTime",
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
        "name": "beneficiaries",
        "outputs": [
            {
                "internalType": "bool",
                "name": "",
                "type": "bool"
            }
        ],
        "stateMutability": "view",
        "type

require('dotenv').config(); // Load environment variables from .env file
const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3  = require('web3');
const {interface,bytecode} = require('./compile.js');

const provider = new HDWalletProvider(process.env.SECRET_KEY,process.env.INFURA_URL_OF_SEPOLIA);


const web3 = new Web3(provider);

const deploy = async()=>{
    const accounts = await web3.eth.getAccounts();
    console.log(accounts,'...');
    console.log("Contract is deployed by manager with address: " + accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({data:'0x' + bytecode})
    .send({gas : '2000000', from : accounts[0]})
    console.log('done'  + result);

    console.log("Contract deployed to address: ", result.options.address)
    //0x2c987Caa443D52F4322EC6822344b12C38C5cDE6
}

deploy();
import React, {Component} from 'react';
require('dotenv').config(); // Load environment variables from .env file

console.log('process.env.SECRET_KEY',process.env.SECRET_KEY)
console.log('process.env.SECRET_KEY',process.env.INFURA_URL_OF_SEPOLIA)
class Lottery extends Component{
    render() {
        return <h1>Decentralized Lottery Application</h1>
    }
}


export default Lottery;
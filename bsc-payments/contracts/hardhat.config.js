require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");

module.exports = {
  defaultNetwork: "bsc",
  networks: {
    bsc: {
      url: `${process.env.RPC_URL}`,
      accounts: [`${process.env.PRIVATE_KEY}`],
      gas: 12000000,
      gasPrice: 10000000000,
    },
  },
  solidity: {
    version: "0.8.13",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  etherscan: {
    apiKey: process.env.API_KEY,
  },
};

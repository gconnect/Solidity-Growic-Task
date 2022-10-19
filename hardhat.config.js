require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const ALCHEMY_GOERLI_URL = process.env.ALCHEMY_GOERLI_URL
const METAMASK_KEY = process.env.METAMASK_KEY

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: ALCHEMY_GOERLI_URL,
      accounts: [METAMASK_KEY]
    }
  }
};

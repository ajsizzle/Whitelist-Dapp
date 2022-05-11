const { ethers } = require("hardhat")

async function main() {
    /**
     * @dev A ContractFactory is ethers.js is an abstraction used to deploy new smart contracts,
     * so whitelistContract is a factor for instances of our Whitelist contract.
     */
    const whitelistContract = await ethers.getContractFactory("Whitelist")

    /**
     * @dev deploy the contract
     * @notice 10 is the max num of addresses allowed
     */
    const deployedWhitelistContract = await whitelistContract.deploy(10)

    await deployedWhitelistContract.deployed()

    /**
     * @dev print the address of the deployed contract
     */
    console.log("Whitelist Contract Address:", deployedWhitelistContract.address)
}

/**
 * @dev Call the main function and catch if there is any error
 */
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })

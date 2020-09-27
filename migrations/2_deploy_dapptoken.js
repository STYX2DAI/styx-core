const STYX = artifacts.require('STYX')

module.exports = async function(deployer, network, accounts) {
  // Deploy Dapp Token
  await deployer.deploy(STYX)
  const STYX = await STYX.deployed()
}

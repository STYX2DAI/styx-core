const STYX = artifacts.require('STYX')
const TokenFarm = artifacts.require('TokenFarm')

module.exports = async function(deployer, network, accounts) {
  const styx = await STYX.deployed()
  await deployer.deploy(TokenFarm, styx.address)
  const tokenFarm = await TokenFarm.deployed()
  // styx.grantRole(bytes32 role, address account)

  await styx.transfer(tokenFarm.address, '1000000000000000000000000') //1 milion
}

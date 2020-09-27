const STYX = artifacts.require('STYX')

module.exports = async function(deployer, network, accounts) {
  const styx = await deployer.deploy(STYX)
  await STYX.deployed()
}

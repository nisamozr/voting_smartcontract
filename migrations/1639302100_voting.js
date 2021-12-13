const Vote = artifacts.require("./Voteing.sol")
// const election = artifacts.require("./election.sol")

module.exports = function(_deployer) {
  // Use deployer to state migration tasks.
  _deployer.deploy(Vote)
  // _deployer.deploy(election)
};

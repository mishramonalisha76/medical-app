var medrecords = artifacts.require("./medrecords.sol");

module.exports = function(deployer) {
  deployer.deploy(medrecords);
};
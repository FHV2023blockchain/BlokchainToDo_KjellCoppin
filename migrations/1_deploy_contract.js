const CustomContract = artifacts.require("CustomContract");

module.exports = function (deployer) {
    deployer.deploy(CustomContract);
}
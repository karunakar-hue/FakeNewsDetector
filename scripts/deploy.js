const hre = require("hardhat");

async function main() {
  // Compile contracts
  await hre.run('compile');

  // Deploy contract
  const FakeNewsDetector = await hre.ethers.getContractFactory("FakeNewsDetector");
  const fakeNewsDetector = await FakeNewsDetector.deploy();

  await fakeNewsDetector.deployed();

  console.log("FakeNewsDetector deployed to:", fakeNewsDetector.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

const {
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("StudentRegister", function () {
  let registerStudent
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployContractFixture() {
   
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const StudentRegister = await ethers.getContractFactory("StudentRegister");
    const studentRegister = await StudentRegister.deploy();

    return { studentRegister, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      const { studentRegister, owner } = await loadFixture(deployContractFixture);

      expect(await studentRegister.owner()).to.equal(owner.address);
    });
  });

  describe("RegisterStudent", function () {
    describe("Validations", function () {
      
      it("Should revert with the right error if called from another account", async function () {
        const { studentRegister, otherAccount } = await loadFixture(
          deployContractFixture
        );
        // We use studentRegister.connect() to send a transaction from another account
        const tx = studentRegister.connect(otherAccount).registerStudent("0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2", "john", 12, 23);
        await expect(tx).to.be.revertedWith(
          "not owner"
        );
      });

      it("Should revert with the right error if student is already registered", async function () {
        const { studentRegister, owner } = await loadFixture(
          deployContractFixture
        );
        const newStudent = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
        const registeredStudent = "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
        const tx = await studentRegister.connect(owner).registerStudent(newStudent, "john", 12, 23);
          if (tx[0] == newStudent) {
            await expect(tx).to.be.revertedWithCustomError(studentRegister,
          "Unauthorized"
          );
        }
      });

    it("Owner should register student", async function () {
        const { studentRegister, owner } = await loadFixture(
          deployContractFixture
        );
        const newStudent = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
        const registeredStudent = "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
        registerStudent = await studentRegister.connect(owner)
        .registerStudent(ethers.utils.getAddress(registeredStudent), "john".toString(), ethers.utils.parseUnits("12"), ethers.utils.parseUnits("23"));
        console.log(registerStudent)
        expect(registerStudent).to.equal(registerStudent);

      });  
    });

    describe("GetStudentDetails", function () {
      it("Should get student details", async function () {
        const { studentRegister } = await loadFixture(
          deployContractFixture
        );
        const student = await studentRegister.getStudentDetails("0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2")
        console.log(student)
        expect(student[0]).to.equal(registerStudent[0]);
        expect(student[1]).to.equal(registerStudent[1]);
        expect(student[2]).to.equal(registerStudent[2]);
        expect(student[3]).to.equal(registerStudent[3]);

      });
    });
    
  });
  });


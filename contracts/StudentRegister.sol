// SPDX_License-Identifier : MIT
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract StudentRegister {

    address public owner;

    struct Student {
        address studentId;
        string name;
        uint256 percentage;
        uint256 totalMarks;
        bool isRegistered;
    }

    mapping(address => Student) public student;

    // custom errorf
    error Unauthorized(string message);

    constructor(){
        owner = msg.sender;
    }

    // Only owner modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    // Only owner can register student
    function registerStudent(address studentId, string memory name, uint256 percentage, uint256 totalMarks) public onlyOwner {
        // require(student[studentId].isRegistered == false, "student already registered");
        if(student[studentId].isRegistered != false){
            revert Unauthorized("student already registered");
        }
        student[studentId] = Student(studentId, name, percentage, totalMarks, true);
    }

    // Get student details
    function getStudentDetails(address studentId) public view returns (address, string memory, uint256, uint256){
       return (student[studentId].studentId, student[studentId].name, student[studentId].percentage, student[studentId].totalMarks);      
           
    }
  }
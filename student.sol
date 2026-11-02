
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StudentData {

    // Structure to store student information
    struct Student {
        uint256 id;
        string name;
        uint256 age;
        string course;
    }

    // Array to store multiple students
    Student[] public students;

    // Event for fallback function
    event FallbackCalled(address sender, uint256 amount);

    // Function to add student details
    function addStudent(
        uint256 _id,
        string memory _name,
        uint256 _age,
        string memory _course
    ) public {

        students.push(
            Student(_id, _name, _age, _course)
        );
    }

    // Function to get student details
    function getStudent(uint256 index)
        public
        view
        returns (
            uint256,
            string memory,
            uint256,
            string memory
        )
    {
        require(index < students.length, "Invalid student index");

        Student memory s = students[index];

        return (
            s.id,
            s.name,
            s.age,
            s.course
        );
    }

    // Function to get total number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Fallback function
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value);
    }
}

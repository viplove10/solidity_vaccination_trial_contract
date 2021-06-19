// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.5;


contract Clinic {
    
    
}


contract Volunteers {
    
    struct Volunteer {
        uint256 dob;
        bytes1 gender; 
        bytes32 medical_precondition_hash;
        bool other_vaccine_taken;
        string other_vaccine_name;
        uint256 other_vaccination_date;
        
        bool doesExists;
        bool approved;
    }

    mapping (address => Volunteer) private volunteers;
    
    
    /**
     * Notify whenever a volunteer is added
     * @param volunteer Address of the added volunteer
     */
    event VolunteerAdded(address volunteer);
    
    /**
     * Notify whenever a volunteer is approved
     * @param volunteer Address of the volunteer approved
     */
    event VolunteerApproved(address volunteer);
    
    
    function addVolunteer(uint256 dob, bytes1 gender, bytes memory medical_precondition, bool other_vaccine_taken, string memory other_vaccine_name, uint256 other_vaccination_date) public {
        address volunteer = msg.sender;
        
        require(volunteers[volunteer].doesExists != true, "Volunteer already exists");
        
        volunteers[volunteer].doesExists = true;
        volunteers[volunteer].approved = false;
        
        volunteers[volunteer].dob = dob;
        volunteers[volunteer].gender = gender;
        volunteers[volunteer].medical_precondition_hash = sha256(medical_precondition);
        volunteers[volunteer].other_vaccine_taken = other_vaccine_taken;
        volunteers[volunteer].other_vaccine_name = other_vaccine_name;
        volunteers[volunteer].other_vaccination_date = other_vaccination_date;
        
        emit VolunteerAdded(volunteer);
    }
    
    
    function removeVolunteer() public {
        volunteers[msg.sender].doesExists = false;
    }

}
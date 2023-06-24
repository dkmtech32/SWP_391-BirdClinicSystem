/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.users.doctor;

import models.dto.speciality.SpecialityDTO;
import models.dto.users.UserDTO;

/**
 *
 * @author Admin
 */
public interface DoctorDTO extends UserDTO {

    String getAcademicTitle();

    String getDegree();

    int getDocAge();

    String getDocPhone();

    SpecialityDTO getSpeciality();

    int getYearsOfExperience();

    void setAcademicTitle(String academicTitle);

    void setDegree(String degree);

    void setDocAge(int docAge);

    void setDocPhone(String docPhone);

    void setSpeciality(SpecialityDTO speciality);

    void setYearsOfExperience(int yearsOfExperience);
    
}

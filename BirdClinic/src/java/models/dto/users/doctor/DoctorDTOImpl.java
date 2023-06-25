/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.users.doctor;

import models.dto.images.ImageDTO;
import models.dto.speciality.SpecialityDTO;
import models.dto.users.UserDTO;
import models.dto.users.UserDTOImpl;

/**
 *
 * @author Admin
 */
public class DoctorDTOImpl extends UserDTOImpl implements DoctorDTO {
    private SpecialityDTO speciality;
    private String docPhone;
    private int docAge;
    private int yearsOfExperience;
    private String academicTitle;
    private String degree;

    public DoctorDTOImpl() {
    }

    public DoctorDTOImpl(UserDTO user) {
        super.copyUser(user);
    }
    
    public DoctorDTOImpl(UserDTO user, SpecialityDTO speciality, String docPhone, int docAge, int yearsOfExperience, String academicTitle, String degree) {
        super.copyUser(user);
        this.speciality = speciality;
        this.docPhone = docPhone;
        this.docAge = docAge;
        this.yearsOfExperience = yearsOfExperience;
        this.academicTitle = academicTitle;
        this.degree = degree;
    }

    @Override
    public SpecialityDTO getSpeciality() {
        return speciality;
    }

    @Override
    public void setSpeciality(SpecialityDTO speciality) {
        this.speciality = speciality;
    }

    @Override
    public String getDocPhone() {
        return docPhone;
    }

    @Override
    public void setDocPhone(String docPhone) {
        this.docPhone = docPhone;
    }

    @Override
    public int getDocAge() {
        return docAge;
    }

    @Override
    public void setDocAge(int docAge) {
        this.docAge = docAge;
    }

    @Override
    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    @Override
    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    @Override
    public String getAcademicTitle() {
        return academicTitle;
    }

    @Override
    public void setAcademicTitle(String academicTitle) {
        this.academicTitle = academicTitle;
    }

    @Override
    public String getDegree() {
        return degree;
    }

    @Override
    public void setDegree(String degree) {
        this.degree = degree;
    }
}

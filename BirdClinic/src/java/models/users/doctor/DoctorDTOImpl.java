/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.doctor;

import models.speciality.SpecialityDTO;
import models.users.UserDTO;
import models.users.UserDTOImpl;

/**
 *
 * @author Admin
 */
public class DoctorDTOImpl extends UserDTOImpl implements DoctorDTO {

    private SpecialityDTO speciality;
    private int docAge;
    private int yearsOfExperience;
    private String academicTitle;
    private String degree;

    public DoctorDTOImpl() {
    }

    public DoctorDTOImpl(UserDTO user) {
        super.copyUser(user);
    }

    public DoctorDTOImpl(UserDTO user, SpecialityDTO speciality, int docAge, int yearsOfExperience, String academicTitle, String degree) {
        super.copyUser(user);
        this.speciality = speciality;
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

    @Override
    public DoctorDTOImpl copyUser() {
        DoctorDTOImpl doctor = new DoctorDTOImpl();
        doctor.copyUser(this);
        doctor.setSpeciality(this.speciality);
        doctor.setDocAge(this.docAge);
        doctor.setYearsOfExperience(this.yearsOfExperience);
        doctor.setAcademicTitle(this.academicTitle);
        doctor.setDegree(this.degree);
        return doctor;
    }

    @Override
     public void copyUser(UserDTO user) {
        super.copyUser(user);

        if (user instanceof DoctorDTO) {
            DoctorDTO doctor = (DoctorDTO) user;
            this.setSpeciality(doctor.getSpeciality());
            this.setDocAge(doctor.getDocAge());
            this.setYearsOfExperience(doctor.getYearsOfExperience());
            this.setAcademicTitle(doctor.getAcademicTitle());
            this.setDegree(doctor.getDegree());
        } else {
            throw new IllegalArgumentException("Invalid user type for copying.");
        }
    }
}

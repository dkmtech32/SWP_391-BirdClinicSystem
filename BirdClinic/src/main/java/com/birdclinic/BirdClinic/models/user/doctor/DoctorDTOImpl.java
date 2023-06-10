package com.birdclinic.BirdClinic.models.user.doctor;

import com.birdclinic.BirdClinic.models.user.UserDTOImpl;

public class DoctorDTOImpl extends UserDTOImpl implements DoctorDTO {
    private String doctorID;
    private String specialtyID;
    private String docFullName;
    private String docPhone;
    private int docAge;
    private int yearOfExp;
    private String academicTitle;
    private String degree;

    public DoctorDTOImpl() {
    }

    @Override
    public String getDoctorID() {
        return doctorID;
    }

    @Override
    public void setDoctorID(String doctorID) {
        this.doctorID = doctorID;
    }

    @Override
    public String getSpecialtyID() {
        return specialtyID;
    }

    @Override
    public void setSpecialtyID(String specialtyID) {
        this.specialtyID = specialtyID;
    }

    @Override
    public String getDocFullName() {
        return docFullName;
    }

    @Override
    public void setDocFullName(String docFullName) {
        this.docFullName = docFullName;
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
    public int getYearOfExp() {
        return yearOfExp;
    }

    @Override
    public void setYearOfExp(int yearOfExp) {
        this.yearOfExp = yearOfExp;
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

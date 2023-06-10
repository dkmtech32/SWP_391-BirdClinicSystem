package com.birdclinic.BirdClinic.models.user.doctor;

import com.birdclinic.BirdClinic.models.user.UserDTO;

public interface DoctorDTO extends UserDTO {

    String getDoctorID();

    void setDoctorID(String doctorID);

    String getSpecialtyID();

    void setSpecialtyID(String specialtyID);

    String getDocFullName();

    void setDocFullName(String docFullName);

    String getDocPhone();

    void setDocPhone(String docPhone);

    int getDocAge();

    void setDocAge(int docAge);

    int getYearOfExp();

    void setYearOfExp(int yearOfExp);

    String getAcademicTitle();

    void setAcademicTitle(String academicTitle);

    String getDegree();

    void setDegree(String degree);

}
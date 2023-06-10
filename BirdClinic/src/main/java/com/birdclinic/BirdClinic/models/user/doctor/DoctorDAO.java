package com.birdclinic.BirdClinic.models.user.doctor;

import com.birdclinic.BirdClinic.models.user.UserDAO;
import com.birdclinic.BirdClinic.models.user.UserDTO;

public interface DoctorDAO extends UserDAO {

    DoctorDTO readDoctor(String doctorID);

    boolean deleteDoctor(String doctorID);

    boolean createDoctor(DoctorDTO doctor);

    boolean updateDoctor(DoctorDTO doctor);

    boolean createDoctorFromUser(UserDTO user);

    boolean linkDoctorAccount(String doctorID, String userID);

    boolean delinkDoctorAccount(String userID);
}
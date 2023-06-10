package com.birdclinic.BirdClinic.models.user.doctor;

// import java.util.List;
// import java.util.ArrayList;
// import java.util.Map;
// import java.util.HashMap;
import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.birdclinic.BirdClinic.models.user.UserDAOImpl;
import com.birdclinic.BirdClinic.models.user.UserDTO;

@Repository
public class DoctorDAOImpl extends UserDAOImpl implements DoctorDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public DoctorDTO readDoctor(String doctorID) {
        DoctorDTO result = null;

        return result;
    }

    @Override
    public boolean deleteDoctor(String doctorID) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean createDoctor(DoctorDTO doctor) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean updateDoctor(DoctorDTO doctor) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean createDoctorFromUser(UserDTO user) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean linkDoctorAccount(String doctorID, String userID) {
        boolean result = false;

        return result;
    }

    @Override
    public boolean delinkDoctorAccount(String userID) {
        boolean result = false;

        return result;
    }
}

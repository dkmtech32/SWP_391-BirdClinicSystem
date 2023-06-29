/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.users.doctor;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dao.users.UserDAO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface DoctorDAO extends UserDAO {

    int deleteDoctor(String doctorID) throws SQLException;

    int insertDoctor(DoctorDTO doctor) throws SQLException;

    List<DoctorDTO> readAllDoctors() throws SQLException;

    DoctorDTO readDoctor(String doctorID) throws SQLException;

    DoctorDTO readDoctor(String doctorID, Connection con) throws SQLException;

    int updateDoctor(DoctorDTO doctor) throws SQLException;
    
}

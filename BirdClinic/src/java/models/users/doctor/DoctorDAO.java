/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.doctor;

import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.users.UserDAO;

/**
 *
 * @author Admin
 */
public interface DoctorDAO extends UserDAO {

    int deleteDoctor(String doctorID) 
            throws SQLException, NoSuchRecordExists;

    int insertDoctor(DoctorDTO doctor) 
            throws SQLException, RecordAlreadyExists;

    List<DoctorDTO> readAllDoctors() 
            throws SQLException, NoSuchRecordExists;

    DoctorDTO readDoctor(String doctorID) 
            throws SQLException, NoSuchRecordExists;

    List<DoctorDTO> readListOfDoctors(List<String> doctorIDs) 
            throws SQLException, NoSuchRecordExists;

    int updateDoctor(DoctorDTO doctor) 
            throws SQLException, NoSuchRecordExists;
    
}

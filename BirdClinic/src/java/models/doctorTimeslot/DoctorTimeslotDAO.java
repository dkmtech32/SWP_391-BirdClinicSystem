/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.doctorTimeslot;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface DoctorTimeslotDAO extends Serializable {

    int deleteDoctorTimeslot(String doctorID, String timeSlotID) 
            throws NoSuchRecordExists, SQLException;

    int insertDoctorTimeslot(String doctorID, String timeSlotID) 
            throws RecordAlreadyExists, SQLException;

    List<TimeslotDTO> readDoctorTimeslotByDoctor(String doctorID) 
            throws NoSuchRecordExists, SQLException;

    List<DoctorDTO> readDoctorTimeslotByTimeslot(String timeslotID) 
            throws NoSuchRecordExists, SQLException;
    
    List<List<TimeslotDTO>> readDoctorTimeslotByDoctorGrouped(String doctorID) 
            throws NoSuchRecordExists, SQLException;
    
    int dropDoctor(String doctorID)
            throws SQLException, NoSuchRecordExists;
}

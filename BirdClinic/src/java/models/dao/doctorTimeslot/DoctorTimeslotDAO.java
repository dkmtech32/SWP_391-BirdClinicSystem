/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.doctorTimeslot;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface DoctorTimeslotDAO extends Serializable {

    int deleteDoctorTimeslot(String doctorID, String timeSlotID) throws SQLException;

    int insertDoctorTimeslot(String doctorID, String timeSlotID) throws SQLException;

    List<TimeslotDTO> readDoctorTimeslotByDoctor(String doctorID) throws SQLException;

    List<DoctorDTO> readDoctorTimeslotByTimeslot(String timeslotID) throws SQLException;
    
    Map<String, List<TimeslotDTO>> readDoctorTimeslotByDoctorGrouped(String doctorID) throws SQLException;
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.timeslot;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public interface TimeslotDAO extends Serializable{

    List<TimeslotDTO> readAllTimeSlot() throws NoSuchRecordExists, SQLException;

    TimeslotDTO readTimeSlot(String timeslotID) throws NoSuchRecordExists, SQLException;
   
    List<TimeslotDTO> readListOfTimeslot(List<String> timeslotIDs) throws NoSuchRecordExists, SQLException;
    
    List<String> readWeekdays() throws NoSuchRecordExists, SQLException;
    
    List<List<TimeslotDTO>> readTimeslotsGrouped() throws NoSuchRecordExists, SQLException;
}

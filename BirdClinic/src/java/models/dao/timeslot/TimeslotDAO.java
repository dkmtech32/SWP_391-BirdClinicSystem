/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.timeslot;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.timeslot.TimeslotDTO;

/**
 *
 * @author Admin
 */
public interface TimeslotDAO extends Serializable{

    List<TimeslotDTO> readAllTimeSlot() throws SQLException;

    TimeslotDTO readTimeSlot(String timeslotID) throws SQLException;

    TimeslotDTO readTimeSlot(String timeslotID, Connection con) throws SQLException;
    
}

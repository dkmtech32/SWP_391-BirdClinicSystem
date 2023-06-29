/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.appointment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.appointment.AppointmentDTO;
/**
 *
 * @author Admin
 */
public interface AppointmentDAO extends Serializable {
    AppointmentDTO readAppointment(String appointmentID) throws SQLException;
    
    AppointmentDTO readAppointment(String appointmentID, Connection con) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByBird(String birdID) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByBird(String birdID, Connection con) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByDoctor(String doctorID) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByDoctor(String doctorID, Connection con) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByCustomer(String customerID) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByCustomer(String customerID, Connection con) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByTimeslot(String timeslotID) throws SQLException;
    
    List<AppointmentDTO> readAppointmentByTimeslot(String timeslotID, Connection con) throws SQLException;
    
    int deleteAppointment(String appointmentID) throws SQLException;
    
    int deleteAppointment(String appointmentID, Connection con) throws SQLException;
    
    int insertAppointment(AppointmentDTO appointment) throws SQLException;
    
    int insertAppointment(AppointmentDTO appointment, Connection con) throws SQLException;
    
    int updateAppointment(AppointmentDTO appointment) throws SQLException;
    
    int updateAppointment(AppointmentDTO appointment, Connection con) throws SQLException;
}

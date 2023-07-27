/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointment;

import java.io.Serializable;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.service_.Service_DTO;

/**
 *
 * @author Admin
 */
public interface AppointmentDAO extends Serializable {

    AppointmentDTO readAppointment(String appointmentID)
            throws NoSuchRecordExists, SQLException;

    List<AppointmentDTO> readListOfAppointment(List<String> appointmentIDs)
            throws NoSuchRecordExists, SQLException;
    
    List<AppointmentDTO> readAllAppointments()
            throws NoSuchRecordExists, SQLException;

    List<AppointmentDTO> readAppointmentByBird(String birdID)
            throws NoSuchRecordExists, SQLException;

    List<AppointmentDTO> readAppointmentByDoctor(String doctorID)
            throws NoSuchRecordExists, SQLException;

    List<AppointmentDTO> readAppointmentByCustomer(String customerID)
            throws NoSuchRecordExists, SQLException;

    List<AppointmentDTO> readAppointmentByTimeslot(String timeslotID)
            throws NoSuchRecordExists, SQLException;
    
    List<AppointmentDTO> readAppointmentByDate(Date before, Date after)
            throws NoSuchRecordExists, SQLException;

    List<AppointmentDTO> readAppointmentByStatus(String status) throws NoSuchRecordExists, SQLException;

    AppointmentDTO readAppointmentByDocTime(String doctorID, String timeslotID, Date appDate)
            throws NoSuchRecordExists, SQLException;

    int deleteAppointment(String appointmentID) throws NoSuchRecordExists, SQLException;

    int insertAppointment(AppointmentDTO appointment) throws RecordAlreadyExists, SQLException;

    int updateAppointment(AppointmentDTO appointment) throws NoSuchRecordExists, SQLException;

    int updateAppointmentStatus(String appointmentID, String status) throws NoSuchRecordExists, SQLException;
    
    int deleteService(String appointmentID) throws SQLException;
    
    int addService(List<Service_DTO> services, String appointmentID) throws SQLException;
}

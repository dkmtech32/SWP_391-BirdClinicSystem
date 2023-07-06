/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.general;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.bird.BirdDTO;
import models.medicalRecord.MedicalRecordDTO;
import models.recordMedicine.RecordMedicineDTO;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface GeneralServices extends Serializable {

    boolean checkRole(String role);

    UserDTO getCurrentUser();

    boolean login(String username, String password) throws AccountDoesNotExist, SQLException;

    AppointmentDTO viewAppointment(String appointmentID) throws SQLException, AppointmentDoesNotExistException;

    BirdDTO viewBird(String birdID) throws SQLException, BirdDoesNotExistException;

    MedicalRecordDTO viewMedicalRecord(String appointmentID) throws SQLException;

    List<RecordMedicineDTO> viewRecordMeds(String medicalRecordID) throws SQLException;
    
    boolean register(Map<String, String[]> args)
            throws AccountAlreadyExistsException, PasswordsNotEqualException, SQLException, PasswordNotStrongException;
    
    List<DoctorDTO> getAllDoctors() throws SQLException;
    
    List<List<TimeslotDTO>> getTimeslotsByWeekday(String doctorID) 
            throws SQLException;
    
    List<Service_DTO> getServices(String doctorID) 
            throws SQLException, AccountDoesNotExist;
    
    TimeslotDTO getTimeslot(String TimeslotID) throws SQLException;
    
    boolean updateAccount(Map<String, String[]> args) 
            throws AccountAlreadyExistsException, PasswordNotStrongException, SQLException;
    
    boolean enableAccount(String userID) throws AccountDoesNotExist, SQLException;
    
    boolean updateAccountPassword(String nPassword)
            throws PasswordNotStrongException, AccountDoesNotExist, SQLException;
}
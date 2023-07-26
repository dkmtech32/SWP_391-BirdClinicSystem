/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.general;

import java.io.InputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.bird.BirdAlreadyExistsException;
import models.bird.BirdDTO;
import models.blog.BlogDTO;
import models.feedback.FeedbackDTO;
import models.medicalRecord.MedicalRecordDTO;
import models.recordMedicine.RecordMedicineDTO;
import models.service_.Service_DTO;
import models.speciality.SpecialityDTO;
import models.timeslot.TimeslotDTO;
import models.users.UserDTO;
import models.users.customer.CustomerDTO;
import models.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface GeneralServices extends Serializable {

    boolean checkRole(String role);

    UserDTO getCurrentUser();

    boolean login(String username, String password) throws AccountDoesNotExistException, SQLException;

    AppointmentDTO viewAppointment(String appointmentID) throws SQLException, AppointmentDoesNotExistException;

    BirdDTO viewBird(String birdID) throws SQLException, BirdDoesNotExistException;

    MedicalRecordDTO viewMedicalRecord(String appointmentID) throws SQLException;

    List<RecordMedicineDTO> viewRecordMeds(String medicalRecordID) throws SQLException;

    FeedbackDTO viewFeedback(String appointmentID) throws SQLException;

    UserDTO viewAccount(String userID) throws AccountDoesNotExistException, SQLException;
    
    BirdDTO createBird(Map<String, String[]> args, CustomerDTO customer, InputStream imageFile) throws BirdAlreadyExistsException, SQLException;

    CustomerDTO createAccount(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, PasswordsNotEqualException, SQLException, PasswordNotStrongException;
    
    boolean register(CustomerDTO account, BirdDTO bird) throws SQLException;

    List<DoctorDTO> getAllDoctors() throws SQLException;

    List<List<TimeslotDTO>> getTimeslotsByWeekday(String doctorID)
            throws SQLException;

    List<Service_DTO> getServices(String doctorID)
            throws SQLException, AccountDoesNotExistException;

    TimeslotDTO getTimeslot(String TimeslotID) throws SQLException;

    boolean updateAccount(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, SQLException;

    boolean enableAccount(String userID) throws AccountDoesNotExistException, SQLException;

    boolean updateAccountPassword(String nPassword)
            throws PasswordNotStrongException, AccountDoesNotExistException, SQLException;

    DoctorDTO getDoctorInfo(String doctorID) throws SQLException, AccountDoesNotExistException;
    
    CustomerDTO getCustomerInfo(String customerID) throws SQLException, AccountDoesNotExistException;

    List<SpecialityDTO> getSpecialities()
            throws SQLException;

    boolean isDoctorFree(String doctorID, String timeslotID, Date appDate)
            throws SQLException, AccountDoesNotExistException;

    List<FeedbackDTO> getDoctorFeedbacks(String doctorID) throws SQLException;

    BigDecimal getDoctorRatings(List<FeedbackDTO> feedbacks) throws SQLException;

    List<BirdDTO> getCustomerBirds(String customerID) throws SQLException;

    BlogDTO viewBlog(String blogID) throws SQLException, BlogDoesNotExistException;

    List<BlogDTO> viewIntroBlogs() throws SQLException;
    
    List<AppointmentDTO> getAppointmentsByFilter(String filter) 
            throws SQLException;
    
    List<BlogDTO> viewAllBlog() throws SQLException, BlogDoesNotExistException;
    
    List<AppointmentDTO> getBirdAppointments(String birdID) throws BirdDoesNotExistException, SQLException;

    List<AppointmentDTO> getCustomerAppointments(String customerID) throws AccountDoesNotExistException, SQLException;
    
    List<MedicalRecordDTO> viewMedicalRecordOfBird(String birdID) throws SQLException;
}

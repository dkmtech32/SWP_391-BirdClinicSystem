/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentAlreadyExistsException;
import models.appointment.AppointmentDTO;
import models.blog.BlogDTO;
import models.feedback.FeedbackDTO;
import models.service_.Service_DTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.BlogDoesNotExistException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public interface StaffServices extends GeneralServices {

    boolean cancelAppointment(String appointmentID) throws AppointmentDoesNotExistException, SQLException;

    List<DoctorDTO> checkDoctor(AppointmentDTO appointment) throws AppointmentDoesNotExistException, DoctorDoesNotExistException, SQLException;

    boolean updateAppointment(String appointmentID) throws AppointmentDoesNotExistException, DoctorDoesNotExistException, SQLException;

    boolean updateAppointmentDoctor(String appointmentID, String doctorID) throws DoctorDoesNotExistException, AppointmentDoesNotExistException, SQLException;

    boolean updateAppointmentPayment(String appointmentID, String payment) throws AppointmentDoesNotExistException, SQLException;

    boolean updateAppointmentPrice(String appointmentID, BigDecimal totalPrice)
            throws AppointmentDoesNotExistException, SQLException;

    boolean updateService_(String serviceID, float servicePrice, String serviceName) throws ServiceDoesNotExistException, SQLException;

    List<FeedbackDTO> getCustomerFeedbacks(String customerID) throws SQLException;

    BlogDTO addBlog(Map<String, String[]> args, InputStream file) throws BlogAlreadyExistsException, SQLException;

    BlogDTO editBlog(Map<String, String[]> args, InputStream file) throws BlogDoesNotExistException, SQLException;

    Map<String, List<DoctorDTO>> getDoctorBySpeciality() throws SQLException;

    List<Service_DTO> getService_BySpeciality(String specialityID) throws SQLException, ServiceDoesNotExistException;

    boolean addService(Map<String, String[]> args) throws ServiceAlreadyExistsException, SQLException;

    List<Service_DTO> getAllServices() throws SQLException, ServiceDoesNotExistException;

    boolean deleteService(String serviceID) throws SQLException, ServiceDoesNotExistException;
    
    boolean bookReexamination(Map<String, String[]> args) throws SQLException, AppointmentAlreadyExistsException;
}

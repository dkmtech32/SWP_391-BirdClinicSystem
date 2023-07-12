/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.admin;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.service_.Service_DTO;
import models.users.UserDTO;
import models.users.customer.CustomerDTO;
import models.users.doctor.DoctorDTO;
import services.general.AccountAlreadyExistsException;
import services.general.AccountDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServices;
import services.staff.ServiceDoesNotExistException;

/**
 *
 * @author Admin
 */
public interface AdminServices extends GeneralServices {

    boolean changeDoctorInfo(Map<String, String[]> args) throws SQLException, AccountDoesNotExistException;

    boolean changeDoctorTimeslots(Map<String, String[]> args) throws SQLException, AccountDoesNotExistException;

    CustomerDTO createCustomer(Map<String, String[]> args) throws AccountAlreadyExistsException, SQLException;

    DoctorDTO createDoctor(Map<String, String[]> args) throws AccountAlreadyExistsException, SQLException;

    UserDTO createStaffAdmin(Map<String, String[]> args) throws AccountAlreadyExistsException, SQLException;

    List<AppointmentDTO> getAllAppointments() throws SQLException, AppointmentDoesNotExistException;

    List<CustomerDTO> getAllCustomer() throws SQLException, AccountDoesNotExistException;

//    List<BigDecimal> getAllRatingsFromDoctor() throws SQLException, AccountDoesNotExistException;

    List<Service_DTO> getAllServices() throws SQLException, ServiceDoesNotExistException;

    List<UserDTO> getAllUsers() throws SQLException, AccountDoesNotExistException;

    boolean toggleAccountStatus(String userID) throws AccountDoesNotExistException, SQLException;
    
    List<UserDTO> getUsersByFilter(String filter) throws SQLException, AccountDoesNotExistException;
}

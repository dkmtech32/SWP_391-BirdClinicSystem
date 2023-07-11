/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.admin;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDTO;
import models.service_.Service_DTO;
import models.speciality.SpecialityDTO;
import models.users.UserDTO;
import models.users.UserDTOImpl;
import models.users.customer.CustomerDTO;
import models.users.customer.CustomerDTOImpl;
import models.users.doctor.DoctorDTO;
import models.users.doctor.DoctorDTOImpl;
import services.general.AccountAlreadyExistsException;
import services.general.AccountDoesNotExist;
import services.general.AccountDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServicesImpl;
import services.staff.ServiceDoesNotExistException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class AdminServicesImpl extends GeneralServicesImpl implements AdminServices {

    public AdminServicesImpl(UserDTO user) throws AccountDoesNotExist {
        if (user.getUserRole().toLowerCase().equals("admin")) {
            this.currentUser = user;
        } else {
            throw new AccountDoesNotExist();
        }
    }

    @Override
    public DoctorDTO createDoctor(Map<String, String[]> args)
            throws AccountAlreadyExistsException, SQLException {
        //assumption: args have all key-value pairs
        DoctorDTO result = null;
        String username = args.get("username")[0];
        String password = args.get("password")[0];
        String email = args.get("email")[0];
        String academicTitle = args.get("academic-title")[0];
        String degree = args.get("degree")[0];
        String gender = args.get("gender")[0];
        int docAge = Integer.parseInt(args.get("doctor-age")[0]);
        String specialityID = args.get("specialityID")[0];
        int yOE = Integer.parseInt(args.get("years-of-experience")[0]);
        String phoneNumber = args.get("phone-number")[0];

        try {
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            SpecialityDTO speciality = specialityDAO.readSpeciality(specialityID);
            String rPassword = Utils.hash(password);
            String userID = Utils.hash(email + username + String.valueOf(System.currentTimeMillis()));
            result = new DoctorDTOImpl();
            result.setUserID(userID);
            result.setEmail(email);
            result.setUserName(username);
            result.setUserPassword(rPassword);
            result.setGender(gender);
            result.setUserRole("doctor");
            result.setImage(image);
            result.setStatus_(true);
            result.setPhoneNumber(phoneNumber);

            //doctor info
            result.setAcademicTitle(academicTitle);
            result.setDegree(degree);
            result.setDocAge(docAge);
            result.setSpeciality(speciality);
            result.setYearsOfExperience(yOE);

            doctorDAO.insertDoctor(result);

        } catch (RecordAlreadyExists ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }
    
    @Override
    public CustomerDTO createCustomer(Map<String, String[]> args)
            throws AccountAlreadyExistsException, SQLException {
        CustomerDTO result = null;
        String username = args.get("username")[0];
        String password = args.get("password")[0];
        String email = args.get("email")[0];
        String role = args.get("role")[0];
        String phoneNumber = args.get("phone-number")[0];
        String gender = args.get("gender")[0];
        String address = args.get("customer-address")[0];
        Date dob = Date.valueOf(args.get("dob")[0]);

        try {

            String rPassword = Utils.hash(password);
            String userID = Utils.hash(email + username);
            result = new CustomerDTOImpl();
            result.setUserID(userID);
            result.setEmail(email);
            result.setUserName(username);
            result.setUserPassword(rPassword);
            result.setGender(gender);
            result.setUserRole(role);
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            result.setImage(image);
            result.setStatus_(true);
            result.setPhoneNumber(phoneNumber);
            result.setCustomerAddress(address);
            result.setDob(dob);

            customerDAO.insertCustomer(result);

        } catch (RecordAlreadyExists ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public UserDTO createStaffAdmin(Map<String, String[]> args)
            throws AccountAlreadyExistsException, SQLException {
        //assumption: args have all 4 key-value pairs
        UserDTO result = null;
        String username = args.get("username")[0];
        String password = args.get("password")[0];
        String email = args.get("email")[0];
        String role = args.get("role")[0];
        String phoneNumber = args.get("phone-number")[0];
        String gender = args.get("gender")[0];

        try {

            String rPassword = Utils.hash(password);
            String userID = Utils.hash(email + username);
            result = new UserDTOImpl();
            result.setUserID(userID);
            result.setEmail(email);
            result.setUserName(username);
            result.setUserPassword(rPassword);
            result.setGender(gender);
            result.setUserRole(role);
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            result.setImage(image);
            result.setStatus_(true);
            result.setPhoneNumber(phoneNumber);

            userDAO.insertUser(result);

        } catch (RecordAlreadyExists ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean toggleAccountStatus(String userID) throws AccountDoesNotExistException, SQLException {
        boolean result = false;

        try {
            UserDTO user = userDAO.readUser(userID);
            String status = user.isStatus_() ? "banned" : "active";
            result = userDAO.updateUserStatus(userID, status) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean changeDoctorInfo(Map<String, String[]> args) throws SQLException, AccountDoesNotExistException {
        boolean result = false;

        try {
            String doctorID = args.get("doctorID")[0];
            String academicTitle = args.get("academic-title")[0];
            String degree = args.get("degree")[0];
            int docAge = Integer.parseInt(args.get("doctor-age")[0]);
            String specialityID = args.get("specialityID")[0];
            int yOE = Integer.parseInt(args.get("years-of-experience")[0]);
            SpecialityDTO speciality = specialityDAO.readSpeciality(specialityID);

            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
            doctor.setAcademicTitle(academicTitle);
            doctor.setDegree(degree);
            doctor.setDocAge(docAge);
            doctor.setSpeciality(speciality);
            doctor.setYearsOfExperience(yOE);

            result = doctorDAO.updateDoctor(doctor) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean changeDoctorTimeslots(Map<String, String[]> args) throws SQLException, AccountDoesNotExistException {
        boolean result = false;

        try {
            String doctorID = args.get("doctorID")[0];
            String[] timeslots = args.get("timeslots");

            doctorTimeslotDAO.dropDoctor(doctorID);
            for (String timeslotID : timeslots) {
                result = doctorTimeslotDAO.insertDoctorTimeslot(doctorID, timeslotID) > 0;
            }

        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        } catch (RecordAlreadyExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public List<BigDecimal> getAllRatingsFromDoctor() throws SQLException, AccountDoesNotExistException {
        List<BigDecimal> result = null;

        List<DoctorDTO> doctors = super.getAllDoctors();
        for (DoctorDTO doctor : doctors) {
            if (result == null) {
                result = new ArrayList<>();
            }
            result.add(super.getDoctorRatings(doctor.getUserID()));
        }
        return result;
    }

    @Override
    public List<AppointmentDTO> getAllAppointments() throws SQLException, AppointmentDoesNotExistException {
        List<AppointmentDTO> result = null;
        
        try {
            result = appointmentDAO.readAllAppointments();
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }
        
        return result;
    }
    
    @Override
    public List<CustomerDTO> getAllCustomer() throws SQLException, AccountDoesNotExistException {
        List<CustomerDTO> result = null;
        
        try {
            result = customerDAO.readAllCustomers();
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }
        
        return result;
    }
    
    @Override
    public List<UserDTO> getAllUsers() throws SQLException, AccountDoesNotExistException {
        List<UserDTO> result = null;
        
        try {
            result = userDAO.readAllUsers();
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }
        
        return result;
    }
    
    @Override
    public List<Service_DTO> getAllServices() throws SQLException, ServiceDoesNotExistException {
        List<Service_DTO> result = null;
        
        try {
            result = serviceDAO.readAllService_();
        } catch (NoSuchRecordExists ex) {
            throw new ServiceDoesNotExistException(ex.getMessage());
        }
        
        return result;
    }
}

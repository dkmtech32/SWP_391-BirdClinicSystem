/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.admin;

import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.feedback.FeedbackDTO;
import models.images.ImageDTO;
import models.speciality.SpecialityDTO;
import models.timeslot.TimeslotDTO;
import models.users.UserDTO;
import models.users.UserDTOImpl;
import models.users.customer.CustomerDTO;
import models.users.doctor.DoctorDTO;
import models.users.doctor.DoctorDTOImpl;
import services.general.AccountAlreadyExistsException;
import services.general.AccountDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServicesImpl;
import services.general.ImageAlreadyExistsException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class AdminServicesImpl extends GeneralServicesImpl implements AdminServices {

    public AdminServicesImpl(UserDTO user) throws AccountDoesNotExistException {
        if (user.getUserRole().toLowerCase().equals("admin")) {
            this.currentUser = user;
        } else {
            throw new AccountDoesNotExistException();
        }
    }

    @Override
    public DoctorDTO createDoctor(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, SQLException {
        //assumption: args have all key-value pairs
        DoctorDTO result = null;
        String username = args.get("username")[0];
        String password = args.get("password")[0];
        String email = args.get("email")[0];
        String academicTitle = args.get("academic-title")[0];
        String degree = args.get("degree")[0];
        String gender = args.get("gender")[0];
        String fullName = args.get("full-name")[0];
        int docAge = Integer.parseInt(args.get("doctor-age")[0]);
        String specialityID = args.get("specialityID")[0];
        int yOE = Integer.parseInt(args.get("years-of-experience")[0]);
        String phoneNumber = args.get("phone-number")[0];
        String filetype = Utils.getFromMap(args, "filetype", ".jpg");
        String path = Utils.getFromMap(args, "path", "");

        try {
            
            SpecialityDTO speciality = specialityDAO.readSpeciality(specialityID);
            String rPassword = Utils.hash(password);
            String userID = Utils.hash(email + username + String.valueOf(System.currentTimeMillis()));
            result = new DoctorDTOImpl();
            result.setUserID(userID);
            ImageDTO image = null;
            if (file != null) {
                String imageURLName = userID + filetype;
                image = addImage(file, path, imageURLName);
            } else {
                image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            }
            result.setFullName(fullName);
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

        } catch (RecordAlreadyExists | ImageAlreadyExistsException ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public CustomerDTO createCustomer(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, SQLException {
        CustomerDTO result = null;

        return result;
    }

    @Override
    public UserDTO createStaffAdmin(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, SQLException {
        //assumption: args have all 4 key-value pairs
        UserDTO result = null;
        String username = args.get("username")[0];
        String password = args.get("password")[0];
        String email = args.get("email")[0];
        String role = args.get("userRole")[0];
        String phoneNumber = args.get("phone-number")[0];
        String fullName = args.get("full-name")[0];
        String gender = args.get("gender")[0];
        String filetype = Utils.getFromMap(args, "filetype", ".jpg");
        String path = Utils.getFromMap(args, "path", "");

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
            result.setFullName(fullName);
            ImageDTO image = null;
            if (file != null) {
                String imageURLName = userID + filetype;
                image = addImage(file, path, imageURLName);
            } else {
                image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            }
            result.setImage(image);
            result.setStatus_(true);
            result.setPhoneNumber(phoneNumber);

            userDAO.insertUser(result);

        } catch (RecordAlreadyExists | ImageAlreadyExistsException ex) {
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
            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
            String academicTitle = Utils.getFromMap(args, "academic-title", doctor.getAcademicTitle());
            String degree = Utils.getFromMap(args, "degree", doctor.getDegree());
            int docAge = Integer.parseInt(Utils.getFromMap(args, "age", String.valueOf(doctor.getDocAge())));
            String specialityID = Utils.getFromMap(args, "specialityID", doctor.getAcademicTitle());
            int yOE = Integer.parseInt(Utils.getFromMap(args, "years-of-experience", String.valueOf(doctor.getYearsOfExperience())));
            SpecialityDTO speciality = specialityDAO.readSpeciality(specialityID);
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
            doctorTimeslotDAO.insertMultipleDoctorTimeslots(doctorID, timeslots);

        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        } catch (RecordAlreadyExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public Map<DoctorDTO, BigDecimal> getAllRatingsFromDoctor() throws SQLException {
        Map<DoctorDTO, List<BigDecimal>> ratingsMap = new HashMap<>();
        Map<DoctorDTO, BigDecimal> averageRatings = null;
        try {
            List<FeedbackDTO> feedbackList = feedbackDAO.readAllFeedback();

            // Calculate sum of ratings for each doctor
            for (FeedbackDTO feedback : feedbackList) {
                DoctorDTO doctor = feedback.getAppointment().getDoctor();
                BigDecimal rating = feedback.getRating();

                List<BigDecimal> ratings = ratingsMap.getOrDefault(doctor, new ArrayList<>());
                ratings.add(rating);
                ratingsMap.put(doctor, ratings);
            }

            averageRatings = new HashMap<>();
            // Calculate average ratings for each doctor
            for (Map.Entry<DoctorDTO, List<BigDecimal>> entry : ratingsMap.entrySet()) {
                DoctorDTO doctor = entry.getKey();
                List<BigDecimal> ratings = entry.getValue();

                BigDecimal sum = BigDecimal.ZERO;
                for (BigDecimal rating : ratings) {
                    sum = sum.add(rating);
                }

                BigDecimal average = sum.divide(new BigDecimal(ratings.size()), 2, BigDecimal.ROUND_HALF_UP);
                averageRatings.put(doctor, average);
            }
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return averageRatings;
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
    public List<UserDTO> getUsersByFilter(String filter) throws SQLException, AccountDoesNotExistException {
        List<UserDTO> result = null;

        try {
            result = userDAO.readUserByRole(filter);
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }
}

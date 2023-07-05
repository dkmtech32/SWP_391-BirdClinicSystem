/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.customer;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentAlreadyExistsException;
import models.appointment.AppointmentDTO;
import models.appointment.AppointmentDTOImpl;
import models.bird.BirdAlreadyExistsException;
import models.bird.BirdDTO;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.UserDTO;
import models.users.customer.CustomerDTO;
import models.users.customer.CustomerDTOImpl;
import services.general.AccountAlreadyExistsException;
import services.general.GeneralServicesImpl;
import services.general.BirdDoesNotExistException;
import services.general.PasswordNotStrongException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class CustomerServicesImpl extends GeneralServicesImpl implements CustomerServices {

    public CustomerServicesImpl(UserDTO currentUser) throws SQLException {
        super();
        String customerID = currentUser.getUserID();
        try {
            CustomerDTO customer = customerDAO.readCustomer(customerID);
            this.currentUser = customer;
        } catch (NoSuchRecordExists ex) {
            //impossible bc controller will check role and initiates the right service -> db problem
            throw new SQLException(ex.getMessage());
        }

    }

    @Override
    public boolean bookAppointment(Map<String, String> args)
            throws AppointmentAlreadyExistsException, SQLException {
        boolean result = false;
        String birdID = args.get("birdID");
        String notes = args.get("notes");
        String timeslotID = args.get("timeslotID");
        String service_ID = args.get("serviceID");
        String appDay = args.get("appDay");
        String doctorID = args.get("doctorID");

        try {
            AppointmentDTO app = new AppointmentDTOImpl();
            app.setAppointmentID(Utils.hash(birdID + service_ID + timeslotID + appDay));
            app.setAppStatus("Processing");
            app.setBird(birdDAO.readBird(birdID));
            TimeslotDTO timeslot = timeslotDAO.readTimeSlot(timeslotID);
            app.setTimeslot(timeslot);
            if (doctorID == null) {
                app.setDoctor(null);
            } else {
                app.setDoctor(doctorDAO.readDoctor(doctorID));
            }
            app.setPayment("cash");
            Service_DTO service = serviceDAO.readService_(service_ID);
            app.setService_(service);
            app.setNotes(notes);

            Date date = Date.valueOf(appDay);
            long milliseconds = date.getTime() + timeslot.getTimeSlot().getTime();
            app.setAppTime(new Timestamp(milliseconds));

            result = appointmentDAO.insertAppointment(app) > 0;
        } catch (NoSuchRecordExists ex) {
            //impossible unless account/timeslot/service doesn't exist in db -> SQLException
            throw new SQLException(ex.getMessage());
        } catch (RecordAlreadyExists ex) {
            throw new AppointmentAlreadyExistsException();
        }
        return result;
    }

    @Override
    public List<BirdDTO> getCustomerBirds() throws SQLException {
        String customerID = currentUser.getUserID();
        List<BirdDTO> birds;

        try {
            birds = birdDAO.readAllBirdByCustomer(customerID);
        } catch (NoSuchRecordExists ex) {
            birds = null;
        }
        return birds;
    }

    @Override
    public List<AppointmentDTO> getCustomerAppointments() throws SQLException {
        String customerID = currentUser.getUserID();
        List<AppointmentDTO> apps;

        try {
            apps = appointmentDAO.readAppointmentByCustomer(customerID);
        } catch (NoSuchRecordExists ex) {
            apps = null;
        }
        return apps;
    }

    @Override
    public boolean updateCustomerInfo(Map<String, String[]> args)
            throws AccountAlreadyExistsException, PasswordNotStrongException, SQLException {
        boolean result = false;
        //assume all args are in place
        String username = args.get("username")[0];
        String fullName = args.get("full-name")[0];
        String password = args.get("password")[0];
        String email = args.get("email")[0];
        String gender = args.get("gender")[0];
        Date dob = Date.valueOf(args.get("dob")[0]);
        String address = args.get("address")[0];
        String phoneNumber = args.get("phone-number")[0];
        if (Utils.checkPassword(password)) {
            throw new PasswordNotStrongException();
        }
        try {
            String userID = Utils.hash(email + username);
            customerDAO.readCustomer(userID);
            //if it reads -> repeat -> throw error
            throw new AccountAlreadyExistsException();
        } catch (NoSuchRecordExists ex) {
            //check if it's image problems
            if (!ex.getMessage().equals("Image")) {
                CustomerDTO customer = new CustomerDTOImpl(currentUser);
                customer.setEmail(email);
                customer.setUserName(username);
                customer.setUserPassword(password);
                customer.setGender(gender);
                customer.setFullName(fullName);
                ((CustomerDTO) customer).setDob(dob);
                ((CustomerDTO) customer).setCustomerAddress(address);
                ((CustomerDTO) customer).setPhoneNumber(phoneNumber);

                try {
                    result = customerDAO.updateCustomer((CustomerDTO) currentUser) > 0;
                } catch (NoSuchRecordExists ex1) {
                    throw new SQLException(ex1.getMessage());
                }
            } else {
                throw new AccountAlreadyExistsException(ex.getMessage());
            }
        }

        return result;
    }

    @Override
    public boolean addBird(Map<String, String[]> args)
            throws BirdAlreadyExistsException, SQLException {
        boolean result = false;
        
        return result;
    }

    @Override
    public boolean deleteBird(String birdID)
            throws BirdDoesNotExistException, SQLException {
        return true;
    }

    @Override
    public boolean updateBird(Map<String, String[]> args)
            throws BirdAlreadyExistsException, SQLException {
        return true;
    }
    
    
}

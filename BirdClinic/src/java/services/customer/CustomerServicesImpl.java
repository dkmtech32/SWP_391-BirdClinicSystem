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
import java.util.logging.Level;
import java.util.logging.Logger;
import models.appointment.AppointmentAlreadyExistsException;
import models.appointment.AppointmentDTO;
import models.appointment.AppointmentDTOImpl;
import models.bird.BirdDTO;
import models.bird.BirdDTOImpl;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDTO;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.UserDTO;
import models.users.customer.CustomerDTO;
import models.users.doctor.DoctorDTO;
import services.general.AccountAlreadyExistsException;
import services.general.AccountDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServicesImpl;
import services.general.BirdDoesNotExistException;
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
        String appDate = args.get("appDate");
        String doctorID = args.get("doctorID");

        try {
            AppointmentDTO app = new AppointmentDTOImpl();
            app.setAppointmentID(Utils.hash(birdID + service_ID + timeslotID + appDate));
            app.setAppStatus("processing");
            app.setBird(birdDAO.readBird(birdID));
            TimeslotDTO timeslot = timeslotDAO.readTimeSlot(timeslotID);
            app.setTimeslot(timeslot);
            if (doctorID == null) {
                app.setDoctor(null);
            } else {
                app.setDoctor(doctorDAO.readDoctor(doctorID));
            }
            app.setPayment(null);
            Service_DTO service = serviceDAO.readService_(service_ID);
            app.setService_(service);
            app.setNotes(notes);

            Date date = Date.valueOf(appDate);
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
    public boolean addBird(Map<String, String[]> args)
            throws BirdAlreadyExistsException, SQLException {
        boolean result = false;

        try {
            BirdDTO bird = new BirdDTOImpl();

            // Extract attribute values from the args map
            String birdFullname = args.get("bird-full-name")[0];
            String imageID = Utils.getFromMap(args, "imageID", "4rt43t5y56y465t4r3e24r435y65u76i"); //default bird image
            String birdID = Utils.hash(birdFullname + currentUser.getUserID());

            String birdGender = args.get("bird-gender")[0];
            String breed = args.get("breed")[0];
            String band_chip = args.get("band_chip")[0];
            float birdWeight = Float.parseFloat(args.get("bird-weight")[0]);
            String sexingMethod = args.get("sexing-method")[0];
            String medicalHistory = args.get("medical-history")[0];
            Date hatchingDate = Date.valueOf(args.get("hatching-date")[0]);
            String featherColor = args.get("feather-color")[0];

            // Set attribute values using the BirdDTO setters
            bird.setBirdID(birdID);
            // Assuming you have a CustomerDAO to read the customer from the database based on the customerID
            bird.setCustomer((CustomerDTO) currentUser);
            // Assuming you have an ImageDAO to read the image from the database based on the imageID
            ImageDTO image = imageDAO.readImage(imageID);
            bird.setImage(image);
            bird.setBirdFullname(birdFullname);
            bird.setBirdGender(birdGender);
            bird.setBreed(breed);
            bird.setBand_Chip(band_chip);
            bird.setBirdWeight(birdWeight);
            bird.setSexingMethod(sexingMethod);
            bird.setMedicalHistory(medicalHistory);
            bird.setHatchingDate(hatchingDate);
            bird.setFeatherColor(featherColor);

            // Assuming you have a BirdDAO to interact with the bird table in the database
            // and the necessary methods like insertBird(BirdDTO bird) are implemented.
            int insertResult = birdDAO.insertBird(bird);

            result = insertResult > 0;
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        } catch (RecordAlreadyExists ex) {
            throw new BirdAlreadyExistsException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean deleteBird(String birdID)
            throws BirdDoesNotExistException, SQLException {
        boolean result = false;

        try {
            result = birdDAO.deleteBird(birdID) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new BirdDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean updateBird(Map<String, String[]> args)
            throws BirdDoesNotExistException, SQLException {
        boolean result = false;

        try {
            String birdID = args.get("birdID")[0];
            BirdDTO bird = birdDAO.readBird(birdID);

            // Extract attribute values from the args map
            String imageID = Utils.getFromMap(args, "imageID", bird.getImage().getImageID());
            String birdFullname = Utils.getFromMap(args, "bird-full-name", bird.getBirdFullname());
            String birdGender = Utils.getFromMap(args, "bird-gender", bird.getBirdGender());
            String breed = Utils.getFromMap(args, "breed", bird.getBreed());
            String band_chip = Utils.getFromMap(args, "band_chip", bird.getBand_Chip());
            float birdWeight = Float.parseFloat(Utils.getFromMap(args, "bird-weight", String.valueOf(bird.getBirdWeight())));
            String sexingMethod = Utils.getFromMap(args, "sexing-method", bird.getSexingMethod());
            String medicalHistory = Utils.getFromMap(args, "medical-history", bird.getMedicalHistory());
            Date hatchingDate = Date.valueOf(Utils.getFromMap(args, "hatching-date", bird.getHatchingDate().toString()));
            String featherColor = Utils.getFromMap(args, "feather-color", bird.getFeatherColor());

            // Assuming you have an ImageDAO to read the image from the database based on the imageID
            ImageDTO image = imageDAO.readImage(imageID);
            bird.setImage(image);
            bird.setBirdFullname(birdFullname);
            bird.setBirdGender(birdGender);
            bird.setBreed(breed);
            bird.setBand_Chip(band_chip);
            bird.setBirdWeight(birdWeight);
            bird.setSexingMethod(sexingMethod);
            bird.setMedicalHistory(medicalHistory);
            bird.setHatchingDate(hatchingDate);
            bird.setFeatherColor(featherColor);

            // Assuming you have a BirdDAO to interact with the bird table in the database
            // and the necessary methods like insertBird(BirdDTO bird) are implemented.
            int updateResult = birdDAO.updateBird(bird);

            result = updateResult > 0;
        } catch (NoSuchRecordExists ex) {
            throw new BirdDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean cancelAppointment(String appointmentID) throws AppointmentDoesNotExistException, SQLException {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            if (appointment.getAppStatus().trim().toLowerCase().equals("processing")) {
                result = appointmentDAO.updateAppointmentStatus("cancelled", appointmentID) > 0;
            }
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean updateAccount(Map<String, String[]> args)
            throws AccountDoesNotExistException, AccountAlreadyExistsException, SQLException {
        boolean result = false;
        try {
            if (super.updateAccount(args)) {
                CustomerDTO tempCustomer = ((CustomerDTO) currentUser).copyUser();

                Date dob = Date.valueOf(Utils.getFromMap(args, "dob", tempCustomer.getDob().toString()));
                String address = Utils.getFromMap(args, "address", tempCustomer.getCustomerAddress());
                String phoneNumber = Utils.getFromMap(args, "phone-number", tempCustomer.getPhoneNumber());

                tempCustomer.setCustomerAddress(address);
                tempCustomer.setDob(dob);
                tempCustomer.setPhoneNumber(phoneNumber);
                result = customerDAO.updateCustomer(tempCustomer) > 0;
                if (result) {
                    ((CustomerDTO) currentUser).copyUser(tempCustomer);
                }

            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public DoctorDTO getDoctor(String doctorID) throws SQLException, AccountDoesNotExistException {
        DoctorDTO doctor = null;

        if (doctorID != null && !doctorID.trim().equals("")) {
            try {
                doctor = doctorDAO.readDoctor(doctorID);
            } catch (NoSuchRecordExists ex) {
                throw new AccountDoesNotExistException(ex.getMessage());
            }
        }

        return doctor;
    }
}

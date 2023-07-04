/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.appointment.AppointmentDAO;
import models.appointment.AppointmentDAOImpl;
import models.appointment.AppointmentDTO;
import models.bird.BirdDAO;
import models.bird.BirdDAOImpl;
import models.bird.BirdDTO;
import models.doctorTimeslot.DoctorTimeslotDAO;
import models.doctorTimeslot.DoctorTimeslotDAOImpl;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDAO;
import models.images.ImageDAOImpl;
import models.images.ImageDTO;
import models.medicalRecord.MedicalRecordDAO;
import models.medicalRecord.MedicalRecordDAOImpl;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDAO;
import models.medicine.MedicineDAOImpl;
import models.recordMedicine.RecordMedicineDAO;
import models.recordMedicine.RecordMedicineDAOImpl;
import models.recordMedicine.RecordMedicineDTO;
import models.service_.Service_DAO;
import models.service_.Service_DAOImpl;
import models.service_.Service_DTO;
import models.speciality.SpecialityDAO;
import models.speciality.SpecialityDAOImpl;
import models.speciality.SpecialityDTO;
import models.timeslot.TimeslotDAO;
import models.timeslot.TimeslotDAOImpl;
import models.timeslot.TimeslotDTO;
import models.users.UserDAO;
import models.users.UserDAOImpl;
import models.users.UserDTO;
import models.users.customer.CustomerDAO;
import models.users.customer.CustomerDAOImpl;
import models.users.customer.CustomerDTO;
import models.users.customer.CustomerDTOImpl;
import models.users.doctor.DoctorDAO;
import models.users.doctor.DoctorDAOImpl;
import models.users.doctor.DoctorDTO;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class AccountServicesImpl implements AccountServices {

    protected final UserDAO userDAO;
    protected final ImageDAO imageDAO;
    protected final AppointmentDAO appointmentDAO;
    protected final TimeslotDAO timeslotDAO;
    protected final BirdDAO birdDAO;
    protected final DoctorDAO doctorDAO;
    protected final Service_DAO serviceDAO;
    protected final MedicalRecordDAO medicalRecordDAO;
    protected final MedicineDAO medicineDAO;
    protected final RecordMedicineDAO recordMedicineDAO;
    protected final SpecialityDAO specialityDAO;
    protected final CustomerDAO customerDAO;
    protected final DoctorTimeslotDAO doctorTimeslotDAO;

    protected UserDTO currentUser;

    public AccountServicesImpl() {
        imageDAO = new ImageDAOImpl();
        specialityDAO = new SpecialityDAOImpl();
        customerDAO = new CustomerDAOImpl(imageDAO);
        userDAO = new UserDAOImpl(imageDAO);
        serviceDAO = new Service_DAOImpl(specialityDAO);
        doctorDAO = new DoctorDAOImpl(specialityDAO, imageDAO);
        timeslotDAO = new TimeslotDAOImpl();
        birdDAO = new BirdDAOImpl(imageDAO, customerDAO);
        appointmentDAO = new AppointmentDAOImpl(birdDAO, doctorDAO, serviceDAO, timeslotDAO);
        medicalRecordDAO = new MedicalRecordDAOImpl(appointmentDAO);
        medicineDAO = new MedicineDAOImpl();
        recordMedicineDAO = new RecordMedicineDAOImpl(medicalRecordDAO, medicineDAO);
        doctorTimeslotDAO = new DoctorTimeslotDAOImpl(timeslotDAO, doctorDAO);
    }

    @Override
    public boolean login(String username, String password)
            throws AccountDoesNotExist, SQLException {
        password = Utils.hash(password);
        boolean result = false;
        try {
            currentUser = userDAO.loginUser(username, password);
            result = true;
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExist(ex.getMessage());
        }
        return result;
    }

    @Override
    public boolean register(Map<String, String[]> args)
            throws AccountAlreadyExistsException, PasswordsNotEqualException, PasswordNotStrongException, SQLException {
        //assumption: args have all 4 key-value pairs
        String username = args.get("username")[0];
        String uPassword = args.get("password")[0];
        String cPassword = args.get("repeat-password")[0];
        String email = args.get("email")[0];
        boolean result = false;

        try {
            if (!uPassword.equals(cPassword)) {
                throw new PasswordsNotEqualException();
            }
            if (Utils.checkPassword(uPassword)) {
                throw new PasswordNotStrongException();
            }

            String rPassword = Utils.hash(uPassword);
            String userID = Utils.hash(email + username);
            CustomerDTO customer = new CustomerDTOImpl();
            customer.setUserID(userID);
            customer.setEmail(email);
            customer.setUserName(username);
            customer.setUserPassword(rPassword);
            customer.setGender("unknown");
            customer.setUserRole("customer");
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            customer.setImage(image);
            customer.setStatus_(true);

            //customer info
            customer.setCustomerAddress("");
            customer.setDob(null);

            result = customerDAO.insertCustomer(customer) > 0;
        } catch (RecordAlreadyExists ex) {
            throw new AccountAlreadyExistsException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            //no image -> db error
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public UserDTO getCurrentUser() {
        //typecasting will be implemented in subclass
        return currentUser;
    }

    @Override
    public void setCurrentUser(UserDTO currentUser) {
        //typecasting will be implemented in subclass
        this.currentUser = currentUser;
    }

    @Override
    public boolean checkRole(String role) {
        return currentUser.getUserRole().equals(role.toLowerCase());
    }

    @Override
    public BirdDTO viewBird(String birdID)
            throws SQLException, BirdDoesNotExistException {
        //checking will be implemented in subclasses
        BirdDTO bird = null;

        try {
            if (currentUser != null) {
                bird = birdDAO.readBird(birdID);
            }
        } catch (SQLException ex) {
            throw ex;
        } catch (NoSuchRecordExists ex) {
            throw new BirdDoesNotExistException(ex.getMessage());
        }

        return bird;
    }

    @Override
    public AppointmentDTO viewAppointment(String appointmentID)
            throws SQLException, AppointmentDoesNotExistException {
        //checking will be implemented in subclasses
        AppointmentDTO appointment = null;

        try {
            if (currentUser != null) {
                appointment = appointmentDAO.readAppointment(appointmentID);
            }
        } catch (SQLException ex) {
            throw ex;
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }

        return appointment;
    }

    @Override
    public MedicalRecordDTO viewMedicalRecord(String appointmentID) throws SQLException {
        MedicalRecordDTO medicalRecord = null;

        try {
            if (currentUser != null) {
                medicalRecord = medicalRecordDAO.readMedicalRecordByAppointment(appointmentID);
            }
        } catch (SQLException ex) {
            throw ex;
        } catch (NoSuchRecordExists ex) {
            medicalRecord = null;
        }

        return medicalRecord;
    }

    @Override
    public List<RecordMedicineDTO> viewRecordMeds(String medicalRecordID) throws SQLException {
        List<RecordMedicineDTO> recMeds = null;

        try {
            if (currentUser != null) {
                recMeds = recordMedicineDAO.readMedicineFromRecord(medicalRecordID);
            }
        } catch (SQLException ex) {
            throw ex;
        } catch (NoSuchRecordExists ex) {
            recMeds = null;
        }

        return recMeds;
    }
    
    @Override
    public List<DoctorDTO> getAllDoctors() throws SQLException {
        List<DoctorDTO> doctors = null;

        try {
            doctors = doctorDAO.readAllDoctors();
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return doctors;
    }
    
    @Override
    public Map<String, List<TimeslotDTO>> getTimeslotsByWeekday(String doctorID) 
            throws SQLException {
        Map<String, List<TimeslotDTO>> timeslots = null;
        
        try {
            if (doctorID == null || doctorID.trim().equals("")) {
                timeslots = timeslotDAO.readTimeslotsGrouped();
            } else {
                timeslots = doctorTimeslotDAO.readDoctorTimeslotByDoctorGrouped(doctorID);
            }
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }
        
        return timeslots;
    }
    
    @Override
    public List<Service_DTO> getServices(String doctorID) 
            throws SQLException, AccountDoesNotExist {
        List<Service_DTO> services = null;
        
        try {
            if (doctorID == null || doctorID.trim().equals("")) {
                services = serviceDAO.readAllService_();
            }
            else {
                SpecialityDTO spec = doctorDAO.readDoctor(doctorID).getSpeciality();
                services = serviceDAO.readServiceBySpeciality(spec.getSpecialityID());
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExist();
        }
        
        return services;
    }
    
    @Override
    public TimeslotDTO getTimeslot(String TimeslotID) throws SQLException {
        TimeslotDTO timeslot = null;
        
        try {
            timeslot = timeslotDAO.readTimeSlot(TimeslotID);
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }
        
        return timeslot;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.general;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
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
public class GeneralServicesImpl implements GeneralServices {

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

    public GeneralServicesImpl() {
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
            throws AccountDoesNotExistException, SQLException {
        password = Utils.hash(password);
        boolean result = false;
        try {
            currentUser = userDAO.loginUser(username, password);
            result = true;
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }
        return result;
    }

    @Override
    public boolean register(Map<String, String[]> args)
            throws AccountAlreadyExistsException, PasswordsNotEqualException, PasswordNotStrongException, SQLException {
        //assumption: args have all 4 key-value pairs
        String username = Utils.getFromMap(args, "username", "");
        String uPassword = Utils.getFromMap(args, "password", "");
        String cPassword = Utils.getFromMap(args, "repeat-password", "");
        String email = Utils.getFromMap(args, "email", "");
        boolean result = false;

        try {
            if (!uPassword.equals(cPassword)) {
                throw new PasswordsNotEqualException();
            }
            if (Utils.checkPassword(uPassword)) {
                throw new PasswordNotStrongException();
            }

            if (userDAO.readUserByEmailUserName(email, username) != null) {
                throw new AccountAlreadyExistsException();
            }

            String rPassword = Utils.hash(uPassword);
            String userID = Utils.hash(email + username);
            CustomerDTO customer = new CustomerDTOImpl();
            customer.setUserID(userID);
            customer.setEmail(email);
            customer.setUserName(username);
            customer.setUserPassword(rPassword);
            customer.setGender("unknown"); //default
            customer.setUserRole("customer"); //only allow customer registration - other accs must be done by admin
            ImageDTO image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf"); //default image
            customer.setImage(image);
            customer.setStatus_(false); //default

            //customer info
            customer.setCustomerAddress(null);
            customer.setDob(null);
            customer.setPhoneNumber(null);

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
    public boolean enableAccount(String userID) throws AccountDoesNotExistException, SQLException {
        boolean result = false;

        try {
            UserDTO user = userDAO.readUser(userID);
            if (!user.isStatus_()) {
                user.setStatus_(true);
                result = userDAO.updateUser(user) > 0;
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public UserDTO getCurrentUser() {
        return currentUser;
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
            throws SQLException, AccountDoesNotExistException {
        List<Service_DTO> services = null;

        try {
            if (doctorID == null || doctorID.trim().equals("")) {
                services = serviceDAO.readAllService_();
            } else {
                SpecialityDTO spec = doctorDAO.readDoctor(doctorID).getSpeciality();
                services = serviceDAO.readServiceBySpeciality(spec.getSpecialityID());
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
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

    @Override
    public boolean updateAccount(Map<String, String[]> args)
            throws AccountAlreadyExistsException, AccountDoesNotExistException, SQLException {
        boolean result = false;
        //assume all args are in place
        String username = Utils.getFromMap(args, "username", currentUser.getUserName());
        String fullName = Utils.getFromMap(args, "full-name", currentUser.getFullName());
        String email = Utils.getFromMap(args, "email", currentUser.getUserName());
        String gender = Utils.getFromMap(args, "gender", currentUser.getUserName());
        try {
            if (userDAO.readUserByEmailUserName(email, username) != null) {
                throw new AccountAlreadyExistsException();
            }

            UserDTO user = currentUser.copyUser();
            user.setEmail(email);
            user.setUserName(username);
            user.setGender(gender);
            user.setFullName(fullName);

            result = userDAO.updateUser(user) > 0;
            currentUser.copyUser(user);
        } catch (NoSuchRecordExists ex) {
            //check if it's image problems
            if (ex.getMessage().contains("Image")) {
                throw new SQLException(ex.getMessage());
            } else {
                throw new AccountDoesNotExistException(ex.getMessage());
            }
        }

        return result;
    }

    @Override
    public boolean updateAccountPassword(String nPassword)
            throws PasswordNotStrongException, AccountDoesNotExistException, SQLException {
        boolean result = false;

        try {
            if (Utils.checkPassword(nPassword)) {
                throw new PasswordNotStrongException();
            }

            nPassword = Utils.hash(nPassword);
            result = userDAO.updateUserPassword(currentUser.getUserID(), nPassword) > 0;

        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }
}

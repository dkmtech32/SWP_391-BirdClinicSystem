/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.general;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDAO;
import models.appointment.AppointmentDAOImpl;
import models.appointment.AppointmentDTO;
import models.bird.BirdAlreadyExistsException;
import models.bird.BirdDAO;
import models.bird.BirdDAOImpl;
import models.bird.BirdDTO;
import models.bird.BirdDTOImpl;
import models.blog.BlogDAO;
import models.blog.BlogDAOImpl;
import models.blog.BlogDTO;
import models.doctorTimeslot.DoctorTimeslotDAO;
import models.doctorTimeslot.DoctorTimeslotDAOImpl;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.feedback.FeedbackDAO;
import models.feedback.FeedbackDAOImpl;
import models.feedback.FeedbackDTO;
import models.images.ImageDAO;
import models.images.ImageDAOImpl;
import models.images.ImageDTO;
import models.images.ImageDTOImpl;
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
import services.staff.ServiceDoesNotExistException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class GeneralServicesImpl implements GeneralServices {

    private static final long serialVersionUID = 6529685098267757690L;

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
    protected final FeedbackDAO feedbackDAO;
    protected final BlogDAO blogDAO;

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
        feedbackDAO = new FeedbackDAOImpl(appointmentDAO);
        blogDAO = new BlogDAOImpl(imageDAO);
    }

    @Override
    public boolean login(String username, String password)
            throws AccountDoesNotExistException, SQLException {
        password = Utils.hash(password);
        boolean result = false;
        try {
            UserDTO user = userDAO.loginUser(username, password);
            if (user.isStatus_()) {
                currentUser = user;
                result = true;
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }
        return result;
    }

    @Override
    public CustomerDTO createAccount(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, PasswordsNotEqualException, PasswordNotStrongException, SQLException {
        //assumption: args have all 4 key-value pairs
        String username = Utils.getFromMap(args, "username", "");
        String fullName = Utils.getFromMap(args, "fullName", "");

        String uPassword = Utils.getFromMap(args, "password", "");
        String cPassword = Utils.getFromMap(args, "repeat-password", "");
        String email = Utils.getFromMap(args, "email", "");
        String gender = Utils.getFromMap(args, "gender", "");
        String address = Utils.getFromMap(args, "address", "");
        Date dob = Date.valueOf(Utils.getFromMap(args, "dob", ""));
        String phone = Utils.getFromMap(args, "phone", "");
        String filetype = Utils.getFromMap(args, "filetype", ".jpg");
        String path = Utils.getFromMap(args, "path", "");
        CustomerDTO result = null;

        try {
            if (!uPassword.equals(cPassword)) {
                throw new PasswordsNotEqualException();
            }
//            if (Utils.checkPassword(uPassword)) {
//                throw new PasswordNotStrongException();
//            }

            if (userDAO.readUserByEmailUserName(email, username) != null) {
                throw new AccountAlreadyExistsException();
            }

            String rPassword = Utils.hash(uPassword);
            String userID = Utils.hash(email + username + String.valueOf(System.currentTimeMillis()));
            CustomerDTO customer = new CustomerDTOImpl();
            customer.setUserID(userID);
            customer.setEmail(email);
            customer.setUserName(username);
            customer.setFullName(fullName);
            customer.setUserPassword(rPassword);
            customer.setGender(gender);
            customer.setUserRole("customer"); //only allow customer registration - other accs must be done by admin
            ImageDTO image = null;
            if (file != null) {
                String imageURLName = userID + filetype;
                image = addImage(file, path, imageURLName);
            } else {
                image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            }
            customer.setImage(image);
            customer.setStatus_(true); //default

            //customer info
            customer.setCustomerAddress(address);
            customer.setDob(dob);
            customer.setPhoneNumber(phone);

            result = customer;
        } catch (NoSuchRecordExists ex) {
            //no image -> db error
            throw new SQLException(ex.getMessage());
        } catch (ImageAlreadyExistsException ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public BirdDTO createBird(Map<String, String[]> args, CustomerDTO customer, InputStream file) throws BirdAlreadyExistsException, SQLException {
        BirdDTO result = null;

        try {
            BirdDTO bird = new BirdDTOImpl();

//            ImageDTO image = imageDAO.readImage("05b5b4345d8ac2f73ece3df15be03230"); //default
            String birdFullname = args.get("bird-full-name")[0];
            String birdGender = args.get("bird-gender")[0];
            String breed = args.get("breed")[0];
            String band_chip = args.get("band_chip")[0];
            float birdWeight = Float.parseFloat(args.get("bird-weight")[0]) / 1000;
            Date hatchingDate = Date.valueOf(args.get("hatching-date")[0]);
            String featherColor = args.get("feather-color")[0];
            String filetype = Utils.getFromMap(args, "filetype", ".jpg");
            String path = Utils.getFromMap(args, "path", "");
            String birdID = Utils.hash(customer.getUserID() + birdFullname + String.valueOf(System.currentTimeMillis()));
            ImageDTO image = null;
            if (file != null) {
                String imageURLName = birdID + filetype;
                image = addImage(file, path, imageURLName);
            } else {
                image = imageDAO.readImage("whfnhfn3ga98h943ghjanfueafa92rhf");
            }

            bird.setBirdID(birdID);

            bird.setCustomer(customer);
            bird.setImage(image);

            bird.setImage(image);
            bird.setBirdFullname(birdFullname);
            bird.setBirdGender(birdGender);
            bird.setBreed(breed);
            bird.setBand_Chip(band_chip);
            bird.setBirdWeight(birdWeight);
            bird.setSexingMethod("");
            bird.setMedicalHistory(null);
            bird.setHatchingDate(hatchingDate);
            bird.setFeatherColor(featherColor);
            result = bird;
        } catch (ImageAlreadyExistsException ex) {
            throw new SQLException(ex.getMessage());
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean register(CustomerDTO account, BirdDTO bird) throws SQLException {
        boolean result = false;

        try {
            result = customerDAO.insertCustomer(account) > 0;
            result = result && birdDAO.insertBird(bird) > 0;
        } catch (RecordAlreadyExists ex) {
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
        } catch (NoSuchRecordExists ex) {
            medicalRecord = null;
        }

        return medicalRecord;
    }

    @Override
    public List<MedicalRecordDTO> viewMedicalRecordOfBird(String birdID) throws SQLException {
        List<MedicalRecordDTO> medicalRecord = null;

        try {
            if (currentUser != null) {
                medicalRecord = medicalRecordDAO.readMedicalRecordByBird(birdID);
            }
        } catch (NoSuchRecordExists ex) {
            medicalRecord = null;
        }

        return medicalRecord;
    }

    @Override
    public FeedbackDTO viewFeedback(String appointmentID) throws SQLException {
        FeedbackDTO feedback = null;

        try {
            if (currentUser != null) {
                feedback = feedbackDAO.readFeedbackByAppointment(appointmentID);
            }
        } catch (NoSuchRecordExists ex) {
            feedback = null;
        }

        return feedback;
    }

    @Override
    public List<RecordMedicineDTO> viewRecordMeds(String medicalRecordID) throws SQLException {
        List<RecordMedicineDTO> recMeds = null;

        try {
            if (currentUser != null) {
                recMeds = recordMedicineDAO.readMedicineFromRecord(medicalRecordID);
            }
        } catch (NoSuchRecordExists ex) {
            recMeds = null;
        }

        return recMeds;
    }

    @Override
    public UserDTO viewAccount(String userID) throws AccountDoesNotExistException, SQLException {
        UserDTO user = null;

        try {
            if (currentUser != null) {
                user = userDAO.readUser(userID);
                if (user.getUserRole().toLowerCase().equals("customer")) {
                    user = customerDAO.readCustomer(userID);
                }
                if (user.getUserRole().toLowerCase().equals("doctor")) {
                    user = doctorDAO.readDoctor(userID);
                }
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return user;
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
    public List<List<TimeslotDTO>> getTimeslotsByWeekday(String doctorID)
            throws SQLException {
        List<List<TimeslotDTO>> timeslots = null;

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
    public List<SpecialityDTO> getSpecialities()
            throws SQLException {
        List<SpecialityDTO> services = null;

        try {
            services = specialityDAO.readAllSpecialities();
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return services;
    }

    @Override
    public boolean isDoctorFree(String doctorID, String timeslotID, Date appDate)
            throws SQLException, AccountDoesNotExistException {
        boolean result = false;

        try {
            result = appointmentDAO.readAppointmentByDocTime(doctorID, timeslotID, appDate) == null;
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
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
    public boolean updateAccount(Map<String, String[]> args, InputStream file)
            throws AccountAlreadyExistsException, SQLException {
        boolean result = false;
        //assume all args are in place
        String username = Utils.getFromMap(args, "username", currentUser.getUserName());
        String fullName = Utils.getFromMap(args, "full-name", currentUser.getFullName());
        String email = Utils.getFromMap(args, "email", currentUser.getUserName());
        String gender = Utils.getFromMap(args, "gender", currentUser.getUserName());
        String phoneNumber = Utils.getFromMap(args, "phone-number", currentUser.getPhoneNumber());
        String filetype = Utils.getFromMap(args, "filetype", ".jpg");
        String path = Utils.getFromMap(args, "path", "");
        try {
            if (!username.equals(currentUser.getUserName()) && !email.equals(currentUser.getEmail()) && userDAO.readUserByEmailUserName(email, username) != null) {
                throw new AccountAlreadyExistsException();
            }

            UserDTO user = currentUser.copyUser();
            user.setEmail(email);
            user.setUserName(username);
            user.setGender(gender);
            user.setFullName(fullName);
            user.setPhoneNumber(phoneNumber);
            if (file != null) {
                String imageURLName = user.getUserID() + filetype;
                ImageDTO image = addImage(file, path, imageURLName);
                user.setImage(image);
            }

            result = userDAO.updateUser(user) > 0;
            currentUser.copyUser(user);
        } catch (NoSuchRecordExists | ImageAlreadyExistsException ex) {
            //check if it's image problems
            if (ex.getMessage().contains("Image")) {
                throw new SQLException(ex.getMessage());
            } else {
                throw new AccountAlreadyExistsException(ex.getMessage());
            }
        }

        return result;
    }

    @Override
    public boolean updateAccountPassword(String nPassword)
            throws PasswordNotStrongException, AccountDoesNotExistException, SQLException {
        boolean result = false;

        try {

            nPassword = Utils.hash(nPassword);
            result = userDAO.updateUserPassword(currentUser.getUserID(), nPassword) > 0;

        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public DoctorDTO getDoctorInfo(String doctorID) throws SQLException, AccountDoesNotExistException {
        DoctorDTO doctor = null;

        try {
            if (doctorID != null && !doctorID.trim().equals("")) {
                doctor = doctorDAO.readDoctor(doctorID);
                doctor.setUserName(null);
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return doctor;
    }

    @Override
    public CustomerDTO getCustomerInfo(String customerID) throws SQLException, AccountDoesNotExistException {
        CustomerDTO customer = null;

        try {
            if (customerID != null && !customerID.trim().equals("")) {
                customer = customerDAO.readCustomer(customerID);
                customer.setUserName(null);
            }
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return customer;
    }

    @Override
    public List<FeedbackDTO> getDoctorFeedbacks(String doctorID) throws SQLException {
        List<FeedbackDTO> feedbacks = null;

        try {
            feedbacks = feedbackDAO.readFeedbackByDoctor(doctorID);
        } catch (NoSuchRecordExists ex) {
            feedbacks = null;
        }

        return feedbacks;
    }

    @Override
    public BigDecimal getDoctorRatings(List<FeedbackDTO> feedbacks) throws SQLException {
        BigDecimal ratings = BigDecimal.ZERO;
        if (feedbacks == null) {
            return ratings;
        }
        for (FeedbackDTO feedback : feedbacks) {
            ratings = feedback.getRating().add(ratings);
        }
        if (ratings.compareTo(BigDecimal.ZERO) > 0) {
            ratings = ratings.divide(BigDecimal.valueOf(feedbacks.size()), 2, RoundingMode.HALF_UP);
            ratings.setScale(2, RoundingMode.HALF_DOWN);
        }

        return ratings;
    }

    @Override
    public List<BirdDTO> getCustomerBirds(String customerID) throws SQLException {
        List<BirdDTO> birds;

        try {
            birds = birdDAO.readAllBirdByCustomer(customerID);
        } catch (NoSuchRecordExists ex) {
            birds = null;
        }
        return birds;
    }

    protected boolean changeAppointmentStatus(String appointmentID, String status)
            throws SQLException, AppointmentDoesNotExistException {
        boolean result = false;

        try {
            result = appointmentDAO.updateAppointmentStatus(appointmentID, status) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public BlogDTO viewBlog(String blogID) throws SQLException, BlogDoesNotExistException {
        BlogDTO blog = null;

        try {
            blog = blogDAO.readBlog(blogID);
        } catch (NoSuchRecordExists ex) {
            throw new BlogDoesNotExistException(ex.getMessage());
        }

        return blog;
    }

    @Override
    public List<BlogDTO> viewAllBlog() throws SQLException, BlogDoesNotExistException {
        List<BlogDTO> blogs = null;

        try {
            blogs = blogDAO.readAllBlogs();
        } catch (NoSuchRecordExists ex) {
            throw new BlogDoesNotExistException(ex.getMessage());
        }

        return blogs;
    }

    @Override
    public List<BlogDTO> viewIntroBlogs() throws SQLException {
        List<BlogDTO> blog = null;

        try {
            blog = blogDAO.readTopThreeBlogs();
        } catch (NoSuchRecordExists ex) {
            throw new SQLException(ex.getMessage());
        }

        return blog;
    }

    @Override
    public List<AppointmentDTO> getAppointmentsByFilter(String filter)
            throws SQLException {
        List<AppointmentDTO> result = null;

        try {
            if (filter.equals("upcoming")) {
                Date today = new Date(System.currentTimeMillis());
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(today);
                calendar.add(Calendar.DATE, 8);
                Date nextWeek = new Date(calendar.getTime().getTime());
                result = appointmentDAO.readAppointmentByDate(today, nextWeek);
            } else {
                result = appointmentDAO.readAppointmentByStatus(filter);
            }

        } catch (NoSuchRecordExists ex) {
            result = null;
        }
        if (result != null) {
            Collections.sort(result);
        }
        return result;
    }

    @Override
    public List<AppointmentDTO> getBirdAppointments(String birdID) throws BirdDoesNotExistException, SQLException {
        List<AppointmentDTO> apps = null;

        try {
            apps = appointmentDAO.readAppointmentByBird(birdID);
        } catch (NoSuchRecordExists ex) {
            throw new BirdDoesNotExistException(ex.getMessage());
        }

        return apps;
    }

    @Override
    public List<AppointmentDTO> getCustomerAppointments(String customerID) throws AccountDoesNotExistException, SQLException {
        List<AppointmentDTO> apps = null;

        try {
            apps = appointmentDAO.readAppointmentByCustomer(customerID);
        } catch (NoSuchRecordExists ex) {
            throw new AccountDoesNotExistException(ex.getMessage());
        }

        return apps;
    }

    protected ImageDTO addImage(InputStream file, String path, String filename)
            throws SQLException, ImageAlreadyExistsException {
        ImageDTO image = null;
        try {
            String name = imageDAO.saveFileToDisk(file, path, filename);
            if (name != null && !name.trim().equals("")) {
                ImageDTO testImg = new ImageDTOImpl();
                String imageID = Utils.hash(path + name);
                testImg.setImageID(imageID);
                testImg.setImageURLName(name);
                try {
                    imageDAO.deleteImage(imageID);
                } catch (NoSuchRecordExists ex) {
                } finally {
                    imageDAO.insertImage(testImg);
                }
                image = testImg;
            }
        } catch (RecordAlreadyExists | IOException ex) {
            throw new ImageAlreadyExistsException(ex.getMessage());
        }
        return image;
    }

    protected List<AppointmentDTO> filterAppointmentsByStatus(List<AppointmentDTO> appointments, String status) {
        List<AppointmentDTO> filteredAppointments = new ArrayList<>();

        appointments.stream().filter((appointment)
                -> (appointment.getAppStatus().equals(status))).forEachOrdered((appointment)
                -> {
            filteredAppointments.add(appointment);
        });

        return filteredAppointments;
    }

    protected List<AppointmentDTO> filterAppointmentsByDate(List<AppointmentDTO> appointments, Date startDate, Date endDate) {
        List<AppointmentDTO> filteredAppointments = new ArrayList<>();

        appointments.forEach((appointment) -> {
            Date appTime = appointment.getAppTime();
            if ((appTime.after(startDate) || appTime.equals(startDate)) && (appTime.before(endDate) || appTime.equals(endDate))) {
                filteredAppointments.add(appointment);
            }
        });

        return filteredAppointments;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.blog.BlogDTO;
import models.blog.BlogDTOImpl;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.feedback.FeedbackDTO;
import models.images.ImageDTO;
import models.service_.Service_DTO;
import models.service_.Service_DTOImpl;
import models.speciality.NoSuchSpecialityExistsException;
import models.speciality.SpecialityDTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AccountDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.BlogDoesNotExistException;
import services.general.GeneralServicesImpl;
import services.general.ImageAlreadyExistsException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class StaffServicesImpl extends GeneralServicesImpl implements StaffServices {

    public StaffServicesImpl(UserDTO user) throws AccountDoesNotExistException {
        if (user.getUserRole().toLowerCase().equals("staff")) {
            this.currentUser = user;
        } else {
            throw new AccountDoesNotExistException();
        }
    }

    @Override
    public boolean updateAppointmentDoctor(String appointmentID, String doctorID)
            throws DoctorDoesNotExistException, AppointmentDoesNotExistException, SQLException {
        boolean result = false;

        try {
            DoctorDTO doctor = doctorDAO.readDoctor(doctorID);
            if (doctor != null) {
                AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
                appointment.setDoctor(doctor);
                result = appointmentDAO.updateAppointment(appointment) > 0;
            }
        } catch (NoSuchRecordExists ex) {
            if (ex.getMessage().toLowerCase().contains("doctor")) {
                throw new DoctorDoesNotExistException(ex.getMessage());
            } else {
                throw new AppointmentDoesNotExistException(ex.getMessage());
            }
        }

        return result;
    }

    @Override
    public boolean updateAppointmentPayment(String appointmentID, String payment)
            throws AppointmentDoesNotExistException, SQLException {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            appointment.setPayment(payment);
            result = appointmentDAO.updateAppointment(appointment) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public List<DoctorDTO> checkDoctor(AppointmentDTO appointment)
            throws AppointmentDoesNotExistException, DoctorDoesNotExistException, SQLException {
        List<DoctorDTO> result = null;

        try {
            if (appointment.getDoctor() == null) {
                result = doctorDAO.readDoctorsBySpeciality(appointment.getService_().getSpeciality().getSpecialityID());
            }
        } catch (NoSuchRecordExists ex) {
            if (ex.getMessage().toLowerCase().contains("doctor")) {
                throw new DoctorDoesNotExistException(ex.getMessage());
            } else {
                throw new AppointmentDoesNotExistException(ex.getMessage());
            }
        }

        return result;
    }

    @Override
    public boolean cancelAppointment(String appointmentID)
            throws AppointmentDoesNotExistException, SQLException {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            String newStatus;
            switch (appointment.getAppStatus().toLowerCase()) {
                case "processing":
                case "confirm":
                    newStatus = "cancelled";
                    break;
                default:
                    newStatus = appointment.getAppStatus();
            }

            result = appointmentDAO.updateAppointmentStatus(appointmentID, newStatus) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new AppointmentDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public boolean updateAppointment(String appointmentID)
            throws AppointmentDoesNotExistException, DoctorDoesNotExistException, SQLException {
        boolean result = false;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            String newStatus = "processing";
            switch (appointment.getAppStatus().toLowerCase()) {
                case "processing":
                    if (appointment.getDoctor() == null) {
                        throw new DoctorDoesNotExistException();
                    }
                    newStatus = "confirm";
                    break;
                case "confirm":
                    newStatus = "check-in";
                    break;
                case "check-in":
                    if (appointment.getPayment() == null || appointment.getPayment().trim().equals("")) {
                        throw new AppointmentDoesNotExistException("Payment has not been set");
                    }
                    newStatus = "complete";
                    break;
                default:
                    throw new AppointmentDoesNotExistException("unknown status");
            }

            result = appointmentDAO.updateAppointmentStatus(appointmentID, newStatus) > 0;
        } catch (NoSuchRecordExists ex) {
            if (ex.getMessage().toLowerCase().contains("doctor")) {
                throw new DoctorDoesNotExistException(ex.getMessage());
            } else {
                throw new AppointmentDoesNotExistException(ex.getMessage());
            }
        }

        return result;
    }

    @Override
    public boolean updateService_(String serviceID, float servicePrice, String serviceName)
            throws ServiceDoesNotExistException, SQLException {
        boolean result = false;
        BigDecimal price = BigDecimal.valueOf(servicePrice);

        try {
            Service_DTO service = serviceDAO.readService_(serviceID);
            service.setServicePrice(price);
            result = serviceDAO.updateService(service) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new ServiceDoesNotExistException(ex.getMessage());
        }

        return result;
    }

    @Override
    public List<Service_DTO> getService_BySpeciality(String specialityID) throws SQLException, ServiceDoesNotExistException {
        List<Service_DTO> services = null;

        try {
            if (specialityID != null) {
                services = serviceDAO.readServiceBySpeciality(specialityID);
            } else {
                services = serviceDAO.readAllService_();
            }
        } catch (NoSuchRecordExists ex) {
            throw new ServiceDoesNotExistException(ex.getMessage());
        }

        return services;
    }

    @Override
    public boolean addService(Map<String, String[]> args) throws ServiceAlreadyExistsException, SQLException {
        boolean result = false;

        try {
            String specialityID = Utils.getFromMap(args, "specialityID", "");
            String serviceName = Utils.getFromMap(args, "service-name", "");
            BigDecimal servicePrice = BigDecimal.valueOf(Float.valueOf(Utils.getFromMap(args, "service-price", "")));
            String serviceID = Utils.hash(specialityID + serviceName);

            Service_DTO service = new Service_DTOImpl();
            service.setServiceID(serviceID);
            service.setServiceName(serviceName);
            service.setSpeciality(specialityDAO.readSpeciality(specialityID));
            service.setServicePrice(servicePrice);

            result = serviceDAO.insertService(service) > 0;
        } catch (NoSuchSpecialityExistsException ex) {
            throw new SQLException(ex.getMessage());
        } catch (RecordAlreadyExists ex) {
            throw new ServiceAlreadyExistsException(ex.getMessage());
        }

        return result;
    }

    @Override
    public BlogDTO addBlog(Map<String, String[]> args, InputStream file) throws BlogAlreadyExistsException, SQLException {

        String title = Utils.getFromMap(args, "blog-title", "");
        String content = Utils.getFromMap(args, "blog-content", "");
        String author = currentUser.getFullName();
        String description = Utils.getFromMap(args, "_description", "");
        String category = Utils.getFromMap(args, "category", "");
        String filetype = Utils.getFromMap(args, "filetype", ".jpg");
        String path = Utils.getFromMap(args, "path", "");
        Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
        String blogID = Utils.hash(title + author + category + uploadTime.toString());

        BlogDTO blog = null;
        try {
            blog = new BlogDTOImpl();
            blog.setBlogID(blogID);
            blog.setBlogContent(content);
            blog.setTitle(title);
            blog.setDescription(description);
            blog.setCategory(category);
            blog.setUploadDatetime(uploadTime);
            ImageDTO image = null;
            if (file != null) {
                String imageURLName = blogID + filetype;
                image = addImage(file, path, imageURLName);
            } else {
                image = imageDAO.readImage("00DB5DAF82D7F818D6AB6A466AF7BEE4");
            }
            blog.setThumbnail(image);
            blogDAO.insertBlog(blog);
        } catch (RecordAlreadyExists | NoSuchRecordExists | ImageAlreadyExistsException ex) {
            throw new BlogAlreadyExistsException(ex.getMessage());
        }

        return blog;
    }

    @Override
    public BlogDTO editBlog(Map<String, String[]> args, InputStream file) throws BlogDoesNotExistException, SQLException {
        String title = Utils.getFromMap(args, "blog-title", "");
        String content = Utils.getFromMap(args, "blog-content", "");
        String description = Utils.getFromMap(args, "_description", "");
        String category = Utils.getFromMap(args, "category", "");
        String blogID = Utils.getFromMap(args, "blogID", "");
        String filetype = Utils.getFromMap(args, "filetype", ".jpg");
        String path = Utils.getFromMap(args, "path", "");

        BlogDTO blog = null;

        try {
            blog = blogDAO.readBlog(blogID);

            blog.setBlogContent(content);
            blog.setTitle(title);
            blog.setCategory(category);
            blog.setDescription(description);
            ImageDTO image = null;
            if (file != null) {
                String imageURLName = blogID + filetype;
                image = addImage(file, path, imageURLName);
            } else {
                image = imageDAO.readImage("00DB5DAF82D7F818D6AB6A466AF7BEE4");
            }
            blog.setThumbnail(image);
            blogDAO.updateBlog(blog);
        } catch (NoSuchRecordExists | ImageAlreadyExistsException ex) {
            throw new BlogDoesNotExistException(ex.getMessage());
        }

        return blog;
    }

    @Override
    public List<FeedbackDTO> getCustomerFeedbacks(String customerID) throws SQLException {
        List<FeedbackDTO> feedbacks = null;

        try {
            feedbacks = feedbackDAO.readFeedbackByCustomer(customerID);
        } catch (NoSuchRecordExists ex) {
            feedbacks = null;
        }

        return feedbacks;
    }

    @Override
    public Map<String, List<DoctorDTO>> getDoctorBySpeciality() throws SQLException {
        Map<String, List<DoctorDTO>> doctorBySpeciality = null;

        List<DoctorDTO> doctors = getAllDoctors();
        doctorBySpeciality = new HashMap<>();
        for (DoctorDTO doctor : doctors) {
            List<DoctorDTO> docList = doctorBySpeciality.get(doctor.getSpeciality().getSpecialityID());
            if (docList == null) {
                docList = new ArrayList<>();
                docList.add(doctor);
                doctorBySpeciality.put(doctor.getSpeciality().getSpecialityID(), docList);
            } else {
                doctorBySpeciality.get(doctor.getSpeciality().getSpecialityID()).add(doctor);
            }
        }

        return doctorBySpeciality;
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
    
    @Override
    public boolean deleteService(String serviceID) throws SQLException, ServiceDoesNotExistException {
        boolean result = false;
        
        try {
            result = serviceDAO.deleteService(serviceID) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new ServiceDoesNotExistException(ex.getMessage());
        }
        
        return result;
    }
}

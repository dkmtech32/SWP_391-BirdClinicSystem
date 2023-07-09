/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.blog.BlogDTO;
import models.blog.BlogDTOImpl;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.feedback.FeedbackDTO;
import models.service_.Service_DTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AccountDoesNotExist;
import services.general.AppointmentDoesNotExistException;
import services.general.BlogDoesNotExistException;
import services.general.GeneralServicesImpl;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class StaffServicesImpl extends GeneralServicesImpl implements StaffServices {

    public StaffServicesImpl(UserDTO user) throws AccountDoesNotExist {
        if (user.getUserRole().toLowerCase().equals("staff")) {
            this.currentUser = user;
        } else {
            throw new AccountDoesNotExist();
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
            service.setServiceName(serviceName);
            result = serviceDAO.updateService(service) > 0;
        } catch (NoSuchRecordExists ex) {
            throw new ServiceDoesNotExistException(ex.getMessage());
        }

        return result;
    }
    
    @Override
    public boolean addBlog(Map<String, String[]> args) throws BlogAlreadyExistsException, SQLException {
        boolean result = false;
        
        String title = Utils.getFromMap(args, "blog-title", "");
        String content = Utils.getFromMap(args, "blog-content", "");
        String author = currentUser.getFullName();
        String category = Utils.getFromMap(args, "category", "");
        Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
        String blogID = Utils.hash(title + author + category + uploadTime.toString());
        
        try {
            BlogDTO blog = new BlogDTOImpl();
            
            blog.setBlogID(blogID);
            blog.setBlogContent(content);
            blog.setTitle(title);
            blog.setCategory(category);
            blog.setUploadDatetime(uploadTime);
            
            blogDAO.insertBlog(blog);
            result = true;
        } catch (RecordAlreadyExists ex) {
            throw new BlogAlreadyExistsException(ex.getMessage());
        }
        
        return result;
    }
    
    public boolean editBlog(Map<String, String[]> args) throws BlogDoesNotExistException, SQLException {
        boolean result = false;
        
        String title = Utils.getFromMap(args, "blog-title", "");
        String content = Utils.getFromMap(args, "blog-content", "");
        String category = Utils.getFromMap(args, "category", "");
        Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
        String blogID = Utils.hash(title + category + uploadTime.toString());
        
        try {
            BlogDTO blog = new BlogDTOImpl();
            
            blog.setBlogID(blogID);
            blog.setBlogContent(content);
            blog.setTitle(title);
            blog.setCategory(category);
            blog.setUploadDatetime(uploadTime);
            
            blogDAO.insertBlog(blog);
            result = true;
        } catch (RecordAlreadyExists ex) {
            throw new BlogDoesNotExistException(ex.getMessage());
        }
        
        return result;
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
}

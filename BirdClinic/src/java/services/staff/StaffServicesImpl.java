/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import models.service_.Service_DTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AccountDoesNotExist;
import services.general.AppointmentDoesNotExistException;
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
    
    public boolean addBlog(Map<String, String[]> args) throws BlogAlreadyExistsException, SQLException {
        boolean result = false;
        
        String title = Utils.getFromMap(args, "title", "");
        
        return result;
    }
}

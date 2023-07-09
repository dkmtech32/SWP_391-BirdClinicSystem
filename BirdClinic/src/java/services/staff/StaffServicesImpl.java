/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import models.service_.Service_DTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AccountDoesNotExist;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServicesImpl;

/**
 *
 * @author Admin
 */
public class StaffServicesImpl extends GeneralServicesImpl {

    public StaffServicesImpl(UserDTO user) throws AccountDoesNotExist {
        if (user.getUserRole().toLowerCase().equals("staff")) {
            this.currentUser = user;
        } else {
            throw new AccountDoesNotExist();
        }
    }

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
}

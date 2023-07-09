/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import java.sql.SQLException;
import java.util.List;
import models.appointment.AppointmentDTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public interface StaffServices extends GeneralServices {

    boolean cancelAppointment(String appointmentID) throws AppointmentDoesNotExistException, SQLException;

    List<DoctorDTO> checkDoctor(AppointmentDTO appointment) throws AppointmentDoesNotExistException, DoctorDoesNotExistException, SQLException;

    boolean updateAppointment(String appointmentID) throws AppointmentDoesNotExistException, DoctorDoesNotExistException, SQLException;

    boolean updateAppointmentDoctor(String appointmentID, String doctorID) throws DoctorDoesNotExistException, AppointmentDoesNotExistException, SQLException;

    boolean updateAppointmentPayment(String appointmentID, String payment) throws AppointmentDoesNotExistException, SQLException;

    boolean updateService_(String serviceID, float servicePrice, String serviceName) throws ServiceDoesNotExistException, SQLException;
    
}

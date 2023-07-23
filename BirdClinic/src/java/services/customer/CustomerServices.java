/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.customer;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentAlreadyExistsException;
import models.bird.BirdAlreadyExistsException;
import models.bird.BirdDTO;
import models.users.doctor.DoctorDTO;
import services.doctor.DoctorDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.BirdDoesNotExistException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public interface CustomerServices extends GeneralServices {

    boolean addBird(Map<String, String[]> args, InputStream file) throws BirdAlreadyExistsException, SQLException;

    boolean bookAppointment(Map<String, String> args) throws AppointmentAlreadyExistsException, SQLException;

    boolean deleteBird(String birdID) throws BirdDoesNotExistException, SQLException;

    List<BirdDTO> getCustomerBirds() throws SQLException;

    boolean updateBird(Map<String, String[]> args, InputStream file) throws BirdDoesNotExistException, SQLException;

    boolean cancelAppointment(String appointmentID, String reason)
            throws SQLException, AppointmentDoesNotExistException;

    boolean addFeedback(Map<String, String[]> args) throws AppointmentDoesNotExistException, SQLException;
    
    List<DoctorDTO> getDoctorBySpeciality(String specialityID) throws DoctorDoesNotExistException, SQLException;
}

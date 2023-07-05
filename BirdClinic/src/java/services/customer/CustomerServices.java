/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import models.appointment.AppointmentAlreadyExistsException;
import models.appointment.AppointmentDTO;
import models.bird.BirdAlreadyExistsException;
import models.bird.BirdDTO;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;
import services.general.AccountAlreadyExistsException;
import services.general.AccountDoesNotExist;
import services.general.BirdDoesNotExistException;
import services.general.PasswordNotStrongException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public interface CustomerServices extends GeneralServices {

    boolean addBird(Map<String, String[]> args) throws BirdAlreadyExistsException, SQLException;

    boolean bookAppointment(Map<String, String> args) throws AppointmentAlreadyExistsException, SQLException;

    boolean deleteBird(String birdID) throws BirdDoesNotExistException, SQLException;

    List<AppointmentDTO> getCustomerAppointments() throws SQLException;

    List<BirdDTO> getCustomerBirds() throws SQLException;

    boolean updateBird(Map<String, String[]> args) throws BirdAlreadyExistsException, SQLException;

    boolean updateCustomerInfo(Map<String, String[]> args) 
            throws AccountAlreadyExistsException, PasswordNotStrongException, SQLException;
}

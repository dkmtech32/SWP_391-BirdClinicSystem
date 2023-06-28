/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.appointment;

import java.io.Serializable;
import java.util.Map;
import models.dto.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public interface AppointmentServices extends Serializable {

    AppointmentDTO bookAppointment(Map<String, String> args) throws AppointmentAlreadyExistsException;

    boolean checkInAppointment(String appointmentID);

    boolean checkOutAppointment(String appointmentID);

    boolean confirmAppointment(String appointmentID);

    boolean confirmAppointment(String appointmentID, String doctorID);
    
}

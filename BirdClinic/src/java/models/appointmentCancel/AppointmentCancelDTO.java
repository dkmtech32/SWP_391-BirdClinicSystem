/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointmentCancel;

import java.io.Serializable;
import models.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public interface AppointmentCancelDTO extends Serializable {

    AppointmentDTO getAppointment();

    String getReason();

    void setAppointment(AppointmentDTO appointment);

    void setReason(String reason);
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointmentCancel;

import models.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public class AppointmentCancelDTOImpl implements AppointmentCancelDTO {
    private AppointmentDTO appointment;
    private String reason;

    public AppointmentCancelDTOImpl(AppointmentDTO appointment, String reason) {
        this.appointment = appointment;
        this.reason = reason;
    }

    public AppointmentCancelDTOImpl() {
    }

    @Override
    public AppointmentDTO getAppointment() {
        return appointment;
    }

    @Override
    public void setAppointment(AppointmentDTO appointment) {
        this.appointment = appointment;
    }

    @Override
    public String getReason() {
        return reason;
    }

    @Override
    public void setReason(String reason) {
        this.reason = reason;
    }

    
}

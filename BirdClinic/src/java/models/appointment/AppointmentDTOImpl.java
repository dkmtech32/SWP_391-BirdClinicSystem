/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointment;

import java.sql.Date;
import models.bird.BirdDTO;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class AppointmentDTOImpl implements AppointmentDTO {
    private String appointmentID;
    private BirdDTO bird;
    private DoctorDTO doctor;
    private TimeslotDTO timeslot;
    private Service_DTO service_;
    private Date appTime;
    private String notes;
    private String payment;
    private String appStatus;

    public AppointmentDTOImpl() {
    }

    public AppointmentDTOImpl(String appointmentID, BirdDTO bird, DoctorDTO doctor, TimeslotDTO timeslot, Service_DTO service_, Date appTime, String notes, String payment, String appStatus) {
        this.appointmentID = appointmentID;
        this.bird = bird;
        this.doctor = doctor;
        this.timeslot = timeslot;
        this.service_ = service_;
        this.appTime = appTime;
        this.notes = notes;
        this.payment = payment;
        this.appStatus = appStatus;
    }

    @Override
    public String getAppointmentID() {
        return appointmentID;
    }

    @Override
    public void setAppointmentID(String appointmentID) {
        this.appointmentID = appointmentID;
    }

    @Override
    public BirdDTO getBird() {
        return bird;
    }

    @Override
    public void setBird(BirdDTO bird) {
        this.bird = bird;
    }

    @Override
    public DoctorDTO getDoctor() {
        return doctor;
    }

    @Override
    public void setDoctor(DoctorDTO doctor) {
        this.doctor = doctor;
    }

    @Override
    public TimeslotDTO getTimeslot() {
        return timeslot;
    }

    @Override
    public void setTimeslot(TimeslotDTO timeslot) {
        this.timeslot = timeslot;
    }

    @Override
    public Service_DTO getService_() {
        return service_;
    }

    @Override
    public void setService_(Service_DTO service_) {
        this.service_ = service_;
    }

    @Override
    public Date getAppTime() {
        return appTime;
    }

    @Override
    public void setAppTime(Date appTime) {
        this.appTime = appTime;
    }

    @Override
    public String getNotes() {
        return notes;
    }

    @Override
    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String getPayment() {
        return payment;
    }

    @Override
    public void setPayment(String payment) {
        this.payment = payment;
    }

    @Override
    public String getAppStatus() {
        return appStatus;
    }

    @Override
    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus;
    }
    
    
}

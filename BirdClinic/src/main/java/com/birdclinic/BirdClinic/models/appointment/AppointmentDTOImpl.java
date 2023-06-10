package com.birdclinic.BirdClinic.models.appointment;

import java.sql.Timestamp;

public class AppointmentDTOImpl implements AppointmentDTO {
    private String appointmentID;
    private String birdID;
    private String doctorID;
    private Timestamp appTime;
    private String notes;
    private String appType;
    private String slotTime;
    private String payment;
    private String appStatus;

    public AppointmentDTOImpl() {

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
    public String getBirdID() {
        return birdID;
    }

    @Override
    public void setBirdID(String birdID) {
        this.birdID = birdID;
    }

    @Override
    public String getDoctorID() {
        return doctorID;
    }

    @Override
    public void setDoctorID(String doctorID) {
        this.doctorID = doctorID;
    }

    @Override
    public Timestamp getAppTime() {
        return appTime;
    }

    @Override
    public void setAppTime(Timestamp appTime) {
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
    public String getAppType() {
        return appType;
    }

    @Override
    public void setAppType(String appType) {
        this.appType = appType;
    }

    @Override
    public String getSlotTime() {
        return slotTime;
    }

    @Override
    public void setSlotTime(String slotTime) {
        this.slotTime = slotTime;
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

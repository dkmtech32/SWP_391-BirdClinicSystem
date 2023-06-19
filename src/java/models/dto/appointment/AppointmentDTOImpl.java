/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.appointment;

import java.sql.Timestamp;
import models.dto.bird.BirdDTO;
import models.dto.speciality.SpecialityDTO;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class AppointmentDTOImpl implements AppointmentDTO {
    private String appointmentID;
    private BirdDTO bird;
    private DoctorDTO doctor;
    private TimeslotDTO timeslot;
    private SpecialityDTO speciality;
    private Timestamp appTime;
    private String notes;
    private String payment;
    private String appStatus;

    public AppointmentDTOImpl() {
    }

    public AppointmentDTOImpl(String appointmentID, BirdDTO bird, DoctorDTO doctor, TimeslotDTO timeslot, SpecialityDTO speciality, Timestamp appTime, String notes, String payment, String appStatus) {
        this.appointmentID = appointmentID;
        this.bird = bird;
        this.doctor = doctor;
        this.timeslot = timeslot;
        this.speciality = speciality;
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
    public SpecialityDTO getSpeciality() {
        return speciality;
    }

    @Override
    public void setSpeciality(SpecialityDTO speciality) {
        this.speciality = speciality;
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

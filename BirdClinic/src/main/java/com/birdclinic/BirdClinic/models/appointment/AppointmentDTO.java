package com.birdclinic.BirdClinic.models.appointment;

import java.sql.Timestamp;

public interface AppointmentDTO {

    String getAppointmentID();

    void setAppointmentID(String appointmentID);

    String getBirdID();

    void setBirdID(String birdID);

    String getDoctorID();

    void setDoctorID(String doctorID);

    Timestamp getAppTime();

    void setAppTime(Timestamp appTime);

    String getNotes();

    void setNotes(String notes);

    String getAppType();

    void setAppType(String appType);

    String getSlotTime();

    void setSlotTime(String slotTime);

    String getPayment();

    void setPayment(String payment);

    String getAppStatus();

    void setAppStatus(String appStatus);

}
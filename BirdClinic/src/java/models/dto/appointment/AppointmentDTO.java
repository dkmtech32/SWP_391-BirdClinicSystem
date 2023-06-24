/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.appointment;

import java.io.Serializable;
import java.sql.Timestamp;
import models.dto.bird.BirdDTO;
import models.dto.service_.Service_DTO;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface AppointmentDTO extends Serializable {

    String getAppStatus();

    Timestamp getAppTime();

    String getAppointmentID();

    BirdDTO getBird();

    DoctorDTO getDoctor();

    String getNotes();

    String getPayment();

    Service_DTO getService_();

    TimeslotDTO getTimeslot();

    void setAppStatus(String appStatus);

    void setAppTime(Timestamp appTime);

    void setAppointmentID(String appointmentID);

    void setBird(BirdDTO bird);

    void setDoctor(DoctorDTO doctor);

    void setNotes(String notes);

    void setPayment(String payment);

    void setService_(Service_DTO service_);

    void setTimeslot(TimeslotDTO timeslot);
    
}

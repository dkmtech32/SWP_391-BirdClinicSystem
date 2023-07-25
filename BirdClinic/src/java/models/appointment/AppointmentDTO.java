/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointment;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import models.bird.BirdDTO;
import models.service_.Service_DTO;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public interface AppointmentDTO extends Serializable, Comparable {

    String getAppStatus();

    Date getAppTime();

    String getAppointmentID();

    BirdDTO getBird();

    DoctorDTO getDoctor();

    String getNotes();

    String getPayment();

    List<Service_DTO> getService_();

    TimeslotDTO getTimeslot();

    void setAppStatus(String appStatus);

    void setAppTime(Date appTime);

    void setAppointmentID(String appointmentID);

    void setBird(BirdDTO bird);

    void setDoctor(DoctorDTO doctor);

    void setNotes(String notes);

    void setPayment(String payment);

    void setService_(Service_DTO service_);

    void setTimeslot(TimeslotDTO timeslot);
    
    void setAllService(List<Service_DTO> service_);
    
}

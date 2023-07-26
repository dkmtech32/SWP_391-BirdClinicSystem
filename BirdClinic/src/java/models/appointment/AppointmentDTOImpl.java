/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointment;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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
    private List<Service_DTO> service_;
    private Date appTime;
    private String notes;
    private String payment;
    private String appStatus;
    private BigDecimal totalPrice;

    public AppointmentDTOImpl() {
        totalPrice = BigDecimal.ZERO;
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
    public List<Service_DTO> getService_() {
        return service_;
    }

    @Override
    public void setService_(Service_DTO service_) {
        if (this.service_ == null) {
            this.service_ = new ArrayList<>();
        }
        this.service_.add(service_);
    }

    @Override
    public void setAllService(List<Service_DTO> service_) {
        if (this.service_ == null) {
            this.service_ = new ArrayList<>();
        }
        if (this.service_.indexOf(service_) == -1) {
            this.service_.addAll(service_);
        }
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

    @Override
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    @Override
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    @Override
    public int compareTo(Object o) {
        int result = 0;
        if (o instanceof AppointmentDTO) {
            AppointmentDTO obj = (AppointmentDTO) o;

            result = - appTime.compareTo(obj.getAppTime());
            if (result == 0) {
                result = - timeslot.compareTo(obj.getTimeslot());
            }
        }
        return result;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.timeslot;

import java.sql.Time;

/**
 *
 * @author Admin
 */
public class TimeslotDTOImpl implements TimeslotDTO {
    private String timeSlotID;
    private Time timeSlot;
    private String day_;

    public TimeslotDTOImpl() {
    }

    public TimeslotDTOImpl(String timeSlotID, Time timeSlot, String day_) {
        this.timeSlotID = timeSlotID;
        this.timeSlot = timeSlot;
        this.day_ = day_;
    }

    @Override
    public String getTimeSlotID() {
        return timeSlotID;
    }

    @Override
    public void setTimeSlotID(String timeSlotID) {
        this.timeSlotID = timeSlotID;
    }

    @Override
    public Time getTimeSlot() {
        return timeSlot;
    }

    @Override
    public void setTimeSlot(Time timeSlot) {
        this.timeSlot = timeSlot;
    }

    @Override
    public String getDay_() {
        return day_;
    }

    @Override
    public void setDay_(String day_) {
        this.day_ = day_;
    }
    
    @Override
    public String getTimeDisplay() {
        return this.timeSlot.toString().substring(0, 5);
    }
}

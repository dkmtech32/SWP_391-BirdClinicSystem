/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.timeslot;

import java.sql.Time;
import java.util.Objects;

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

    @Override
    public int compareTo(Object o) {
        TimeslotDTOImpl obj = (TimeslotDTOImpl)o;
        
        return this.getTimeSlot().compareTo(obj.getTimeSlot());
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.timeSlotID);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final TimeslotDTOImpl other = (TimeslotDTOImpl) obj;
        return Objects.equals(this.timeSlotID, other.timeSlotID);
    }
    
    
}

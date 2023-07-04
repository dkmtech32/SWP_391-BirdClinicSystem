/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.timeslot;

import java.io.Serializable;
import java.sql.Time;

/**
 *
 * @author Admin
 */
public interface TimeslotDTO extends Serializable{

    String getDay_();

    String getTimeDisplay();

    Time getTimeSlot();

    String getTimeSlotID();

    void setDay_(String day_);

    void setTimeSlot(Time timeSlot);

    void setTimeSlotID(String timeSlotID);
    
}

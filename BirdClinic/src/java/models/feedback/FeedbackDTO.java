/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.feedback;

import java.math.BigDecimal;
import java.sql.Timestamp;
import models.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public interface FeedbackDTO {

    AppointmentDTO getAppointment();

    String getFeedbackContent();

    String getFeedbackID();

    Timestamp getFeedbackTime();

    String getTitle();
    
    BigDecimal getRating();

    void setAppointment(AppointmentDTO appointment);

    void setFeedbackContent(String feedbackContent);

    void setFeedbackID(String feedbackID);

    void setFeedbackTime(Timestamp feedbackTime);

    void setTitle(String title);
    
    void setRating(BigDecimal rating);
}

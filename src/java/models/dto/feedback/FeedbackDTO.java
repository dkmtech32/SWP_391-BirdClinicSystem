/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.feedback;

import java.sql.Timestamp;
import models.dto.appointment.AppointmentDTO;
import models.dto.users.customer.CustomerDTO;

/**
 *
 * @author Admin
 */
public interface FeedbackDTO {

    AppointmentDTO getAppointment();

    CustomerDTO getCustomer();

    String getFeedbackContent();

    String getFeedbackID();

    Timestamp getFeedbackTime();

    String getTitle();

    void setAppointment(AppointmentDTO appointment);

    void setCustomer(CustomerDTO customer);

    void setFeedbackContent(String feedbackContent);

    void setFeedbackID(String feedbackID);

    void setFeedbackTime(Timestamp feedbackTime);

    void setTitle(String title);
    
}

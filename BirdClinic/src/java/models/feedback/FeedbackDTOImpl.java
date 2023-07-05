/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.feedback;

import java.sql.Timestamp;
import models.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public class FeedbackDTOImpl implements FeedbackDTO {
    private String feedbackID;
    private AppointmentDTO appointment;
    private String feedbackContent;
    private String title;
    private Timestamp feedbackTime;

    public FeedbackDTOImpl() {
    }

    public FeedbackDTOImpl(String feedbackID, AppointmentDTO appointment, String feedbackContent, String title, Timestamp feedbackTime) {
        this.feedbackID = feedbackID;
        this.appointment = appointment;
        this.feedbackContent = feedbackContent;
        this.title = title;
        this.feedbackTime = feedbackTime;
    }

    @Override
    public String getFeedbackID() {
        return feedbackID;
    }

    @Override
    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    @Override
    public AppointmentDTO getAppointment() {
        return appointment;
    }

    @Override
    public void setAppointment(AppointmentDTO appointment) {
        this.appointment = appointment;
    }

    @Override
    public String getFeedbackContent() {
        return feedbackContent;
    }

    @Override
    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public Timestamp getFeedbackTime() {
        return feedbackTime;
    }

    @Override
    public void setFeedbackTime(Timestamp feedbackTime) {
        this.feedbackTime = feedbackTime;
    }
    
    
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.feedback;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.feedback.FeedbackDTO;

/**
 *
 * @author Admin
 */
public interface FeedbackDAO extends Serializable {
    FeedbackDTO readFeedback(String feedbackID) throws SQLException;
    
    FeedbackDTO readFeedback(String feedbackID, Connection con) throws SQLException;
    
    FeedbackDTO readFeedbackByAppointment(String appointmentID, Connection con) throws SQLException;
    
    FeedbackDTO readFeedbackByAppointment(String appointmentID) throws SQLException;
    
    List<FeedbackDTO> readFeedbackByDoctor(String doctorID, Connection con) throws SQLException;
    
    List<FeedbackDTO> readFeedbackByDoctor(String doctorID) throws SQLException;
    
    List<FeedbackDTO> readFeedbackByCustomer(String customerID, Connection con) throws SQLException;
    
    List<FeedbackDTO> readFeedbackByCustomer(String customerID) throws SQLException;
    
    int insertFeedback(FeedbackDTO feedback) throws SQLException;
    
    int deleteFeedback(String feedbackID) throws SQLException;
    
    int updateFeedback(FeedbackDTO feedback) throws SQLException;
}

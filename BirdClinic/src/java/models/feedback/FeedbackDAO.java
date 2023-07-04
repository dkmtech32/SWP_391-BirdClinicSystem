/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.feedback;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface FeedbackDAO extends Serializable {
    FeedbackDTO readFeedback(String feedbackID) throws SQLException, NoSuchRecordExists;
    
    FeedbackDTO readFeedbackByAppointment(String appointmentID) throws SQLException, NoSuchRecordExists;
    
    List<FeedbackDTO> readFeedbackByDoctor(String doctorID) throws SQLException, NoSuchRecordExists;
    
    List<FeedbackDTO> readFeedbackByCustomer(String customerID) throws SQLException, NoSuchRecordExists;
    
    int insertFeedback(FeedbackDTO feedback) throws SQLException, RecordAlreadyExists;
    
    int deleteFeedback(String feedbackID) throws SQLException, NoSuchRecordExists;
    
    int updateFeedback(FeedbackDTO feedback) throws SQLException, NoSuchRecordExists;
}

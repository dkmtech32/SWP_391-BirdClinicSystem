/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.feedback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dao.appointment.AppointmentDAO;
import models.dao.users.customer.CustomerDAO;
import models.dto.feedback.FeedbackDTO;

/**
 *
 * @author Admin
 */
public class FeedbackDAOImpl implements FeedbackDAO {
    private final AppointmentDAO appointmentDAO;
    private final CustomerDAO customerDAO;

    public FeedbackDAOImpl(AppointmentDAO appointmentDAO, CustomerDAO customerDAO) {
        this.appointmentDAO = appointmentDAO;
        this.customerDAO = customerDAO;
    }
    
    private static final String READ_FEEDBACK = "";
    private static final String READ_FEEDBACK_BY_APPOINTMENT = "";
    private static final String READ_FEEDBACK_BY_CUSTOMER = "";
    private static final String UPDATE_FEEDBACK = "";
    private static final String INSERT_FEEDBACK = "";
    private static final String DELETE_FEEDBACK = "";
    

    @Override
    public FeedbackDTO readFeedback(String feedbackID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public FeedbackDTO readFeedback(String feedbackID, Connection con) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID, Connection con) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FeedbackDTO> readFeedbackByDoctor(String doctorID, Connection con) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FeedbackDTO> readFeedbackByDoctor(String doctorID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID, Connection con) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertFeedback(FeedbackDTO feedback) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteFeedback(String feedbackID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateFeedback(FeedbackDTO feedback) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.appointment.AppointmentDAO;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import utils.DBUtils;

public class FeedbackDAOImpl implements FeedbackDAO {

    private final AppointmentDAO appointmentDAO;

    public FeedbackDAOImpl(AppointmentDAO appointmentDAO) {
        this.appointmentDAO = appointmentDAO;
    }

    private static final String READ_FEEDBACK
            = "SELECT feedbackID, appointmentID, feedbackContent, title, feedbackTime, rating "
            + "FROM Feedback "
            + "WHERE feedbackID = ?";
    private static final String READ_FEEDBACK_BY_APPOINTMENT
            = "SELECT feedbackID, appointmentID, feedbackContent, title, feedbackTime, rating "
            + "FROM Feedback "
            + "WHERE appointmentID = ?";
    private static final String UPDATE_FEEDBACK
            = "UPDATE Feedback "
            + "SET feedbackContent = ?, title = ?, rating = ? "
            + "WHERE feedbackID = ?";
    private static final String INSERT_FEEDBACK
            = "INSERT INTO Feedback (feedbackID, appointmentID, feedbackContent, title, feedbackTime, rating) "
            + "VALUES (?, ?, ?, ?, ?)";
    private static final String DELETE_FEEDBACK
            = "DELETE FROM Feedback "
            + "WHERE feedbackID = ?";

    @Override
    public FeedbackDTO readFeedback(String feedbackID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        FeedbackDTO feedback = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK);
            stm.setString(1, feedbackID);
            rs = stm.executeQuery();

            if (rs.next()) {
                feedback = new FeedbackDTOImpl();
                feedback.setFeedbackID(rs.getString("feedbackID"));
                feedback.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID")));
                feedback.setFeedbackContent(rs.getString("feedbackContent"));
                feedback.setTitle(rs.getString("title"));
                feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
                feedback.setRating(rs.getBigDecimal("rating"));
            }
            
            if (feedback == null) {
                throw new NoSuchFeedbackExistsException();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return feedback;
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        FeedbackDTO feedback = null;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                feedback = new FeedbackDTOImpl();
                feedback.setFeedbackID(rs.getString("feedbackID"));
                feedback.setAppointment(appointment);
                feedback.setFeedbackContent(rs.getString("feedbackContent"));
                feedback.setTitle(rs.getString("title"));
                feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
                feedback.setRating(rs.getBigDecimal("rating"));
            }

            if (feedback == null) {
                throw new NoSuchFeedbackExistsException();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return feedback;
    }

    @Override
    public List<FeedbackDTO> readFeedbackByDoctor(String doctorID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<FeedbackDTO> result = null;

        try {
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByDoctor(doctorID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            for (AppointmentDTO appointment : appointments) {
                stm.setString(1, appointment.getAppointmentID());
                rs = stm.executeQuery();

                if (rs.next()) {
                    FeedbackDTO feedback = new FeedbackDTOImpl();
                    feedback.setFeedbackID(rs.getString("feedbackID"));
                    feedback.setAppointment(appointment);
                    feedback.setFeedbackContent(rs.getString("feedbackContent"));
                    feedback.setTitle(rs.getString("title"));
                    feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
                feedback.setRating(rs.getBigDecimal("rating"));
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(feedback);
                }
            }
            
            if (result == null || result.isEmpty()) throw new NoSuchFeedbackExistsException(); 
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    @Override
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<FeedbackDTO> result = null;

        try {
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByCustomer(customerID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            for (AppointmentDTO appointment : appointments) {
                stm.setString(1, appointment.getAppointmentID());
                rs = stm.executeQuery();

                if (rs.next()) {
                    FeedbackDTO feedback = new FeedbackDTOImpl();
                    feedback.setFeedbackID(rs.getString("feedbackID"));
                    feedback.setAppointment(appointment);
                    feedback.setFeedbackContent(rs.getString("feedbackContent"));
                    feedback.setTitle(rs.getString("title"));
                    feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
                feedback.setRating(rs.getBigDecimal("rating"));
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(feedback);
                }
            }
            
            if (result == null || result.isEmpty()) throw new NoSuchFeedbackExistsException(); 
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    @Override
    public int insertFeedback(FeedbackDTO feedback) throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_FEEDBACK);
            stm.setString(1, feedback.getFeedbackID());
            stm.setString(2, feedback.getAppointment().getAppointmentID());
            stm.setString(3, feedback.getFeedbackContent());
            stm.setString(4, feedback.getTitle());
            stm.setTimestamp(5, feedback.getFeedbackTime());
            stm.setBigDecimal(6, feedback.getRating());

            result = stm.executeUpdate();
            
            if (result == 0) throw new FeedbackAlreadyExistsException();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    @Override
    public int deleteFeedback(String feedbackID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_FEEDBACK);
            stm.setString(1, feedbackID);

            result = stm.executeUpdate();
            
            if (result == 0) throw new NoSuchFeedbackExistsException();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    @Override
    public int updateFeedback(FeedbackDTO feedback) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_FEEDBACK);
            stm.setString(1, feedback.getFeedbackContent());
            stm.setString(2, feedback.getTitle());
            stm.setBigDecimal(3, feedback.getRating());
            stm.setString(4, feedback.getFeedbackID());

            result = stm.executeUpdate();
            
            if (result == 0) throw new NoSuchFeedbackExistsException();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
}

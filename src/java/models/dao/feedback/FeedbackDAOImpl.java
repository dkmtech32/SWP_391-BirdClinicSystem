/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.dao.appointment.AppointmentDAO;
import models.dao.users.customer.CustomerDAO;
import models.dto.feedback.FeedbackDTO;
import models.dto.feedback.FeedbackDTOImpl;
import utils.DBUtils;

public class FeedbackDAOImpl implements FeedbackDAO {
    private final AppointmentDAO appointmentDAO;
    private final CustomerDAO customerDAO;

    public FeedbackDAOImpl(AppointmentDAO appointmentDAO, CustomerDAO customerDAO) {
        this.appointmentDAO = appointmentDAO;
        this.customerDAO = customerDAO;
    }

    private static final String READ_FEEDBACK = "SELECT * FROM Feedback WHERE feedbackID = ?";
    private static final String READ_FEEDBACK_BY_APPOINTMENT = "SELECT * FROM Feedback WHERE appointmentID = ?";
    private static final String READ_FEEDBACK_BY_CUSTOMER = "SELECT * FROM Feedback WHERE customerID = ?";
    private static final String READ_FEEDBACK_BY_DOCTOR = "SELECT * FROM Feedback WHERE doctorID = ?";
    private static final String UPDATE_FEEDBACK = "UPDATE Feedback SET feedbackContent = ?, title = ? WHERE feedbackID = ?";
    private static final String INSERT_FEEDBACK = "INSERT INTO Feedback (feedbackID, customerID, appointmentID, feedbackContent, title, feedbackTime) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_FEEDBACK = "DELETE FROM Feedback WHERE feedbackID = ?";

    @Override
    public FeedbackDTO readFeedback(String feedbackID) throws SQLException {
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stm = con.prepareStatement(READ_FEEDBACK)) {
            stm.setString(1, feedbackID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return mapFeedback(rs, con);
            }
        }
        return null;
    }

    @Override
    public FeedbackDTO readFeedback(String feedbackID, Connection con) throws SQLException {
        try (PreparedStatement stm = con.prepareStatement(READ_FEEDBACK)) {
            stm.setString(1, feedbackID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return mapFeedback(rs, con);
            }
        }
        return null;
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID, Connection con) throws SQLException {
        try (PreparedStatement stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT)) {
            stm.setString(1, appointmentID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return mapFeedback(rs, con);
            }
        }
        return null;
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID) throws SQLException {
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT)) {
            stm.setString(1, appointmentID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return mapFeedback(rs, con);
            }
        }
        return null;
    }

    @Override
public List<FeedbackDTO> readFeedbackByDoctor(String doctorID, Connection con) throws SQLException {
    try (PreparedStatement stm = con.prepareStatement(READ_FEEDBACK_BY_DOCTOR)) {
        stm.setString(1, doctorID);
        ResultSet rs = stm.executeQuery();
        List<FeedbackDTO> feedbackList = new ArrayList<>();
        while (rs.next()) {
            feedbackList.add(mapFeedback(rs, con));
        }
        return feedbackList;
    }
}

@Override
public List<FeedbackDTO> readFeedbackByDoctor(String doctorID) throws SQLException {
    try (Connection con = DBUtils.getConnection();
         PreparedStatement stm = con.prepareStatement(READ_FEEDBACK_BY_DOCTOR)) {
        stm.setString(1, doctorID);
        ResultSet rs = stm.executeQuery();
        List<FeedbackDTO> feedbackList = new ArrayList<>();
        while (rs.next()) {
            feedbackList.add(mapFeedback(rs, con));
        }
        return feedbackList;
    }
}

    @Override
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID, Connection con) throws SQLException {
        try (PreparedStatement stm = con.prepareStatement(READ_FEEDBACK_BY_CUSTOMER)) {
            stm.setString(1, customerID);
            ResultSet rs = stm.executeQuery();
            List<FeedbackDTO> feedbackList = new ArrayList<>();
            while (rs.next()) {
                feedbackList.add(mapFeedback(rs, con));
            }
            return feedbackList;
        }
    }

    @Override
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID) throws SQLException {
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stm = con.prepareStatement(READ_FEEDBACK_BY_CUSTOMER)) {
            stm.setString(1, customerID);
            ResultSet rs = stm.executeQuery();
            List<FeedbackDTO> feedbackList = new ArrayList<>();
            while (rs.next()) {
                feedbackList.add(mapFeedback(rs, con));
            }
            return feedbackList;
        }
    }

    @Override
    public int insertFeedback(FeedbackDTO feedback) throws SQLException {
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stm = con.prepareStatement(INSERT_FEEDBACK)) {
            stm.setString(1, feedback.getFeedbackID());
            stm.setString(2, feedback.getCustomer().getUserID());
            stm.setString(3, feedback.getAppointment().getAppointmentID());
            stm.setString(4, feedback.getFeedbackContent());
            stm.setString(5, feedback.getTitle());
            stm.setTimestamp(6, feedback.getFeedbackTime());
            return stm.executeUpdate();
        }
    }

    @Override
    public int deleteFeedback(String feedbackID) throws SQLException {
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stm = con.prepareStatement(DELETE_FEEDBACK)) {
            stm.setString(1, feedbackID);
            return stm.executeUpdate();
        }
    }

    @Override
    public int updateFeedback(FeedbackDTO feedback) throws SQLException {
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stm = con.prepareStatement(UPDATE_FEEDBACK)) {
            stm.setString(1, feedback.getFeedbackContent());
            stm.setString(2, feedback.getTitle());
            stm.setString(3, feedback.getFeedbackID());
            return stm.executeUpdate();
        }
    }

    private FeedbackDTO mapFeedback(ResultSet rs, Connection con) throws SQLException {
        FeedbackDTO feedback = new FeedbackDTOImpl();
        feedback.setFeedbackID(rs.getString("feedbackID"));
        feedback.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
        feedback.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID"), con));
        feedback.setFeedbackContent(rs.getString("feedbackContent"));
        feedback.setTitle(rs.getString("title"));
        feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
        return feedback;
    }
}
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
import models.dto.appointment.AppointmentDTO;
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

    private static final String READ_FEEDBACK
            = "SELECT feedbackID, customerID, appointmentID, feedbackContent, title, feedbackTime "
            + "FROM Feedback "
            + "WHERE feedbackID = ?";
    private static final String READ_FEEDBACK_BY_APPOINTMENT
            = "SELECT feedbackID, customerID, appointmentID, feedbackContent, title, feedbackTime "
            + "FROM Feedback "
            + "WHERE appointmentID = ?";
    private static final String READ_FEEDBACK_BY_CUSTOMER
            = "SELECT feedbackID, customerID, appointmentID, feedbackContent, title, feedbackTime "
            + "FROM Feedback "
            + "WHERE customerID = ?";
    private static final String UPDATE_FEEDBACK
            = "UPDATE Feedback "
            + "SET feedbackContent = ?, title = ? "
            + "WHERE feedbackID = ?";
    private static final String INSERT_FEEDBACK
            = "INSERT INTO Feedback (feedbackID, customerID, appointmentID, feedbackContent, title, feedbackTime) "
            + "VALUES (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_FEEDBACK
            = "DELETE FROM Feedback "
            + "WHERE feedbackID = ?";

    @Override
    public FeedbackDTO readFeedback(String feedbackID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        FeedbackDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK);
            stm.setString(1, feedbackID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = this.mapFeedbackToDTO(rs, con);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public FeedbackDTO readFeedback(String feedbackID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        FeedbackDTO result = null;

        try {
            stm = con.prepareStatement(READ_FEEDBACK);
            stm.setString(1, feedbackID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = this.mapFeedbackToDTO(rs, con);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return result;
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        FeedbackDTO result = null;

        try {
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = this.mapFeedbackToDTO(rs, con);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return result;
    }

    @Override
    public FeedbackDTO readFeedbackByAppointment(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        FeedbackDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = this.mapFeedbackToDTO(rs, con);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public List<FeedbackDTO> readFeedbackByDoctor(String doctorID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<FeedbackDTO> result = null;

        try {
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            result = new ArrayList<>();
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByDoctor(doctorID);
            for (AppointmentDTO app : appointments) {
                stm.setString(1, app.getAppointmentID());

                rs = stm.executeQuery();
                if (rs.next()) {
                    result.add(this.mapFeedbackToDTO(rs, con));
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return result;
    }

    @Override
    public List<FeedbackDTO> readFeedbackByDoctor(String doctorID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<FeedbackDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK_BY_APPOINTMENT);
            result = new ArrayList<>();
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByDoctor(doctorID);
            for (AppointmentDTO app : appointments) {
                stm.setString(1, app.getAppointmentID());

                rs = stm.executeQuery();
                if (rs.next()) {
                    result.add(this.mapFeedbackToDTO(rs, con));
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<FeedbackDTO> result = null;

        try {
            stm = con.prepareStatement(READ_FEEDBACK_BY_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                result.add(this.mapFeedbackToDTO(rs, con));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return result;
    }

    @Override
    public List<FeedbackDTO> readFeedbackByCustomer(String customerID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<FeedbackDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_FEEDBACK_BY_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                result.add(this.mapFeedbackToDTO(rs, con));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public int insertFeedback(FeedbackDTO feedback) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_FEEDBACK);
            stm.setString(1, feedback.getFeedbackID());
            stm.setString(2, feedback.getCustomer().getUserID());
            stm.setString(3, feedback.getAppointment().getAppointmentID());
            stm.setString(4, feedback.getFeedbackContent());
            stm.setString(5, feedback.getTitle());
            stm.setTimestamp(6, feedback.getFeedbackTime());
            
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public int deleteFeedback(String feedbackID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_FEEDBACK);
            stm.setString(1, feedbackID);
            
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    public int updateFeedback(FeedbackDTO feedback) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_FEEDBACK);
            stm.setString(1, feedback.getCustomer().getUserID());
            stm.setString(2, feedback.getAppointment().getAppointmentID());
            stm.setString(3, feedback.getFeedbackContent());
            stm.setString(4, feedback.getTitle());
            stm.setTimestamp(5, feedback.getFeedbackTime());
            stm.setString(6, feedback.getFeedbackID());
            
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
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

    private FeedbackDTO mapFeedbackToDTO(ResultSet rs, Connection con) throws SQLException {
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

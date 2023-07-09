/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.appointmentCancel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.appointment.AppointmentDAO;
import models.appointment.AppointmentDTO;
import models.exceptions.NoSuchRecordExists;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class AppointmentCancelDAOImpl implements AppointmentCancelDAO {

    private final AppointmentDAO appointmentDAO;

    public AppointmentCancelDAOImpl(AppointmentDAO appointmentDAO) {
        this.appointmentDAO = appointmentDAO;
    }
    private static final String READ_APPOINTMENT_CANCEL
            = "SELECT appointmentID, reason "
            + "FROM AppointmentCancel "
            + "WHERE appointmentID = ?;";
    private static final String INSERT_APPOINTMENT_CANCEL
            = "INSERT INTO AppointmentCancel (appointmentID, reason) "
            + "VALUES (?, ?);";

    @Override
    public AppointmentCancelDTO readAppointmentCancel(String appointmentID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AppointmentCancelDTO appointmentCancel = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_CANCEL);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                appointmentCancel = new AppointmentCancelDTOImpl();
                appointmentCancel.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID")));
                appointmentCancel.setReason(rs.getString("reason"));
            }

            if (appointmentCancel == null) {
                throw new NoSuchRecordExists();
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

        return appointmentCancel;
    }

    @Override
    public List<AppointmentCancelDTO> readAppointmentCancelsByIds(List<String> appointmentIds) 
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentCancelDTO> appointmentCancels = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_CANCEL);
            
            for (String appointmentId : appointmentIds) {
                stm.setString(1, appointmentId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    AppointmentCancelDTO appointmentCancel = new AppointmentCancelDTOImpl();
                    appointmentCancel.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID")));
                    appointmentCancel.setReason(rs.getString("reason"));
                    appointmentCancels.add(appointmentCancel);
                }
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

        return appointmentCancels;
    }
    
    @Override
    public List<AppointmentCancelDTO> readAppointmentCancelsByCustomer(String customerID) 
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<AppointmentCancelDTO> appointmentCancels = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_APPOINTMENT_CANCEL);
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByCustomer(customerID);
            
            for (AppointmentDTO appointment : appointments) {
                stm.setString(1, appointment.getAppointmentID());
                rs = stm.executeQuery();

                while (rs.next()) {
                    AppointmentCancelDTO appointmentCancel = new AppointmentCancelDTOImpl();
                    appointmentCancel.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID")));
                    appointmentCancel.setReason(rs.getString("reason"));
                    appointmentCancels.add(appointmentCancel);
                }
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

        return appointmentCancels;
    }

    @Override
    public void insertAppointmentCancel(AppointmentCancelDTO appointmentCancel) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_APPOINTMENT_CANCEL);
            stm.setString(1, appointmentCancel.getAppointment().getAppointmentID());
            stm.setString(2, appointmentCancel.getReason());
            stm.executeUpdate();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}

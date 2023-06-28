/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.timeslot;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import models.dto.timeslot.TimeslotDTO;
import models.dto.timeslot.TimeslotDTOImpl;
import utils.DBUtils;
/**
 *
 * @author Admin
 */
public class TimeslotDAOImpl implements TimeslotDAO {
    private static final String READ_TIMESLOT = "select timeSlotID, timeSlot, day_ "
            + "from TimeSlot "
            + "where timeSlotID = ?";
    private static final String READ_ALL_TIMESLOT = "select timeSlotID, timeSlot, day_ "
            + "from TimeSlot ";
    
    public TimeslotDAOImpl() {
    }

    @Override
    public TimeslotDTO readTimeSlot(String timeslotID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimeslotDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();

            if (rs != null) {
                result = new TimeslotDTOImpl();
                result.setTimeSlotID(timeslotID);
                result.setDay_(rs.getString("day_"));
                result.setTimeSlot(rs.getTime("timeSlot"));
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
    public TimeslotDTO readTimeSlot(String timeslotID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimeslotDTO result = null;

        try {
            stm = con.prepareStatement(READ_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();

            if (rs != null) {
                result = new TimeslotDTOImpl();
                result.setTimeSlotID(timeslotID);
                result.setDay_(rs.getString("day_"));
                result.setTimeSlot(rs.getTime("timeSlot"));
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
    public List<TimeslotDTO> readAllTimeSlot() throws SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<TimeslotDTO> timeSlotList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_TIMESLOT);

            while (rs != null) {
                TimeslotDTO result = new TimeslotDTOImpl();
                result.setTimeSlotID(rs.getString("timeSlotID"));
                result.setDay_(rs.getString("day_"));
                result.setTimeSlot(rs.getTime("timeSlot"));
            
                if (timeSlotList==null) 
                    timeSlotList = new ArrayList<>();
                timeSlotList.add(result);
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
        
        return timeSlotList;
    }
}

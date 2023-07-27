/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.timeslot;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import models.exceptions.NoSuchRecordExists;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class TimeslotDAOImpl implements TimeslotDAO {

    private static final String READ_TIMESLOT
            = "select timeSlotID, timeSlot, day_ "
            + "from TimeSlot "
            + "where timeSlotID = ?";
    private static final String READ_ALL_TIMESLOT
            = "select timeSlotID, timeSlot, day_ "
            + "from TimeSlot ";
    private static final String READ_TIMESLOT_BY_WEEKDAY
            = "SELECT timeSlotID, timeSlot, day_ "
            + "FROM TimeSlot "
            + "WHERE day_=?";

    public TimeslotDAOImpl() {
    }

    @Override
    public TimeslotDTO readTimeSlot(String timeslotID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TimeslotDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new TimeslotDTOImpl();
                result.setTimeSlotID(timeslotID);
                result.setDay_(rs.getString("day_"));
                result.setTimeSlot(rs.getTime("timeSlot"));
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

        return result;
    }

    @Override
    public List<TimeslotDTO> readAllTimeSlot() throws NoSuchRecordExists, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<TimeslotDTO> timeSlotList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_TIMESLOT);

            while (rs.next()) {
                TimeslotDTO result = new TimeslotDTOImpl();
                result.setTimeSlotID(rs.getString("timeSlotID"));
                result.setDay_(rs.getString("day_"));
                result.setTimeSlot(rs.getTime("timeSlot"));

                if (timeSlotList == null) {
                    timeSlotList = new ArrayList<>();
                }
                timeSlotList.add(result);
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
        Collections.sort(timeSlotList);
        return timeSlotList;
    }

    @Override
    public List<TimeslotDTO> readListOfTimeslot(List<String> timeslotIDs) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<TimeslotDTO> timeSlotList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_TIMESLOT);

            for (String timeslotID : timeslotIDs) {
                stm.setString(1, timeslotID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    TimeslotDTO result = new TimeslotDTOImpl();
                    result.setTimeSlotID(rs.getString("timeSlotID"));
                    result.setDay_(rs.getString("day_"));
                    result.setTimeSlot(rs.getTime("timeSlot"));

                    if (timeSlotList == null) {
                        timeSlotList = new ArrayList<>();
                    }
                    timeSlotList.add(result);
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

        if (timeSlotList != null) {
            Collections.sort(timeSlotList);
        }
        return timeSlotList;
    }

    @Override
    public List<String> readWeekdays() throws NoSuchRecordExists, SQLException {
        return Arrays.asList("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    }

    @Override
    public List<List<TimeslotDTO>> readTimeslotsGrouped() throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<List<TimeslotDTO>> timeslots = null;

        try {
            List<String> weekdays = readWeekdays();
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_TIMESLOT_BY_WEEKDAY);

            for (String weekday : weekdays) {
                stm.setString(1, weekday);
                rs = stm.executeQuery();
                List<TimeslotDTO> timeSlotList = null;

                while (rs.next()) {
                    TimeslotDTO result = new TimeslotDTOImpl();
                    result.setTimeSlotID(rs.getString("timeSlotID"));
                    result.setDay_(rs.getString("day_"));
                    result.setTimeSlot(rs.getTime("timeSlot"));

                    if (timeSlotList == null) {
                        timeSlotList = new ArrayList<>();
                    }
                    timeSlotList.add(result);
                }
                if (timeSlotList != null && !timeSlotList.isEmpty()) {
                    Collections.sort(timeSlotList);
                    if (timeslots == null) {
                        timeslots = new ArrayList<>();
                    }
                    timeslots.add(timeSlotList);
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

        return timeslots;
    }
}

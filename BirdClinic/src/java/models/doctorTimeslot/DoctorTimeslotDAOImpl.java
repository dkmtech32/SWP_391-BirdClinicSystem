/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.doctorTimeslot;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.timeslot.TimeslotDAO;
import models.users.doctor.DoctorDAO;
import utils.DBUtils;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class DoctorTimeslotDAOImpl implements DoctorTimeslotDAO {

    private final TimeslotDAO timeslotDAO;
    private final DoctorDAO doctorDAO;
    private static final String READ_DOCTIME_BY_DOCTOR
            = "select doctorID, timeSlotID "
            + "from DoctorTimeSlot "
            + "where doctorID = ?";
    private static final String READ_DOCTIME_BY_TIMESLOT
            = "select doctorID, timeSlotID "
            + "from DoctorTimeSlot "
            + "where timeSlotID = ?";
    private static final String INSERT_DOCTIME
            = "insert into DoctorTimeSlot(doctorID, timeSlotID) "
            + "values (?, ?)";
    private static final String DELETE_DOCTIME
            = "delete from DoctorTimeSlot "
            + "where doctorID = ? and timeSlotID = ?";

    public DoctorTimeslotDAOImpl(TimeslotDAO timeslotDAO, DoctorDAO doctorDAO) {
        this.timeslotDAO = timeslotDAO;
        this.doctorDAO = doctorDAO;
    }

    @Override
    public List<TimeslotDTO> readDoctorTimeslotByDoctor(String doctorID)
            throws SQLException, NoSuchRecordExists {
        List<TimeslotDTO> timeslots = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTIME_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();
            List<String> timeslotIDs = new ArrayList<>();

            while (rs.next()) {
                timeslotIDs.add(rs.getString("timeSlotID"));
            }

            if (!timeslotIDs.isEmpty()) {
                timeslots = timeslotDAO.readListOfTimeslot(timeslotIDs);
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

    @Override
    public List<DoctorDTO> readDoctorTimeslotByTimeslot(String timeslotID)
            throws SQLException, NoSuchRecordExists {
        List<DoctorDTO> doctors = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTIME_BY_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();
            List<String> doctorIDs = new ArrayList<>();

            while (rs.next()) {
                doctorIDs.add(rs.getString("doctorID"));
            }

            if (!doctorIDs.isEmpty()) {
                doctors = doctorDAO.readListOfDoctors(doctorIDs);
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

        return doctors;
    }

    @Override
    public int deleteDoctorTimeslot(String doctorID, String timeSlotID)
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_DOCTIME);
            stm.setString(1, doctorID);
            stm.setString(2, timeSlotID);

            result = stm.executeUpdate();

            if (result == 0) {
                throw new DoctorNotInTimeslotException();
            }
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
    public int insertDoctorTimeslot(String doctorID, String timeSlotID)
            throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_DOCTIME);
            stm.setString(1, doctorID);
            stm.setString(2, timeSlotID);

            result = stm.executeUpdate();
            if (result == 0) {
                throw new DoctorAlreadyInTimeslotException();
            }
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
    public Map<String, List<TimeslotDTO>> readDoctorTimeslotByDoctorGrouped(String doctorID)
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Map<String, List<TimeslotDTO>> timeslotsByWeekday = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTIME_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();
            List<String> timeslotIDs = new ArrayList<>();

            while (rs.next()) {
                timeslotIDs.add(rs.getString("timeSlotID"));
            }

            if (!timeslotIDs.isEmpty()) { //
                List<TimeslotDTO> timeslots = timeslotDAO.readListOfTimeslot(timeslotIDs);
                timeslotsByWeekday = new HashMap<>();

                List<String> weekdays = timeslotDAO.readWeekdays();
                for (String weekday : weekdays) { //is actually const, so still O(n)
                    timeslotsByWeekday.put(weekday, new ArrayList<>());
                }

                for (TimeslotDTO timeslot : timeslots) {
                    timeslotsByWeekday.get(timeslot.getDay_()).add(timeslot);
                }
            } else {
                throw new DoctorNotInTimeslotException();
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

        return timeslotsByWeekday;
    }
}

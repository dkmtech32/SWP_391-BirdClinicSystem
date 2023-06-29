/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.doctorTimeslot;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import models.dao.timeslot.TimeslotDAO;
import models.dao.users.doctor.DoctorDAO;
import utils.DBUtils;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class DoctorTimeslotDAOImpl implements DoctorTimeslotDAO {

    private final TimeslotDAO timeslotDAO;
    private final DoctorDAO doctorDAO;
    private static final String READ_DOCTIME_BY_DOCTOR = "select doctorID, timeSlotID "
            + "from DoctorTimeSlot "
            + "where doctorID = ?";
    private static final String READ_DOCTIME_BY_TIMESLOT = "select doctorID, timeSlotID "
            + "from DoctorTimeSlot "
            + "where timeSlotID = ?";
    private static final String INSERT_DOCTIME = "insert into DoctorTimeSlot(doctorID, timeSlotID) "
            + "values (?, ?)";
    private static final String DELETE_DOCTIME = "delete from DoctorTimeSlot "
            + "where doctorID = ? and timeSlotID = ?";

    public DoctorTimeslotDAOImpl(TimeslotDAO timeslotDAO, DoctorDAO doctorDAO) {
        this.timeslotDAO = timeslotDAO;
        this.doctorDAO = doctorDAO;
    }

    @Override
    public List<TimeslotDTO> readDoctorTimeslotByDoctor(String doctorID) throws SQLException {
        List<TimeslotDTO> timeslots = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTIME_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            while (rs.next()) {
                TimeslotDTO timeslot = timeslotDAO.readTimeSlot(rs.getString("timeSlotID"), con);
                if (timeslots == null) {
                    timeslots = new ArrayList();
                }
                timeslots.add(timeslot);
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

        return timeslots;
    }

    @Override
    public List<DoctorDTO> readDoctorTimeslotByTimeslot(String timeslotID) throws SQLException {
        List<DoctorDTO> doctors = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTIME_BY_TIMESLOT);
            stm.setString(1, timeslotID);
            rs = stm.executeQuery();

            while (rs.next()) {
                DoctorDTO doctor = doctorDAO.readDoctor(rs.getString("doctorID"), con);
                if (doctors == null) {
                    doctors = new ArrayList();
                }
                doctors.add(doctor);
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

        return doctors;
    }

    @Override
    public int deleteDoctorTimeslot(String doctorID, String timeSlotID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_DOCTIME);
            stm.setString(1, doctorID);
            stm.setString(2, timeSlotID);

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
    public int insertDoctorTimeslot(String doctorID, String timeSlotID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_DOCTIME);
            stm.setString(1, doctorID);
            stm.setString(2, timeSlotID);

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
    public Map<String, List<TimeslotDTO>> readDoctorTimeslotByDoctorGrouped(String doctorID) throws SQLException {
//        Map<String, List<>
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTIME_BY_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            while (rs.next()) {
                List<TimeslotDTO> timeslots = new ArrayList();
                TimeslotDTO timeslot = timeslotDAO.readTimeSlot(rs.getString("timeSlotID"), con);
                timeslots.add(timeslot);
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

        return null;
    }
}

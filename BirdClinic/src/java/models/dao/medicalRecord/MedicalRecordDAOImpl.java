/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.medicalRecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.dao.appointment.AppointmentDAO;
import models.dao.bird.BirdDAO;
import models.dao.users.doctor.DoctorDAO;
import models.dto.medicalRecord.MedicalRecordDTO;
import models.dto.medicalRecord.MedicalRecordDTOImpl;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MedicalRecordDAOImpl implements MedicalRecordDAO {

    private final BirdDAO birdDAO;
    private final AppointmentDAO appointmentDAO;
    private final DoctorDAO doctorDAO;

    private static final String READ_MEDICAL_RECORD
            = "SELECT medicalRecordID, appointmentID, birdID, doctorID, recordTime, diagnosis "
            + "FROM MedicalRecord "
            + "WHERE medicalRecordID = ?";
    private static final String READ_MEDICAL_RECORD_BY_BIRD
            = "SELECT medicalRecordID, appointmentID, birdID, doctorID, recordTime, diagnosis "
            + "FROM MedicalRecord "
            + "WHERE birdID = ?";
    private static final String READ_MEDICAL_RECORD_BY_APPOINTMENT
            = "SELECT medicalRecordID, appointmentID, birdID, doctorID, recordTime, diagnosis "
            + "FROM MedicalRecord "
            + "WHERE appointmentID = ?";
    private static final String READ_MEDICAL_RECORD_BY_DOCTOR
            = "SELECT medicalRecordID, appointmentID, birdID, doctorID, recordTime, diagnosis "
            + "FROM MedicalRecord "
            + "WHERE doctorID = ?";
    private static final String INSERT_MEDICAL_RECORD
            = "INSERT INTO MedicalRecord (medicalRecordID, appointmentID, birdID, doctorID, recordTime, diagnosis) "
            + "VALUES (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_MEDICAL_RECORD
            = "DELETE FROM MedicalRecord "
            + "WHERE medicalRecordID = ?";
    private static final String UPDATE_MEDICAL_RECORD 
            = "UPDATE MedicalRecord "
            + "SET appointmentID = ?, birdID = ?, doctorID = ?, recordTime = ?, diagnosis = ? "
            + "WHERE medicalRecordID = ?";

    public MedicalRecordDAOImpl(BirdDAO birdDAO, AppointmentDAO appointmentDAO, DoctorDAO doctorDAO) {
        this.birdDAO = birdDAO;
        this.appointmentDAO = appointmentDAO;
        this.doctorDAO = doctorDAO;
    }

    @Override
    public MedicalRecordDTO readMedicalRecord(String medicalRecordID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicalRecordDTO medicalRecord = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            if (rs.next()) {
                medicalRecord = mapAppointment(rs, con);
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

        return medicalRecord;
    }
    
    @Override
    public MedicalRecordDTO readMedicalRecord(String medicalRecordID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicalRecordDTO medicalRecord = null;

        try {
            stm = con.prepareStatement(READ_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            if (rs.next()) {
                medicalRecord = mapAppointment(rs, con);
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

        return medicalRecord;
    }
    
    @Override
    public MedicalRecordDTO readMedicalRecordByAppointment(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicalRecordDTO medicalRecord = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                medicalRecord = mapAppointment(rs, con);
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

        return medicalRecord;
    }
    
    @Override
    public MedicalRecordDTO readMedicalRecordByAppointment(String appointmentID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicalRecordDTO medicalRecord = null;

        try {
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                medicalRecord = mapAppointment(rs, con);
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

        return medicalRecord;
    }
    
    @Override
    public List<MedicalRecordDTO> readMedicalRecordByBird(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_BIRD);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();
            result = new ArrayList<>();

            if (rs.next()) {
                result.add(mapAppointment(rs, con));
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
    public List<MedicalRecordDTO> readMedicalRecordByBird(String appointmentID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_BIRD);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();
            result = new ArrayList<>();

            if (rs.next()) {
                result.add(mapAppointment(rs, con));
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
    public List<MedicalRecordDTO> readMedicalRecordByDoctor(String appointmentID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_DOCTOR);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();
            result = new ArrayList<>();

            if (rs.next()) {
                result.add(mapAppointment(rs, con));
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
    public List<MedicalRecordDTO> readMedicalRecordByDoctor(String appointmentID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_DOCTOR);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();
            result = new ArrayList<>();

            if (rs.next()) {
                result.add(mapAppointment(rs, con));
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
    public int insertMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_MEDICAL_RECORD);
            stm.setString(1, medicalRecord.getMedicalRecordID());
            stm.setString(2, medicalRecord.getAppointment().getAppointmentID());
            stm.setString(3, medicalRecord.getBird().getBirdID());
            stm.setString(4, medicalRecord.getDoctor().getUserID());
            stm.setTimestamp(5, medicalRecord.getRecordTime());
            stm.setString(6, medicalRecord.getDiagnosis());
            
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
    public int deleteMedicalRecord(String medicalRecordID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);
            
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
    public int updateMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_MEDICAL_RECORD);
            stm.setString(1, medicalRecord.getAppointment().getAppointmentID());
            stm.setString(2, medicalRecord.getBird().getBirdID());
            stm.setString(3, medicalRecord.getDoctor().getUserID());
            stm.setTimestamp(4, medicalRecord.getRecordTime());
            stm.setString(5, medicalRecord.getDiagnosis());
            stm.setString(6, medicalRecord.getMedicalRecordID());
            
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
    
    private MedicalRecordDTO mapAppointment(ResultSet rs, Connection conn) throws SQLException {
        MedicalRecordDTOImpl medicalRecord = new MedicalRecordDTOImpl();
        
        medicalRecord.setMedicalRecordID(rs.getString("medicalRecordID"));
        medicalRecord.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID"),conn));
        medicalRecord.setBird(birdDAO.readBird(rs.getString("birdID"),conn));
        medicalRecord.setDoctor(doctorDAO.readDoctor(rs.getString("doctorID"),conn));
        medicalRecord.setRecordTime(rs.getTimestamp("recordTime"));
        medicalRecord.setDiagnosis(rs.getString("diagnosis"));
    

    return medicalRecord;
}
    
}

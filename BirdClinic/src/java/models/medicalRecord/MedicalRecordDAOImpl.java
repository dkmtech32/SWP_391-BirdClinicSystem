/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicalRecord;

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

/**
 *
 * @author Admin
 */
public class MedicalRecordDAOImpl implements MedicalRecordDAO {

    private final AppointmentDAO appointmentDAO;

    private static final String READ_MEDICAL_RECORD
            = "SELECT medicalRecordID, appointmentID, recordTime, diagnosis, treatmentDays, doctorNotes "
            + "FROM MedicalRecord "
            + "WHERE medicalRecordID = ?";

    private static final String READ_MEDICAL_RECORD_BY_APPOINTMENT
            = "SELECT medicalRecordID, appointmentID, recordTime, diagnosis, treatmentDays, doctorNotes "
            + "FROM MedicalRecord "
            + "WHERE appointmentID = ?";

    private static final String INSERT_MEDICAL_RECORD
            = "INSERT INTO MedicalRecord (medicalRecordID, appointmentID, recordTime, diagnosis, treatmentDays, doctorNotes) "
            + "VALUES (?, ?, ?, ?, ?, ?)";

    private static final String DELETE_MEDICAL_RECORD
            = "DELETE FROM MedicalRecord "
            + "WHERE medicalRecordID = ?";

    private static final String UPDATE_MEDICAL_RECORD
            = "UPDATE MedicalRecord "
            + "SET appointmentID = ?, recordTime = ?, diagnosis = ?, treatmentDays = ?, doctorNotes = ? "
            + "WHERE medicalRecordID = ?";

    public MedicalRecordDAOImpl(AppointmentDAO appointmentDAO) {
        this.appointmentDAO = appointmentDAO;
    }

    @Override
    public MedicalRecordDTO readMedicalRecord(String medicalRecordID) throws SQLException, NoSuchRecordExists {
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
                {
                    medicalRecord = new MedicalRecordDTOImpl();

                    medicalRecord.setMedicalRecordID(medicalRecordID);
                    medicalRecord.setAppointment(appointmentDAO.readAppointment(rs.getString("appointmentID")));
                    medicalRecord.setRecordTime(rs.getTimestamp("recordTime"));
                    medicalRecord.setDiagnosis(rs.getString("diagnosis"));
                    medicalRecord.setDoctorNotes(rs.getString("doctorNotes"));
                    medicalRecord.setTreatmentDays(rs.getInt("treatmentDays"));
                }
            }

            if (medicalRecord == null) {
                throw new NoSuchMedicalRecordExistsException();
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

        return medicalRecord;
    }

    @Override
    public MedicalRecordDTO readMedicalRecordByAppointment(String appointmentID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicalRecordDTO medicalRecord = null;

        try {
            AppointmentDTO appointment = appointmentDAO.readAppointment(appointmentID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_APPOINTMENT);
            stm.setString(1, appointmentID);
            rs = stm.executeQuery();

            if (rs.next()) {
                medicalRecord = new MedicalRecordDTOImpl();

                medicalRecord.setMedicalRecordID(rs.getString("medicalRecordID"));
                medicalRecord.setAppointment(appointment);
                medicalRecord.setRecordTime(rs.getTimestamp("recordTime"));
                medicalRecord.setDiagnosis(rs.getString("diagnosis"));
                medicalRecord.setDoctorNotes(rs.getString("doctorNotes"));
                medicalRecord.setTreatmentDays(rs.getInt("treatmentDays"));
            }

            if (medicalRecord == null) {
                throw new NoSuchMedicalRecordExistsException();
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

        return medicalRecord;
    }

    @Override
    public List<MedicalRecordDTO> readMedicalRecordByBird(String birdID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByBird(birdID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD);

            for (AppointmentDTO appointment : appointments) {
                stm.setString(1, appointment.getAppointmentID());
                rs = stm.executeQuery();

                if (rs.next()) {
                    MedicalRecordDTO medicalRecord = new MedicalRecordDTOImpl();

                    medicalRecord.setMedicalRecordID(rs.getString("medicalRecordID"));
                    medicalRecord.setAppointment(appointment);
                    medicalRecord.setRecordTime(rs.getTimestamp("recordTime"));
                    medicalRecord.setDiagnosis(rs.getString("diagnosis"));
                    medicalRecord.setDoctorNotes(rs.getString("doctorNotes"));
                    medicalRecord.setTreatmentDays(rs.getInt("treatmentDays"));
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(medicalRecord);
                }
            }

            if (result == null || result.isEmpty()) {
                throw new NoSuchMedicalRecordExistsException();
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
    public List<MedicalRecordDTO> readMedicalRecordByDoctor(String doctorID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            List<AppointmentDTO> appointments = appointmentDAO.readAppointmentByDoctor(doctorID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD);

            for (AppointmentDTO appointment : appointments) {
                stm.setString(1, appointment.getAppointmentID());
                rs = stm.executeQuery();

                if (rs.next()) {
                    MedicalRecordDTO medicalRecord = new MedicalRecordDTOImpl();

                    medicalRecord.setMedicalRecordID(rs.getString("medicalRecordID"));
                    medicalRecord.setAppointment(appointment);
                    medicalRecord.setRecordTime(rs.getTimestamp("recordTime"));
                    medicalRecord.setDiagnosis(rs.getString("diagnosis"));
                    medicalRecord.setDoctorNotes(rs.getString("doctorNotes"));
                    medicalRecord.setTreatmentDays(rs.getInt("treatmentDays"));
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(medicalRecord);
                }
            }

            if (result == null || result.isEmpty()) {
                throw new NoSuchMedicalRecordExistsException();
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
    public int insertMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_MEDICAL_RECORD);
            stm.setString(1, medicalRecord.getMedicalRecordID());
            stm.setString(2, medicalRecord.getAppointment().getAppointmentID());
            stm.setTimestamp(3, medicalRecord.getRecordTime());
            stm.setString(4, medicalRecord.getDiagnosis());
            stm.setInt(5, medicalRecord.getTreatmentDays());
            stm.setString(6, medicalRecord.getDoctorNotes());

            result = stm.executeUpdate();

            if (result == 0) {
                throw new MedicalRecordAlreadyExistsException();
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
    public int deleteMedicalRecord(String medicalRecordID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);

            result = stm.executeUpdate();

            if (result == 0) {
                throw new NoSuchMedicalRecordExistsException();
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
    public int updateMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_MEDICAL_RECORD);
            stm.setString(1, medicalRecord.getAppointment().getAppointmentID());
            stm.setTimestamp(2, medicalRecord.getRecordTime());
            stm.setString(3, medicalRecord.getDiagnosis());
            stm.setInt(4, medicalRecord.getTreatmentDays());
            stm.setString(5, medicalRecord.getDoctorNotes());
            stm.setString(6, medicalRecord.getMedicalRecordID());

            result = stm.executeUpdate();

            if (result == 0) {
                throw new NoSuchMedicalRecordExistsException();
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
}

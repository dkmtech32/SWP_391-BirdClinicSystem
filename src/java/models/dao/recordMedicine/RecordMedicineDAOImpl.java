/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.recordMedicine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.dao.medicalRecord.MedicalRecordDAO;
import models.dao.medicine.MedicineDAO;
import models.dto.recordMedicine.RecordMedicineDTO;
import models.dto.recordMedicine.RecordMedicineDTOImpl;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class RecordMedicineDAOImpl implements RecordMedicineDAO {

    private final MedicalRecordDAO medRecDAO;
    private final MedicineDAO medDAO;

    public RecordMedicineDAOImpl(MedicalRecordDAO medRecDAO, MedicineDAO medDAO) {
        this.medRecDAO = medRecDAO;
        this.medDAO = medDAO;
    }

    private static final String READ_MEDICINE_BY_MEDICAL_RECORD
            = "SELECT medicalRecordID, medicineID, quantity, descriptions "
            + "FROM RecordMedicine "
            + "WHERE medicalRecordID=?";
    private static final String READ_MEDICAL_RECORD_BY_MEDICINE
            = "SELECT medicalRecordID, medicineID, quantity, descriptions "
            + "FROM RecordMedicine "
            + "WHERE medicineID=?";
    private static final String INSERT_RECORD_MEDICINE
            = "INSERT INTO RecordMedicine (medicalRecordID, medicineID, quantity, descriptions) "
            + "VALUES (?, ?, ?, ?)";
    private static final String DELETE_RECORD_MEDICINE
            = "DELETE FROM RecordMedicine "
            + "WHERE medicalRecordID=? and medicineID=?";
    private static final String UPDATE_RECORD_MEDICINE
            = "UPDATE RecordMedicine "
            + "SET quantity=?, descriptions=? "
            + "WHERE medicalRecordID=? and medicineID=?";

    @Override
    public List<RecordMedicineDTO> readMedicineFromRecord(String medicalRecordID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<RecordMedicineDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICINE_BY_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }
                RecordMedicineDTO recMed = mapRecordMedicine(rs, con);
                result.add(recMed);
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
    public List<RecordMedicineDTO> readMedicineFromRecord(String medicalRecordID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<RecordMedicineDTO> result = null;

        try {
            stm = con.prepareStatement(READ_MEDICINE_BY_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }
                RecordMedicineDTO recMed = mapRecordMedicine(rs, con);
                result.add(recMed);
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
    public List<RecordMedicineDTO> readRecordFromMedicine(String medicineID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<RecordMedicineDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_MEDICINE);
            stm.setString(1, medicineID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }
                RecordMedicineDTO recMed = mapRecordMedicine(rs, con);
                result.add(recMed);
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
    public List<RecordMedicineDTO> readRecordFromMedicine(String medicineID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<RecordMedicineDTO> result = null;

        try {
            stm = con.prepareStatement(READ_MEDICAL_RECORD_BY_MEDICINE);
            stm.setString(1, medicineID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }
                RecordMedicineDTO recMed = mapRecordMedicine(rs, con);
                result.add(recMed);
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
    public int deleteRecordMedicine(String medicineID, String medRecID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_RECORD_MEDICINE);
            stm.setString(1, medRecID);
            stm.setString(2, medicineID);
            
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
    public int insertRecordMedicine(RecordMedicineDTO recMed) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_RECORD_MEDICINE);
            stm.setString(1, recMed.getMedicalRecord().getMedicalRecordID());
            stm.setString(2, recMed.getMedicine().getMedicineID());
            stm.setInt(3, recMed.getQuantity());
            stm.setString(4, recMed.getDescriptions());
            
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
    public int updateRecordMedicine(RecordMedicineDTO recMed) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_RECORD_MEDICINE);
            stm.setInt(1, recMed.getQuantity());
            stm.setString(2, recMed.getDescriptions());
            stm.setString(3, recMed.getMedicalRecord().getMedicalRecordID());
            stm.setString(4, recMed.getMedicine().getMedicineID());
            
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

    private RecordMedicineDTOImpl mapRecordMedicine(ResultSet resultSet, Connection connection) throws SQLException {
        RecordMedicineDTOImpl recordMedicine = new RecordMedicineDTOImpl();

        String medicalRecordId = resultSet.getString("medicalRecordID");
        recordMedicine.setMedicalRecord(medRecDAO.readMedicalRecord(medicalRecordId, connection));

        String medicineId = resultSet.getString("medicineID");
        recordMedicine.setMedicine(medDAO.readMedicine(medicineId, connection));

        int quantity = resultSet.getInt("quantity");
        recordMedicine.setQuantity(quantity);

        String descriptions = resultSet.getString("descriptions");
        recordMedicine.setDescriptions(descriptions);

        return recordMedicine;
    }

}

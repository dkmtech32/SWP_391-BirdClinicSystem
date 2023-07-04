/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordMedicine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.medicalRecord.MedicalRecordDAO;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDAO;
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
            = "SELECT medicalRecordID, medicineID, quantity, description "
            + "FROM RecordMedicine "
            + "WHERE medicalRecordID=?";
    private static final String INSERT_RECORD_MEDICINE
            = "INSERT INTO RecordMedicine (medicalRecordID, medicineID, quantity, description) "
            + "VALUES (?, ?, ?, ?)";
    private static final String DELETE_RECORD_MEDICINE
            = "DELETE FROM RecordMedicine "
            + "WHERE medicalRecordID=? and medicineID=?";
    private static final String UPDATE_RECORD_MEDICINE
            = "UPDATE RecordMedicine "
            + "SET quantity=?, description=? "
            + "WHERE medicalRecordID=? and medicineID=?";

    @Override
    public List<RecordMedicineDTO> readMedicineFromRecord(String medicalRecordID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<RecordMedicineDTO> result = null;

        try {
            MedicalRecordDTO medRec = medRecDAO.readMedicalRecord(medicalRecordID);
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICINE_BY_MEDICAL_RECORD);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }
                RecordMedicineDTO recMed = new RecordMedicineDTOImpl();
                recMed.setMedicalRecord(medRec);
                recMed.setMedicine(medDAO.readMedicine(rs.getString("medicineID")));
                recMed.setDescription_(rs.getString("description"));
                recMed.setQuantity(rs.getInt("quantity"));
                
                result.add(recMed);
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
    public int deleteRecordMedicine(String medicineID, String medRecID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_RECORD_MEDICINE);
            stm.setString(1, medRecID);
            stm.setString(2, medicineID);

            result = stm.executeUpdate();
            
            if (result == 0) throw new NoSuchRecordMedicineException();
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
    public int insertRecordMedicine(RecordMedicineDTO recMed) throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_RECORD_MEDICINE);
            stm.setString(1, recMed.getMedicalRecord().getMedicalRecordID());
            stm.setString(2, recMed.getMedicine().getMedicineID());
            stm.setInt(3, recMed.getQuantity());
            stm.setString(4, recMed.getDescription_());

            result = stm.executeUpdate();
            
            if (result == 0) throw new RecordMedicineAlreadyExistsException();
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
    public int updateRecordMedicine(RecordMedicineDTO recMed) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_RECORD_MEDICINE);
            stm.setInt(1, recMed.getQuantity());
            stm.setString(2, recMed.getDescription_());
            stm.setString(3, recMed.getMedicalRecord().getMedicalRecordID());
            stm.setString(4, recMed.getMedicine().getMedicineID());

            result = stm.executeUpdate();
            
            if (result == 0) throw new NoSuchRecordMedicineException();
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

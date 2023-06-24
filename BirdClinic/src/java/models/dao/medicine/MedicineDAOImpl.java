/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.medicine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.dto.medicine.MedicineDTO;
import models.dto.medicine.MedicineDTOImpl;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MedicineDAOImpl implements MedicineDAO{
    private static final String READ_MEDICINE = "select medicineID, medicineName, medicinePrice "
            + "from Medicine "
            + "where medicineID = ?";
    private static final String READ_ALL_MEDICINE = "select medicineID, medicineName, medicinePrice "
            + "from Medicine ";
    private static final String SEARCH_MEDICINE = "select medicineID, medicineName, medicinePrice "
            + "from Medicine "
            + "where medicineName like ?";

    public MedicineDAOImpl() {
    }


    @Override
    public MedicineDTO readMedicine(String medicineID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicineDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICINE);
            stm.setString(1, medicineID);
            rs = stm.executeQuery();

            if (rs != null) {
                result = new MedicineDTOImpl();
                result.setMedicineID(medicineID);
                result.setMedicineName(rs.getString("medicineName"));
                result.setMedicinePrice(rs.getInt("medicinePrice"));
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
    public MedicineDTO readMedicine(String medicineID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicineDTO result = null;

        try {
            stm = con.prepareStatement(READ_MEDICINE);
            stm.setString(1, medicineID);
            rs = stm.executeQuery();

            if (rs != null) {
                result = new MedicineDTOImpl();
                result.setMedicineID(medicineID);
                result.setMedicineName(rs.getString("medicineName"));
                result.setMedicinePrice(rs.getInt("medicinePrice"));
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
    public List<MedicineDTO> searchMedicine(String medicineName) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicineDTO> medicineList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(SEARCH_MEDICINE);
            stm.setString(1, "%" + medicineName + "%");
            rs = stm.executeQuery();

            while (rs != null) {
                MedicineDTO result = new MedicineDTOImpl();
                result.setMedicineID(rs.getString("medicineID"));
                result.setMedicineName(rs.getString("medicineName"));
                result.setMedicinePrice(rs.getInt("medicinePrice"));
                if (medicineList==null) 
                    medicineList = new ArrayList();
                medicineList.add(result);
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
        
        return medicineList;
    }

    @Override
    public List<MedicineDTO> readAllMedicines() throws SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<MedicineDTO> medicineList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_MEDICINE);

            while (rs != null) {
                MedicineDTO result = new MedicineDTOImpl();
                result.setMedicineID(rs.getString("medicineID"));
                result.setMedicineName(rs.getString("medicineName"));
                result.setMedicinePrice(rs.getInt("medicinePrice"));
            
                if (medicineList==null) 
                    medicineList = new ArrayList();
                medicineList.add(result);
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
        
        return medicineList;
    }
}

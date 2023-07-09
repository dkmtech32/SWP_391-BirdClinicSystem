/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MedicineDAOImpl implements MedicineDAO {

    private static final String READ_MEDICINE
            = "select medicineID, medicineName, medicinePrice, unit "
            + "from Medicine "
            + "where medicineID = ?";
    private static final String READ_ALL_MEDICINE
            = "select medicineID, medicineName, medicinePrice, unit "
            + "from Medicine ";
    private static final String SEARCH_MEDICINE
            = "select medicineID, medicineName, medicinePrice, unit "
            + "from Medicine "
            + "where medicineName like ?";
    private static final String UPDATE_MEDICINE
            = "UPDATE Medicine "
            + "SET medicineName = ?, medicinePrice = ?, unit = ? "
            + "WHERE medicineID = ?";

    public MedicineDAOImpl() {
    }

    @Override
    public MedicineDTO readMedicine(String medicineID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        MedicineDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICINE);
            stm.setString(1, medicineID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new MedicineDTOImpl();
                result.setMedicineID(medicineID);
                result.setMedicineName(rs.getString("medicineName"));
                result.setMedicinePrice(rs.getBigDecimal("medicinePrice"));
                result.setUnit(rs.getString("unit"));
            }

            if (result == null) {
                throw new NoSuchMedicineExistsException();
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
    public List<MedicineDTO> searchMedicine(String medicineName) throws NoSuchRecordExists, SQLException {
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
                result.setMedicinePrice(rs.getBigDecimal("medicinePrice"));
                result.setUnit(rs.getString("unit"));
                if (medicineList == null) {
                    medicineList = new ArrayList();
                }
                medicineList.add(result);
            }

            if (medicineList == null || medicineList.isEmpty()) {
                throw new NoSuchMedicineExistsException();
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

        return medicineList;
    }

    @Override
    public List<MedicineDTO> readAllMedicines() throws NoSuchRecordExists, SQLException {
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
                result.setMedicinePrice(rs.getBigDecimal("medicinePrice"));
                result.setUnit(rs.getString("unit"));

                if (medicineList == null) {
                    medicineList = new ArrayList();
                }
                medicineList.add(result);
            }
            if (medicineList == null || medicineList.isEmpty()) {
                throw new NoSuchMedicineExistsException();
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

        return medicineList;
    }

    @Override
    public List<MedicineDTO> readListOfMedicine(List<String> medicineIDs)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicineDTO> medicineList = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_MEDICINE);

            for (String medicineID : medicineIDs) {
                stm.setString(1, medicineID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    MedicineDTO medicine = new MedicineDTOImpl();
                    medicine.setMedicineID(rs.getString("medicineID"));
                    medicine.setMedicineName(rs.getString("medicineName"));
                    medicine.setMedicinePrice(rs.getBigDecimal("medicinePrice"));
                    medicine.setUnit(rs.getString("unit"));
                    medicineList.add(medicine);
                }

                rs.close();
            }

            if (medicineList.isEmpty()) {
                throw new NoSuchMedicineExistsException();
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

        return medicineList;
    }

    @Override
    public int updateMedicine(MedicineDTO medicineDTO) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsAffected = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_MEDICINE);
            stm.setString(1, medicineDTO.getMedicineName());
            stm.setBigDecimal(2, medicineDTO.getMedicinePrice());
            stm.setString(3, medicineDTO.getUnit());
            stm.setString(4, medicineDTO.getMedicineID());

            rowsAffected = stm.executeUpdate();

            if (rowsAffected == 0) {
                throw new NoSuchMedicineExistsException();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return rowsAffected;
    }
}

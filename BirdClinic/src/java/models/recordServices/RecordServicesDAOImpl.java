/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordServices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.medicalRecord.MedicalRecordDAO;
import models.service_.Service_DAO;
import models.medicalRecord.MedicalRecordDTO;
import models.service_.Service_DTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class RecordServicesDAOImpl implements RecordServicesDAO {

    private final MedicalRecordDAO medRecDAO;
    private final Service_DAO serviceDAO;

    private static final String READ_SERVICES
            = "select serviceID "
            + "from RecordServices "
            + "where medicalRecordID = ?";
    private static final String READ_RECORDS
            = "select medicalRecordID, serviceID "
            + "from RecordServices "
            + "where serviceID = ?";
    private static final String INSERT_RECORD_SERVICES
            = "INSERT INTO RecordServices (medicalRecordID, serviceID) "
            + "VALUES (?, ?)";
    private static final String DELETE_RECORD_SERVICES
            = "DELETE FROM RecordServices "
            + "WHERE medicalRecordID = ? and serviceID=?";

    public RecordServicesDAOImpl(MedicalRecordDAO medRecDAO, Service_DAO serviceDAO) {
        this.medRecDAO = medRecDAO;
        this.serviceDAO = serviceDAO;
    }

    @Override
    public List<Service_DTO> readService_(String medicalRecordID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Service_DTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_SERVICES);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }

                result.add(serviceDAO.readService_(rs.getString("serviceID")));
            }
            
            if (result == null || result.isEmpty()) throw new NoSuchRecordServicesException();
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
    public int insertRecordServices(MedicalRecordDTO medRec, Service_DTO service) throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_RECORD_SERVICES);
            stm.setString(1, medRec.getMedicalRecordID());
            stm.setString(2, service.getServiceID());

            result = stm.executeUpdate();
            
            if (result == 0) throw new RecordServicesAlreadyExistsException();
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
    public int deleteRecordServices(String medicalRecordID, String serviceID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_RECORD_SERVICES);
            stm.setString(1, medicalRecordID);
            stm.setString(2, serviceID);

            result = stm.executeUpdate();
            
            if (result == 0) throw new NoSuchRecordServicesException();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            throw ex;
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
    public List<MedicalRecordDTO> readRecord(String serviceID) throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_RECORDS);
            stm.setString(1, serviceID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }

                result.add(medRecDAO.readMedicalRecord(rs.getString("medicalRecordID")));
            }
            
            if (result == null || result.isEmpty()) throw new NoSuchRecordServicesException();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            throw ex;
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
}

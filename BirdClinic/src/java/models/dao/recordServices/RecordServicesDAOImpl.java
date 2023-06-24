/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.recordServices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.dao.medicalRecord.MedicalRecordDAO;
import models.dao.service_.Service_DAO;
import models.dto.medicalRecord.MedicalRecordDTO;
import models.dto.service_.Service_DTO;
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
    private static final String DELETE_RECORD
            = "DELETE FROM RecordServices "
            + "WHERE medicalRecordID = ?";
    private static final String DELETE_SERVICE
            = "DELETE FROM RecordServices "
            + "WHERE serviceID = ?";

    public RecordServicesDAOImpl(MedicalRecordDAO medRecDAO, Service_DAO serviceDAO) {
        this.medRecDAO = medRecDAO;
        this.serviceDAO = serviceDAO;
    }

    @Override
    public List<Service_DTO> readServicesUsed(String medicalRecordID) throws SQLException {
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
    public List<Service_DTO> readServicesUsed(String medicalRecordID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Service_DTO> result = null;

        try {
            stm = con.prepareStatement(READ_SERVICES);
            stm.setString(1, medicalRecordID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }

                result.add(serviceDAO.readService_(rs.getString("serviceID")));
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
    public List<MedicalRecordDTO> readRecordByUsage(String serviceID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<MedicalRecordDTO> result = null;

        try {
            stm = con.prepareStatement(READ_RECORDS);
            stm.setString(1, serviceID);
            rs = stm.executeQuery();

            while (rs.next()) {
                if (result == null) {
                    result = new ArrayList<>();
                }

                result.add(medRecDAO.readMedicalRecord(rs.getString("medicalRecord")));
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
    public List<MedicalRecordDTO> readRecordByUsage(String serviceID) throws SQLException {
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

                result.add(medRecDAO.readMedicalRecord(rs.getString("medicalRecord")));
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
    public int insertRecordService_(MedicalRecordDTO medRec, Service_DTO service) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_RECORD_SERVICES);
            stm.setString(1, medRec.getMedicalRecordID());
            stm.setString(2, service.getServiceID());
            
            result = stm.executeUpdate();
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
    public int deleteRecord(MedicalRecordDTO medRec) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_RECORD);
            stm.setString(1, medRec.getMedicalRecordID());
            
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
    public int deleteService(Service_DTO service) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_SERVICE);
            stm.setString(1, service.getServiceID());
            
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
}

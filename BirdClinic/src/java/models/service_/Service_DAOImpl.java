/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.service_;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.speciality.SpecialityDAO;
import models.speciality.SpecialityDTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class Service_DAOImpl implements Service_DAO {

    private static final String READ_SERVICE
            = "select serviceID, specialityID, serviceName, servicePrice "
            + "from Service_ "
            + "where serviceID = ?";
    private static final String READ_SERVICE_BY_SPECIALITY
            = "select serviceID, specialityID, serviceName, servicePrice "
            + "from Service_ "
            + "where specialityID = ?";
    private static final String READ_ALL_SERVICE
            = "select serviceID, specialityID, serviceName, servicePrice "
            + "from Service_ ";
    private static final String SEARCH_SERVICE
            = "select serviceID, specialityID, serviceName, servicePrice "
            + "from Service_ "
            + "where serviceName like ?";
    private static final String UPDATE_SERVICE = "UPDATE Service_ "
            + "SET specialityID = ?, "
            + "serviceName = ?, "
            + "servicePrice = ? "
            + "WHERE serviceID = ?";
    private final SpecialityDAO specialityDAO;

    public Service_DAOImpl(SpecialityDAO specialityDAO) {
        this.specialityDAO = specialityDAO;
    }

    @Override
    public Service_DTO readService_(String serviceID)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Service_DTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_SERVICE);
            stm.setString(1, serviceID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new Service_DTOImpl();
                result.setServiceID(serviceID);
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("specialityID")));
                result.setServiceName(rs.getString("serviceName"));
                result.setServicePrice(rs.getInt("servicePrice"));
            }

            if (result == null) {
                throw new NoSuchService_ExistsException();
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
    public List<Service_DTO> searchService_(String serviceName)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Service_DTO> serviceList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(SEARCH_SERVICE);
            stm.setString(1, "%" + serviceName + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                Service_DTO result = new Service_DTOImpl();
                result.setServiceID(rs.getString("serviceID"));
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("specialityID")));
                result.setServiceName(rs.getString("serviceName"));
                result.setServicePrice(rs.getInt("servicePrice"));
                if (serviceList == null) {
                    serviceList = new ArrayList();
                }
                serviceList.add(result);
            }

            if (serviceList == null || serviceList.isEmpty()) {
                throw new NoSuchService_ExistsException();
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

        return serviceList;
    }

    @Override
    public List<Service_DTO> readAllService_()
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<Service_DTO> serviceList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_SERVICE);

            while (rs.next()) {
                Service_DTO result = new Service_DTOImpl();
                result.setServiceID(rs.getString("serviceID"));
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("specialityID")));
                result.setServiceName(rs.getString("serviceName"));
                result.setServicePrice(rs.getInt("servicePrice"));

                if (serviceList == null) {
                    serviceList = new ArrayList();
                }
                serviceList.add(result);
            }

            if (serviceList == null || serviceList.isEmpty()) {
                throw new NoSuchService_ExistsException();
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

        return serviceList;
    }

    @Override
    public List<Service_DTO> readServiceBySpeciality(String specialityID)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Service_DTO> serviceList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_SERVICE_BY_SPECIALITY);
            stm.setString(1, specialityID);
            SpecialityDTO spec = specialityDAO.readSpeciality(specialityID);
            rs = stm.executeQuery();

            while (rs.next()) {
                Service_DTO result = new Service_DTOImpl();
                result.setServiceID(rs.getString("serviceID"));
                result.setSpeciality(spec);
                result.setServiceName(rs.getString("serviceName"));
                result.setServicePrice(rs.getInt("servicePrice"));
                if (serviceList == null) {
                    serviceList = new ArrayList();
                }
                serviceList.add(result);
            }

            if (serviceList == null || serviceList.isEmpty()) {
                throw new NoSuchService_ExistsException();
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

        return serviceList;
    }

    @Override
    public int updateService(Service_DTO serviceDTO) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsAffected = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_SERVICE);
            stm.setString(1, serviceDTO.getSpeciality().getSpecialityID());
            stm.setString(2, serviceDTO.getServiceName());
            stm.setInt(3, serviceDTO.getServicePrice());
            stm.setString(4, serviceDTO.getServiceID());

            rowsAffected = stm.executeUpdate();

            if (rowsAffected == 0) {
                throw new NoSuchService_ExistsException();
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

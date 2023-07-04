/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.speciality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class SpecialityDAOImpl implements SpecialityDAO {

    private static final String READ_SPECIALITY
            = "select specialityID, specialityName "
            + "from Speciality "
            + "where specialityID = ?";
    private static final String READ_ALL_SPECIALITY
            = "select specialityID, specialityName "
            + "from Speciality ";

    public SpecialityDAOImpl() {
    }

    @Override
    public SpecialityDTO readSpeciality(String specialityID) throws NoSuchSpecialityExistsException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        SpecialityDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_SPECIALITY);
            stm.setString(1, specialityID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new SpecialityDTOImpl();
                result.setSpecialityID(specialityID);
                result.setSpecialityName(rs.getString("specialityName"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            throw new NoSuchSpecialityExistsException(ex.getMessage());
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
    public List<SpecialityDTO> readAllSpecialities() throws NoSuchSpecialityExistsException, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<SpecialityDTO> specialityList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_SPECIALITY);

            while (rs != null) {
                SpecialityDTO result = new SpecialityDTOImpl();
                result.setSpecialityID(rs.getString("specialityID"));
                result.setSpecialityName(rs.getString("specialityName"));

                if (specialityList == null) {
                    specialityList = new ArrayList();
                }
                specialityList.add(result);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            throw new NoSuchSpecialityExistsException(ex.getMessage());
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

        return specialityList;
    }

    @Override
    public List<SpecialityDTO> readListOfSpecialities(List<String> specialityIDs) 
            throws NoSuchSpecialityExistsException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<SpecialityDTO> specs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_SPECIALITY);
            for (String specialityID : specialityIDs) {
                stm.setString(1, specialityID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    SpecialityDTO result = new SpecialityDTOImpl();
                    result.setSpecialityID(specialityID);
                    result.setSpecialityName(rs.getString("specialityName"));

                    if (specs == null) {
                        specs = new ArrayList<>();
                    }
                    specs.add(result);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            throw new NoSuchSpecialityExistsException(ex.getMessage());
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

        return specs;
    }
}

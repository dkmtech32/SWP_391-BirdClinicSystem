/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.users.doctor;

import models.dao.speciality.SpecialityDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import models.dao.images.ImageDAO;
import models.dao.users.UserDAOImpl;
import models.dto.users.UserDTO;
import models.dto.users.doctor.DoctorDTO;
import models.dto.users.doctor.DoctorDTOImpl;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class DoctorDAOImpl extends UserDAOImpl implements DoctorDAO {

    private final SpecialityDAO specialityDAO;

    private static final String READ_DOCTOR = "select doctorID, specialityID, docPhone, docAge, yearsOfExperience, academicTitle, degree "
            + "from Doctor "
            + "where doctorID = ?";
    private static final String READ_ALL_DOCTOR = "select doctorID, specialityID, docPhone, docAge, yearsOfExperience, academicTitle, degree "
            + "from Users ";
    private static final String INSERT_DOCTOR = "insert into Doctor(doctorID, specialityID, docPhone, docAge, yearsOfExperience, academicTitle, degree) "
            + "values (?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_DOCTOR = "delete from Doctor "
            + "where doctorID = ?";
    private static final String UPDATE_DOCTOR = "update Doctor "
            + "set specialityID = ?, docPhone = ?, docAge = ?, yearsOfExperience = ?, academicTitle = ?, degree = ? "
            + "where doctorID = ?";
    private List<DoctorDTO> doctorList;

    public DoctorDAOImpl(SpecialityDAO specialityDAO, ImageDAO imageDAO) {
        super(imageDAO);
        this.specialityDAO = specialityDAO;
    }

    @Override
    public DoctorDTO readDoctor(String doctorID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        DoctorDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            if (rs != null) {
                UserDTO user = this.readUser(doctorID);
                result = new DoctorDTOImpl(user);
                result.setUserID(doctorID);
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("imageID")));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDocPhone(rs.getString("docPhone"));
                result.setDocAge(rs.getInt("docAge"));
                result.setYearsOfExperience(rs.getInt("yearsOfExperience"));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDegree(rs.getString("degree"));
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
    public DoctorDTO readDoctor(String doctorID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        DoctorDTO result = null;

        try {
            stm = con.prepareStatement(READ_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            if (rs != null) {
                UserDTO user = this.readUser(doctorID, con);
                result = new DoctorDTOImpl(user);
                result.setUserID(doctorID);
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("imageID")));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDocPhone(rs.getString("docPhone"));
                result.setDocAge(rs.getInt("docAge"));
                result.setYearsOfExperience(rs.getInt("yearsOfExperience"));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDegree(rs.getString("degree"));
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
    public int insertDoctor(DoctorDTO doctor) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            super.insertUser(doctor, con);
            stm = con.prepareStatement(INSERT_DOCTOR);
            stm.setString(1, doctor.getUserID());
            stm.setString(2, doctor.getSpeciality().getSpecialityID());
            stm.setString(3, doctor.getDocPhone());
            stm.setInt(4, doctor.getDocAge());
            stm.setInt(5, doctor.getYearsOfExperience());
            stm.setString(6, doctor.getAcademicTitle());
            stm.setString(7, doctor.getDegree());

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
    public int deleteDoctor(String doctorID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_DOCTOR);
            stm.setString(1, doctorID);

            result = stm.executeUpdate()
                    + super.deleteUser(doctorID, con);
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
    public int updateDoctor(DoctorDTO doctor) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_DOCTOR);
            stm.setString(1, doctor.getSpeciality().getSpecialityID());
            stm.setString(2, doctor.getDocPhone());
            stm.setInt(3, doctor.getDocAge());
            stm.setInt(4, doctor.getYearsOfExperience());
            stm.setString(5, doctor.getAcademicTitle());
            stm.setString(6, doctor.getDegree());
            stm.setString(7, doctor.getUserID());

            result = stm.executeUpdate();
            super.updateUser(doctor, con);
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
    public List<DoctorDTO> readAllDoctors() throws SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_DOCTOR);
            this.doctorList.clear();

            while (rs != null) {
                String doctorID = rs.getString("doctorID");
                UserDTO user = this.readUser(doctorID,con);
                DoctorDTO result = new DoctorDTOImpl(user);
                result.setUserID(doctorID);
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("imageID")));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDocPhone(rs.getString("docPhone"));
                result.setDocAge(rs.getInt("docAge"));
                result.setYearsOfExperience(rs.getInt("yearsOfExperience"));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDegree(rs.getString("degree"));

                if (this.doctorList == null) {
                    this.doctorList = new ArrayList();
                }
                doctorList.add(result);
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

        return this.doctorList;
    }

    @Override
    public List<DoctorDTO> getDoctorList() {
        return doctorList;
    }
}

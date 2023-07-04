/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.doctor;

import models.speciality.SpecialityDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDAO;
import models.images.NoSuchImagesExistsException;
import models.speciality.NoSuchSpecialityExistsException;
import models.users.NoSuchUserExistsException;
import models.users.UserDAOImpl;
import models.users.UserDTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class DoctorDAOImpl extends UserDAOImpl implements DoctorDAO {

    private final SpecialityDAO specialityDAO;

    private static final String READ_DOCTOR
            = "select doctorID, specialityID, docAge, yearsOfExperience, academicTitle, degree "
            + "from Doctor "
            + "where doctorID = ?";
    private static final String READ_ALL_DOCTOR
            = "select doctorID, specialityID, docAge, yearsOfExperience, academicTitle, degree "
            + "from Doctor ";
    private static final String INSERT_DOCTOR
            = "insert into Doctor(doctorID, specialityID, docAge, yearsOfExperience, academicTitle, degree) "
            + "values (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_DOCTOR
            = "delete from Doctor "
            + "where doctorID = ?";
    private static final String UPDATE_DOCTOR
            = "update Doctor "
            + "set specialityID = ?, docAge = ?, yearsOfExperience = ?, academicTitle = ?, degree = ? "
            + "where doctorID = ?";

    public DoctorDAOImpl(SpecialityDAO specialityDAO, ImageDAO imageDAO) {
        super(imageDAO);
        this.specialityDAO = specialityDAO;
    }

    @Override
    public DoctorDTO readDoctor(String doctorID)
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        DoctorDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTOR);
            stm.setString(1, doctorID);
            rs = stm.executeQuery();

            if (rs.next()) {
                UserDTO user = this.readUser(doctorID);
                result = new DoctorDTOImpl(user);
                result.setUserID(doctorID);
                result.setSpeciality(specialityDAO.readSpeciality(rs.getString("specialityID")));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDocAge(rs.getInt("docAge"));
                result.setYearsOfExperience(rs.getInt("yearsOfExperience"));
                result.setAcademicTitle(rs.getString("academicTitle"));
                result.setDegree(rs.getString("degree"));
            }

            if (result == null) {
                throw new NoSuchDoctorExistsException();
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
    public int insertDoctor(DoctorDTO doctor)
            throws SQLException, RecordAlreadyExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            super.insertUser(doctor);
            stm = con.prepareStatement(INSERT_DOCTOR);
            stm.setString(1, doctor.getUserID());
            stm.setString(2, doctor.getSpeciality().getSpecialityID());
            stm.setInt(3, doctor.getDocAge());
            stm.setInt(4, doctor.getYearsOfExperience());
            stm.setString(5, doctor.getAcademicTitle());
            stm.setString(6, doctor.getDegree());

            result = stm.executeUpdate();
            if (result == 0) {
                throw new DoctorAlreadyExistsException();
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
    public int deleteDoctor(String doctorID)
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            int deleteUser = super.deleteUser(doctorID);

            if (deleteUser > 0) {
                con = DBUtils.getConnection();
                stm = con.prepareStatement(DELETE_DOCTOR);
                stm.setString(1, doctorID);

                result = stm.executeUpdate();
            }

            if (result == 0) {
                throw new NoSuchDoctorExistsException();
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
    public int updateDoctor(DoctorDTO doctor)
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            int updateUser = super.updateUser(doctor);
            if (updateUser > 0) {
                con = DBUtils.getConnection();
                stm = con.prepareStatement(UPDATE_DOCTOR);
                stm.setString(1, doctor.getSpeciality().getSpecialityID());
                stm.setInt(2, doctor.getDocAge());
                stm.setInt(3, doctor.getYearsOfExperience());
                stm.setString(4, doctor.getAcademicTitle());
                stm.setString(5, doctor.getDegree());
                stm.setString(6, doctor.getUserID());

                result = stm.executeUpdate();
            }

            if (result == 0) {
                throw new NoSuchDoctorExistsException();
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
    public List<DoctorDTO> readAllDoctors()
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<DoctorDTO> doctorList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTOR);
            List<UserDTO> users = super.readUserByRole("doctor");

            for (UserDTO user : users) {
                stm.setString(1, user.getUserID());
                rs = stm.executeQuery();

                if (rs.next()) {
                    DoctorDTO result = new DoctorDTOImpl(user);
                    result.setSpeciality(specialityDAO.readSpeciality(rs.getString("specialityID")));
                    result.setAcademicTitle(rs.getString("academicTitle"));
                    result.setDocAge(rs.getInt("docAge"));
                    result.setYearsOfExperience(rs.getInt("yearsOfExperience"));
                    result.setAcademicTitle(rs.getString("academicTitle"));
                    result.setDegree(rs.getString("degree"));

                    if (doctorList == null) {
                        doctorList = new ArrayList();
                    }
                    doctorList.add(result);
                }
            }
            if (doctorList == null || doctorList.isEmpty()) {
                throw new NoSuchDoctorExistsException();
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

        return doctorList;
    }

    @Override
    public List<DoctorDTO> readListOfDoctors(List<String> doctorIDs)
            throws SQLException, NoSuchRecordExists {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<DoctorDTO> doctorList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_DOCTOR);
            List<UserDTO> users = super.readListOfUsers(doctorIDs);

            for (UserDTO user : users) {
                stm.setString(1, user.getUserID());
                rs = stm.executeQuery();

                if (rs.next()) {
                    DoctorDTO result = new DoctorDTOImpl(user);
                    result.setSpeciality(specialityDAO.readSpeciality(rs.getString("specialityID")));
                    result.setAcademicTitle(rs.getString("academicTitle"));
                    result.setDocAge(rs.getInt("docAge"));
                    result.setYearsOfExperience(rs.getInt("yearsOfExperience"));
                    result.setAcademicTitle(rs.getString("academicTitle"));
                    result.setDegree(rs.getString("degree"));

                    if (doctorList == null) {
                        doctorList = new ArrayList();
                    }
                    doctorList.add(result);
                }
            }

            if (doctorList == null || doctorList.isEmpty()) {
                throw new NoSuchDoctorExistsException();
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

        return doctorList;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import models.dao.images.ImageDAO;
import models.dto.users.UserDTO;
import models.dto.users.UserDTOImpl;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserDAOImpl implements UserDAO {

    private static final String READ_USER = "select userID, imageID, userName, userPassword, fullName, gender, email, userRole "
            + "from Users "
            + "where userID = ?";
    private static final String READ_ALL_USER = "select userID, imageID, userName, userPassword, fullName, gender, email, userRole "
            + "from Users ";
    private static final String LOGIN_USER = "select userID, imageID, userName, userPassword, fullName, gender, email, userRole "
            + "from Users "
            + "where userName = ? and userPassword = ?";
    private static final String INSERT_USER = "insert into Users(userID, imageID, userName, userPassword, fullName, gender, email, userRole) "
            + "values (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_USER = "delete from Users "
            + "where userID = ?";
    private static final String UPDATE_USER = "update Users "
            + "set imageID = ?, userName = ?, userPassword = ?, fullName = ?, gender = ?, email = ?, userRole = ? "
            + "where userID = ?";
    private final ImageDAO imageDAO;

    public UserDAOImpl(ImageDAO imageDAO) {
        this.imageDAO = imageDAO;
    }

    @Override
    public UserDTO readUser(String userID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_USER);
            stm.setString(1, userID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new UserDTOImpl();
                result.setUserID(userID);
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(rs.getString("userPassword"));
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
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
    public UserDTO readUser(String userID, Connection con) throws SQLException {
       PreparedStatement stm = null;
       ResultSet rs = null;
       UserDTO result = null;
        try {
            stm = con.prepareStatement(READ_USER);
            stm.setString(1, userID);
            rs = stm.executeQuery();
            
            if (rs.next()) {
                result = new UserDTOImpl();
                result.setUserID(userID);
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(rs.getString("userPassword"));
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));
            }
        }

        catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return result;

    }

    @Override
    public int insertUser(UserDTO user) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_USER);
            stm.setString(1, user.getUserID());
            stm.setString(2, user.getImage().getImageID());
            stm.setString(3, user.getUserName());
            stm.setString(4, user.getUserPassword());
            stm.setString(5, user.getFullName());
            stm.setString(6, user.getGender());
            stm.setString(7, user.getEmail());
            stm.setString(8, user.getUserRole());

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
    public int insertUser(UserDTO user, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int result = 0;

        try {
            stm = con.prepareStatement(INSERT_USER);
            stm.setString(1, user.getUserID());
            stm.setString(2, user.getImage().getImageID());
            stm.setString(3, user.getUserName());
            stm.setString(4, user.getUserPassword());
            stm.setString(5, user.getFullName());
            stm.setString(6, user.getGender());
            stm.setString(7, user.getEmail());
            stm.setString(8, user.getUserRole());

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    @Override
    public int deleteUser(String userID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_USER);
            stm.setString(1, userID);

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
    public int deleteUser(String userID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int result = 0;

        try {
            stm = con.prepareStatement(DELETE_USER);
            stm.setString(1, userID);

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    @Override
    public int updateUser(UserDTO user) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_USER);
            stm.setString(1, user.getImage().getImageID());
            stm.setString(2, user.getUserName());
            stm.setString(3, user.getUserPassword());
            stm.setString(4, user.getFullName());
            stm.setString(5, user.getGender());
            stm.setString(6, user.getEmail());
            stm.setString(7, user.getUserRole());
            stm.setString(8, user.getUserID());

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
    public int updateUser(UserDTO user, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int result = 0;

        try {
            stm = con.prepareStatement(UPDATE_USER);
            stm.setString(1, user.getImage().getImageID());
            stm.setString(2, user.getUserName());
            stm.setString(3, user.getUserPassword());
            stm.setString(4, user.getFullName());
            stm.setString(5, user.getGender());
            stm.setString(6, user.getEmail());
            stm.setString(7, user.getUserRole());
            stm.setString(8, user.getUserID());

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    @Override
    public UserDTO loginUser(String userName, String userPassword) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(LOGIN_USER);
            stm.setString(1, userName);
            stm.setString(1, userPassword);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new UserDTOImpl();
                result.setUserID(rs.getString("userID"));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(rs.getString("userPassword"));
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
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
    public List<UserDTO> readAllUsers() throws SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<UserDTO> userList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_USER);

            while (rs.next()) {
                UserDTO result = new UserDTOImpl();
                result.setUserID(rs.getString("userID"));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(rs.getString("userPassword"));
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));

                if (userList == null) {
                    userList = new ArrayList<UserDTO>();
                }
                userList.add(result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return userList;
    }
    
    @Override
    public List<UserDTO> readAllUsers(Connection con) throws SQLException {
        Statement stm = null;
        ResultSet rs = null;
        List<UserDTO> userList = null;

        try {
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_USER);

            while (rs.next()) {
                UserDTO result = new UserDTOImpl();
                result.setUserID(rs.getString("userID"));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID")));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(rs.getString("userPassword"));
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));

                if (userList == null) {
                    userList = new ArrayList();
                }
                userList.add(result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return userList;
    }
}

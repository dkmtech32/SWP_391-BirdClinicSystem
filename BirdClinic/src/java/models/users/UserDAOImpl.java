/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.images.ImageDAO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserDAOImpl implements UserDAO {

    private static final String READ_USER
            = "select imageID, userName, userPassword, fullName, "
            + "gender, email, userRole, phoneNumber, status_ "
            + "from Users "
            + "where userID = ?";
    private static final String READ_USER_BY_EMAIL_USERNAME
            = "select userID, imageID, userPassword, fullName, "
            + "gender, userRole, phoneNumber, status_ "
            + "from Users "
            + "where email = ? and userName = ?";
    private static final String READ_ALL_USER
            = "select userID, imageID, userName, userPassword, fullName, "
            + "gender, email, userRole, phoneNumber, status_ "
            + "from Users ";
    private static final String READ_ALL_USER_BY_ROLE
            = "select userID, imageID, userName, userPassword, fullName, "
            + "gender, email, phoneNumber, status_ "
            + "from Users "
            + "where userRole = ?";
    private static final String LOGIN_USER
            = "select userID, imageID, fullName, "
            + "gender, email, userRole, phoneNumber, status_ "
            + "from Users "
            + "where userName = ? and userPassword = ?";
    private static final String INSERT_USER
            = "insert into "
            + "Users(userID, imageID, userName, userPassword, fullName, "
            + "gender, email, userRole, phoneNumber, status_) "
            + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_USER
            = "delete from Users "
            + "where userID = ?";
    private static final String UPDATE_USER
            = "update Users "
            + "set imageID = ?, userName = ?, fullName = ?, "
            + "gender = ?, email = ?, userRole = ?, phoneNumber = ?, status_ = ? "
            + "where userID = ?";
    private static final String UPDATE_USER_STATUS
            = "update Users "
            + "set status_ = ? "
            + "where userID = ?";
    private static final String UPDATE_USER_PASSWORD
            = "update Users "
            + "set userPassword = ? "
            + "where userID = ?";
    private final ImageDAO imageDAO;

    public UserDAOImpl(ImageDAO imageDAO) {
        this.imageDAO = imageDAO;
    }

    @Override
    public UserDTO readUser(String userID)
            throws NoSuchRecordExists, SQLException {
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
                result.setImage(imageDAO.readImage(rs.getString("imageID")));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(null);
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));
                result.setStatus_(rs.getString("status_").equals("active"));
                result.setPhoneNumber(rs.getString("phoneNumber"));
            }

            if (result == null) {
                throw new NoSuchUserExistsException();
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
    public UserDTO readUserByEmailUserName(String email, String username)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_USER_BY_EMAIL_USERNAME);
            stm.setString(1, email);
            stm.setString(2, username);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new UserDTOImpl();
                result.setUserID(rs.getString("userID"));
                result.setImage(imageDAO.readImage(rs.getString("imageID")));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(email);
                result.setUserPassword(null);
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(username);
                result.setStatus_(rs.getString("status_").equals("active"));
                result.setPhoneNumber(rs.getString("phoneNumber"));
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
    public List<UserDTO> readUserByRole(String userRole)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<UserDTO> users = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_ALL_USER_BY_ROLE);
            stm.setString(1, userRole);
            rs = stm.executeQuery();

            while (rs.next()) {
                UserDTO result = new UserDTOImpl();
                result.setUserID(rs.getString("userID"));
                result.setImage(imageDAO.readImage(rs.getString("imageID")));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(null);
                result.setGender(rs.getString("gender"));
                result.setUserRole(userRole);
                result.setUserName(rs.getString("userName"));
                result.setStatus_(rs.getString("status_").equals("active"));
                result.setPhoneNumber(rs.getString("phoneNumber"));

                if (users == null) {
                    users = new ArrayList<>();
                }

                users.add(result);
            }

            if (users == null || users.isEmpty()) {
                throw new NoSuchUserExistsException();
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

        return users;
    }

    @Override
    public int insertUser(UserDTO user) throws SQLException, RecordAlreadyExists {
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
            stm.setString(9, user.getPhoneNumber());
            stm.setString(10, user.isStatus_() ? "active" : "banned");

            result = stm.executeUpdate();

            if (result == 0) {
                throw new UserAlreadyExistsException();
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
    public int deleteUser(String userID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_USER);
            stm.setString(1, userID);

            result = stm.executeUpdate();
            if (result == 0) {
                throw new NoSuchUserExistsException();
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
    public int updateUser(UserDTO user) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_USER);
            stm.setString(1, user.getImage().getImageID());
            stm.setString(2, user.getUserName());
            stm.setString(3, user.getFullName());
            stm.setString(4, user.getGender());
            stm.setString(5, user.getEmail());
            stm.setString(6, user.getUserRole());
            stm.setString(7, user.getPhoneNumber());
            stm.setString(8, user.isStatus_() ? "active" : "banned");
            stm.setString(9, user.getUserID());

            result = stm.executeUpdate();
            if (result == 0) {
                throw new NoSuchUserExistsException();
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
    public int updateUserStatus(String userID, String status) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_USER_STATUS);
            stm.setString(1, status);
            stm.setString(2, userID);

            result = stm.executeUpdate();
            if (result == 0) {
                throw new NoSuchUserExistsException();
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
    public int updateUserPassword(String userID, String password) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_USER_PASSWORD);
            stm.setString(1, password);
            stm.setString(2, userID);

            result = stm.executeUpdate();
            if (result == 0) {
                throw new NoSuchUserExistsException();
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
    public UserDTO loginUser(String userName, String userPassword)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(LOGIN_USER);
            stm.setString(1, userName);
            stm.setString(2, userPassword);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new UserDTOImpl();
                result.setUserID(rs.getString("userID"));
                result.setImage(imageDAO.readImage(rs.getString("imageID")));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(null);
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(userName);
                result.setStatus_(rs.getString("status_").equals("active"));
                result.setPhoneNumber(rs.getString("phoneNumber"));
            }
            if (result == null) {
                throw new NoSuchUserExistsException();
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
    public List<UserDTO> readAllUsers()
            throws NoSuchRecordExists, SQLException {
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
                result.setImage(imageDAO.readImage(rs.getString("imageID")));
                result.setFullName(rs.getString("fullName"));
                result.setEmail(rs.getString("email"));
                result.setUserPassword(null);
                result.setGender(rs.getString("gender"));
                result.setUserRole(rs.getString("userRole"));
                result.setUserName(rs.getString("userName"));
                result.setStatus_(rs.getString("status_").equals("active"));
                result.setPhoneNumber(rs.getString("phoneNumber"));

                if (userList == null) {
                    userList = new ArrayList<>();
                }
                userList.add(result);
            }
            if (userList == null || userList.isEmpty()) {
                throw new NoSuchUserExistsException();
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

        return userList;
    }

    @Override
    public List<UserDTO> readListOfUsers(List<String> userIDs)
            throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<UserDTO> userList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_USER);
            for (String userID : userIDs) {
                stm.setString(1, userID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    UserDTO result = new UserDTOImpl();
                    result.setUserID(rs.getString("userID"));
                    result.setImage(imageDAO.readImage(rs.getString("imageID")));
                    result.setFullName(rs.getString("fullName"));
                    result.setEmail(rs.getString("email"));
                    result.setUserPassword(null);
                    result.setGender(rs.getString("gender"));
                    result.setUserRole(rs.getString("userRole"));
                    result.setUserName(rs.getString("userName"));
                    result.setStatus_(rs.getString("status_").equals("active"));
                    result.setPhoneNumber(rs.getString("phoneNumber"));

                    if (userList == null) {
                        userList = new ArrayList<>();
                    }
                    userList.add(result);
                }
            }

            if (userList == null || userList.isEmpty()) {
                throw new NoSuchUserExistsException();
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

        return userList;
    }
}

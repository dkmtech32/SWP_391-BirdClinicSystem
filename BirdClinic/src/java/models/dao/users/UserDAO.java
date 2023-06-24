/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.users;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.users.UserDTO;

/**
 *
 * @author Admin
 */
public interface UserDAO extends Serializable {

    int deleteUser(String userID) throws SQLException;

    int deleteUser(String userID, Connection con) throws SQLException;

    int insertUser(UserDTO user) throws SQLException;

    int insertUser(UserDTO user, Connection con) throws SQLException;

    UserDTO loginUser(String userName, String userPassword) throws SQLException;

    List<UserDTO> readAllUsers() throws SQLException;

    List<UserDTO> readAllUsers(Connection con) throws SQLException;

    UserDTO readUser(String userID) throws SQLException;

    UserDTO readUser(String userID, Connection con) throws SQLException;

    int updateUser(UserDTO user) throws SQLException;

    int updateUser(UserDTO user, Connection con) throws SQLException;
    
}

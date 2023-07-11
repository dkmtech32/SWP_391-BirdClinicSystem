/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface UserDAO extends Serializable {

    int deleteUser(String userID) 
            throws NoSuchRecordExists, SQLException;

    int insertUser(UserDTO user)
            throws RecordAlreadyExists, SQLException;

    UserDTO loginUser(String userName, String userPassword)
            throws NoSuchRecordExists, SQLException;

    List<UserDTO> readAllUsers()
            throws NoSuchRecordExists, SQLException;

    UserDTO readUser(String userID)
            throws NoSuchRecordExists, SQLException;
    
    UserDTO readUserByEmailUserName(String email, String username)
            throws NoSuchRecordExists, SQLException;

    int updateUserPassword(String userID, String password) throws NoSuchRecordExists, SQLException;
    
    List<UserDTO> readListOfUsers(List<String> userIDs) 
            throws NoSuchRecordExists, SQLException;

    int updateUser(UserDTO user) 
            throws NoSuchRecordExists, SQLException;

    List<UserDTO> readUserByRole(String userRole) 
            throws NoSuchRecordExists, SQLException;
    
    int updateUserStatus(String userID, String status) throws NoSuchRecordExists, SQLException;
}

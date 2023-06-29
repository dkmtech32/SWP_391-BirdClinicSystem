/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Map;
import models.dto.users.UserDTO;

/**
 *
 * @author Admin
 */
public interface AccountServices extends Serializable {

    boolean accExist(UserDTO user);

    UserDTO login(String username, String password) throws AccountNotExistException, SQLException;
    
    UserDTO register(Map<String, String> args) throws AccountAlreadyExistsException, PasswordsNotEqualException, SQLException;
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account;

import java.io.Serializable;
import models.dto.users.UserDTO;

/**
 *
 * @author Admin
 */
public interface AccountServices extends Serializable {

    boolean accExist(UserDTO user);
    //    public UserDTO register(Map<String, String> args) throws AccountAlreadyExistsException {
    //        UserDTO user = null;
    //    }

    UserDTO login(String username, String password) throws AccountNotExistException;

    boolean logout(UserDTO user) throws AccountNotExistException;
    
}

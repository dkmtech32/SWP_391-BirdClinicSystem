/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.account;

import java.sql.SQLException;
import java.util.Map;
import models.dao.images.ImageDAOImpl;
import models.dao.users.UserDAO;
import models.dao.users.UserDAOImpl;
import models.dto.users.UserDTO;
import utils.StringUtil;

/**
 *
 * @author Admin
 */
public class AccountServicesImpl implements AccountServices {

    private final UserDAO userDAO;

    public AccountServicesImpl() {
        userDAO = new UserDAOImpl(new ImageDAOImpl());
    }

    @Override
    public UserDTO login(String username, String password) throws AccountNotExistException {
        password = StringUtil.hash(password);
        UserDTO user = null;
        try {
            user = userDAO.loginUser(username, password);
        } catch (SQLException ex) {
            throw new AccountNotExistException();
        }

        return user;
    }

    @Override
    public boolean logout(UserDTO user) throws AccountNotExistException {
        boolean result = false;
        try {
            result = user != null && userDAO.readUser(user.getUserID())==null;
        } catch (SQLException ex) {
            throw new AccountNotExistException();
        }

        return result;
    }
    
    @Override
    public boolean accExist(UserDTO user) {
        boolean result = false;
        try {
            result = userDAO.readUser(user.getUserID())!=null;
        } catch (SQLException ex) {
        }
        return result;
    }
    
//    public UserDTO register(Map<String, String> args) throws AccountAlreadyExistsException {
//        UserDTO user = null;
//    }
}

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
import models.dto.users.UserDTOImpl;
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
    public UserDTO login(String username, String password) throws AccountNotExistException, SQLException {
        password = StringUtil.hash(password);
        UserDTO user = null;
        user = userDAO.loginUser(username, password);
        if (user == null) {
            throw new AccountNotExistException();
        }
        return user;
    }

    @Override
    public boolean accExist(UserDTO user) {
        boolean result = false;
        try {
            result = userDAO.readUser(user.getUserID()) != null;
        } catch (SQLException ex) {
        }
        return result;
    }

    @Override
    public UserDTO register(Map<String, String> args)
            throws AccountAlreadyExistsException, PasswordsNotEqualException, SQLException {
        //assumption: args have all 4 key-value pairs
        UserDTO result = null;
        String username = args.get("username");
        String uPassword = args.get("password");
        String cPassword = args.get("repeat-password");
        String email = args.get("email");

        if (!uPassword.equals(cPassword)) {
            throw new PasswordsNotEqualException();
        }

        String rPassword = StringUtil.hash(cPassword);
        String userID = StringUtil.hash(cPassword + username);

        if (userDAO.readUser(userID) != null) {
            result = new UserDTOImpl();
            result.setUserID(userID);
            result.setEmail(email);
            result.setUserName(username);
            result.setUserPassword(rPassword);
            result.setGender("unknown");
            result.setUserRole("customer");
            result.setImage(null);
            result.setStatus_(true);
        } else {
            throw new AccountAlreadyExistsException();
        }

        return result;
    }
}

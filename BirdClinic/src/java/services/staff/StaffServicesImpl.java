/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.staff;

import models.users.UserDTO;
import services.account.AccountDoesNotExist;
import services.account.AccountServicesImpl;

/**
 *
 * @author Admin
 */
public class StaffServicesImpl extends AccountServicesImpl  {

    public StaffServicesImpl(UserDTO user) throws AccountDoesNotExist {
        if (user.getUserRole().toLowerCase().equals("admin"))
        {
            this.currentUser = user;
        } else throw new AccountDoesNotExist();
    }
    
}

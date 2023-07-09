/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.customer;

import java.sql.Date;
import models.users.UserDTO;
import models.users.UserDTOImpl;

/**
 *
 * @author Admin
 */
public class CustomerDTOImpl extends UserDTOImpl implements CustomerDTO {
    private Date dob;
    private String customerAddress;

    public CustomerDTOImpl() {
    }

    public CustomerDTOImpl(UserDTO user, Date dob, String customerAddress) {
        super.copyUser(user);
        this.dob = dob;
        this.customerAddress = customerAddress;
    }

    public CustomerDTOImpl(UserDTO user) {
        super.copyUser(user);
    }

    @Override
    public Date getDob() {
        return dob;
    }

    @Override
    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public String getCustomerAddress() {
        return customerAddress;
    }

    @Override
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    
    
}

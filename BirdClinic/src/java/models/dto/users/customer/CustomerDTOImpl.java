/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.users.customer;

import java.sql.Date;
//import models.dto.images.ImageDTO;
import models.dto.users.UserDTO;
import models.dto.users.UserDTOImpl;

/**
 *
 * @author Admin
 */
public class CustomerDTOImpl extends UserDTOImpl implements CustomerDTO {
    private Date dob;
    private String phoneNumber;
    private String customerAddress;

    public CustomerDTOImpl() {
    }

    public CustomerDTOImpl(UserDTO user, Date dob, String phoneNumber, String customerAddress) {
        super.copyUser(user);
        this.dob = dob;
        this.phoneNumber = phoneNumber;
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
    public String getPhoneNumber() {
        return phoneNumber;
    }

    @Override
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

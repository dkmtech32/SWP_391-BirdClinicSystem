/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users.customer;

import java.sql.Date;
import models.users.UserDTO;

/**
 *
 * @author Admin
 */
public interface CustomerDTO extends UserDTO {

    String getCustomerAddress();

    Date getDob();

    String getPhoneNumber();

    void setCustomerAddress(String customerAddress);

    void setDob(Date dob);

    void setPhoneNumber(String phoneNumber);
    
    @Override
    CustomerDTO copyUser();
    
    @Override
    void copyUser(UserDTO user);
}

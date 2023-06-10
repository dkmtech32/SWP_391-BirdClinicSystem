package com.birdclinic.BirdClinic.models.user.customer;

import java.sql.Date;

import com.birdclinic.BirdClinic.models.user.UserDTO;

public interface CustomerDTO extends UserDTO {

    String getCustomerID();

    void setCustomerID(String customerID);

    String getFullName();

    void setFullName(String fullName);

    String getPhoneNumber();

    void setPhoneNumber(String phoneNumber);

    Date getDob();

    void setDob(Date dob);

    String getCustomerAddress();

    void setCustomerAddress(String customerAddress);

    String getGender();

    void setGender(String gender);

}
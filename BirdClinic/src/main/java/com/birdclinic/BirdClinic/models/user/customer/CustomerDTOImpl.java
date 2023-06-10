package com.birdclinic.BirdClinic.models.user.customer;

import java.sql.Date;

import com.birdclinic.BirdClinic.models.user.UserDTOImpl;

public class CustomerDTOImpl extends UserDTOImpl implements CustomerDTO {
    private String customerID;
    private String fullName;
    private String phoneNumber;
    private Date dob;
    private String customerAddress;
    private String gender;

    public CustomerDTOImpl() {

    }

    @Override
    public String getCustomerID() {
        return customerID;
    }

    @Override
    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    @Override
    public String getFullName() {
        return fullName;
    }

    @Override
    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    @Override
    public String getGender() {
        return gender;
    }

    @Override
    public void setGender(String gender) {
        this.gender = gender;
    }

    
}

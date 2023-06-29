/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.users;

import models.dto.images.ImageDTO;

/**
 *
 * @author Admin
 */
public class UserDTOImpl implements UserDTO {
    private String userID;
    private ImageDTO image;
    private String userName;
    private String userPassword;
    private String fullName;
    private String gender;
    private String email;
    private String userRole;
    private boolean status_;

    public UserDTOImpl(
            String userID, ImageDTO image, String userName, String userPassword, 
            String fullName, String gender, String email, String userRole, boolean status_) {
        this.userID = userID;
        this.image = image;
        this.userName = userName;
        this.userPassword = userPassword;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.userRole = userRole;
        this.status_ = status_;
    }

    public UserDTOImpl() {
    }

    @Override
    public String getUserID() {
        return userID;
    }

    @Override
    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public ImageDTO getImage() {
        return image;
    }

    @Override
    public void setImage(ImageDTO image) {
        this.image = image;
    }

    @Override
    public String getUserName() {
        return userName;
    }

    @Override
    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String getUserPassword() {
        return userPassword;
    }

    @Override
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
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
    public String getGender() {
        return gender;
    }

    @Override
    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String getUserRole() {
        return userRole;
    }

    @Override
    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public boolean isStatus_() {
        return status_;
    }

    @Override
    public void setStatus_(boolean status_) {
        this.status_ = status_;
    }
    
    @Override
    public String getDisplayRole() {
        return this.userRole.substring(0,1).toUpperCase() + this.userRole.substring(1);
    }
    
    protected void copyUser(UserDTO user) {
        this.setUserID(user.getUserID());
        this.setUserName(user.getUserName());
        this.setImage(user.getImage());
        this.setUserPassword(user.getUserPassword());
        this.setEmail(user.getEmail());
        this.setFullName(user.getFullName());
        this.setGender(user.getGender());
        this.setUserRole(user.getUserRole());
    }
}

package com.birdclinic.BirdClinic.models.user;

public class UserDTOImpl implements UserDTO {
    private String userID;
    private String userName;
    private String userPassword;
    private String imageID;
    private String email;
    private String userRole;
    public UserDTOImpl() {
    }
    // public UserDTOImpl(String userID, String userName, String userPassword, String imageID, String email,
    //         String userRole) {
    //     this.userID = userID;
    //     this.userName = userName;
    //     this.userPassword = userPassword;
    //     this.imageID = imageID;
    //     this.email = email;
    //     this.userRole = userRole;
    // }
    @Override
    public String getUserID() {
        return userID;
    }
    @Override
    public void setUserID(String userID) {
        this.userID = userID;
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
    public String getImageID() {
        return imageID;
    }
    @Override
    public void setImageID(String imageID) {
        this.imageID = imageID;
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

    
}

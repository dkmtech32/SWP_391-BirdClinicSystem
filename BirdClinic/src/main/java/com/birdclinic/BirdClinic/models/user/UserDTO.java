package com.birdclinic.BirdClinic.models.user;

import java.io.Serializable;

public interface UserDTO extends Serializable {

    String getUserID();

    void setUserID(String userID);

    String getUserName();

    void setUserName(String userName);

    String getUserPassword();

    void setUserPassword(String userPassword);

    String getImageID();

    void setImageID(String imageID);

    String getEmail();

    void setEmail(String email);

    String getUserRole();

    void setUserRole(String userRole);

}
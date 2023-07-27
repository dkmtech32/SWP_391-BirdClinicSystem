/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.users;

import java.io.Serializable;
import models.images.ImageDTO;

/**
 *
 * @author Admin
 */
public interface UserDTO extends Serializable {

    void copyUser(UserDTO user);

    UserDTO copyUser();

    String getDisplayRole();

    String getEmail();

    String getFullName();

    String getGender();

    ImageDTO getImage();

    String getPhoneNumber();

    String getUserID();

    String getUserName();

    String getUserPassword();

    String getUserRole();

    boolean isStatus_();

    void setEmail(String email);

    void setFullName(String fullName);

    void setGender(String gender);

    void setImage(ImageDTO image);

    void setPhoneNumber(String phoneNumber);

    void setStatus_(boolean status_);

    void setUserID(String userID);

    void setUserName(String userName);

    void setUserPassword(String userPassword);

    void setUserRole(String userRole);
    
}

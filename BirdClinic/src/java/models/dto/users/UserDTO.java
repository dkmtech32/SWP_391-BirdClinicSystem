/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.users;

import java.io.Serializable;
import models.dto.images.ImageDTO;

/**
 *
 * @author Admin
 */
public interface UserDTO extends Serializable {

    String getEmail();

    String getFullName();

    String getGender();

    ImageDTO getImage();

    String getUserID();

    String getUserName();

    String getUserPassword();

    String getUserRole();
    
    String getDisplayRole();
    
    boolean isStatus_();

    void setEmail(String email);

    void setFullName(String fullName);

    void setGender(String gender);

    void setImage(ImageDTO image);

    void setUserID(String userID);

    void setUserName(String userName);

    void setUserPassword(String userPassword);

    void setUserRole(String userRole);
    
    void setStatus_(boolean status_);
}

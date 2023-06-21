/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.speciality;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public interface SpecialityDTO extends Serializable {

    String getSpecialityID();

    String getSpecialityName();

    void setSpecialityID(String specialityID);

    void setSpecialityName(String specialityName);
    
}

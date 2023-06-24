/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.service_;

import java.io.Serializable;
import models.dto.speciality.SpecialityDTO;

/**
 *
 * @author Admin
 */
public interface Service_DTO extends Serializable {

    String getServiceID();

    String getServiceName();

    int getServicePrice();

    SpecialityDTO getSpeciality();

    void setServiceID(String serviceID);

    void setServiceName(String serviceName);

    void setServicePrice(int servicePrice);

    void setSpeciality(SpecialityDTO speciality);
    
}

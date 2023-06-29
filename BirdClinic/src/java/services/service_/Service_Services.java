/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.service_;

import java.io.Serializable;
import java.util.List;
import models.dto.service_.Service_DTO;

/**
 *
 * @author Admin
 */
public interface Service_Services extends Serializable {

    List<Service_DTO> getAllService_() throws NoSuchService_ExistsException;

    List<Service_DTO> getService_BySpeciality(String specialityID) throws NoSuchService_ExistsException, NoSuchSpecialityExistsException;
    
}

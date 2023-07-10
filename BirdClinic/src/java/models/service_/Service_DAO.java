/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.service_;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface Service_DAO extends Serializable {

    List<Service_DTO> readAllService_() 
            throws NoSuchRecordExists, SQLException;

    Service_DTO readService_(String serviceID) 
            throws NoSuchRecordExists, SQLException;

    List<Service_DTO> searchService_(String serviceName) 
            throws NoSuchRecordExists, SQLException;
    
    List<Service_DTO> readServiceBySpeciality(String specialityID) 
            throws NoSuchRecordExists, SQLException;
    
    int updateService(Service_DTO service) 
            throws NoSuchRecordExists, SQLException;
    
    int insertService(Service_DTO service) 
            throws RecordAlreadyExists, SQLException;
}

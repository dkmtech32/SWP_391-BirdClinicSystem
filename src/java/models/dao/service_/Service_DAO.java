/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.service_;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.service_.Service_DTO;

/**
 *
 * @author Admin
 */
public interface Service_DAO extends Serializable {

    List<Service_DTO> readAllService_() throws SQLException;

    Service_DTO readService_(String serviceID) throws SQLException;

    Service_DTO readService_(String serviceID, Connection con) throws SQLException;

    List<Service_DTO> searchService_(String serviceName) throws SQLException;
    
}

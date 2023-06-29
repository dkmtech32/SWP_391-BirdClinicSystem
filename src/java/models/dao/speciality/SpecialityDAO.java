/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.speciality;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.speciality.SpecialityDTO;

/**
 *
 * @author Admin
 */
public interface SpecialityDAO extends Serializable {

    List<SpecialityDTO> readAllSpecialities() throws SQLException;

    SpecialityDTO readSpeciality(String specialityID) throws SQLException;

    SpecialityDTO readSpeciality(String specialityID, Connection con) throws SQLException;
    
}

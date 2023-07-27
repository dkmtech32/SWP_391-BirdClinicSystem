/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.bird;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface BirdDAO extends Serializable {

    BirdDTO readBird(String birdID) 
            throws SQLException, NoSuchRecordExists;
    
    List<BirdDTO> readAllBird() 
            throws SQLException, NoSuchRecordExists;
    
    List<BirdDTO> readListOfBird(List<String> birdIDs) 
            throws SQLException, NoSuchRecordExists;
    
    List<BirdDTO> readAllBirdByCustomer(String customerID) 
            throws SQLException, NoSuchRecordExists;
    
    int insertBird(BirdDTO bird) 
            throws SQLException, RecordAlreadyExists;
    
    int deleteBird(String birdID) 
            throws SQLException, NoSuchRecordExists;
    
    int updateBird(BirdDTO bird) 
            throws SQLException, NoSuchRecordExists;
}

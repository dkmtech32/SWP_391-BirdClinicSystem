/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.bird;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.bird.BirdDTO;

/**
 *
 * @author Admin
 */
public interface BirdDAO extends Serializable {

    BirdDTO readBird(String birdID) throws SQLException;

    BirdDTO readBird(String birdID, Connection con) throws SQLException;
    
    List<BirdDTO> readAllBird() throws SQLException;
    
    List<BirdDTO> readAllBird(Connection con) throws SQLException;
    
    List<BirdDTO> readAllBirdByCustomer(String customerID) throws SQLException;

    List<BirdDTO> readAllBirdByCustomer(String customerID, Connection con) throws SQLException;
    
    int insertBird(BirdDTO bird) throws SQLException;
    
    int insertBird(BirdDTO bird, Connection con) throws SQLException;
    
    int deleteBird(String birdID) throws SQLException;
    
    int deleteBird(String birdID, Connection con) throws SQLException;
    
    int updateBird(BirdDTO bird) throws SQLException;
    
    int updateBird(BirdDTO bird, Connection con) throws SQLException;
}

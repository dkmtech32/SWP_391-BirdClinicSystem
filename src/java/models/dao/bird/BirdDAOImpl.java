/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.bird;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.dao.users.customer.CustomerDAO;
import models.dao.images.ImageDAO;
import models.dto.bird.BirdDTO;
import models.dto.bird.BirdDTOImpl;
import utils.DBUtils;
/**
 *
 * @author Admin
 */
public class BirdDAOImpl {
    private final ImageDAO imageDAO;
    private final CustomerDAO customerDAO;
    
    private static final String READ_BIRD = "select birdID, customerID, imageID, birdFullname, birdGender, "
            + "breed, band, microchip, birdWeight, sexingMethod, medicalHistory, hatchingDate, featherColor "
            + "from Bird "
            + "where birdID = ?";
    private static final String READ_ALL_BIRD = "select birdID, customerID, imageID, birdFullname, birdGender, "
            + "breed, band, microchip, birdWeight, sexingMethod, medicalHistory, hatchingDate, featherColor "
            + "from Bird ";
    private static final String READ_ALL_BIRD_BY_CUSTOMER = "select birdID, customerID, imageID, birdFullname, birdGender, "
            + "breed, band, microchip, birdWeight, sexingMethod, medicalHistory, hatchingDate, featherColor "
            + "from Bird "
            + "where customerID = ?";
    private static final String INSERT_BIRD = "insert into Bird(birdID, customerID, imageID, birdFullname, birdGender, "
            + "breed, band, microchip, birdWeight, sexingMethod, medicalHistory, hatchingDate, featherColor ) "
            + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_BIRD = "delete from Bird "
            + "where birdID = ?";
    private static final String UPDATE_BIRD = "update Bird "
            + "set customerID, imageID, birdFullname, birdGender, "
            + "breed, band, microchip, birdWeight, sexingMethod, medicalHistory, hatchingDate, featherColor "
            + "where birdID = ?";
    
    //each constant is one feature
    //each feature is 2 functions: pass in args + get connection from DBUtils and pass in args + pass in Connection
    //if args not ID, pass in DTO

    public BirdDAOImpl(ImageDAO imageDAO, CustomerDAO customerDAO) {
        this.imageDAO = imageDAO;
        this.customerDAO = customerDAO;
    }
    
    public BirdDTO readBird(String birdID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdDTO result = null;
        
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_BIRD);
            stm.setString(1, birdID);
            rs = stm.executeQuery();
            
            if (rs.next()) {
                result = new BirdDTOImpl();
                result.setBirdID(rs.getString("birdID"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        return result;
    }
    
    public BirdDTO readBird(String birdID, Connection con) throws SQLException {
        return null;
    }
}

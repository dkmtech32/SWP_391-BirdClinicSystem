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
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
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
                result.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setBirdFullname(rs.getString("birdFullName"));
                result.setBirdGender(rs.getString("birdGender"));
                result.setBreed(rs.getString("breed"));
                result.setBand(rs.getString("band"));
                result.setMicrochip(rs.getString("microchip"));
                result.setBirdWeight(rs.getInt("birdWeight"));
                result.setMicrochip(rs.getString("microchip"));
                result.setSexingMethod(rs.getString("sexingMethod"));
                result.setMedicalHistory(rs.getString("medicalHistory"));
                result.setHatchingDate(rs.getDate("hatchingDate"));
                result.setFeatherColor(rs.getString("featherColor"));
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
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdDTO result = null;
        
        try {
            stm = con.prepareStatement(READ_BIRD);
            stm.setString(1, birdID);
            rs = stm.executeQuery();
            
            if (rs.next()) {
                result = new BirdDTOImpl();
                result.setBirdID(rs.getString("birdID"));
                result.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setBirdFullname(rs.getString("birdFullName"));
                result.setBirdGender(rs.getString("birdGender"));
                result.setBreed(rs.getString("breed"));
                result.setBand(rs.getString("band"));
                result.setMicrochip(rs.getString("microchip"));
                result.setBirdWeight(rs.getInt("birdWeight"));
                result.setMicrochip(rs.getString("microchip"));
                result.setSexingMethod(rs.getString("sexingMethod"));
                result.setMedicalHistory(rs.getString("medicalHistory"));
                result.setHatchingDate(rs.getDate("hatchingDate"));
                result.setFeatherColor(rs.getString("featherColor"));
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
        }
        
        return result;
    }

    public int insertBird(BirdDTO bird) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_BIRD);
            stm.setString(1, bird.getBirdID());
            stm.setString(2, bird.getCustomer().getUserID());
            stm.setString(3, bird.getImage().getImageID());
            stm.setString(4, bird.getBirdFullname());
            stm.setString(5, bird.getBirdGender());
            stm.setString(6, bird.getBreed());
            stm.setString(7, bird.getBand());
            stm.setString(8, bird.getMicrochip());
            stm.setInt(9, bird.getBirdWeight());
            stm.setString(8, bird.getSexingMethod());
            stm.setString(10, bird.getMedicalHistory());
            stm.setDate(11, bird.getHatchingDate());
            stm.setString(8, bird.getMicrochip());  
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public int insertUser(BirdDTO bird, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int result = 0;

        try {
            stm = con.prepareStatement(INSERT_BIRD);
            stm = con.prepareStatement(INSERT_BIRD);
            stm.setString(1, bird.getBirdID());
            stm.setString(2, bird.getCustomer().getUserID());
            stm.setString(3, bird.getImage().getImageID());
            stm.setString(4, bird.getBirdFullname());
            stm.setString(5, bird.getBirdGender());
            stm.setString(6, bird.getBreed());
            stm.setString(7, bird.getBand());
            stm.setString(8, bird.getMicrochip());
            stm.setInt(9, bird.getBirdWeight());
            stm.setString(8, bird.getSexingMethod());
            stm.setString(10, bird.getMedicalHistory());
            stm.setDate(11, bird.getHatchingDate());
            stm.setString(8, bird.getMicrochip());  

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    public int deleteBird(String BirdID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_BIRD);
            stm.setString(1, BirdID);

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public int deleteBird(String birdID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int result = 0;

        try {
            stm = con.prepareStatement(DELETE_BIRD);
            stm.setString(1, birdID);

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    public int updateUser(BirdDTO bird) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_BIRD);
            stm.setString(1, bird.getBirdID());
            stm.setString(2, bird.getCustomer().getUserID());
            stm.setString(3, bird.getImage().getImageID());
            stm.setString(4, bird.getBirdFullname());
            stm.setString(5, bird.getBirdGender());
            stm.setString(6, bird.getBreed());
            stm.setString(7, bird.getBand());
            stm.setString(8, bird.getMicrochip());
            stm.setInt(9, bird.getBirdWeight());
            stm.setString(8, bird.getSexingMethod());
            stm.setString(10, bird.getMedicalHistory());
            stm.setDate(11, bird.getHatchingDate());
            stm.setString(8, bird.getMicrochip());  

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public int updateUser(BirdDTO bird, Connection con) throws SQLException {
        PreparedStatement stm = null;
        int result = 0;

        try {
            stm = con.prepareStatement(UPDATE_BIRD);
            stm.setString(1, bird.getBirdID());
            stm.setString(2, bird.getCustomer().getUserID());
            stm.setString(3, bird.getImage().getImageID());
            stm.setString(4, bird.getBirdFullname());
            stm.setString(5, bird.getBirdGender());
            stm.setString(6, bird.getBreed());
            stm.setString(7, bird.getBand());
            stm.setString(8, bird.getMicrochip());
            stm.setInt(9, bird.getBirdWeight());
            stm.setString(8, bird.getSexingMethod());
            stm.setString(10, bird.getMedicalHistory());
            stm.setDate(11, bird.getHatchingDate());
            stm.setString(8, bird.getMicrochip()); 

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    public List<BirdDTO> readAllBird() throws SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<BirdDTO> userList = null;

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_BIRD);

            while (rs.next()) {
                BirdDTO result = new BirdDTOImpl();
                result.setBirdID(rs.getString("birdID"));
                result.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setBirdFullname(rs.getString("birdFullName"));
                result.setBirdGender(rs.getString("birdGender"));
                result.setBreed(rs.getString("breed"));
                result.setBand(rs.getString("band"));
                result.setMicrochip(rs.getString("microchip"));
                result.setBirdWeight(rs.getInt("birdWeight"));
                result.setMicrochip(rs.getString("microchip"));
                result.setSexingMethod(rs.getString("sexingMethod"));
                result.setMedicalHistory(rs.getString("medicalHistory"));
                result.setHatchingDate(rs.getDate("hatchingDate"));
                result.setFeatherColor(rs.getString("featherColor"));

                if (userList == null) {
                    userList = new ArrayList<BirdDTO>();
                }
                userList.add(result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return userList;
    }

    public List<BirdDTO> readAllBird(Connection con) throws SQLException {
        Statement stm = null;
        ResultSet rs = null;
        List<BirdDTO> userList = null;

        try {
            stm = con.createStatement();
            rs = stm.executeQuery(READ_ALL_BIRD);

            while (rs.next()) {
                BirdDTO result = new BirdDTOImpl();
                result.setBirdID(rs.getString("birdID"));
                result.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
                result.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                result.setBirdFullname(rs.getString("birdFullName"));
                result.setBirdGender(rs.getString("birdGender"));
                result.setBreed(rs.getString("breed"));
                result.setBand(rs.getString("band"));
                result.setMicrochip(rs.getString("microchip"));
                result.setBirdWeight(rs.getInt("birdWeight"));
                result.setMicrochip(rs.getString("microchip"));
                result.setSexingMethod(rs.getString("sexingMethod"));
                result.setMedicalHistory(rs.getString("medicalHistory"));
                result.setHatchingDate(rs.getDate("hatchingDate"));
                result.setFeatherColor(rs.getString("featherColor"));

                if (userList == null) {
                    userList = new ArrayList();
                }
                userList.add(result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (rs.next()) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return userList;
    }

    public List<BirdDTO> readAllBirdByCustomer(String customerID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<BirdDTO> birdList = null;
    
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_ALL_BIRD_BY_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();
    
            while (rs.next()) {
                BirdDTO bird = new BirdDTOImpl();
                bird.setBirdID(rs.getString("birdID"));
                bird.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
                bird.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                bird.setBirdFullname(rs.getString("birdFullName"));
                bird.setBirdGender(rs.getString("birdGender"));
                bird.setBreed(rs.getString("breed"));
                bird.setBand(rs.getString("band"));
                bird.setMicrochip(rs.getString("microchip"));
                bird.setBirdWeight(rs.getInt("birdWeight"));
                bird.setSexingMethod(rs.getString("sexingMethod"));
                bird.setMedicalHistory(rs.getString("medicalHistory"));
                bird.setHatchingDate(rs.getDate("hatchingDate"));
                bird.setFeatherColor(rs.getString("featherColor"));
    
                if (birdList == null) {
                    birdList = new ArrayList<>();
                }
                birdList.add(bird);
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
    
        return birdList;
    }
    
    public List<BirdDTO> readAllBirdByCustomer(String customerID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<BirdDTO> birdList = null;
    
        try {
            stm = con.prepareStatement(READ_ALL_BIRD_BY_CUSTOMER);
            stm.setString(1, customerID);
            rs = stm.executeQuery();
    
            while (rs.next()) {
                BirdDTO bird = new BirdDTOImpl();
                bird.setBirdID(rs.getString("birdID"));
                bird.setCustomer(customerDAO.readCustomer(rs.getString("customerID"), con));
                bird.setImage(imageDAO.readImageDb(rs.getString("imageID"), con));
                bird.setBirdFullname(rs.getString("birdFullName"));
                bird.setBirdGender(rs.getString("birdGender"));
                bird.setBreed(rs.getString("breed"));
                bird.setBand(rs.getString("band"));
                bird.setMicrochip(rs.getString("microchip"));
                bird.setBirdWeight(rs.getInt("birdWeight"));
                bird.setSexingMethod(rs.getString("sexingMethod"));
                bird.setMedicalHistory(rs.getString("medicalHistory"));
                bird.setHatchingDate(rs.getDate("hatchingDate"));
                bird.setFeatherColor(rs.getString("featherColor"));
    
                if (birdList == null) {
                    birdList = new ArrayList<>();
                }
                birdList.add(bird);
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
        }
    
        return birdList;
    }
}

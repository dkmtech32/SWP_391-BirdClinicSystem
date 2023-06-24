/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.images;

import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import models.dto.images.ImageDTO;
import models.dto.images.ImageDTOImpl;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ImageDAOImpl implements ImageDAO {

    private static final String READ_IMAGE_DB = "select imageID, imageURLName"
            + "from Images "
            + "where imageID = ?";
    private static final String INSERT_IMAGE_DB = "insert into Images(imageID, imageURLName) "
            + "values (?, ?)";
    private static final String DELETE_IMAGE_DB = "delete from Images "
            + "where imageID = ?";
    private static final String UPDATE_IMAGE_DB = "update Images "
            + "set imageURLName = ? "
            + "where imageID = ?";

    public ImageDAOImpl() {
    }

    
    
    @Override
    public ImageDTO readImageDb(String imageID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_IMAGE_DB);
            stm.setString(1, imageID);
            rs = stm.executeQuery();

            if (rs != null) {
                result = new ImageDTOImpl();
                result.setImageID(imageID);
                result.setImageURLName(rs.getString("imageURLName"));
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
    
    public ImageDTO readImageDb(String imageID, Connection con) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDTO result = null;

        try {
            stm = con.prepareStatement(READ_IMAGE_DB);
            stm.setString(1, imageID);
            rs = stm.executeQuery();

            if (rs != null) {
                result = new ImageDTOImpl();
                result.setImageID(imageID);
                result.setImageURLName(rs.getString("imageURLName"));
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
    
    @Override
    public int insertImageDb (ImageDTO image) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_IMAGE_DB);
            stm.setString(1, image.getImageID());
            stm.setString(2, image.getImageURLName());
            
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
    
    @Override
    public int deleteImageDb (String imageID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_IMAGE_DB);
            stm.setString(1, imageID);
            
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
    
    @Override
    public int updateImageDb (ImageDTO image) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_IMAGE_DB);
            stm.setString(1, image.getImageURLName());
            stm.setString(2, image.getImageID());
            
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
    
    @Override
    public String getImageInDisk(ImageDTO image, ServletContext context) throws MalformedURLException {
        String filepath = "/WEB-INF/images/";
        
        String url = context.getResource(filepath + image.getImageURLName()).toString();
        return url;
    }
}

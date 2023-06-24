/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.images;

import java.io.Serializable;
import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import models.dto.images.ImageDTO;

/**
 *
 * @author Admin
 */
public interface ImageDAO extends Serializable {

    int deleteImageDb(String imageID) throws SQLException;

    String getImageInDisk(ImageDTO image, ServletContext context) throws MalformedURLException;

    int insertImageDb(ImageDTO image) throws SQLException;

    ImageDTO readImageDb(String imageID) throws SQLException;

    ImageDTO readImageDb(String imageID, Connection con) throws SQLException;

    int updateImageDb(ImageDTO image) throws SQLException;

}

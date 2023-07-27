/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.images;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ImageDAOImpl implements ImageDAO {

    private static final String READ_IMAGE
            = "select imageID, imageURLName "
            + "from Images "
            + "where imageID = ?";
    private static final String INSERT_IMAGE
            = "insert into Images(imageID, imageURLName) "
            + "values (?, ?)";
    private static final String DELETE_IMAGE
            = "delete from Images "
            + "where imageID = ?";
    private static final String UPDATE_IMAGE
            = "update Images "
            + "set imageURLName = ? "
            + "where imageID = ?";

    public ImageDAOImpl() {
    }

    @Override
    public ImageDTO readImage(String imageID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDTO result = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_IMAGE);
            stm.setString(1, imageID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = new ImageDTOImpl();
                result.setImageID(imageID);
                result.setImageURLName(rs.getString("imageURLName"));
            }

            if (result == null) {
                throw new NoSuchImagesExistsException();
            }
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

    @Override
    public int insertImage(ImageDTO image) throws RecordAlreadyExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_IMAGE);
            stm.setString(1, image.getImageID());
            stm.setString(2, image.getImageURLName());

            result = stm.executeUpdate();
            if (result == 0) {
                throw new ImageAlreadyExistsException();
            }
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
    public int deleteImage(String imageID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE_IMAGE);
            stm.setString(1, imageID);

            result = stm.executeUpdate();
            if (result == 0) {
                throw new NoSuchImagesExistsException();
            }
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
    public int updateImage(ImageDTO image) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_IMAGE);
            stm.setString(1, image.getImageURLName());
            stm.setString(2, image.getImageID());

            result = stm.executeUpdate();
            if (result == 0) {
                throw new NoSuchImagesExistsException();
            }
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
    public List<ImageDTO> readListOfImages(List<String> imageIDs)
            throws SQLException, NoSuchRecordExists {
        List<ImageDTO> images = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_IMAGE);
            for (String imageID : imageIDs) {
                stm.setString(1, imageID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    ImageDTO result = new ImageDTOImpl();
                    result.setImageID(imageID);
                    result.setImageURLName(rs.getString("imageURLName"));

                    if (images == null) {
                        images = new ArrayList<>();
                    }
                    images.add(result);
                }
            }

            if (images == null) {
                throw new NoSuchImagesExistsException();
            }
            if (images.isEmpty()) {
                throw new NoSuchImagesExistsException();
            }
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

        return images;
    }
    
    @Override
    public String saveFileToDisk(InputStream fileContent, String path, String filename) throws IOException {
        File file = new File(path, filename);
        file.createNewFile();
        
        Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        fileContent.close();
        return filename;
    }
    
    @Override
    public boolean deleteFileFromDisk(String path, String filename) throws IOException {
        File file = new File(path, filename);
        return file.delete();
    }
    
    @Override
    public Path readImageFromDisk(String path, String filename) throws IOException {
        File file = new File(path, filename);
        return file.toPath();
    }
}

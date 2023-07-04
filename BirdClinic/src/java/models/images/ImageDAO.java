/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.images;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface ImageDAO extends Serializable {

    int deleteImage(String imageID) throws NoSuchRecordExists, SQLException;

    int insertImage(ImageDTO image) throws RecordAlreadyExists, SQLException;

    ImageDTO readImage(String imageID) throws NoSuchRecordExists, SQLException;

    List<ImageDTO> readListOfImages(List<String> imageIDs) throws NoSuchRecordExists, SQLException;

    int updateImage(ImageDTO image) throws NoSuchRecordExists, SQLException;

}

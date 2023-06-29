/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.images;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public interface ImageDTO extends Serializable {

    String getImageID();

    String getImageURLName();
    
    String getImageInDisk();

    void setImageID(String imageID);

    void setImageURLName(String imageURL);
    
}

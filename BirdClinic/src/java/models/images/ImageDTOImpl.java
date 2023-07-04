/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.images;

/**
 *
 * @author Admin
 */
public class ImageDTOImpl implements ImageDTO {
    private String imageID;
    private String imageURLName;

    public ImageDTOImpl() {
    }

    public ImageDTOImpl(String imageID, String imageURLName) {
        this.imageID = imageID;
        this.imageURLName = imageURLName;
    }

    @Override
    public String getImageID() {
        return imageID;
    }

    @Override
    public void setImageID(String imageID) {
        this.imageID = imageID;
    }

    @Override
    public String getImageURLName() {
        return imageURLName;
    }

    @Override
    public void setImageURLName(String imageURLName) {
        this.imageURLName = imageURLName;
    }
    
    @Override
    public String getImageInDisk() {
        return "../assets/img/avatar/"+this.imageURLName;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.blog;

import java.io.Serializable;
import java.sql.Timestamp;
import models.images.ImageDTO;

/**
 *
 * @author Admin
 */
public interface BlogDTO extends Serializable {

    String getBlogContent();

    String getBlogID();

    String getCategory();

    String getDescription();

    ImageDTO getThumbnail();

    String getTitle();

    Timestamp getUploadDatetime();

    void setBlogContent(String blogContent);

    void setBlogID(String blogID);

    void setCategory(String category);

    void setDescription(String description);

    void setThumbnail(ImageDTO thumbnail);

    void setTitle(String title);

    void setUploadDatetime(Timestamp uploadDatetime);
    
}

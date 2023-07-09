/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.blog;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public interface BlogDTO extends Serializable {

    String getBlogContent();

    String getBlogID();

    String getCategory();

    String getTitle();

    Timestamp getUploadDatetime();

    void setBlogContent(String blogContent);

    void setBlogID(String blogID);

    void setCategory(String category);

    void setTitle(String title);

    void setUploadDatetime(Timestamp uploadDatetime);
    
}

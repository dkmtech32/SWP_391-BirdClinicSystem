/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.blog;

/**
 *
 * @author Admin
 */
import java.sql.Timestamp;
import models.images.ImageDTO;

public class BlogDTOImpl implements BlogDTO {
    private String blogID;
    private String title;
    private Timestamp uploadDatetime;
    private String category;
    private String blogContent;
    private String _description;
    private ImageDTO thumbnail;

    public BlogDTOImpl() {
    }

    

    @Override
    public String getBlogID() {
        return blogID;
    }

    @Override
    public void setBlogID(String blogID) {
        this.blogID = blogID;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public Timestamp getUploadDatetime() {
        return uploadDatetime;
    }

    @Override
    public void setUploadDatetime(Timestamp uploadDatetime) {
        this.uploadDatetime = uploadDatetime;
    }

    @Override
    public String getCategory() {
        return category;
    }

    @Override
    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String getBlogContent() {
        return blogContent;
    }

    @Override
    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    @Override
    public String getDescription() {
        return _description;
    }

    @Override
    public void setDescription(String _description) {
        this._description = _description;
    }

    @Override
    public ImageDTO getThumbnail() {
        return thumbnail;
    }

    @Override
    public void setThumbnail(ImageDTO thumbnail) {
        this.thumbnail = thumbnail;
    }
    
    
}


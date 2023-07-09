/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.blog;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public interface BlogDAO extends Serializable {

    void insertBlog(BlogDTO blog) throws SQLException;

    BlogDTO readBlog(String blogID) throws NoSuchRecordExists, SQLException;

    int updateBlog(BlogDTO blog) throws NoSuchRecordExists, SQLException;
    
    List<BlogDTO> readTopThreeBlogs() throws NoSuchRecordExists, SQLException;
}

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
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface BlogDAO extends Serializable {

    int insertBlog(BlogDTO blog) throws RecordAlreadyExists, SQLException;

    BlogDTO readBlog(String blogID) throws NoSuchRecordExists, SQLException;

    int updateBlog(BlogDTO blog) throws NoSuchRecordExists, SQLException;

    List<BlogDTO> readTopThreeBlogs() throws NoSuchRecordExists, SQLException;

    List<BlogDTO> readAllBlogs() throws NoSuchRecordExists, SQLException;
}

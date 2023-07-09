package models.blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import utils.DBUtils;

public class BlogDAOImpl implements BlogDAO {

    private static final String READ_BLOG
            = "SELECT blogID, title, uploadDatetime, category,  blogContent "
            + "FROM Blog "
            + "WHERE blogID = ?";
    private static final String INSERT_BLOG
            = "INSERT INTO Blog (blogID, title, uploadDatetime, category, blogContent) "
            + "VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_BLOG
            = "UPDATE Blog "
            + "SET title = ?, category = ?, blogContent = ? "
            + "WHERE blogID = ?";
    private static final String READ_TOP_THREE_BLOGS
            = "SELECT TOP 3 blogID, title, uploadDatetime, category, blogContent "
            + "FROM Blog "
            + "ORDER BY uploadDatetime DESC";

    @Override
    public BlogDTO readBlog(String blogID) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BlogDTO blog = null;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(READ_BLOG);
            stm.setString(1, blogID);
            rs = stm.executeQuery();

            if (rs.next()) {
                blog = new BlogDTOImpl();
                blog.setBlogID(rs.getString("blogID"));
                blog.setTitle(rs.getString("title"));
                blog.setUploadDatetime(rs.getTimestamp("uploadDatetime"));
                blog.setCategory(rs.getString("category"));
                blog.setBlogContent(rs.getString("blogContent"));
            }

            if (blog == null) {
                throw new NoSuchBlogExistsException();
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

        return blog;
    }

    @Override
    public int insertBlog(BlogDTO blog) throws RecordAlreadyExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(INSERT_BLOG);
            stm.setString(1, blog.getBlogID());
            stm.setString(2, blog.getTitle());
            stm.setTimestamp(3, blog.getUploadDatetime());
            stm.setString(4, blog.getCategory());
            stm.setString(5, blog.getBlogContent());
            result = stm.executeUpdate();
            if (result == 0) {
                throw new BlogAlreadyExistsException();
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
    public int updateBlog(BlogDTO blog) throws NoSuchRecordExists, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowsAffected = 0;

        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE_BLOG);
            stm.setString(1, blog.getTitle());
            stm.setTimestamp(2, blog.getUploadDatetime());
            stm.setString(3, blog.getCategory());
            stm.setString(4, blog.getBlogContent());
            stm.setString(5, blog.getBlogID());

            rowsAffected = stm.executeUpdate();

            if (rowsAffected == 0) {
                throw new NoSuchBlogExistsException();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return rowsAffected;
    }

    @Override
    public List<BlogDTO> readTopThreeBlogs() throws NoSuchRecordExists, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<BlogDTO> blogs = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(READ_TOP_THREE_BLOGS);

            while (rs.next()) {
                BlogDTO blog = new BlogDTOImpl();
                blog.setBlogID(rs.getString("blogID"));
                blog.setTitle(rs.getString("title"));
                blog.setUploadDatetime(rs.getTimestamp("uploadDatetime"));
                blog.setCategory(rs.getString("category"));
                blog.setBlogContent(rs.getString("blogContent"));
                blogs.add(blog);
            }

            if (blogs.isEmpty()) {
                throw new NoSuchBlogExistsException();
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

        return blogs;
    }
}

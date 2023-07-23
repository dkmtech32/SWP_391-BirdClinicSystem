/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.blog;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.blog.BlogDTO;
import services.general.BlogDoesNotExistException;
import services.staff.StaffServices;

/**
 *
 * @author Admin
 */
public class UpdateBlogServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "/Staff/blog-update.jsp";
        String blogID = request.getParameter("blogID");
        HttpSession session = request.getSession();
        try {
            StaffServices service = (StaffServices) session.getAttribute("service");
            BlogDTO blog = service.viewBlog(blogID);
            request.setAttribute("blog", blog);
        } catch (BlogDoesNotExistException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        Map<String, String[]> params = request.getParameterMap();
        Map<String, String[]> args = new HashMap<>(params);
        Part userImage = request.getPart("blog-image");
        String path = request.getServletContext().getInitParameter("PATH");
        InputStream blogIS = null;
        String blogID = "";

        try {
            if (userImage != null && userImage.getSize()>0L) {
                blogIS = userImage.getInputStream();
                args.put("filename", new String[]{userImage.getSubmittedFileName()});
                args.put("path", new String[]{path + "\\blog\\"});
            }
            StaffServices service = (StaffServices) session.getAttribute("service");
            BlogDTO blog = service.editBlog(args, blogIS);
            blogID = blog.getBlogID();

        } catch (BlogDoesNotExistException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher("/Blog?blogID=" + blogID).forward(request, response);

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard.customer;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.bird.BirdDTO;
import services.customer.CustomerServices;
import services.general.BirdDoesNotExistException;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class CustomerDashboardUpdateBirdServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String birdID = request.getParameter("birdID");
        CustomerServices service = (CustomerServices) session.getAttribute("service");
        String url = "/Customer/update-bird.jsp";
        try {
            BirdDTO bird = service.viewBird(birdID);
            request.setAttribute("bird", bird);
        } catch (BirdDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Bird does not exist. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something went wrong. Please try again.");
        } finally {
            request.setAttribute("url", url);
            request.getRequestDispatcher("/Common/dashboard.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");

        String url = "/Dashboard/Birds/update";
        HttpSession session = request.getSession();
        CustomerServices service = (CustomerServices) session.getAttribute("service");
        Map<String, String[]> params = request.getParameterMap();
        Map<String, String[]> args = new HashMap<>(params);
        Part birdImg = request.getPart("bird-image");
        InputStream birdIS = null;
        String path = request.getServletContext().getInitParameter("PATH");
        try {
            if (birdImg != null && birdImg.getSize()>0L) {
                birdIS = birdImg.getInputStream();
                args.put("filename", new String[]{birdImg.getSubmittedFileName()});
                args.put("path", new String[]{path + "\\bird\\"});
            }
            service.updateBird(args, birdIS);
            url = "/Dashboard/Birds";
        } catch (BirdDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Bird does not exist. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something went wrong. Please try again.");
        } finally {
            response.sendRedirect(request.getContextPath() + url);
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

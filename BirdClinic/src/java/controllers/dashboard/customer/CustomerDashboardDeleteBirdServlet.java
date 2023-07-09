/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard.customer;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.customer.CustomerServices;
import services.general.BirdDoesNotExistException;

/**
 *
 * @author Admin
 */
public class CustomerDashboardDeleteBirdServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
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

        String url = "/Dashboard/Birds";

        request.getRequestDispatcher(url).forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "/Dashboard/Birds";
        HttpSession session = request.getSession();
        CustomerServices service = (CustomerServices) session.getAttribute("service");
        String birdID = request.getParameter("birdID");

        try {
            service.deleteBird(birdID);
        } catch (BirdDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Bird does not exist. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something went wrong. Please try again.");
        } finally {
            response.sendRedirect(request.getContextPath()+"/Dashboard/Birds");
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

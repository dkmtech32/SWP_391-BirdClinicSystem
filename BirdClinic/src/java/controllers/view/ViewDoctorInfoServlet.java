/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.view;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.feedback.FeedbackDTO;
import models.users.UserDTO;
import models.users.doctor.DoctorDTO;
import services.general.AccountDoesNotExistException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public class ViewDoctorInfoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = "/Common/doctor-info.jsp";
        HttpSession session = request.getSession();
        
        String userID = request.getParameter("userID");
        
        try {
            GeneralServices service = (GeneralServices) session.getAttribute("service");
            UserDTO user = service.getCurrentUser();
            if (user.getUserRole().equals("admin")) {
                url = "/Admin/dr-profile.jsp";
            }
            
            DoctorDTO doctor = service.getDoctorInfo(userID);
            List<FeedbackDTO> feedbacks = service.getDoctorFeedbacks(doctor.getUserID());
            BigDecimal ratings = service.getDoctorRatings(feedbacks);
            request.setAttribute("feedbacks", feedbacks);
            request.setAttribute("ratings", ratings);
            request.setAttribute("doctor", doctor);
        } catch (ClassCastException ex) {
            url = "/login";
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something is wrong. Please try again.");
        } catch (AccountDoesNotExistException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

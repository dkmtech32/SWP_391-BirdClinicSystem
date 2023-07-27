/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.speciality.SpecialityDTO;
import models.users.doctor.DoctorDTO;
import services.customer.CustomerServices;

/**
 *
 * @author Admin
 */
public class PrepareDoctorsAppBookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String url = "/Common/index.jsp";
        HttpSession session = request.getSession();
        CustomerServices services = (CustomerServices) session.getAttribute("service");
        
        try {
            List<DoctorDTO> doctors = services.getAllDoctors();
            request.setAttribute("doctors", doctors);
            List<SpecialityDTO> specs = services.getSpecialities();
            request.setAttribute("specs",specs);
//            Map<DoctorDTO, BigDecimal> feedbacks = services.getAllRatingsFromDoctor();
//            request.setAttribute("ratings", feedbacks);
            url = "/Customer/booking-list.jsp";
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("message", "Something went wrong. Please try again.");
        }  finally {
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
        response.sendError(405);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.appointment.AppointmentAlreadyExistsException;
import services.customer.CustomerServices;

/**
 *
 * @author Admin
 */
public class BookAppointmentServlet extends HttpServlet {

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
        response.sendError(405);
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

        String birdID = request.getParameter("birdID");
        String notes = request.getParameter("notes");
        String serviceID = request.getParameter("serviceID");
        String timeslotID = request.getParameter("timeslotID");
        String appDay = request.getParameter("appDay");
        String doctorID = request.getParameter("doctorID");
        String url = "/Customer/prepareBooking";
        
        HttpSession session = request.getSession();
        CustomerServices service = (CustomerServices) session.getAttribute("service");

        try {
            Map<String, String> map = new HashMap<>();
            map.put("birdID", birdID);
            map.put("serviceID", serviceID);
            map.put("timeslotID", timeslotID);
            map.put("appDay", appDay);
            if (doctorID != null) {
                map.put("doctorID", doctorID);
            }
            if (notes != null) {
                map.put("notes", notes);
            }
            if (!map.isEmpty()) {
                service.bookAppointment(map);
                url = "/Common/index.jsp";
            }
        } catch (SQLException | AppointmentAlreadyExistsException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
    }// </editor-fold>

}

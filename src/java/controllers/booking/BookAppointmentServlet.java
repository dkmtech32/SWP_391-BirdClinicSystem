/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.appointment.AppointmentServices;
import services.appointment.AppointmentServicesImpl;

/**
 *
 * @author Admin
 */
public class BookAppointmentServlet extends HttpServlet {

    private AppointmentServices appServices;

    @Override
    public void init() {
        appServices = new AppointmentServicesImpl();
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

        try {
            Map<String, String> map = new HashMap<>();
            testString("birdID", birdID, map);
            testString("serviceID", serviceID, map);
            testString("timeslotID", "0227321c75909512447393796f173788", map);
            testString("appDay", Date.valueOf(LocalDate.now()).toString(), map);
            if (doctorID != null) {
                map.put("doctorID", doctorID);
            }
            if (notes != null) {
                map.put("notes", notes);
            }
            if (!map.isEmpty()) {
                appServices.bookAppointment(map);
                url = "/Customer/custDashboard";
            }
        } catch (Exception ex) {
            log(ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void testString(String key, String value, Map<String, String> map) throws Exception {
        if (value == null) {
            throw new Exception();
        }
        if (value.trim().isEmpty()) {
            throw new Exception();
        }
        map.put(key, value.trim());
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

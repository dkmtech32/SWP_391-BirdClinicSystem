/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.dto.timeslot.TimeslotDTO;
import services.account.doctor.NoSuchDoctorExistsException;
import services.timeslot.NoDoctorsAvailableException;
import services.timeslot.TimeslotServices;
import services.timeslot.TimeslotServicesImpl;

/**
 *
 * @author Admin
 */
public class PrepareDatetimeAppBookServlet extends HttpServlet {

//    private BirdServices birdServices;
//    private Service_Services serviceServices;
    private TimeslotServices timeslotServices;
//    private DoctorServices doctorServices;

    @Override
    public void init() {
//        birdServices = new BirdServicesImpl();
//        serviceServices = new Service_ServicesImpl();
        timeslotServices = new TimeslotServicesImpl();
//        doctorServices = new DoctorServicesImpl();
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

        response.setContentType("text/html;charset=UTF-8");

        String doctorID = request.getParameter("doctorID");
        String url = "/Common/index.jsp";

        try {
            List<TimeslotDTO> timeslots;
            if (doctorID == null) {
                //didn't choose a doctor
                timeslots = timeslotServices.getAllTimeslots();
            }
            else {
                //chose doctor
                timeslots = timeslotServices.getDoctorTimeslot(doctorID);
                request.setAttribute("doctorID", doctorID);
            }
            request.setAttribute("timeslots", timeslots);
            url = "/Customer/bookingDatetime.jsp";
        } catch (NoDoctorsAvailableException | NoSuchDoctorExistsException ex) {
            log(ex.getMessage());
            url = "/Customer/booking-list.jsp";
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
    }// </editor-fold>

}

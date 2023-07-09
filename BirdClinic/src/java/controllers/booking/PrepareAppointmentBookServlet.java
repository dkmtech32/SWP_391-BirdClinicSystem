/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.bird.BirdDTO;
import models.service_.Service_DTO;
import models.users.doctor.DoctorDTO;
import services.general.AccountDoesNotExist;
import services.customer.CustomerServices;

/**
 *
 * @author Admin
 */
public class PrepareAppointmentBookServlet extends HttpServlet {

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
        String doctorID = request.getParameter("doctorID");
        String appDate = request.getParameter("appDate").trim();
        String timeslotID = request.getParameter("timeslotID");
        String url = "/Common/index.jsp";

        try {
            if (session == null) {
                url = "/Common/login.jsp";
            } else {
                CustomerServices service = (CustomerServices) session.getAttribute("service");
                List<BirdDTO> birds = service.getCustomerBirds();
                request.setAttribute("birds", birds);

                if (doctorID != null) {
                    DoctorDTO doctor = service.getDoctorInfo(doctorID);
                    request.setAttribute("doctor", doctor);
                }
                List<Service_DTO> services = service.getServices(doctorID);
                request.setAttribute("serviceList", services);

                request.setAttribute("appDate", appDate);
                request.setAttribute("timeslot", service.getTimeslot(timeslotID));
                url = "bookInfo.jsp";

            }

        } catch (SQLException | AccountDoesNotExist ex) {
            ex.printStackTrace();
            url = "/Common/booking-list.jsp";
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
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.bird.BirdDTO;
import models.service_.NoSuchService_ExistsException;
import models.service_.Service_DTO;
import models.speciality.NoSuchSpecialityExistsException;
import models.timeslot.NoSuchTimeslotExistsException;
import models.users.UserDTO;
import models.users.customer.NoSuchCustomerExistsException;
import models.users.doctor.DoctorDTO;
import models.users.doctor.NoSuchDoctorExistsException;
import services.account.AccountDoesNotExist;
import services.account.AccountServices;
import services.customer.CustomerServices;

/**
 *
 * @author Admin
 */
public class PrepareAppointmentBookServlet extends HttpServlet {

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

        HttpSession session = request.getSession();
        String doctorID = request.getParameter("doctorID");
        String appDate = request.getParameter("appDate");
        String timeslotID = request.getParameter("timeslotID");
        String url = "/Common/index.jsp";

        try {
            if (session == null) {
                url = "/Common/login.jsp";
            } else {
                AccountServices service = (AccountServices) session.getAttribute("service");
                List<BirdDTO> birds = ((CustomerServices) service).getCustomerBirds();
                request.setAttribute("birds", birds);

                request.setAttribute("doctorID", doctorID);
                List<Service_DTO> services = service.getServices(doctorID);
                request.setAttribute("serviceList", services);

                request.setAttribute("appDay", appDate);
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
    }// </editor-fold>

}

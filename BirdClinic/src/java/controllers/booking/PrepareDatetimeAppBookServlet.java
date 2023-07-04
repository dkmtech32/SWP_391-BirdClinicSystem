/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.timeslot.TimeslotDTO;
import services.account.AccountServices;
import services.customer.CustomerServices;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class PrepareDatetimeAppBookServlet extends HttpServlet {

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
        String nextMonday = request.getParameter("nextWeekday");
        String url = "/Common/index.jsp";
        HttpSession session = request.getSession();
        AccountServices service = (AccountServices) session.getAttribute("service");

        try {
            
            Map<String, List<TimeslotDTO>> timeslots = ((CustomerServices)service).getTimeslotsByWeekday(doctorID);

            Date date = Date.valueOf(LocalDate.now());
            if (nextMonday != null) {
                date = Date.valueOf(nextMonday);
            }

            List<Date> daysInWeek = Utils.getDaysInWeek(date);
            request.setAttribute("timeslots", timeslots);
            request.setAttribute("week", daysInWeek);
            request.setAttribute("nextWeekday", Utils.getNextWeekWeekday(date));
            url = "/Customer/bookingDatetime.jsp";
        } catch (SQLException ex) {
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

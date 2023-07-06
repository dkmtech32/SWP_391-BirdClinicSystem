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
import services.customer.CustomerServices;
import utils.Utils;
import services.general.GeneralServices;

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
        String currentWeekday = request.getParameter("currentWeekday");
        String url = "/Common/index.jsp";
        HttpSession session = request.getSession();
        GeneralServices service = (GeneralServices) session.getAttribute("service");

        try {

            Map<String, List<TimeslotDTO>> timeslots = ((CustomerServices) service).getTimeslotsByWeekday(doctorID);

            Date date = Date.valueOf(LocalDate.now());
            if (currentWeekday != null) { //always in the future
                date = Date.valueOf(currentWeekday.trim());
                request.setAttribute("lastWeekday", Utils.getLastWeekWeekday(date));
            }

            if (true) { //TODO: test to see if nextMonday is x weeks ahead. (can only book x+1 weeks in advance)
                request.setAttribute("nextWeekday", Utils.getNextWeekWeekday(date));
            }

            String[] weekdays = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
            Map<String, Date> daysInWeek = Utils.getDaysInWeek(date, weekdays);
            daysInWeek = Utils.sortDates(daysInWeek);
            request.setAttribute("timeslots", timeslots);
            request.setAttribute("daysInWeek", daysInWeek);
            request.setAttribute("weekdays", weekdays);
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

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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.timeslot.TimeslotDTO;
import services.customer.CustomerServices;
import services.general.AccountDoesNotExist;
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
        String currentWeekday = request.getParameter("currentWeekday");
        String url = "/Common/index.jsp";
        HttpSession session = request.getSession();
        CustomerServices service = (CustomerServices) session.getAttribute("service");

        try {

            request.setAttribute("doctor", service.getDoctorInfo(doctorID));

            String[] weekdays = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
            request.setAttribute("weekdays", weekdays);
            List<List<TimeslotDTO>> timeslots = service.getTimeslotsByWeekday(doctorID);

            Date date = new Date(System.currentTimeMillis());
            if (currentWeekday != null) {
                Date currentDate = Date.valueOf(currentWeekday.trim());
                if (currentDate.compareTo(date) > 0) { // in the future
                    date = currentDate;
                    request.setAttribute("lastWeekday", Utils.getLastWeekWeekday(date));
                } else { //in the present
                    int days = Utils.getDaysSinceStartOfWeek(date);
                    request.setAttribute("daysBeforeToday", days);
                }
            }

            List<Date> daysInWeek = Utils.getDaysInWeek(date);
            Date nextWeekWeekday = Utils.getNextWeekWeekday(date);
            if (true) { //TODO: test to see if nextMonday is x weeks ahead. (can only book x weeks in advance)

                request.setAttribute("nextWeekday", nextWeekWeekday);
            }
            request.setAttribute("daysInWeek", daysInWeek);
            request.setAttribute("timeslots", timeslots);
            url = "/Customer/bookingDatetime.jsp";
        } catch (SQLException ex) {
            log(ex.getMessage());
            url = "/Customer/booking-list.jsp";
        } catch (AccountDoesNotExist ex) {
            request.setAttribute("error-message", ex.toString());
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

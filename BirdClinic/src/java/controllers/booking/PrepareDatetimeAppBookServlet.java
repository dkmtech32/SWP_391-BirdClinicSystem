/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.timeslot.TimeslotDTO;
import services.customer.CustomerServices;
import services.general.AccountDoesNotExistException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class PrepareDatetimeAppBookServlet extends HttpServlet {

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

            Date currentDate = new Date(System.currentTimeMillis());
            if (currentWeekday != null) {
                Date date = Date.valueOf(currentWeekday.trim());
                if (date.compareTo(currentDate) > 0) { // in the future
                    currentDate = date;
                    request.setAttribute("lastWeekday", Utils.getLastWeekWeekday(currentDate));
                } else { //in the present
                    int days = Utils.getDaysSinceStartOfWeek(currentDate);
                    request.setAttribute("daysBeforeToday", days);
                }
            }

            List<Date> daysInWeek = Utils.getDaysInWeek(currentDate);
            Date nextWeekWeekday = Utils.getNextWeekWeekday(currentDate);
            if (true) { //TODO: test to see if nextMonday is x weeks ahead. (can only book x weeks in advance)
                request.setAttribute("nextWeekday", nextWeekWeekday);
            }
            request.setAttribute("daysInWeek", daysInWeek);

            if (doctorID == null) {
                List<List<TimeslotDTO>> timeslots = service.getTimeslotsByWeekday(doctorID);
                List<List<Map<TimeslotDTO, Boolean>>> timeslotLate = new ArrayList<>();
                for (int i = 0; i < timeslots.size(); i++) {
                    timeslotLate.add(new ArrayList<>());
                    for (int j = 0; j < timeslots.get(i).size(); j++) {
                        Map<TimeslotDTO, Boolean> map = new HashMap<>();
                        TimeslotDTO timeslot = timeslots.get(i).get(j);
                        boolean isFuture = daysInWeek.get(i).compareTo(new Date(System.currentTimeMillis())) > 0;
                        map.put(timeslot, isFuture);
                        timeslotLate.get(i).add(map);
                    }
                }
                request.setAttribute("timeslots", timeslotLate);
            } else {
                List<List<TimeslotDTO>> timeslots = service.getTimeslotsByWeekday(doctorID);
                List<List<Map<TimeslotDTO, Boolean>>> timeslotBusy = new ArrayList<>();
                for (int i = 0; i < timeslots.size(); i++) {
                    timeslotBusy.add(new ArrayList<>());
                    for (int j = 0; j < timeslots.get(i).size(); j++) {
                        Map<TimeslotDTO, Boolean> map = new HashMap<>();
                        TimeslotDTO timeslot = timeslots.get(i).get(j);
                        boolean isFuture = daysInWeek.get(i).compareTo(new Date(System.currentTimeMillis())) > 0;
                        boolean isFree = service.isDoctorFree(doctorID, timeslot.getTimeSlotID(), daysInWeek.get(i));
                        map.put(timeslot, isFuture && isFree);
                        timeslotBusy.get(i).add(map);
                    }
                }
                request.setAttribute("timeslots", timeslotBusy);
            }

            url = "/Customer/bookingDatetime.jsp";
        } catch (SQLException ex) {
            ex.printStackTrace();
            url = "/Customer/booking-list.jsp";
        } catch (AccountDoesNotExistException ex) {

            ex.printStackTrace();
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
        response.sendRedirect(request.getContextPath() + "/Customer/prepareDocs");
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

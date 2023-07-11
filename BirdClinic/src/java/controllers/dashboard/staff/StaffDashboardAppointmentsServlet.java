/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard.staff;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.appointment.AppointmentDTO;
import models.users.doctor.DoctorDTO;
import services.general.AppointmentDoesNotExistException;
import services.staff.StaffServices;

/**
 *
 * @author Admin
 */
public class StaffDashboardAppointmentsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = "/Staff/dashboard-staff-appointments.jsp";
        try {
            StaffServices service = (StaffServices) session.getAttribute("service");
            String filter = request.getParameter("filter");
            if (filter == null || filter.trim().equals("")) {
                filter = "upcoming";
            }
            List<AppointmentDTO> apps = service.getAppointmentsByFilter(filter);

            List<List<DoctorDTO>> docList = new ArrayList<>();
            if (filter.equals("processing") || filter.equals("upcoming")) {
                Map<String, List<DoctorDTO>> doctorSpecialities = service.getDoctorBySpeciality();
                for (AppointmentDTO app : apps) {
                    if (app.getDoctor() != null) {
                        docList.add(null);
                    } else {
                        docList.add(doctorSpecialities.get(app.getService_().getSpeciality().getSpecialityID()));
                    }
                }
            } else {
                docList = new ArrayList<>(Collections.nCopies(apps.size(), null));
            }

            request.setAttribute("docList", docList);
            request.setAttribute("appointments", apps);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (AppointmentDoesNotExistException ex) {
            ex.printStackTrace();
        } finally {
            request.setAttribute("url", url);
            request.getRequestDispatcher("/Common/dashboard.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

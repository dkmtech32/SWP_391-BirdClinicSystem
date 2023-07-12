/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard.staff;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.doctor.DoctorDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.staff.StaffServices;

/**
 *
 * @author Admin
 */
public class StaffDashboardAppointmentsUpdateServlet extends HttpServlet {

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

        try {
            StaffServices service = (StaffServices) session.getAttribute("service");
            String appointmentID = request.getParameter("appointmentID");
            String action = request.getParameter("action");

            switch (action.toLowerCase()) {
                case "cancel":
                    service.cancelAppointment(appointmentID);
                    break;
                case "update":
                    String doctorID = request.getParameter("doctorID");
                    String payment = request.getParameter("payment");
                    if (doctorID != null) {
                        service.updateAppointmentDoctor(appointmentID, doctorID);
                    }
                    if (payment != null) {
                        service.updateAppointmentPayment(appointmentID, payment);
                    }
                    service.updateAppointment(appointmentID);
                    break;
            }
        } catch (DoctorDoesNotExistException ex) {
            ex.printStackTrace();
        } catch (AppointmentDoesNotExistException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher("/Dashboard/Appointments").forward(request, response);
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
        request.getRequestDispatcher("/Dashboard/Appointments").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.timeslot.TimeslotDTO;
import models.users.doctor.DoctorDTO;
import services.admin.AdminServices;
import services.general.AccountDoesNotExistException;

/**
 *
 * @author Admin
 */
public class AdminDoctorsUpdateInfoServlet extends HttpServlet {

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
        AdminServices admin = (AdminServices) session.getAttribute("service");
        String doctorID = request.getParameter("doctorID");
        String url = "/View/Doctor?doctorID=" + doctorID;
        try {
            DoctorDTO doctor = admin.getDoctorInfo(doctorID);
            request.setAttribute("doctor", doctor);
            url = "/Admin/dr-profile.jsp";
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (AccountDoesNotExistException ex) {
            ex.printStackTrace();
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String doctorID = request.getParameter("doctorID");
        String url = "/View/Doctor?doctorID=" + doctorID;
        try {
            AdminServices admin = (AdminServices) session.getAttribute("service");
            Map<String, String[]> args = request.getParameterMap();
            admin.changeDoctorInfo(args);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (AccountDoesNotExistException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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

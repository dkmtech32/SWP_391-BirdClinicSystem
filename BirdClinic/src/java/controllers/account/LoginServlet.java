/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.account;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.users.UserDTO;
import services.general.AccountDoesNotExistException;
import services.admin.AdminServicesImpl;
import services.customer.CustomerServicesImpl;
import services.doctor.DoctorServicesImpl;
import services.staff.StaffServicesImpl;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
        String url = "/Common/login.jsp";

        request.getRequestDispatcher(url).forward(request, response);
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String url = "/Common/login.jsp";
        HttpSession session = request.getSession(true);
        GeneralServices accountService = (GeneralServices) session.getAttribute("service");

        try {
            if (accountService.login(username, password)) {
                UserDTO currentUser = accountService.getCurrentUser();
                switch (currentUser.getUserRole().toLowerCase()) {
                    case "customer":
                        accountService = new CustomerServicesImpl(currentUser);
                        url = "/intro";
                        break;
                    case "doctor":
                        accountService = new DoctorServicesImpl(currentUser);
                        url = "/Dashboard/Appointments";
                        break;
                    case "staff":
                        accountService = new StaffServicesImpl(currentUser);
                        url = "/Dashboard/Appointments";
                        break;
                    case "admin":
                        accountService = new AdminServicesImpl(currentUser);
                        url = "/Admin/Accounts";
                        break;
                }
                session.setAttribute("service", accountService);

                if (remember != null && !remember.trim().equals("")) {
                    //cookies
                }
            }
        } catch (AccountDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Either password or username is wrong. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            url = "/Common/error.html";
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
        return "Servlet used for log in";
    }

}

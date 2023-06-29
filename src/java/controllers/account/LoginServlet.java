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
import models.dto.users.UserDTO;
import services.account.AccountNotExistException;
import services.account.AccountServices;
import services.account.AccountServicesImpl;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    private AccountServices accountServices;

    @Override
    public void init() throws ServletException {
        accountServices = new AccountServicesImpl();
    }

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
        response.sendError(405);
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
        String url = "";

        try {
            if (!username.trim().equals("") && !password.trim().equals("")) {
                UserDTO user = accountServices.login(username, password);
                HttpSession session = request.getSession(true);
                if (remember != null) {
                    //set cookies
                }
                session.setAttribute("currentUserID", user.getUserID());
                session.setAttribute("currentUser", username);

                String tempURL = (String) session.getAttribute("tempURL");
                if (tempURL != null) {
                    session.setAttribute("tempURL", null);
                    url = tempURL;
                }
            }
        } catch (NullPointerException | SQLException ex1) {
            request.setAttribute("message", "Something went wrong. Please try again.");
        } catch (AccountNotExistException ex2) {
            request.setAttribute("message", ex2.getMessage());
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

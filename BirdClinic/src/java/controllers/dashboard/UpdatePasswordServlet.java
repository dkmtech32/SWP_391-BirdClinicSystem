/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.general.AccountDoesNotExistException;
import services.general.GeneralServices;
import services.general.PasswordNotStrongException;
import services.general.PasswordsEqualException;
import services.general.PasswordsNotEqualException;

/**
 *
 * @author Admin
 */
public class UpdatePasswordServlet extends HttpServlet {

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

        String url = "/Common/dashboard-change-password.jsp";

        request.setAttribute("url", url);
        request.getRequestDispatcher("/Common/dashboard.jsp").forward(request, response);
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

        String url = "/Common/dashboard-change-password.jsp";
        HttpSession session = request.getSession();
        GeneralServices service = (GeneralServices) session.getAttribute("service");
        String cPassword = request.getParameter("current-password");
        String nPassword = request.getParameter("new-password");
        String fPassword = request.getParameter("confirm-password");

        try {
            if (fPassword.equals(cPassword)) {
                throw new PasswordsNotEqualException();
            }
            
            if (cPassword.equals(nPassword)) {
                throw new PasswordsEqualException();
            }

            service.updateAccountPassword(nPassword);
            url = "/Dashboard/Appointments";
            request.setAttribute("success-message", "Password changed.");
        } catch (AccountDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Current password does not match. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something is wrong. Please try again.");
        } catch (PasswordsEqualException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "New password must be different. Please try again.");
        } catch (PasswordsNotEqualException ex) {
            ex.printStackTrace();
        } catch (PasswordNotStrongException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Password needs to be stronger. Please try again.");
        } finally {
            response.sendRedirect(request.getContextPath() + url);
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
    }

}

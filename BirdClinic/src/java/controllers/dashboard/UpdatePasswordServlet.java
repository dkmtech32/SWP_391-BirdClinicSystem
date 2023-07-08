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
import services.general.AccountDoesNotExist;
import services.general.GeneralServices;
import services.general.PasswordNotStrongException;
import services.general.PasswordsEqualException;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class UpdatePasswordServlet extends HttpServlet {

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

        String url = "/Common/dashboard-change-password.jsp";

        request.setAttribute("url", url);
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

        String url = "/Common/change-password.jsp";
        HttpSession session = request.getSession();
        GeneralServices service = (GeneralServices) session.getAttribute("service");
        String cPassword = request.getParameter("current-password");
        String nPassword = request.getParameter("new-password");

        try {
            if (cPassword.equals(nPassword)) {
                throw new PasswordsEqualException();
            }

            cPassword = Utils.hash(cPassword);

            if (!service.login(service.getCurrentUser().getUserName(), cPassword)) {
                throw new AccountDoesNotExist();
            }

            service.updateAccountPassword(nPassword);
            url = "/Dashboard/view";
            request.setAttribute("success-message", "Password changed.");
        } catch (AccountDoesNotExist ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Current password does not match. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something is wrong. Please try again.");
        } catch (PasswordsEqualException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "New password must be different. Please try again.");
        } catch (PasswordNotStrongException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Password needs to be stronger. Please try again.");
        } finally {
            request.setAttribute("url", url);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import services.general.AccountAlreadyExistsException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

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

        String url = "/Common/dashboard-profile-setting.jsp";

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

        request.setCharacterEncoding("UTF-8");
        String url = "/Common/dashboard-profile-setting.jsp";
        HttpSession session = request.getSession();
        GeneralServices service = (GeneralServices) session.getAttribute("service");
        Map<String, String[]> params = request.getParameterMap();
        Map<String, String[]> args = new HashMap<>(params);
        Part userImage = request.getPart("user-image");
        InputStream userIS = null;
        String path = request.getServletContext().getInitParameter("PATH");
        try {
            if (userImage != null && userImage.getSize()>0L) {
                userIS = userImage.getInputStream();
                args.put("filename", new String[]{userImage.getSubmittedFileName()});
                String role = request.getParameter("userRole");
                switch (role) {
                    case "customer":
                        args.put("path", new String[]{path + "\\customer\\"});
                        break;
                    case "doctor":
                        args.put("path", new String[]{path + "\\doctor\\"});
                        break;
                    case "admin":
                    case "staff":
                        args.put("path", new String[]{path + "\\staff_admin\\"});
                        break;
                }
            }
            service.updateAccount(args, userIS);
        } catch (AccountAlreadyExistsException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Email or username is already in use. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something went wrong. Please try again.");
        } finally {
            request.setAttribute("url", url);
            request.getRequestDispatcher("/Common/dashboard.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.dashboard.admin;

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
import services.admin.AdminServices;
import services.general.AccountAlreadyExistsException;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class AdminAccountsCreateServlet extends HttpServlet {

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
        String role = request.getParameter("userRole");
        String url = "/Admin/add-staff.jsp";
        if (role.equals("doctor")) {
            url = "/Admin/add-doctor.jsp";
        }
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String url = "/Admin/add-staff.jsp";
        String role = request.getParameter("userRole");
        if (role.equals("doctor")) {
            url = "/Admin/add-doctor.jsp";
        }
        Part userImage = request.getPart("user-image");
        InputStream userIS = null;
        String path = request.getServletContext().getInitParameter("PATH");
        try {

            AdminServices admin = (AdminServices) session.getAttribute("service");
            Map<String, String[]> params = request.getParameterMap();
            Map<String, String[]> args = new HashMap<>(params);
            if (userImage != null) {
                userIS = userImage.getInputStream();
                args.put("filename", new String[]{userImage.getSubmittedFileName()});
            }
            switch (role) {
                case "doctor":
                    args.put("path", new String[]{path + "\\doctors\\"});
                    admin.createDoctor(args, userIS);
                    break;
                case "admin":
                case "staff":
                    args.put("path", new String[]{path + "\\staff_admin\\"});
                    admin.createStaffAdmin(args, userIS);
                    break;
            }
            url = "/Admin/Accounts";
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (AccountAlreadyExistsException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

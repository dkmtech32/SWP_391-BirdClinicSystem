/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.account;

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
import models.bird.BirdAlreadyExistsException;
import models.bird.BirdDTO;
import models.users.customer.CustomerDTO;
import services.general.AccountAlreadyExistsException;
import services.general.GeneralServices;
import services.general.PasswordNotStrongException;
import services.general.PasswordsNotEqualException;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

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
        String url = "/Common/login";
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
        request.setCharacterEncoding("UTF-8");
        String url = "/Common/login";
        HttpSession session = request.getSession(true);
        GeneralServices accountService = (GeneralServices) session.getAttribute("service");
        Map<String, String[]> params = request.getParameterMap();
        Map<String, String[]> args = new HashMap<>(params);
        Part userImage = request.getPart("user-image");
        Part birdImage = request.getPart("bird-image");
        InputStream userIS = null;
        InputStream birdIS = null;
        String path = request.getServletContext().getInitParameter("PATH");
        try {
            if (userImage != null && userImage.getSize()>0L) {
                userIS = userImage.getInputStream();
                args.put("filename", new String[]{userImage.getSubmittedFileName()});
                args.put("path", new String[]{path + "\\customer\\"});
            }
            CustomerDTO customer = accountService.createAccount(args, userIS);
            if (customer != null) {
                if (birdImage != null && birdImage.getSize()>0L) {
                    birdIS = birdImage.getInputStream();
                    args.put("filename", new String[]{birdImage.getSubmittedFileName()});
                    args.put("path", new String[]{path + "\\bird\\"});
                }
                BirdDTO bird = accountService.createBird(args, customer, birdIS);
                if (bird != null) {
                    accountService.register(customer, bird);
                }
            }
        } catch (AccountAlreadyExistsException ex) {
            ex.printStackTrace();
        } catch (PasswordsNotEqualException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (PasswordNotStrongException ex) {
            ex.printStackTrace();
        } catch (BirdAlreadyExistsException ex) {
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
    }

}

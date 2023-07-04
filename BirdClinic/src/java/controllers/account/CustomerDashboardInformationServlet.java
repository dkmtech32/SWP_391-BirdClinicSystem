/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.account.customer.CustomerServices;
import services.account.customer.CustomerServicesImpl;
import models.dto.users.customer.CustomerDTO;
import services.account.customer.NoSuchCustomerExistsException;
import services.appointment.AppointmentServices;

/**
 *
 * @author Admin
 */
public class CustomerDashboardInformationServlet extends HttpServlet {

    private CustomerServices customerServices;
    private AppointmentServices appointmentServices;

    @Override
    public void init() {
        customerServices = new CustomerServicesImpl();
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
        response.setContentType("text/html;charset=UTF-8");
        String url = "/Common/index.jsp";
        try {
            HttpSession session = request.getSession();
            if (session != null) {
                CustomerDTO customer = customerServices.getCustomerInformation("");
                if (customer != null) {
                    customer.setUserPassword(null);
                    session.setAttribute("currentUser", customer);
                    url = "/Customer/customer-dashboard.jsp";
//                    System.out.println(customer.getCustomerAddress());
                }
            }
        } catch (NoSuchCustomerExistsException ex) {
            url = "/Common/login.jsp";
            log(ex.getMessage());
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
        String url = "/Common/index.jsp";
        try {
            HttpSession session = request.getSession();
            if (session != null) {
//                CustomerDTO customer = customerServices.getCustomerInformation("");
//                if (customer != null) {
//                    customer.setUserPassword(null);
//                    session.setAttribute("currentUser", customer);
//                    
////                    System.out.println(customer.getCustomerAddress());
//                }
                url = "/Customer/customer-dashboard.jsp";
            }
//        } catch (NoSuchCustomerExistsException ex) {
//            url = "/Common/login.jsp";
//            log(ex.getMessage());
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

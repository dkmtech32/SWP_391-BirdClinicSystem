/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.booking;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.dto.bird.BirdDTO;
import models.dto.service_.Service_DTO;
import models.dto.timeslot.TimeslotDTO;
import models.dto.users.UserDTO;
import models.dto.users.doctor.DoctorDTO;
import services.account.customer.NoSuchCustomerExistsException;
import services.account.doctor.DoctorServices;
import services.account.doctor.DoctorServicesImpl;
import services.account.doctor.NoSuchDoctorExistsException;
import services.bird.BirdServices;
import services.bird.BirdServicesImpl;
import services.service_.NoSuchService_ExistsException;
import services.service_.NoSuchSpecialityExistsException;
import services.service_.Service_Services;
import services.service_.Service_ServicesImpl;
import services.timeslot.NoDoctorsAvailableException;
import services.timeslot.TimeslotServices;
import services.timeslot.TimeslotServicesImpl;

/**
 *
 * @author Admin
 */
public class PrepareAppointmentBookServlet extends HttpServlet {

    private BirdServices birdServices;
    private Service_Services serviceServices;
    private TimeslotServices timeslotServices;
    private DoctorServices doctorServices;

    @Override
    public void init() {
        birdServices = new BirdServicesImpl();
        serviceServices = new Service_ServicesImpl();
        timeslotServices = new TimeslotServicesImpl();
        doctorServices = new DoctorServicesImpl();
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

        HttpSession session = request.getSession();
        String doctorID = request.getParameter("doctorID");
        String url = "/Common/index.jsp";

        try {
            if (session == null) {
                url = "/Common/login.jsp";
            } else {
                UserDTO user = (UserDTO) session.getAttribute("currentUser");
                List<BirdDTO> birds = birdServices.getBirdsOfCustomer(user.getUserID());
                request.setAttribute("birds", birds);

                if (doctorID != null) {
                    //book appointment by doctor
                    DoctorDTO doctor = doctorServices.getDoctor(doctorID);
                    List<Service_DTO> services = serviceServices.getService_BySpeciality(doctor.getSpeciality().getSpecialityID());
                    List<TimeslotDTO> timeslots = timeslotServices.getDoctorTimeslot(doctorID);
                    request.setAttribute("services", services);
                    request.setAttribute("timeslots", timeslots);
                    request.setAttribute("doctorID", doctorID);
                } else if (doctorID == null) {
                    //no doctors
                    List<Service_DTO> services = serviceServices.getAllService_();
                    List<TimeslotDTO> timeslots = timeslotServices.getAllTimeslots();
                    request.setAttribute("services", services);
                    request.setAttribute("timeslots", timeslots);
                }

                url = "Customer/bookInfo.jsp";

            }

        } catch (NoSuchCustomerExistsException ex) {
            log(ex.getMessage());
            url = "/Common/login.jsp";
        } catch (NoSuchService_ExistsException | NoSuchDoctorExistsException
                | NoDoctorsAvailableException | NoSuchSpecialityExistsException ex) {
            log(ex.getMessage());
            url = "/Common/index.jsp";
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
        response.sendError(405);
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

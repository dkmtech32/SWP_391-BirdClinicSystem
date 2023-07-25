/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.view;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.appointment.AppointmentDTO;
import models.feedback.FeedbackDTO;
import models.medicalRecord.MedicalRecordDTO;
import models.recordMedicine.RecordMedicineDTO;
import models.service_.Service_DTO;
import models.users.doctor.DoctorDTO;
import services.general.AccountDoesNotExistException;
import services.general.AppointmentDoesNotExistException;
import services.general.GeneralServices;

/**
 *
 * @author Admin
 */
public class ViewAppointmentInfoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "/Common/client-appointments-details.jsp";
        HttpSession session = request.getSession();
        GeneralServices service = (GeneralServices) session.getAttribute("service");
        String appointmentID = request.getParameter("appointmentID");

        try {
            AppointmentDTO appointment = service.viewAppointment(appointmentID);
            MedicalRecordDTO medRec = service.viewMedicalRecord(appointmentID);
            List<RecordMedicineDTO> recMed = null;
            if (medRec != null) {
                recMed = service.viewRecordMeds(medRec.getMedicalRecordID());
            }
            FeedbackDTO feedback = service.viewFeedback(appointmentID);
            request.setAttribute("appointment", appointment);
            request.setAttribute("medicalRecord", medRec);
            request.setAttribute("recordMedicines", recMed);
            request.setAttribute("feedback", feedback);
            
            if (service.getCurrentUser().getUserRole().equals("staff")) {
                List<DoctorDTO> doctors = service.getAllDoctors();
                List<Service_DTO> services = service.getServices("");
                request.setAttribute("doctors", doctors);
                request.setAttribute("services", services);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something is wrong. Please try again.");
        } catch (AppointmentDoesNotExistException ex) {
            ex.printStackTrace();
            url = request.getRequestURI().substring(request.getContextPath().length() - 1);
            request.setAttribute("error-message", "Appointment does not exist. Please try again");
        } catch (AccountDoesNotExistException ex) {
            ex.printStackTrace();
            url = request.getRequestURI().substring(request.getContextPath().length() - 1);
            request.setAttribute("error-message", "Account does not exist. Please try again");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

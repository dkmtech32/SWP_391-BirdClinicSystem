/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.prescribe;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDTO;
import services.doctor.DoctorServices;
import services.general.AppointmentDoesNotExistException;

/**
 *
 * @author Admin
 */
public class DoctorPrescriptionServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String url = "/Doctor/add-prescription.jsp";
        try {
            DoctorServices service = (DoctorServices) session.getAttribute("service");
            Map<String, String[]> args = request.getParameterMap();
            MedicalRecordDTO medRec = (MedicalRecordDTO) session.getAttribute("medicalRecord");
            List<MedicineDTO> medicines = (List<MedicineDTO>) session.getAttribute("medicines");
            if (medRec == null) {
                medRec = service.updateRecord(args, medRec);
                session.setAttribute("medicalRecord", medRec);
            }
            if (medicines == null) {
                medicines = service.getAllMedicine();
                session.setAttribute("medicines", medicines);
            }
        } catch (AppointmentDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Appointment does not exist. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something went wrong. Please try again.");
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

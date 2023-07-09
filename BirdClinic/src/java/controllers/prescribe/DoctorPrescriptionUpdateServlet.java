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
import models.recordMedicine.RecordMedicineDTO;
import services.doctor.DoctorServices;
import services.doctor.MedicalRecordAlreadyExistsException;
import services.doctor.MedicineDoesNotExistException;
import services.general.AppointmentDoesNotExistException;

/**
 *
 * @author Admin
 */
public class DoctorPrescriptionUpdateServlet extends HttpServlet {

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

        String url = "/Doctor/Prescription";
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
        //submit/add/delete
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = "/Doctor/Prescription";
        try {
            DoctorServices service = (DoctorServices) session.getAttribute("service");
            MedicalRecordDTO medRec = (MedicalRecordDTO) session.getAttribute("medicalRecord");
            List<RecordMedicineDTO> recMed = (List<RecordMedicineDTO>) session.getAttribute("prescription");
            String action = request.getParameter("action");
            Map<String, String[]> args = request.getParameterMap();

            switch (action) {
                case "submit":
                    if (service.prescribe(medRec, recMed)) {
                        session.removeAttribute("medicalRecord");
                        session.removeAttribute("prescription");
                        session.removeAttribute("medicines");
                    }
                    url = "/View/Appointment?appointmentID=" + medRec.getAppointment().getAppointmentID();
                    break;
                case "add":
                    service.updateRecord(args, medRec);
                    service.updatePrescription(args, medRec, recMed);
                    break;
                case "remove":
                    service.updateRecord(args, medRec);
                    args.put("quantity", new String[]{"-"+args.get("quantity")[0]});
                    service.updatePrescription(args, medRec, recMed);
                    break;
            }

        } catch (MedicalRecordAlreadyExistsException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Medical record already exists. Please try again.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Something went wrong. Please try again.");
        } catch (AppointmentDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Appointment does not exist. Please try again.");
        } catch (MedicineDoesNotExistException ex) {
            ex.printStackTrace();
            request.setAttribute("error-message", "Medicine does not exist. Please try again.");
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

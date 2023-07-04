/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicalRecord;

import java.sql.Timestamp;
import models.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public interface MedicalRecordDTO {

    AppointmentDTO getAppointment();

    String getDiagnosis();

    String getMedicalRecordID();

    Timestamp getRecordTime();
    
    int getTreatmentDays();
    
    String getDoctorNotes();

    void setAppointment(AppointmentDTO appointment);
    
    void setDiagnosis(String diagnosis);

    void setMedicalRecordID(String medicalRecordID);

    void setRecordTime(Timestamp recordTime);
    
    void setTreatmentDays(int treatmentDays);
    
    void setDoctorNotes(String doctorNotes);
}

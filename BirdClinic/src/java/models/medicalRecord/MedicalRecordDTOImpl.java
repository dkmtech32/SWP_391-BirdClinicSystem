/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicalRecord;

import java.sql.Timestamp;
import java.util.Objects;
import models.appointment.AppointmentDTO;

/**
 *
 * @author Admin
 */
public class MedicalRecordDTOImpl implements MedicalRecordDTO {

    private String medicalRecordID;
    private AppointmentDTO appointment;
    private Timestamp recordTime;
    private String diagnosis;
    private int treatmentDays;
    private String doctorNotes;

    public MedicalRecordDTOImpl() {
    }

    public MedicalRecordDTOImpl(String medicalRecordID, AppointmentDTO appointment,
            Timestamp recordTime, String diagnosis, int treatmentDays, String doctorNotes) {
        this.medicalRecordID = medicalRecordID;
        this.appointment = appointment;
        this.recordTime = recordTime;
        this.diagnosis = diagnosis;
        this.treatmentDays = treatmentDays;
        this.doctorNotes = doctorNotes;
    }

    

    @Override
    public String getMedicalRecordID() {
        return medicalRecordID;
    }

    @Override
    public void setMedicalRecordID(String medicalRecordID) {
        this.medicalRecordID = medicalRecordID;
    }

    @Override
    public AppointmentDTO getAppointment() {
        return appointment;
    }

    @Override
    public void setAppointment(AppointmentDTO appointment) {
        this.appointment = appointment;
    }

    @Override
    public Timestamp getRecordTime() {
        return recordTime;
    }

    @Override
    public void setRecordTime(Timestamp recordTime) {
        this.recordTime = recordTime;
    }

    @Override
    public String getDiagnosis() {
        return diagnosis;
    }

    @Override
    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    @Override
    public int getTreatmentDays() {
        return treatmentDays;
    }

    @Override
    public void setTreatmentDays(int treatmentDays) {
        this.treatmentDays = treatmentDays;
    }

    @Override
    public String getDoctorNotes() {
        return doctorNotes;
    }

    @Override
    public void setDoctorNotes(String doctorNotes) {
        this.doctorNotes = doctorNotes;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final MedicalRecordDTOImpl other = (MedicalRecordDTOImpl) obj;
        return Objects.equals(this.medicalRecordID, other.medicalRecordID);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + Objects.hashCode(this.medicalRecordID);
        return hash;
    }
    
    
}

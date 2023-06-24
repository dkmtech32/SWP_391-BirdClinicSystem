/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.medicalRecord;

import java.sql.Timestamp;
import models.dto.appointment.AppointmentDTO;
import models.dto.bird.BirdDTO;
import models.dto.users.doctor.DoctorDTO;

/**
 *
 * @author Admin
 */
public class MedicalRecordDTOImpl implements MedicalRecordDTO {

    private String medicalRecordID;
    private AppointmentDTO appointment;
    private BirdDTO bird;
    private DoctorDTO doctor;
    private Timestamp recordTime;
    private String diagnosis;

    public MedicalRecordDTOImpl() {
    }

    public MedicalRecordDTOImpl(String medicalRecordID, AppointmentDTO appointment, BirdDTO bird,
            DoctorDTO doctor, Timestamp recordTime, String diagnosis) {
        this.medicalRecordID = medicalRecordID;
        this.appointment = appointment;
        this.bird = bird;
        this.doctor = doctor;
        this.recordTime = recordTime;
        this.diagnosis = diagnosis;
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
    public BirdDTO getBird() {
        return bird;
    }

    @Override
    public void setBird(BirdDTO bird) {
        this.bird = bird;
    }

    @Override
    public DoctorDTO getDoctor() {
        return doctor;
    }

    @Override
    public void setDoctor(DoctorDTO doctor) {
        this.doctor = doctor;
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
}

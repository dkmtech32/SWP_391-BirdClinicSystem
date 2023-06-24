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
public interface MedicalRecordDTO {

    AppointmentDTO getAppointment();

    BirdDTO getBird();

    String getDiagnosis();

    DoctorDTO getDoctor();

    String getMedicalRecordID();

    Timestamp getRecordTime();

    void setAppointment(AppointmentDTO appointment);

    void setBird(BirdDTO bird);

    void setDiagnosis(String diagnosis);

    void setDoctor(DoctorDTO doctor);

    void setMedicalRecordID(String medicalRecordID);

    void setRecordTime(Timestamp recordTime);
    
}

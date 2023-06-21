/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.medicalRecord;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.medicalRecord.MedicalRecordDTO;

/**
 *
 * @author Admin
 */
public interface MedicalRecordDAO extends Serializable {

    int deleteMedicalRecord(String medicalRecordID) throws SQLException;

    int insertMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException;

    MedicalRecordDTO readMedicalRecord(String medicalRecordID) throws SQLException;

    MedicalRecordDTO readMedicalRecord(String medicalRecordID, Connection con) throws SQLException;

    MedicalRecordDTO readMedicalRecordByAppointment(String appointmentID) throws SQLException;

    MedicalRecordDTO readMedicalRecordByAppointment(String appointmentID, Connection con) throws SQLException;

    List<MedicalRecordDTO> readMedicalRecordByBird(String appointmentID) throws SQLException;

    List<MedicalRecordDTO> readMedicalRecordByBird(String appointmentID, Connection con) throws SQLException;

    List<MedicalRecordDTO> readMedicalRecordByDoctor(String appointmentID) throws SQLException;

    List<MedicalRecordDTO> readMedicalRecordByDoctor(String appointmentID, Connection con) throws SQLException;

    int updateMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException;
    
}

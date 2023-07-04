/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicalRecord;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface MedicalRecordDAO extends Serializable {

    int deleteMedicalRecord(String medicalRecordID) throws SQLException, NoSuchRecordExists;

    int insertMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException, RecordAlreadyExists;

    MedicalRecordDTO readMedicalRecord(String medicalRecordID) throws SQLException, NoSuchRecordExists;

    MedicalRecordDTO readMedicalRecordByAppointment(String appointmentID) throws SQLException, NoSuchRecordExists;

    List<MedicalRecordDTO> readMedicalRecordByBird(String appointmentID) throws SQLException, NoSuchRecordExists;

    List<MedicalRecordDTO> readMedicalRecordByDoctor(String appointmentID) throws SQLException, NoSuchRecordExists;

    int updateMedicalRecord(MedicalRecordDTO medicalRecord) throws SQLException, NoSuchRecordExists;
    
}

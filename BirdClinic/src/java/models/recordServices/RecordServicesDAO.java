/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordServices;

import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;
import models.medicalRecord.MedicalRecordDTO;
import models.service_.Service_DTO;

/**
 *
 * @author Admin
 */
public interface RecordServicesDAO {

    int deleteRecordServices(String medicalRecordID, String serviceID) throws SQLException, NoSuchRecordExists;

    int insertRecordServices(MedicalRecordDTO medRec, Service_DTO service) throws SQLException, RecordAlreadyExists;

    List<MedicalRecordDTO> readRecord(String serviceID) throws SQLException, NoSuchRecordExists;

    List<Service_DTO> readService_(String medicalRecordID) throws SQLException, NoSuchRecordExists;
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.recordServices;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.medicalRecord.MedicalRecordDTO;
import models.dto.service_.Service_DTO;

/**
 *
 * @author Admin
 */
public interface RecordServicesDAO {

    int deleteRecord(MedicalRecordDTO medRec) throws SQLException;

    int deleteService(Service_DTO service) throws SQLException;

    int insertRecordService_(MedicalRecordDTO medRec, Service_DTO service) throws SQLException;

    List<MedicalRecordDTO> readRecordByUsage(String serviceID, Connection con) throws SQLException;

    List<MedicalRecordDTO> readRecordByUsage(String serviceID) throws SQLException;

    List<Service_DTO> readServicesUsed(String medicalRecordID) throws SQLException;

    List<Service_DTO> readServicesUsed(String medicalRecordID, Connection con) throws SQLException;
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.recordMedicine;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.recordMedicine.RecordMedicineDTO;

/**
 *
 * @author Admin
 */
public interface RecordMedicineDAO extends Serializable {

    int deleteRecordMedicine(String medicineID, String medRecID) throws SQLException;

    int insertRecordMedicine(RecordMedicineDTO recMed) throws SQLException;

    List<RecordMedicineDTO> readMedicineFromRecord(String medicalRecordID) throws SQLException;

    List<RecordMedicineDTO> readMedicineFromRecord(String medicalRecordID, Connection con) throws SQLException;

    List<RecordMedicineDTO> readRecordFromMedicine(String medicineID) throws SQLException;

    List<RecordMedicineDTO> readRecordFromMedicine(String medicineID, Connection con) throws SQLException;

    int updateRecordMedicine(RecordMedicineDTO recMed) throws SQLException;
    
}

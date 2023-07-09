/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordMedicine;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;
import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public interface RecordMedicineDAO extends Serializable {

    int deleteRecordMedicine(String medicineID, String medRecID) throws SQLException, NoSuchRecordExists;

    int insertRecordMedicine(RecordMedicineDTO recMed) throws SQLException, RecordAlreadyExists;

    List<RecordMedicineDTO> readMedicineFromRecord(String medicalRecordID) throws SQLException, NoSuchRecordExists;

    int updateRecordMedicine(RecordMedicineDTO recMed) throws SQLException, NoSuchRecordExists;

    int insertMultipleRecordMedicine(List<RecordMedicineDTO> recMeds) throws SQLException, RecordAlreadyExists;
}

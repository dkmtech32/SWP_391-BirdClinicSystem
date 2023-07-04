/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicine;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public interface MedicineDAO extends Serializable {

    List<MedicineDTO> readAllMedicines() throws NoSuchRecordExists, SQLException;

    MedicineDTO readMedicine(String medicineID) throws NoSuchRecordExists, SQLException;

    List<MedicineDTO> searchMedicine(String medicineName) throws NoSuchRecordExists, SQLException;
    
    List<MedicineDTO> readListOfMedicine(List<String> medicineIDs) throws NoSuchRecordExists, SQLException;
    
    int updateMedicine(MedicineDTO medicine) throws NoSuchRecordExists, SQLException;
    
}

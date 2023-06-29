/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao.medicine;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.dto.medicine.MedicineDTO;

/**
 *
 * @author Admin
 */
public interface MedicineDAO extends Serializable {

    List<MedicineDTO> readAllMedicines() throws SQLException;

    MedicineDTO readMedicine(String medicineID) throws SQLException;

    MedicineDTO readMedicine(String medicineID, Connection con) throws SQLException;

    List<MedicineDTO> searchMedicine(String medicineName) throws SQLException;
    
}

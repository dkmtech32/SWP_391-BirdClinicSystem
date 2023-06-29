/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.recordMedicine;

import java.io.Serializable;
import models.dto.medicalRecord.MedicalRecordDTO;
import models.dto.medicine.MedicineDTO;

/**
 *
 * @author Admin
 */
public interface RecordMedicineDTO extends Serializable {

    String getDescriptions();

    // getters and setters
    MedicalRecordDTO getMedicalRecord();

    MedicineDTO getMedicine();

    int getQuantity();

    void setDescriptions(String descriptions);

    void setMedicalRecord(MedicalRecordDTO medicalRecord);

    void setMedicine(MedicineDTO medicine);

    void setQuantity(int quantity);
    
}

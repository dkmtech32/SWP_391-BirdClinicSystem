/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordMedicine;

import java.io.Serializable;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDTO;

/**
 *
 * @author Admin
 */
public interface RecordMedicineDTO extends Serializable {

    String getDescription_();

    // getters and setters
    MedicalRecordDTO getMedicalRecord();

    MedicineDTO getMedicine();

    int getQuantity();

    void setDescription_(String description);

    void setMedicalRecord(MedicalRecordDTO medicalRecord);

    void setMedicine(MedicineDTO medicine);

    void setQuantity(int quantity);
    
}

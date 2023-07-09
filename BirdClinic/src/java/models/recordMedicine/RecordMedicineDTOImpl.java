/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordMedicine;

import java.util.Objects;
import models.medicalRecord.MedicalRecordDTO;
import models.medicine.MedicineDTO;

/**
 *
 * @author Admin
 */
public class RecordMedicineDTOImpl implements RecordMedicineDTO {

    private MedicalRecordDTO medicalRecord;
    private MedicineDTO medicine;
    private int quantity;
    private String description_;

    // default constructor
    public RecordMedicineDTOImpl() {
    }

    // all arguments constructor
    public RecordMedicineDTOImpl(MedicalRecordDTO medicalRecord, MedicineDTO medicine, int quantity, String descriptions) {
        this.medicalRecord = medicalRecord;
        this.medicine = medicine;
        this.quantity = quantity;
        this.description_ = descriptions;
    }

    // getters and setters
    @Override
    public MedicalRecordDTO getMedicalRecord() {
        return medicalRecord;
    }

    @Override
    public void setMedicalRecord(MedicalRecordDTO medicalRecord) {
        this.medicalRecord = medicalRecord;
    }

    @Override
    public MedicineDTO getMedicine() {
        return medicine;
    }

    @Override
    public void setMedicine(MedicineDTO medicine) {
        this.medicine = medicine;
    }

    @Override
    public int getQuantity() {
        return quantity;
    }

    @Override
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String getDescription_() {
        return description_;
    }

    @Override
    public void setDescription_(String description_) {
        this.description_ = description_;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + Objects.hashCode(this.medicalRecord);
        hash = 29 * hash + Objects.hashCode(this.medicine);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final RecordMedicineDTOImpl other = (RecordMedicineDTOImpl) obj;
        
        return this.medicine.equals(other.medicine) && this.medicalRecord.equals(other.medicalRecord);
    }

    
}


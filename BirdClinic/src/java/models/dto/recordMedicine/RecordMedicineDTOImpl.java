/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.recordMedicine;

import models.dto.medicalRecord.MedicalRecordDTO;
import models.dto.medicine.MedicineDTO;

/**
 *
 * @author Admin
 */
public class RecordMedicineDTOImpl implements RecordMedicineDTO {

    private MedicalRecordDTO medicalRecord;
    private MedicineDTO medicine;
    private int quantity;
    private String descriptions;

    // default constructor
    public RecordMedicineDTOImpl() {
    }

    // all arguments constructor
    public RecordMedicineDTOImpl(MedicalRecordDTO medicalRecord, MedicineDTO medicine, int quantity, String descriptions) {
        this.medicalRecord = medicalRecord;
        this.medicine = medicine;
        this.quantity = quantity;
        this.descriptions = descriptions;
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
    public String getDescriptions() {
        return descriptions;
    }

    @Override
    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }
}


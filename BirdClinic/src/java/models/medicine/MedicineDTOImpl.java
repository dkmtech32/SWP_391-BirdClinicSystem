/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicine;

import java.math.BigDecimal;

/**
 *
 * @author Admin
 */
public class MedicineDTOImpl implements MedicineDTO {
    private String medicineID;
    private String medicineName;
    private BigDecimal medicinePrice;

    public MedicineDTOImpl() {
    }

    public MedicineDTOImpl(String medicineID, String medicineName, BigDecimal medicinePrice) {
        this.medicineID = medicineID;
        this.medicineName = medicineName;
        this.medicinePrice = medicinePrice;
    }

    @Override
    public String getMedicineID() {
        return medicineID;
    }

    @Override
    public void setMedicineID(String medicineID) {
        this.medicineID = medicineID;
    }

    @Override
    public String getMedicineName() {
        return medicineName;
    }

    @Override
    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    @Override
    public BigDecimal getMedicinePrice() {
        return medicinePrice;
    }

    @Override
    public void setMedicinePrice(BigDecimal medicinePrice) {
        this.medicinePrice = medicinePrice;
    }
    
    
}

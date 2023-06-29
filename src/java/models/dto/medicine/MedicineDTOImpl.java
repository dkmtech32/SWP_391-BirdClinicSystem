/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.medicine;

/**
 *
 * @author Admin
 */
public class MedicineDTOImpl implements MedicineDTO {
    private String medicineID;
    private String medicineName;
    private int medicinePrice;

    public MedicineDTOImpl() {
    }

    public MedicineDTOImpl(String medicineID, String medicineName, int medicinePrice) {
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
    public int getMedicinePrice() {
        return medicinePrice;
    }

    @Override
    public void setMedicinePrice(int medicinePrice) {
        this.medicinePrice = medicinePrice;
    }
    
    
}

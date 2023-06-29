/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dto.medicine;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public interface MedicineDTO extends Serializable {

    String getMedicineID();

    String getMedicineName();

    int getMedicinePrice();

    void setMedicineID(String medicineID);

    void setMedicineName(String medicineName);

    void setMedicinePrice(int medicinePrice);
    
}

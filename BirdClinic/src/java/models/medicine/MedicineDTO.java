/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicine;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author Admin
 */
public interface MedicineDTO extends Serializable {

    String getMedicineID();

    String getMedicineName();

    BigDecimal getMedicinePrice();

    void setMedicineID(String medicineID);

    void setMedicineName(String medicineName);

    void setMedicinePrice(BigDecimal medicinePrice);
    
}

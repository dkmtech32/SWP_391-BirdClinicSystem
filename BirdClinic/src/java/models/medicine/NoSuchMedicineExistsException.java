/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicine;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchMedicineExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchMedicineExistsException</code>
     * without detail message.
     */
    public NoSuchMedicineExistsException() {
        super("Medicine");
    }

    /**
     * Constructs an instance of <code>NoSuchMedicineExistsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchMedicineExistsException(String msg) {
        super(msg);
    }
}

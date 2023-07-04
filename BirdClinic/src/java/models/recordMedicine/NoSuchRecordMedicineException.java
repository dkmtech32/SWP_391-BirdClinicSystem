/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordMedicine;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchRecordMedicineException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchRecordMedicineException</code>
     * without detail message.
     */
    public NoSuchRecordMedicineException() {
        super("Medical Record Medicine");
    }

    /**
     * Constructs an instance of <code>NoSuchRecordMedicineException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchRecordMedicineException(String msg) {
        super(msg);
    }
}

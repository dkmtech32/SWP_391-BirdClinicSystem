/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordMedicine;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class RecordMedicineAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of
     * <code>RecordMedicineAlreadyExistsException</code> without detail message.
     */
    public RecordMedicineAlreadyExistsException() {
        super("Medical Record Medicine");
    }

    /**
     * Constructs an instance of
     * <code>RecordMedicineAlreadyExistsException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public RecordMedicineAlreadyExistsException(String msg) {
        super(msg);
    }
}

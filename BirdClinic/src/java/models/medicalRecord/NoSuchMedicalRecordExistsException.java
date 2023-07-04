/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicalRecord;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchMedicalRecordExistsException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchMedicalRecordExistsException</code>
     * without detail message.
     */
    public NoSuchMedicalRecordExistsException() {
        super("Medical Record");
    }

    /**
     * Constructs an instance of <code>NoSuchMedicalRecordExistsException</code>
     * with the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchMedicalRecordExistsException(String msg) {
        super(msg);
    }
}

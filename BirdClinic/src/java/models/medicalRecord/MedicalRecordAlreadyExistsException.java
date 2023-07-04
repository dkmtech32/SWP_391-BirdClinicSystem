/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.medicalRecord;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class MedicalRecordAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of
     * <code>MedicalRecordAlreadyExistsException</code> without detail message.
     */
    public MedicalRecordAlreadyExistsException() {
        super("Medical Record");
    }

    /**
     * Constructs an instance of
     * <code>MedicalRecordAlreadyExistsException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public MedicalRecordAlreadyExistsException(String msg) {
        super(msg);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordServices;

import models.exceptions.NoSuchRecordExists;

/**
 *
 * @author Admin
 */
public class NoSuchRecordServicesException extends NoSuchRecordExists {

    /**
     * Creates a new instance of <code>NoSuchRecordServicesException</code>
     * without detail message.
     */
    public NoSuchRecordServicesException() {
        super("Medical Record's Services");
    }

    /**
     * Constructs an instance of <code>NoSuchRecordServicesException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoSuchRecordServicesException(String msg) {
        super(msg);
    }
}

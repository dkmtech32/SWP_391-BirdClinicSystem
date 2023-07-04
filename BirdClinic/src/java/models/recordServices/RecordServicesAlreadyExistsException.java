/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.recordServices;

import models.exceptions.RecordAlreadyExists;

/**
 *
 * @author Admin
 */
public class RecordServicesAlreadyExistsException extends RecordAlreadyExists {

    /**
     * Creates a new instance of
     * <code>RecordServicesAlreadyExistsException</code> without detail message.
     */
    public RecordServicesAlreadyExistsException() {
        super("Medical Record's Services");
    }

    /**
     * Constructs an instance of
     * <code>RecordServicesAlreadyExistsException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public RecordServicesAlreadyExistsException(String msg) {
        super(msg);
    }
}
